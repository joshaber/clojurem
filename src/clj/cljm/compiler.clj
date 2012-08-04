;   Copyright (c) Rich Hickey. All rights reserved.
;   The use and distribution terms for this software are covered by the
;   Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
;   which can be found in the file epl-v10.html at the root of this distribution.
;   By using this software in any fashion, you are agreeing to be bound by
;   the terms of this license.
;   You must not remove this notice, or any other, from this software.

(set! *warn-on-reflection* true)

(ns cljm.compiler
  (:refer-clojure :exclude [munge macroexpand-1])
  (:require [clojure.java.io :as io]
            [clojure.string :as string]
            [cljm.tagged-literals :as tags]
            [cljm.analyzer :as ana])
  (:import java.lang.StringBuilder))

(declare munge)
(declare init-func-name)

(defmacro ^:private debug-prn
  [& args]
  `(.println System/err (str ~@args)))

(def js-reserved
  #{"abstract" "boolean" "break" "byte" "case"
    "catch" "char" "class" "const" "continue"
    "debugger" "default" "delete" "do" "double"
    "else" "enum" "export" "extends" "final"
    "finally" "float" "for" "function" "goto" "if"
    "implements" "import" "in" "instanceof" "int"
    "interface" "let" "long" "native" "new"
    "package" "private" "protected" "public"
    "return" "short" "static" "super" "switch"
    "synchronized" "this" "throw" "throws"
    "transient" "try" "typeof" "var" "void"
    "volatile" "while" "with" "yield" "methods"})

(def ^:dynamic *position* nil)
(def cljm-reserved-file-names #{"deps.cljm"})

(defn munge
  ([s] (munge s js-reserved))
  ([s reserved]
    (let [ss (string/replace (str s) #"\/(.)" ".$1") ; Division is special
          ss (string/replace (str s) #"\." "_DOT_")
          ss (apply str (map #(if (reserved %) (str % "$") %)
                             (string/split ss #"(?<=\.)|(?=\.)")))
          ms (clojure.lang.Compiler/munge ss)]
      (if (symbol? s)
        (symbol ms)
        ms))))

(defn- comma-sep [xs]
  (interpose ", " xs))

(defn- escape-char [^Character c]
  (let [cp (.hashCode c)]
    (case cp
      ; Handle printable escapes before ASCII
      34 "\\\""
      92 "\\\\"
      ; Handle non-printable escapes
      8 "\\b"
      12 "\\f"
      10 "\\n"
      13 "\\r"
      9 "\\t"
      (if (< 31 cp 127)
        c ; Print simple ASCII characters
        (format "\\u%04X" cp))))) ; Any other character is Unicode

(defn- escape-string [^CharSequence s]
  (let [sb (StringBuilder. (count s))]
    (doseq [c s]
      (.append sb (escape-char c)))
    (.toString sb)))

(defn- wrap-in-double-quotes [x]
  (str \" x \"))

(defmulti emit :op)

(defn emits [& xs]
  (doseq [x xs]
    (cond
      (nil? x) nil
      (map? x) (emit x)
      (seq? x) (apply emits x)
      (fn? x)  (x)
      :else (do
              (let [s (print-str x)]
                (when *position*
                  (swap! *position* (fn [[line column]]
                                      [line (+ column (count s))])))
                (print s)))))
  nil)

(defn ^String emit-str [expr]
  (with-out-str (emit expr)))

(defn emitln [& xs]
  (apply emits xs)
  ;; Prints column-aligned line number comments; good test of *position*.
  ;(when *position*
  ;  (let [[line column] @*position*]
  ;    (print (apply str (concat (repeat (- 120 column) \space) ["// " (inc line)])))))
  (println)
  (when *position*
    (swap! *position* (fn [[line column]]
                        [(inc line) 0])))
  nil)

(defn sel-parts
  "Splits a selector into its constituent parts, keeping any colons. Returns a sequence of strings."
  [sel]
  (map second (re-seq #"(:|[a-zA-Z0-9_]+\:?)" sel)))

(defn- emit-comma-sep
  [xs]
  (doseq [x xs]
    (emits ", ")
    (emits x))
  (emits ", nil"))

(defn emit-method-parts
  "Given remaining selector parts and arguments, returns a string representing the rest of an Objective-C message send. selparts and args should both be sequences of strings."
  [selparts args]
  (emits
    (cond (empty? selparts) (emit-comma-sep args)
          (empty? args) (emits " " (first selparts))
          :else (emits " " (first selparts) (first args)))

    ; If we had both a selector part and an argument this time,
    (if (and 
          (and (seq selparts) (seq args))
          ; ... and we have at least one more of either
          (or (next selparts) (next args)))
          ; ... recur
          (emit-method-parts (next selparts) (next args)))))

(defmulti emit-constant class)
(defmethod emit-constant nil [x] (emits "nil"))
(defmethod emit-constant Long [x] (emits "@" x))
(defmethod emit-constant Integer [x] (emits "@" x)) ; reader puts Integers in metadata
(defmethod emit-constant Double [x] (emits "@" x))
(defmethod emit-constant String [x]
  (emits "@" (wrap-in-double-quotes (escape-string x))))
(defmethod emit-constant Boolean [x] (emits (if x "@YES" "@NO")))
(defmethod emit-constant Character [x]
  (emits "@" (wrap-in-double-quotes (escape-char x))))

(defmethod emit-constant java.util.regex.Pattern [x]
  (let [[_ flags pattern] (re-find #"^(?:\(\?([idmsux]*)\))?(.*)" (str x))]
    (emits \/ (.replaceAll (re-matcher #"/" pattern) "\\\\/") \/ flags)))

(defmethod emit-constant clojure.lang.Keyword [x]
  (emits "cljm_keyword(@\":")
  (emits (if (namespace x)
    (str (namespace x) "/") "")
    (name x))
  (emits "\")"))

(defmethod emit-constant clojure.lang.Symbol [x]
  (emits "cljm_symbol(@\"'")
  (emits (if (namespace x)
    (str (namespace x) "/") "")
    (name x))
  (emits "\")"))

(defn- emit-meta-constant [x & body]
  (if (meta x)
    (do
      (emits "cljm.core.with_meta(" body ",")
      (emit-constant (meta x))
      (emits ")"))
    (emits body)))

(defmethod emit-constant clojure.lang.PersistentList$EmptyList [x]
  (emit-meta-constant x "cljm.core.List.EMPTY"))

(defmethod emit-constant clojure.lang.PersistentList [x]
  (emit-meta-constant x
    (concat ["cljm.core.list("]
            (comma-sep (map #(fn [] (emit-constant %)) x))
            [")"])))

(defmethod emit-constant clojure.lang.Cons [x]
  (emit-meta-constant x
    (concat ["cljm.core.list("]
            (comma-sep (map #(fn [] (emit-constant %)) x))
            [")"])))

(defmethod emit-constant clojure.lang.IPersistentVector [x]
  (emit-meta-constant x
    (concat ["cljm.core.vec(["]
            (comma-sep (map #(fn [] (emit-constant %)) x))
            ["])"])))

(defmethod emit-constant clojure.lang.IPersistentMap [x]
  (emit-meta-constant x
    (concat ["cljm.core.hash_map("]
            (comma-sep (map #(fn [] (emit-constant %))
                            (apply concat x)))
            [")"])))

(defmethod emit-constant clojure.lang.PersistentHashSet [x]
  (emit-meta-constant x
    (concat ["cljm.core.set(["]
            (comma-sep (map #(fn [] (emit-constant %)) x))
            ["])"])))

(defn emit-block
  [context statements ret]
  (when statements
    (emits statements))
  (emit ret))

(defmacro emit-wrap [env & body]
  `(let [env# ~env]
     (when (= :return (:context env#)) (emits "return "))
     ~@body
     (when-not (= :expr (:context env#)) (emitln ";"))))

(defmethod emit :no-op [m])

(defmethod emit :var
  [{:keys [info env] :as arg}]
  (let [n (:name info)
        n (if (= (namespace n) "js")
            (name n)
            n)
        dynamic (:dynamic info)
        local (:local info)
        ns (:ns info)]
    (emit-wrap env 
      (if-not local
        (do 
          (if-not dynamic
            (emits (munge n))
            (emits "cljm_var_lookup(@\"" n "\")"))
          (if-not (= ns 'ObjectiveCClass)
            (emits ".value")))
        (do
          (emits (munge n)))))))

(defmethod emit :meta
  [{:keys [expr meta env]}]
  (emit-wrap env
    (emits "cljm.core.with_meta(" expr "," meta ")")))

(defmethod emit :map
  [{:keys [env keys vals]}]
  (emit-wrap env
    (if (zero? (count keys))
      (emits "@{}")
      (emits "@{ "
             (comma-sep (map (fn [k v]
                               (with-out-str (emit k) (print ": ") (emit v)))
                             keys vals))
             " }"))))

(defmethod emit :vector
  [{:keys [items env]}]
  (emit-wrap env
    (if (empty? items)
      (emits "@[]")
      (emits "@[ "
             (comma-sep items) " ]"))))

(defmethod emit :set
  [{:keys [items env]}]
  (emit-wrap env
    (if (empty? items)
      (emits "[NSSet set]")
      (emits "[NSSet setWithObjects:"
             (comma-sep items) ", nil]"))))

(defmethod emit :constant
  [{:keys [form env]}]
  (when-not (= :statement (:context env))
    (emit-wrap env (emit-constant form))))

(defn get-tag [e]
  (or (-> e :tag)
      (-> e :info :tag)))

(defn infer-tag [e]
  (if-let [tag (get-tag e)]
    tag
    (case (:op e)
      :let (infer-tag (:ret e))
      :if (let [then-tag (infer-tag (:then e))
                else-tag (infer-tag (:else e))]
            (when (= then-tag else-tag)
              then-tag))
      :constant (case (:form e)
                  true 'boolean
                  false 'boolean
                  nil)
      nil)))

(defn safe-test? [e]
  (let [tag (infer-tag e)]
    (or (#{'boolean 'seq} tag)
        (when (= (:op e) :constant)
          (let [form (:form e)]
            (not (or (and (string? form) (= form ""))
                     (and (number? form) (zero? form)))))))))

(defmethod emit :if
  [{:keys [test then else env]}]
  (let [context (:context env)]
        ; (debug-prn test)
    (if (= :expr context)
      (emits "@(cljm_truthy(" test ")) ? " then " : " else)
      (do
        (emitln "if(cljm_truthy(" test ")) {")
        (emitln then)
        (emitln "} else {")
        (emitln else)
        (emitln "}")))))

(defmethod emit :throw
  [{:keys [throw env]}]
  (if (= :expr (:context env))
    (emits "(function(){throw " throw "})()")
    (emitln "throw " throw ";")))

(defn emit-comment
  "Emit a nicely formatted comment string."
  [doc jsdoc]
  (let [docs (when doc [doc])
        docs (if jsdoc (concat docs jsdoc) docs)
        docs (remove nil? docs)]
    (letfn [(print-comment-lines [e] (doseq [next-line (string/split-lines e)]
                                       (emitln "* " (string/trim next-line))))]
      (when (seq docs)
        (emitln "/**")
        (doseq [e docs]
          (when e
            (print-comment-lines e)))
        (emitln "*/")))))

(defmethod emit :def
  [a]
  (let [{:keys [name init env doc dynamic]} a]
    (when init
      (emit-comment doc (:jsdoc init))
      (if-not dynamic
        (let [mname (munge name)]
          (emits mname " = [[CLJMVar alloc] initWithValue:" init "]"))
        (emits "cljm_var_def(@\"" name "\", " init ")"))
      (when-not (= :expr (:context env)) (emitln ";")))))

(defn emit-apply-to
  [{:keys [name params env]}]
  (let [arglist (gensym "arglist__")
        delegate-name (str (munge name) "__delegate")
        params (map munge params)]
    (emitln "(function (" arglist "){")
    (doseq [[i param] (map-indexed vector (butlast params))]
      (emits "var " param " = cljm.core.first(")
      (dotimes [_ i] (emits "cljm.core.next("))
      (emits arglist ")")
      (dotimes [_ i] (emits ")"))
      (emitln ";"))
    (if (< 1 (count params))
      (do
        (emits "var " (last params) " = cljm.core.rest(")
        (dotimes [_ (- (count params) 2)] (emits "cljm.core.next("))
        (emits arglist)
        (dotimes [_ (- (count params) 2)] (emits ")"))
        (emitln ");")
        (emitln "return " delegate-name "(" (string/join ", " params) ");"))
      (do
        (emits "var " (last params) " = ")
        (emits "cljm.core.seq(" arglist ");")
        (emitln ";")
        (emitln "return " delegate-name "(" (string/join ", " params) ");")))
    (emits "})")))

(defn emit-fn-method
  [{:keys [gthis name variadic params statements ret env recurs max-fixed-arity]}]
  (emit-wrap env
             (emitln "^id(NSArray *cljm_args) {")
             (doseq [[i param] (map-indexed vector params)]
                (emitln "id " (munge param) " = cljm_args[" i "];"))
             (when recurs (emitln "while(YES) {"))
             (emit-block :return statements ret)
             (when recurs
               (emitln "break;")
               (emitln "}"))
             (emits "}")))

(defn emit-variadic-fn-method
  [{:keys [gthis name variadic params statements ret env recurs max-fixed-arity] :as f}]
  (emit-wrap env
             (emitln "^id(NSArray *cljm_args) {")
             (doseq [[i param] (map-indexed vector (butlast params))]
                (emitln "id " (munge param) " = cljm_args[" i "];"))
             (let [lastn (munge (last params))]
                (emitln "NSMutableArray *" lastn " = [NSMutableArray array];")
                (emitln "for(NSUInteger cljm_varargs_index = " (- (count params) 1) "; cljm_varargs_index < cljm_args.count; cljm_varargs_index++) {")
                (emitln "[" lastn " addObject:cljm_args[cljm_varargs_index]];"))
             (emitln "}")
             (when recurs (emitln "while(YES) {"))
             (emit-block :return statements ret)
             (when recurs
               (emitln "break;")
               (emitln "}"))
             (emits "}")))

(defmethod emit :fn
  [{:keys [name env methods max-fixed-arity variadic recur-frames loop-lets]}]
  ;;fn statements get erased, serve no purpose and can pollute scope if named
  ; (debug-prn "name \"" name "\"")
  ; (if (= name "my-plus-or-something") 
  ;   (debug-prn "hi"))
  (when-not (= :statement (:context env))
    (let [loop-locals (->> (concat (mapcat :names (filter #(and % @(:flag %)) recur-frames))
                                   (mapcat :names loop-lets))
                           (map munge)
                           seq)]
      (when loop-locals
        (when (= :return (:context env))
            (emits "return "))
        (emitln "((function (" (comma-sep loop-locals) "){")
        (when-not (= :return (:context env))
            (emits "return ")))
      (if (= 1 (count methods))
        (if variadic
          (emit-variadic-fn-method (assoc (first methods) :name name))
          (emit-fn-method (assoc (first methods) :name name)))
        (let [has-name? (and name true)
              name (or name (gensym))
              mname (munge name)
              maxparams (map munge (apply max-key count (map :params methods)))
              mmap (into {}
                     (map (fn [method]
                            [(munge (symbol (str mname "__" (count (:params method)))))
                             method])
                          methods))
              ms (sort-by #(-> % second :params count) (seq mmap))]
          (when (= :return (:context env))
            (emits "return "))
          (emitln "^id(NSArray *cljm_args) {")
          (emitln "__block CLJMVar *" mname " = nil;")
          (doseq [[n meth] ms]
            (emits "id (^" n ")(NSArray *) = ")
            (if (:variadic meth)
              (emit-variadic-fn-method meth)
              (emit-fn-method meth))
            (emitln ";"))
            (emitln mname " = [[CLJMVar alloc] initWithValue:^(NSArray *cljm_args) {")
          ; (when variadic
          ;   (emitln "var " (last maxparams) " = var_args;"))
          (emitln "switch(cljm_args.count) {")
          (doseq [[n meth] ms]
            (if (:variadic meth)
              (do (emitln "default:")
                (emitln "return " n "(cljm_args);")
                (emitln "break;"))
                  ; (emitln "return " n ".cljm$lang$arity$variadic("
                  ;         (comma-sep (butlast maxparams))
                  ;         (when (> (count maxparams) 1) ", ")
                  ;         "cljm.core.array_seq(arguments, " max-fixed-arity "));"))
              (let [pcnt (count (:params meth))]
                (emitln "case " pcnt ":")
                (emitln "return " n "(cljm_args);")
                (emitln "break;"))))
                ; (emitln "return " n ".call(this" (if (zero? pcnt) nil
                ;                                      (list "," (comma-sep (take pcnt maxparams)))) ");"))))
          (emitln "}")
          ; (emitln "throw('Invalid arity: ' + arguments.length);")
          (emitln "}];")
          ; (when variadic
          ;   (emitln mname ".cljm$lang$maxFixedArity = " max-fixed-arity ";")
          ;   (emitln mname ".cljm$lang$applyTo = " (some #(let [[n m] %] (when (:variadic m) n)) ms) ".cljm$lang$applyTo;"))
          ; (when has-name?
          ;   (doseq [[n meth] ms]
          ;     (let [c (count (:params meth))]
          ;       (if (:variadic meth)
          ;         (emitln mname ".cljm$lang$arity$variadic = " n ".cljm$lang$arity$variadic;")
          ;         (emitln mname ".cljm$lang$arity$" c " = " n ";")))))
          (emitln "return ((id (^)(NSArray *)) [" mname " value])(cljm_args);")
          (emitln "}")))
      (when loop-locals
        (emitln ";})(" (comma-sep loop-locals) "))")))))

(defmethod emit :do
  [{:keys [statements ret env]}]
  (let [context (:context env)]
    (when (and statements (= :expr context)) (emits "{"))
    ;(when statements (emitln "{"))
    (emit-block context statements ret)
    ;(when statements (emits "}"))
    (when (and statements (= :expr context)) (emits "}"))))

(defmethod emit :try*
  [{:keys [env try catch name finally]}]
  (let [context (:context env)
        subcontext (if (= :expr context) :return context)]
    (if (or name finally)
      (do
        (when (= :expr context) (emits "(function (){"))
        (emits "try{")
        (let [{:keys [statements ret]} try]
          (emit-block subcontext statements ret))
        (emits "}")
        (when name
          (emits "catch (" (munge name) "){")
          (when catch
            (let [{:keys [statements ret]} catch]
              (emit-block subcontext statements ret)))
          (emits "}"))
        (when finally
          (let [{:keys [statements ret]} finally]
            (assert (not= :constant (:op ret)) "finally block cannot contain constant")
            (emits "finally {")
            (emit-block subcontext statements ret)
            (emits "}")))
        (when (= :expr context) (emits "})()")))
      (let [{:keys [statements ret]} try]
        (when (and statements (= :expr context)) (emits "(function (){"))
        (emit-block subcontext statements ret)
        (when (and statements (= :expr context)) (emits "})()"))))))

(defmethod emit :let
  [{:keys [bindings statements ret env loop]}]
  (let [context (:context env)]
    (when (= :expr context) (emits "{"))
    (doseq [{:keys [name init]} bindings]
      (emitln "id " (munge name) " = " init ";"))
    (when loop (emitln "while(YES) {"))
    (emit-block (if (= :expr context) :return context) statements ret)
    (when loop
      (emitln "break;")
      (emitln "}"))
    ;(emits "}")
    (when (= :expr context) (emits "}"))))

(defmethod emit :recur
  [{:keys [frame exprs env]}]
  (let [temps (vec (take (count exprs) (repeatedly gensym)))
        names (:names frame)]
    (emitln "{")
    (dotimes [i (count exprs)]
      (emitln "id " (temps i) " = " (exprs i) ";"))
    (dotimes [i (count exprs)]
      (emitln (munge (names i)) " = " (temps i) ";"))
    (emitln "continue;")
    (emitln "}")))

(defmethod emit :letfn
  [{:keys [bindings statements ret env]}]
  (let [context (:context env)]
    (when (= :expr context) (emits "(function (){"))
    (doseq [{:keys [name init]} bindings]
      (emitln "id " (munge name) " = " init ";"))
    (emit-block (if (= :expr context) :return context) statements ret)
    (when (= :expr context) (emits "})()"))))

(defn protocol-prefix [psym]
  (str (-> (str psym) (.replace \. \$) (.replace \/ \$)) "$"))

(defmethod emit :invoke
  [{:keys [f args env] :as expr}]
  (let [info (:info f)
        variadic? (:variadic info)
        dynamic? (:dynamic info)
        name (:name info)
        mname (munge name)]
    (emit-wrap env
      (emits "((")
      (emits "id (^)(NSArray *)")
      (emits ") ")
      (emits "[")
      (if dynamic?
        (emits "cljm_var_lookup(@\"" name "\")")
        (emits mname))
      (emits " value]")
      (emits ")(@[" (comma-sep args) "]")
      (emits ")"))))

(comment (defmethod emit :invoke
  [{:keys [f args env] :as expr}]
  (let [info (:info f)
        fn? (and ana/*cljm-static-fns*
                 (not (:dynamic info))
                 (:fn-var info))
        protocol (:protocol info)
        proto? (let [tag (infer-tag (first (:args expr)))]
                 (and protocol tag
                      (or ana/*cljm-static-fns*
                          (:protocol-inline env))
                      (or (= protocol tag)
                          (when-let [ps (:protocols (ana/resolve-existing-var (dissoc env :locals) tag))]
                            (ps protocol)))))
        opt-not? (and (= (:name info) 'cljm.core/not)
                      (= (infer-tag (first (:args expr))) 'boolean))
        ns (:ns info)
        js? (= ns 'js)
        goog? (when ns
                (or (= ns 'goog)
                    (when-let [ns-str (str ns)]
                      (= (get (string/split ns-str #"\.") 0 nil) "goog"))))
        keyword? (and (= (-> f :op) :constant)
                      (keyword? (-> f :form)))
        [f variadic-invoke]
        (if fn?
          (let [arity (count args)
                variadic? (:variadic info)
                mps (:method-params info)
                mfa (:max-fixed-arity info)]
            (cond
             ;; if only one method, no renaming needed
             (and (not variadic?)
                  (= (count mps) 1))
             [f nil]

             ;; direct dispatch to variadic case
             (and variadic? (> arity mfa))
             [(update-in f [:info :name]
                             (fn [name] (symbol (str (munge name) ".cljm$lang$arity$variadic"))))
              {:max-fixed-arity mfa}]

             ;; direct dispatch to specific arity case
             :else
             (let [arities (map count mps)]
               (if (some #{arity} arities)
                 [(update-in f [:info :name]
                             (fn [name] (symbol (str (munge name) ".cljm$lang$arity$" arity)))) nil]
                 [f nil]))))
          [f nil])]
    (emit-wrap env
      (cond
       opt-not?
       (emits "!(" (first args) ")")

       proto?
       (let [pimpl (str (protocol-prefix protocol)
                        (munge (name (:name info))) "$arity$" (count args))]
         (emits (first args) "." pimpl "(" (comma-sep args) ")"))

       keyword?
       (emits "(new cljm.core.Keyword(" f ")).call(" (comma-sep (cons "null" args)) ")")
       
       variadic-invoke
       (let [mfa (:max-fixed-arity variadic-invoke)]
        (emits f "(" (comma-sep (take mfa args))
               (when-not (zero? mfa) ",")
               "cljm.core.array_seq([" (comma-sep (drop mfa args)) "], 0))"))
       
       (or fn? js? goog?)
       (emits f "(" (comma-sep args)  ")")
       
       :else
       (if (and ana/*cljm-static-fns* (= (:op f) :var))
         (let [fprop (str ".cljm$lang$arity$" (count args))]
           (emits "(" f fprop " ? " f fprop "(" (comma-sep args) ") : " f ".call(" (comma-sep (cons "null" args)) "))"))
         (if variadic? 
          (emits f "(" (comma-sep args) ", nil)")
          (emits f "(" (comma-sep args) ")"))))))))

(defmethod emit :new
  [{:keys [ctor args env]}]
  (emit-wrap env
            (let [method (first args)
                  init-args (rest args)]
             (emits "[" ctor " alloc]"))))
             ; (emit-method-parts (sel-parts method) init-args))))

(defmethod emit :set!
  [{:keys [target val env]}]
  (emit-wrap env (emits target " = " val)))

(defmethod emit :ns
  [{:keys [name requires uses requires-macros env]}]
  (emitln "#import <Foundation/Foundation.h>")
  (emitln "#import <CLJMRuntime/CLJMRuntime.h>")
  (when-not (= name 'cljm.core)
    (emitln "#import \"cljm_DOT_core.h\""))
  (emitln "#import \"" (munge name) ".h\"")
  (doseq [lib (into (vals requires) (distinct (vals uses)))]
    (emitln "#import \"" (munge lib) ".h\"")))

(defmethod emit :deftype*
  [{:keys [t fields pmasks]}]
  (let [fields (map munge fields)]
    (emitln "")
    (emitln "/**")
    (emitln "* @constructor")
    (emitln "*/")
    (emitln (munge t) " = (function (" (comma-sep fields) "){")
    (doseq [fld fields]
      (emitln "this." fld " = " fld ";"))
    (doseq [[pno pmask] pmasks]
      (emitln "this.cljm$lang$protocol_mask$partition" pno "$ = " pmask ";"))
    (emitln "})")))

(defmethod emit :defrecord*
  [{:keys [t fields pmasks]}]
  (let [fields (concat (map munge fields) '[__meta __extmap])]
    (emitln "")
    (emitln "/**")
    (emitln "* @constructor")
    (doseq [fld fields]
      (emitln "* @param {*} " fld))
    (emitln "* @param {*=} __meta ")
    (emitln "* @param {*=} __extmap")
    (emitln "*/")
    (emitln (munge t) " = (function (" (comma-sep fields) "){")
    (doseq [fld fields]
      (emitln "this." fld " = " fld ";"))
    (doseq [[pno pmask] pmasks]
      (emitln "this.cljm$lang$protocol_mask$partition" pno "$ = " pmask ";"))
    (emitln "if(arguments.length>" (- (count fields) 2) "){")
    (emitln "this.__meta = __meta;")
    (emitln "this.__extmap = __extmap;")
    (emitln "} else {")
    (emits "this.__meta=")
    (emit-constant nil)
    (emitln ";")
    (emits "this.__extmap=")
    (emit-constant nil)
    (emitln ";")
    (emitln "}")
    (emitln "})")))

(defmethod emit :dot
  [{:keys [target field method args env]}]
  (emit-wrap env
             (if field
               (emits target "." (munge field #{}))
               (do 
                (emits "[" target)
                (emit-method-parts (sel-parts (str method)) args)
                (emits "]")))))

(defmethod emit :objc
  [{:keys [env code segs args]}]
  (emit-wrap env
             (if code
               (emits code)
               (emits (interleave (concat segs (repeat nil))
                                  (concat args [nil]))))))

(defmethod emit :js
  [{:keys [env code segs args]}]
  (emit-wrap env
             (if code
               (emits code)
               (emits (interleave (concat segs (repeat nil))
                                  (concat args [nil]))))))

(defn forms-seq
  "Seq of forms in a Clojure or ClojureScript file."
  ([f]
     (forms-seq f (clojure.lang.LineNumberingPushbackReader. (io/reader f))))
  ([f ^java.io.PushbackReader rdr]
     (if-let [form (binding [*ns* ana/*reader-ns*] (read rdr nil nil))]
       (lazy-seq (cons form (forms-seq f rdr)))
       (.close rdr))))

(defn rename-to
  "Change the file extension from .cljm to .m. Takes a File or a
  String. Always returns a String."
  [file-str ext]
  (clojure.string/replace file-str #"\.cljm$" ext))

(defn mkdirs
  "Create all parent directories for the passed file."
  [^java.io.File f]
  (.mkdirs (.getParentFile (.getCanonicalFile f))))

(defmacro with-core-cljm
  "Ensure that core.cljm has been loaded."
  [& body]
  `(do (when-not (:defs (get @ana/namespaces 'cljm.core))
         (ana/analyze-file "cljm/core.cljm"))
       ~@body))

(defn compile-file* [src dest]
  (with-core-cljm
    (with-open [out ^java.io.Writer (io/make-writer dest {})]
      (binding [*out* out
                ana/*cljm-ns* 'cljm.user
                ana/*cljm-file* (.getPath ^java.io.File src)
                *data-readers* tags/*cljm-data-readers*
                *position* (atom [0 0])]
        (loop [forms (forms-seq src)
               ns-name nil
               deps nil
               externs []]
          (if (seq forms)
            (let [env (ana/empty-env)
                  ast (ana/analyze env (first forms))]
              (do (emit ast)
                  (cond 
                    (= (:op ast) :ns)
                      (let [found-ns (:name ast)]
                        ; TODO: It'd be nice to only init namespaces that are 
                        ; actually used.
                        (emits "__attribute__((constructor))\nvoid " (init-func-name found-ns) "(void) {\n")
                        (emitln "@autoreleasepool {")
                        (recur (rest forms) found-ns (merge (:uses ast) (:requires ast)) externs))
                    (= (:op ast) :def)
                      ; Don't add the block to the externs list if it's private
                      ; (if-let [externs (:private ast)] (conj externs ast) externs
                        (recur (rest forms) ns-name (merge (:uses ast) (:requires ast)) (conj externs ast))
                    :else
                      (recur (rest forms) ns-name deps externs))))
            (do
              (emitln "}")
              (emitln "}")
              {:ns (or ns-name 'cljm.user)
               :provides [ns-name]
               :requires (if (= ns-name 'cljm.core) (set (vals deps)) (conj (set (vals deps)) 'cljm.core))
               :file dest
               :externs externs})))))))

(defn requires-compilation?
  "Return true if the src file requires compilation."
  [^java.io.File src ^java.io.File dest]
  ; for the sake of debugging right now, we'll always recompile everything
  true)
  ; (or (not (.exists dest))
  ;     (> (.lastModified src) (.lastModified dest))))

(defn compile-file
  "Compiles src to a file of the same name, but with a .js extension,
   in the src file's directory.

   With dest argument, write file to provided location. If the dest
   argument is a file outside the source tree, missing parent
   directories will be created. The src file will only be compiled if
   the dest file has an older modification time.

   Both src and dest may be either a String or a File.

   Returns a map containing {:ns .. :provides .. :requires .. :file ..}.
   If the file was not compiled returns only {:file ...}"
  ([src]
     (let [dest (rename-to src ".m")]
       (compile-file src dest)))
  ([src dest]
     (let [src-file (io/file src)
           dest-file (io/file dest)]
       (if (.exists src-file)
         (if (requires-compilation? src-file dest-file)
           (do (mkdirs dest-file)
               (compile-file* src-file dest-file))
           {:file dest-file})
         (throw (java.io.FileNotFoundException. (str "The file " src " does not exist.")))))))

(defn init-func-name
  [ns]
  (munge (str ns "/cljm-ns-init")))

(defn generate-header
  [ns-info file]
  (let [dest-file (io/file file)
        {:keys [externs]} ns-info]
    (with-open [out ^java.io.Writer (io/make-writer dest-file {})]
      (binding [*out* out]
        (emitln "@class CLJMVar;\n")
        (doseq [extern externs]
          (let [mname (munge (:name extern))
                init (:init extern)]
            (emitln "CLJMVar *" mname ";")))))))

(comment
  ;; flex compile-file
  (do
    (compile-file "/tmp/hello.cljm" "/tmp/something.js")
    (slurp "/tmp/hello.js")

    (compile-file "/tmp/somescript.cljm")
    (slurp "/tmp/somescript.js")))

(defn path-seq
  [file-str]
  (->> java.io.File/separator
       java.util.regex.Pattern/quote
       re-pattern
       (string/split file-str)))

(defn to-path
  ([parts]
     (to-path parts java.io.File/separator))
  ([parts sep]
     (apply str (interpose sep parts))))

(defn to-target-file
  "Given the source root directory, the output target directory and
  file under the source root, produce the target file."
  [^java.io.File dir ^String target ^java.io.File file ext]
  (let [dir-path (path-seq (.getAbsolutePath dir))
        file-path (path-seq (.getAbsolutePath file))
        relative-path (drop (count dir-path) file-path)
        parents (butlast relative-path)
        parent-file (java.io.File. ^String (to-path (cons target parents)))]
    (java.io.File. parent-file ^String (rename-to (last relative-path) ext))))

(defn cljm-files-in
  "Return a sequence of all .cljm files in the given directory."
  [dir]
  (filter #(let [name (.getName ^java.io.File %)]
             (and (.endsWith name ".cljm")
                  (not= \. (first name))
                  (not (contains? cljm-reserved-file-names name))))
          (file-seq dir)))

(defn move-and-rename
  [^java.io.File m-file ^java.io.File h-file ns target-dir]
  (let [mname (munge ns)]
    (.renameTo m-file (java.io.File. (str target-dir java.io.File/separator mname ".m")))
    (.renameTo h-file (java.io.File. (str target-dir java.io.File/separator mname ".h")))))

(defn compile-root
  "Looks recursively in src-dir for .cljm files and compiles them to
   .m files. If target-dir is provided, output will go into this
   directory mirroring the source directory structure. Returns a list
   of maps containing information about each file which was compiled
   in dependency order."
  ([src-dir]
     (compile-root src-dir "out"))
  ([src-dir target-dir]
     (let [src-dir-file (io/file src-dir)]
       (loop [cljm-files (cons (java.io.File. "src/cljm/cljm/core.cljm") (cljm-files-in src-dir-file))
              output-files []]
         (if (seq cljm-files)
           (let [cljm-file (first cljm-files)
                 m-file ^java.io.File (to-target-file src-dir-file target-dir cljm-file ".m")
                 ns-info (compile-file cljm-file m-file) 
                 h-file ^java.io.File (to-target-file src-dir-file target-dir cljm-file ".h")]
             (generate-header ns-info h-file)
             (move-and-rename m-file h-file (:ns ns-info) target-dir)
             (recur (rest cljm-files) (conj output-files (assoc ns-info :file-name (.getPath m-file)))))
           output-files)))))

(comment
  ;; compile-root
  ;; If you have a standard project layout with all file in src
  (compile-root "src")
  ;; will produce a mirrored directory structure under "out" but all
  ;; files will be compiled to js.
  )

(comment

;;the new way - use the REPL!!
(require '[cljm.compiler :as comp])
(def repl-env (comp/repl-env))
(comp/repl repl-env)
;having problems?, try verbose mode
(comp/repl repl-env :verbose true)
;don't forget to check for uses of undeclared vars
(comp/repl repl-env :warn-on-undeclared true)

(test-stuff)
(+ 1 2 3)
([ 1 2 3 4] 2)
({:a 1 :b 2} :a)
({1 1 2 2} 1)
(#{1 2 3} 2)
(:b {:a 1 :b 2})
('b '{:a 1 b 2})

(extend-type number ISeq (-seq [x] x))
(seq 42)
;(aset cljm.core.ISeq "number" true)
;(aget cljm.core.ISeq "number")
(satisfies? ISeq 42)
(extend-type nil ISeq (-seq [x] x))
(satisfies? ISeq nil)
(seq nil)

(extend-type default ISeq (-seq [x] x))
(satisfies? ISeq true)
(seq true)

(test-stuff)

(array-seq [])
(defn f [& etc] etc)
(f)

(in-ns 'cljm.core)
;;hack on core


(deftype Foo [a] IMeta (-meta [_] (fn [] a)))
((-meta (Foo. 42)))

;;OLD way, don't you want to use the REPL?
(in-ns 'cljm.compiler)
(import '[javax.script ScriptEngineManager])
(def jse (-> (ScriptEngineManager.) (.getEngineByName "JavaScript")))
(.eval jse cljm.compiler/bootjs)
(def envx {:ns (@namespaces 'cljm.user) :context :expr :locals '{ethel {:name ethel__123 :init nil}}})
(analyze envx nil)
(analyze envx 42)
(analyze envx "foo")
(analyze envx 'fred)
(analyze envx 'fred.x)
(analyze envx 'ethel)
(analyze envx 'ethel.x)
(analyze envx 'my.ns/fred)
(analyze envx 'your.ns.fred)
(analyze envx '(if test then else))
(analyze envx '(if test then))
(analyze envx '(and fred ethel))
(analyze (assoc envx :context :statement) '(def test "fortytwo" 42))
(analyze (assoc envx :context :expr) '(fn* ^{::fields [a b c]} [x y] a y x))
(analyze (assoc envx :context :statement) '(let* [a 1 b 2] a))
(analyze (assoc envx :context :statement) '(defprotocol P (bar [a]) (baz [b c])))
(analyze (assoc envx :context :statement) '(. x y))
(analyze envx '(fn foo [x] (let [x 42] (js* "~{x}['foobar']"))))

(analyze envx '(ns fred (:require [your.ns :as yn]) (:require-macros [clojure.core :as core])))
(defmacro js [form]
  `(emit (ana/analyze {:ns (@ana/namespaces 'cljm.user) :context :statement :locals {}} '~form)))

(defn jscapture [form]
  "just grabs the js, doesn't print it"
  (with-out-str
    (emit (analyze {:ns (@namespaces 'cljm.user) :context :expr :locals {}} form))))

(defn jseval [form]
  (let [js (jscapture form)]
    ;;(prn js)
    (.eval jse (str "print(" js ")"))))

;; from closure.clj
(optimize (jscapture '(defn foo [x y] (if true 46 (recur 1 x)))))

(js (if a b c))
(js (def x 42))
(js (defn foo [a b] a))
(js (do 1 2 3))
(js (let [a 1 b 2 a b] a))

(js (ns fred (:require [your.ns :as yn]) (:require-macros [cljm.core :as core])))

(js (def foo? (fn* ^{::fields [a? b c]} [x y] (if true a? (recur 1 x)))))
(js (def foo (fn* ^{::fields [a b c]} [x y] (if true a (recur 1 x)))))
(js (defn foo [x y] (if true x y)))
(jseval '(defn foo [x y] (if true x y)))
(js (defn foo [x y] (if true 46 (recur 1 x))))
(jseval '(defn foo [x y] (if true 46 (recur 1 x))))
(jseval '(foo 1 2))
(js (and fred ethel))
(jseval '(ns fred (:require [your.ns :as yn]) (:require-macros [cljm.core :as core])))
(js (def x 42))
(jseval '(def x 42))
(jseval 'x)
(jseval '(if 42 1 2))
(jseval '(or 1 2))
(jseval '(fn* [x y] (if true 46 (recur 1 x))))
(.eval jse "print(test)")
(.eval jse "print(cljm.user.Foo)")
(.eval jse  "print(cljm.user.Foo = function (){\n}\n)")
(js (def fred 42))
(js (deftype* Foo [a b-foo c]))
(jseval '(deftype* Foo [a b-foo c]))
(jseval '(. (new Foo 1 2 3) b-foo))
(js (. (new Foo 1 2 3) b))
(.eval jse "print(new cljm.user.Foo(1, 42, 3).b)")
(.eval jse "(function (x, ys){return Array.prototype.slice.call(arguments, 1);})(1,2)[0]")

(macroexpand-1 '(cljm.core/deftype Foo [a b c] Fred (fred [x] a) (fred [x y] b) (ethel [x] c) Ethel (foo [] d)))
(-> (macroexpand-1 '(cljm.core/deftype Foo [a b c] Fred (fred [x] a) (fred [x y] b) (ethel [x] c) Ethel (foo [] d)))
    last last last first meta)

(macroexpand-1 '(cljm.core/extend-type Foo Fred (fred ([x] a) ([x y] b)) (ethel ([x] c)) Ethel (foo ([] d))))
(js (new foo.Bar 65))
(js (defprotocol P (bar [a]) (baz [b c])))
(js (. x y))
(js (. "fred" (y)))
(js (. x y 42 43))
(js (.. a b c d))
(js (. x (y 42 43)))
(js (fn [x] x))
(js (fn ([t] t) ([x y] y) ([ a b & zs] b)))

(js (. (fn foo ([t] t) ([x y] y) ([a b & zs] b)) call nil 1 2))
(js (fn foo
      ([t] t)
      ([x y] y)
      ([ a b & zs] b)))

(js ((fn foo
       ([t] (foo t nil))
       ([x y] y)
       ([ a b & zs] b)) 1 2 3))


(jseval '((fn foo ([t] t) ([x y] y) ([ a b & zs] zs)) 12 13 14 15))

(js (defn foo [this] this))

(js (defn foo [a b c & ys] ys))
(js ((fn [x & ys] ys) 1 2 3 4))
(jseval '((fn [x & ys] ys) 1 2 3 4))
(js (cljm.core/deftype Foo [a b c] Fred (fred [x] a) (fred [x y] a)  (ethel [x] c) Ethel (foo [] d)))
(jseval '(cljm.core/deftype Foo [a b c] Fred (fred [x] a) (fred [x y] a)  (ethel [x] c) Ethel (foo [] d)))

(js (do
           (defprotocol Proto (foo [this]))
           (deftype Type [a] Proto (foo [this] a))
           (foo (new Type 42))))

(jseval '(do
           (defprotocol P-roto (foo? [this]))
           (deftype T-ype [a] P-roto (foo? [this] a))
           (foo? (new T-ype 42))))

(js (def x (fn foo [x] (let [x 42] (js* "~{x}['foobar']")))))
(js (let [a 1 b 2 a b] a))

(doseq [e '[nil true false 42 "fred" fred ethel my.ns/fred your.ns.fred
            (if test then "fooelse")
            (def x 45)
            (do x y y)
            (fn* [x y] x y x)
            (fn* [x y] (if true 46 (recur 1 x)))
            (let* [a 1 b 2 a a] a b)
            (do "do1")
            (loop* [x 1 y 2] (if true 42 (do (recur 43 44))))
            (my.foo 1 2 3)
            (let* [a 1 b 2 c 3] (set! y.s.d b) (new fred.Ethel a b c))
            (let [x (do 1 2 3)] x)
            ]]
  (->> e (analyze envx) emit)
  (newline)))

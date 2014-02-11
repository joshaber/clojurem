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
            [cljm.analyzer :as ana]
            [clojure.pprint :as pp])
  (:import java.lang.StringBuilder))

(declare munge)
(declare init-func-name)

(def include-core true)

(def ^:dynamic *externs* nil)

(def ^:dynamic *static-exprs* nil)

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
(defmethod emit-constant Boolean [x] (emits (if x "@(YES)" "@(NO)")))
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
  (emit-meta-constant x "@[]"))

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
        field (:field info)
        ns (:ns info)
        type? (:type info)
        is-protocol? (:is-protocol info)]
    (emit-wrap env
      (if-not local
        (if is-protocol?
          (emits "@protocol(" (munge n) ")")
          (do
            (if-not dynamic
              (emits (munge n))
              (emits "cljm_var_lookup(@\"" n "\")"))
            (if-not (or (= ns 'ObjectiveCClass) type?)
              (emits ".value"))
            (when (or (= ns 'ObjectiveCClass) type?)
              (emits ".class"))))
        (if field
          (emits "[self " (munge n) "]")
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
    (if (= :expr context)
      (emits "cljm_truthy(" test ") ? " then " : " else)
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

(defn add-extern!
  [ast]
  (swap! *externs* conj ast))

(defn add-static-expr!
  [ast]
  (swap! *static-exprs* conj ast))

(defmethod emit :def
  [{:keys [name init env doc dynamic protocol] :as ast}]
    ;; TODO: don't extern private fn's
    (if-not protocol
      (do (add-extern! ast)
        (when init
          (emit-comment doc (:jsdoc init))
          (if-not dynamic
            (let [mname (munge name)]
              (emits mname " = [[CLJMVar alloc] initWithValue:" init "]"))
            (emits "cljm_var_def(@\"" name "\", " init ")"))
          (when-not (= :expr (:context env)) (emitln ";")))
          (emitln))))

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

(defn emit-start-fn-var
  [args imp-fn]
  (emits "[[CLJMFunction alloc] initWithBlock:^ id (")
  (emits (comma-sep (map #(str "id " (munge %)) args)))
  (when-not imp-fn
    (when (> (count args) 0)
      (emits ", "))
    (emits "id cljm_vararg, ..."))
  (emitln ") {"))

(defn emit-end-fn-var
  []
  (emitln "}]"))

(defn emit-fn-method
  [{:keys [gthis name variadic params statements ret env recurs max-fixed-arity]} imp-fn]
  (emit-wrap env
             (emit-start-fn-var params imp-fn)
             (when imp-fn
              (let [n (munge (first params))]
                (when (not= n 'self) (emitln "id self = " n ";"))))
             (when recurs (emitln "while(YES) {"))
             (emit-block :return statements ret)
             (when recurs
                   (emitln "break;")
                   (emitln "}"))
             (emit-end-fn-var)))

(defn emit-variadic-fn-method
  [{:keys [gthis name variadic params statements ret env recurs max-fixed-arity] :as f} imp-fn]
  (emit-wrap env
             (emit-start-fn-var (drop-last params) imp-fn)
             (when imp-fn
              (let [n (munge (first params))]
                (when (not= n 'self) (emitln "id self = " n ";"))))
             (let [lastn (munge (last params))]
                  (emitln "NSMutableArray *" lastn " = [NSMutableArray array];")
                  (emitln "va_list cljm_args;")
                  (emitln "va_start(cljm_args, cljm_vararg);")
                  (emitln "for (id cljm_currentArg = cljm_vararg; cljm_currentArg != nil; cljm_currentArg = va_arg(cljm_args, id)) {")
                  (emitln "\t[" lastn " addObject:cljm_currentArg];")
                  (emitln "}")
                  (emitln "va_end(cljm_args);"))
             (when recurs (emitln "while(YES) {"))
             (emit-block :return statements ret)
             (when recurs
                   (emitln "break;")
                   (emitln "}"))
             (emit-end-fn-var)))

(defmethod emit :fn
  [{:keys [name env methods max-fixed-arity variadic recur-frames loop-lets imp-fn]}]
  ;;fn statements get erased, serve no purpose and can pollute scope if named
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
          (emit-variadic-fn-method (assoc (first methods) :name name) imp-fn)
          (emit-fn-method (assoc (first methods) :name name) imp-fn))
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
          (emitln "[[CLJMFunction alloc] initWithBlock:^ id (id cljm_vararg, ...) {")
          (emitln "__block CLJMVar *" mname ";")
          (doseq [[n meth] ms]
            (emits "CLJMFunction *" n " = ")
            (if (:variadic meth)
              (emit-variadic-fn-method meth imp-fn)
              (emit-fn-method meth imp-fn))
            (emitln ";")
            (emitln))
          (emitln mname " = [[CLJMVar alloc] initWithValue:[[CLJMFunction alloc] initWithBlock:^ id (NSArray *cljm_args) {")
          (emitln "switch(cljm_args.count) {")
          (doseq [[n meth] ms]
            (if (:variadic meth)
              (do (emitln "default:")
                (emitln "return ((id (^)(id, ...))[" n " block])(cljm_args[0], nil);")
                (emitln "break;"))
              (let [pcnt (count (:params meth))]
                (emitln "case " pcnt ":")
                (emits "return ((id (^)(id, ...))[" n " block])(")
                (dotimes [n pcnt]
                          (emits "cljm_args[" n "], "))
                (emits "nil);")
                ; (emitln "return ((id (^)(id, ...))[" n " block])(cljm_args[0], nil);")
                (emitln "break;"))))
          (emitln "}")
          (emitln "return nil;")
          (emitln "}]];")
          (emitln "NSMutableArray *cljm_collectedArgs = [NSMutableArray array];")
          (emitln "va_list cljm_args;")
          (emitln "va_start(cljm_args, cljm_vararg);")
          (emitln "for (id cljm_currentArg = cljm_vararg; cljm_currentArg != nil; cljm_currentArg = va_arg(cljm_args, id)) {")
          (emitln "\t[cljm_collectedArgs addObject:cljm_currentArg];")
          (emitln "}")
          (emitln "va_end(cljm_args);")
          (emitln "return ((id (^)(NSArray *))[(CLJMFunction *)[" mname " value] block])(cljm_collectedArgs);")
          (emitln "}]")))
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
    (when (= :expr context) (emits "^ id {"))
    (doseq [{:keys [name init]} bindings]
      (emitln "id " (munge name) " = " init ";"))
    (when loop (emitln "while(YES) {"))
    (emit-block (if (= :expr context) :return context) statements ret)
    (when loop
      (emitln "break;")
      (emitln "}"))
    ;(emits "}")
    (when (= :expr context) (emits "}()"))))

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

(defn protocol-munge
  [p x]
  (str (munge p) "_" (munge x)))

(defmethod emit :invoke
  [{:keys [f args env] :as expr}]
  (let [info (:info f)
        variadic? (:variadic info)
        dynamic? (:dynamic info)
        fn-name (:name info)
        mname (munge fn-name)
        keyword? (and (= (-> f :op) :constant)
                      (keyword? (-> f :form)))
        kwname (-> f :form)
        protocol (:protocol info)
        local? (:local info)
        ns (:ns info)
        c-call? (= ns 'c)]
    (emit-wrap env
      (cond
        protocol (let [pmname (protocol-munge protocol (apply str (drop 1 (last (string/split (str fn-name) #"/")))))]
                  (emits "[(id<" (munge protocol) ">) " (first args) " ")
                  (emits pmname)
                  (doseq [arg (rest args)]
                         (emits ":" arg " "))
                  (emits "]"))
        keyword? (emits "[" (first args) " objectForKey:cljm_keyword(@\"" kwname "\")]")
        c-call? (emits (name fn-name) "(" (comma-sep args) ")")
        :else (do (emits "((id (^)(")
                (emits (comma-sep (map (fn [x] (str "id")) (concat args (list "cljm_args")))))
                (emits ", ...))")
                (if-not local?
                  (emits "["))
                (emits "(CLJMFunction *)[")
                (if dynamic?
                    (emits "cljm_var_lookup(@\"" fn-name "\")")
                    (emits mname))
                (if-not local?
                  (emits " value]"))
                (emits " block])(")
                (emits (comma-sep (conj args "nil")) ")"))))))

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
                  init-args (rest args)
                  init-meth (if (seq args)
                                (reduce (fn [xs x] (str xs ":")) "initWithFields" args)
                                "init")]
             (emits "[[" ctor " alloc]")
             (emit-method-parts (sel-parts init-meth) args)
             (emits "]"))))

(defmethod emit :set!
  [{:keys [target val env]}]
  (emit-wrap env (emits target " = " val)))

(defmethod emit :ns
  [{:keys [name requires uses requires-macros env]}]
  (emitln "#import <Foundation/Foundation.h>")
  (emitln "#import <CLJMRuntime/CLJMRuntime.h>")
  (emitln "#import <objc/runtime.h>")
  (when include-core
    (when-not (= name 'cljm.core)
     (emitln "#import \"cljm_DOT_core.h\"")))
  (emitln "#import \"" (munge name) ".h\"")
  (doseq [lib (into (vals requires) (distinct (vals uses)))]
    (emitln "#import \"" (munge lib) ".h\"")))

(defmethod emit :defprotocol*
  [ast]
  (add-extern! ast))

(defmethod emit :deftype*
  [{:keys [t fields pmasks reify] :as ast}]
  (when-not reify
    (add-extern! ast)
    (add-static-expr! ast)))

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
               (emits "[" target " " (munge field #{}) "]")
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

(defmulti emit-static :op)

(declare objc-class-munge)

(defmethod emit-static :deftype*
  [{:keys [t methods]}]
  (emitln)
  (emitln "@implementation " (objc-class-munge t))
  (emitln "@end")
  (emitln))

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
  `(do (when include-core
        (when-not (:defs (get @ana/namespaces 'cljm.core))
         (ana/analyze-file "cljm/core.cljm")))
       ~@body))

(defn compile-file* [src dest]
  (with-core-cljm
    (with-open [out ^java.io.Writer (io/make-writer dest {})]
      (binding [*out* out
                ana/*cljm-ns* 'cljm.user
                ana/*cljm-file* (.getPath ^java.io.File src)
                *data-readers* tags/*cljm-data-readers*
                *position* (atom [0 0])
                *static-exprs* (atom [])]
        (loop [forms (forms-seq src)
               ns-name nil
               deps nil]
          (if (seq forms)
            (let [env (ana/empty-env)
                  ast (ana/analyze env (first forms))]
                  ; (binding [*out* *err*]
                  ;   (println "Goodbye, world!")
                  ;   (clojure.pprint/pprint ast))
              (emit ast)
              (if (= (:op ast) :ns)
                (let [found-ns (:name ast)]
                  ; TODO: It'd be nice to only init namespaces that are
                  ; actually used.
                  (emitln "__attribute__((constructor))")
                  (emitln "void " (init-func-name found-ns) "(void) {\n")
                  (emitln "@autoreleasepool {")
                  (recur (rest forms) found-ns (merge (:uses ast) (:requires ast))))
                (recur (rest forms) ns-name deps)))
            (do
              (emitln "}")
              (emitln "}")
              (doseq [ast @*static-exprs*]
                (emit-static ast))
              {:ns (or ns-name 'cljm.user)
               :provides [ns-name]
               :requires (if (= ns-name 'cljm.core) (set (vals deps)) (conj (set (vals deps)) 'cljm.core))
               :file dest})))))))

(defn requires-compilation?
  "Return true if the src file requires compilation."
  [^java.io.File src ^java.io.File dest]
  ; for the sake of debugging right now, we'll always recompile everything
  true)
  ; (or (not (.exists dest))
  ;     (> (.lastModified src) (.lastModified dest))))

(defmulti emit-h :op)

(defmethod emit-h :defprotocol*
  [{:keys [p index methods]}]
    (emitln)
    (emitln "@protocol " (munge p) " <NSObject>")
    (emitln)
    (doseq [method methods]
      (let [mname (protocol-munge p (apply str (drop 1 (seq (str (first method))))))
            arities (take-while vector? (drop 1 method))
            has-comment? (string? (last method))
            comment (if has-comment? (last method) nil)]
        (when has-comment?
          (emit-comment comment ""))
        (doseq [arity arities]
          (emits "- (id)" mname)
          (doseq [arg (drop 1 arity)]
            (emits ":(id)" (munge arg) " "))
          (emits ";")
          (emitln))
        (emitln)))
    (emitln)
    (emitln "@end")
    (emitln))

(defmethod emit-h :def
  [ast]
  (let [mname (munge (:name ast))]
    (emitln "CLJMVar *" mname ";")))

(defn- objc-class-munge
  [t]
  (if (= (string/upper-case (namespace t)) (namespace t))
      (str (namespace t) (name t))
      (munge t)))

(defn- selector-name
  [sel]
  (let [ssel (seq sel)]
        (apply str (cond 
                     (= (first ssel) \-) (drop 1 ssel)
                     (= (last ssel) \!) (drop-last ssel)
                     :else ssel))))

(defmethod emit-h :deftype*
  [{:keys [t fields superclass protocols methods env] :as ast}]
  (emitln)
  (let [class-name (objc-class-munge t)
        superclass (objc-class-munge superclass)]
        (emits "@interface " class-name " : " superclass))
  (when (seq? (seq protocols))
        (emits " <" (comma-sep (map objc-class-munge protocols)) ">"))
  (emitln)
  (emitln)
  (doseq [p fields]
    (let [tag (-> p meta :tag)
          type (cond
                  (= 'iboutlet tag) "IBOutlet id"
                  nil? "id"
                  :else tag)]
      (emitln "@property (nonatomic, strong) " type " " (munge p) ";")))
  (emitln)
  (doseq [[p ms] methods]
         (doseq [m ms]
                 (let [p-ns (:ns (ana/resolve-existing-var (dissoc env :locals) p))
                       prefix (if (= p-ns 'ObjectiveCClass)
                                ""
                                (str (munge (str p-ns "/" p)) "_"))
                       mname (str prefix (selector-name (str (first m))))
                       parts (string/split mname #":")
                       pair-args (fn [sel arg] (str (munge sel) ":(id)" (munge arg) " "))
                       args (drop 1 (second m))
                       sel-parts (if (seq args)
                                  (apply str (map pair-args (concat parts (repeat "")) args))
                                  (str (first parts)))]
                       (emitln "- (id)" sel-parts ";")
                       (emitln))))
  (emitln)
  (emitln "@end")
  (emitln))

(defn generate-header
  [externs file]
  (let [dest-file (io/file file)]
    (with-open [out ^java.io.Writer (io/make-writer dest-file {})]
      (binding [*out* out]
        (emitln "@class CLJMVar;")
        (emitln)
        (doseq [ast externs]
          (emit-h ast))))))

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
    (binding [*externs* (atom [])]
     (let [src-file (io/file src)
           dest-file (io/file dest)]
       (if (.exists src-file)
         (if (requires-compilation? src-file dest-file)
           (do (mkdirs dest-file)
               (assoc (compile-file* src-file dest-file) :externs @*externs*))
           {:file dest-file, :externs []})
         (throw (java.io.FileNotFoundException. (str "The file " src " does not exist."))))))))

(defn init-func-name
  [ns]
  (munge (str ns "/cljm-ns-init")))

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
       (loop [cljm-files (cljm-files-in src-dir-file)
              output-files []]
         (if (seq cljm-files)
           (let [cljm-file (first cljm-files)
                 m-file ^java.io.File (to-target-file src-dir-file target-dir cljm-file ".m")
                 h-file ^java.io.File (to-target-file src-dir-file target-dir cljm-file ".h")
                 ns-info (compile-file cljm-file m-file)]
             (generate-header (:externs ns-info) h-file)
             (move-and-rename m-file h-file (:ns ns-info) target-dir)
             (recur (rest cljm-files) (conj output-files (assoc ns-info :file-name (.getPath m-file)))))
           output-files)))))

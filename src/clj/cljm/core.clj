;   Copyright (c) Rich Hickey. All rights reserved.
;   The use and distribution terms for this software are covered by the
;   Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php)
;   which can be found in the file epl-v10.html at the root of this distribution.
;   By using this software in any fashion, you are agreeing to be bound by
;   the terms of this license.
;   You must not remove this notice, or any other, from this software.

(ns cljm.core
  (:refer-clojure :exclude [-> ->> .. amap and areduce alength aclone assert binding bound-fn case comment cond condp
                            declare definline definterface defmethod defmulti defn defn- defonce
                            defprotocol defrecord defstruct deftype delay destructure doseq dosync dotimes doto
                            extend-protocol extend-type fn for future gen-class gen-interface
                            if-let if-not import io! lazy-cat lazy-seq let letfn locking loop
                            memfn ns or proxy proxy-super pvalues refer-clojure reify sync time
                            when when-first when-let when-not while with-bindings with-in-str
                            with-loading-context with-local-vars with-open with-out-str with-precision with-redefs
                            satisfies? identical? true? false? nil? str get

                            aget aset
                            + - * / < <= > >= == zero? pos? neg? inc dec max min mod
                            bit-and bit-and-not bit-clear bit-flip bit-not bit-or bit-set
                            bit-test bit-shift-left bit-shift-right bit-xor])
  (:require [clojure.walk]
            [clojure.string :as string]))

(alias 'core 'clojure.core)

(defmacro import-macros [ns [& vars]]
  (core/let [ns (find-ns ns)
             vars (map #(ns-resolve ns %) vars)
             syms (map (core/fn [^clojure.lang.Var v] (core/-> v .sym (with-meta {:macro true}))) vars)
             defs (map (core/fn [sym var]
                                `(def ~sym (deref ~var))) syms vars)]
            `(do ~@defs
                 :imported)))

(import-macros clojure.core
 [-> ->> ..  and assert comment cond
  declare defn defn-
  doto
  extend-protocol fn for
  if-let if-not letfn
  memfn or
  when when-first when-let when-not while])

(defmacro ^{:private true} assert-args [fnname & pairs]
  `(do (when-not ~(first pairs)
         (throw (IllegalArgumentException.
                  ~(core/str fnname " requires " (second pairs)))))
     ~(core/let [more (nnext pairs)]
        (when more
          (list* `assert-args fnname more)))))

(defmacro ->i
  [i]
  `(.integerValue ~i))

(defmacro ->ui
  [ui]
  `(.unsignedIntegerValue ~ui))

(defmacro ->b
  [b]
  `(.boolValue ~b))

(defmacro ->d
  [d]
  `(.doubleValue ~d))

(defmacro selector
  [s]
  (list 'objc* (core/str "@selector(" s ")")))

(defmacro ->v
  [a]
  (list 'objc* "@(~{})" a))

(defn destructure [bindings]
  (core/let [bents (partition 2 bindings)
         pb (fn pb [bvec b v]
              (core/let [pvec
                     (fn [bvec b val]
                       (core/let [gvec (gensym "vec__")]
                         (core/loop [ret (-> bvec (conj gvec) (conj val))
                                     n 0
                                     bs b
                                     seen-rest? false]
                           (if (seq bs)
                             (core/let [firstb (first bs)]
                               (cond
                                 (= firstb '&) (recur (pb ret (second bs) (list `nthnext gvec n))
                                                      n
                                                      (nnext bs)
                                                      true)
                                 (= firstb :as) (pb ret (second bs) gvec)
                                 :else (if seen-rest?
                                         (throw (new Exception "Unsupported binding form, only :as can follow & parameter"))
                                         (recur (pb ret firstb  (list `nth gvec n nil))
                                                (core/inc n)
                                                (next bs)
                                                seen-rest?))))
                             ret))))
                     pmap
                     (fn [bvec b v]
                       (core/let [gmap (gensym "map__")
                                  defaults (:or b)]
                         (core/loop [ret (-> bvec (conj gmap) (conj v)
                                             (conj gmap) (conj `(if (seq? ~gmap) (apply hash-map ~gmap) ~gmap))
                                             ((fn [ret]
                                                (if (:as b)
                                                  (conj ret (:as b) gmap)
                                                  ret))))
                                     bes (reduce
                                          (fn [bes entry]
                                            (reduce #(assoc %1 %2 ((val entry) %2))
                                                    (dissoc bes (key entry))
                                                    ((key entry) bes)))
                                          (dissoc b :as :or)
                                          {:keys #(keyword (core/str %)), :strs core/str, :syms #(list `quote %)})]
                           (if (seq bes)
                             (core/let [bb (key (first bes))
                                        bk (val (first bes))
                                        has-default (contains? defaults bb)]
                               (recur (pb ret bb (if has-default
                                                   (list `get gmap bk (defaults bb))
                                                   (list `get gmap bk)))
                                      (next bes)))
                             ret))))]
                    (cond
                      (symbol? b) (-> bvec (conj b) (conj v))
                      (vector? b) (pvec bvec b v)
                      (map? b) (pmap bvec b v)
                      :else (throw (new Exception (core/str "Unsupported binding form: " b))))))
         process-entry (fn [bvec b] (pb bvec (first b) (second b)))]
        (if (every? symbol? (map first bents))
          bindings
          (reduce process-entry [] bents))))

(defmacro let
  "binding => binding-form init-expr

  Evaluates the exprs in a lexical context in which the symbols in
  the binding-forms are bound to their respective init-exprs or parts
  therein."
  [bindings & body]
  (assert-args
     (vector? bindings) "a vector for its binding"
     (even? (count bindings)) "an even number of forms in binding vector")
  `(let* ~(destructure bindings) ~@body))

(defmacro loop
  "Evaluates the exprs in a lexical context in which the symbols in
  the binding-forms are bound to their respective init-exprs or parts
  therein. Acts as a recur target."
  [bindings & body]
    (assert-args
      (vector? bindings) "a vector for its binding"
      (even? (count bindings)) "an even number of forms in binding vector")
    (let [db (destructure bindings)]
      (if (= db bindings)
        `(loop* ~bindings ~@body)
        (let [vs (take-nth 2 (drop 1 bindings))
              bs (take-nth 2 bindings)
              gs (map (fn [b] (if (symbol? b) b (gensym))) bs)
              bfs (reduce (fn [ret [b v g]]
                            (if (symbol? b)
                              (conj ret g v)
                              (conj ret g v b g)))
                          [] (map vector bs vs gs))]
          `(let ~bfs
             (loop* ~(vec (interleave gs gs))
               (let ~(vec (interleave bs gs))
                 ~@body)))))))

(def fast-path-protocols
  "protocol fqn -> [partition number, bit]"
  (zipmap (map #(symbol "cljm.core" (core/str %))
               '[IFn ICounted IEmptyableCollection ICollection IIndexed ASeq ISeq INext
                 ILookup IAssociative IMap IMapEntry ISet IStack IVector IDeref
                 IDerefWithTimeout IMeta IWithMeta IReduce IKVReduce IEquiv IHash
                 ISeqable ISequential IList IRecord IReversible ISorted IPrintable
                 IPending IWatchable IEditableCollection ITransientCollection
                 ITransientAssociative ITransientMap ITransientVector ITransientSet
                 IMultiFn])
          (iterate (fn [[p b]]
                     (if (core/== 2147483648 b)
                       [(core/inc p) 1]
                       [p (core/bit-shift-left b 1)]))
                   [0 1])))

(def fast-path-protocol-partitions-count
  "total number of partitions"
  (let [c (count fast-path-protocols)
        m (core/mod c 32)]
    (if (core/zero? m)
      (core/quot c 32)
      (core/inc (core/quot c 32)))))

(defmacro str [& xs]
  (let [strs (->> (repeat (count xs) "~{}")
                  (interpose ", ")
                  (apply core/str))]
   (concat (list 'objc* (core/str "[@[ " strs " ] componentsJoinedByString:@\"\"]")) xs)))

(defn bool-expr [e]
  (vary-meta e assoc :tag 'boolean))

(defmacro nil? [x]
  `(coercive-= ~x nil))

;; internal - do not use.
(defmacro coercive-not [x]
  (bool-expr (list 'objc* "@(!~{})" x)))

;; internal - do not use.
(defmacro coercive-not= [x y]
  (bool-expr (list 'objc* "@(~{} != ~{})" x y)))

;; internal - do not use.
(defmacro coercive-= [x y]
  (bool-expr (list 'objc* "@(~{} == ~{})" x y)))

(defmacro true? [x]
  (bool-expr (list 'objc* "@([~{} boolValue] == YES)" x)))

(defmacro false? [x]
  (bool-expr (list 'objc* "@([~{} boolValue] == NO)" x)))

(defmacro undefined? [x]
  (bool-expr (list 'objc* "@(NULL == ~{})" x)))

(defmacro identical? [a b]
  (bool-expr (list 'objc* "@(~{} == ~{})" a b)))

(defmacro aget
  ([a i]
     (list 'objc* "(~{}[[~{} unsignedIntegerValue]])" a i))
  ([a i & idxs]
     (let [astr (apply core/str (repeat (count idxs) "[~{}]"))]
      `(~'objc* ~(core/str "(~{}[[~{} unsignedIntegerValue]]" astr ")") ~a ~i ~@idxs))))

(defmacro aset [a i v]
  (list 'objc* "(~{}[~{}] = ~{})" a i v))

(defmacro +
  ([] 0)
  ([x] x)
  ([x y] (list 'objc* "@([~{} doubleValue] + [~{} doubleValue])" x y))
  ([x y & more] `(+ (+ ~x ~y) ~@more)))

(defmacro -
  ([x] (list 'objc* "@(-[~{} doubleValue])" x))
  ([x y] (list 'objc* "@([~{} doubleValue] - [~{} doubleValue])" x y))
  ([x y & more] `(- (- ~x ~y) ~@more)))

(defmacro *
  ([] 1)
  ([x] x)
  ([x y] (list 'objc* "@([~{} doubleValue] * [~{} doubleValue])" x y))
  ([x y & more] `(* (* ~x ~y) ~@more)))

(defmacro /
  ([x] `(/ 1 ~x))
  ([x y] (list 'objc* "@([~{} doubleValue] / [~{} doubleValue])" x y))
  ([x y & more] `(/ (/ ~x ~y) ~@more)))

(defmacro <
  ([x] true)
  ([x y] (bool-expr (list 'objc* "@([~{} doubleValue] < [~{} doubleValue])" x y)))
  ([x y & more] `(and (< ~x ~y) (< ~y ~@more))))

(defmacro <=
  ([x] true)
  ([x y] (bool-expr (list 'objc* "@([~{} doubleValue] <= [~{} doubleValue])" x y)))
  ([x y & more] `(and (<= ~x ~y) (<= ~y ~@more))))

(defmacro >
  ([x] true)
  ([x y] (bool-expr (list 'objc* "@([~{} doubleValue] > [~{} doubleValue])" x y)))
  ([x y & more] `(and (> ~x ~y) (> ~y ~@more))))

(defmacro >=
  ([x] true)
  ([x y] (bool-expr (list 'objc* "@([~{} doubleValue] >= [~{} doubleValue])" x y)))
  ([x y & more] `(and (>= ~x ~y) (>= ~y ~@more))))

(defmacro ==
  ([x] true)
  ([x y] (bool-expr (list 'objc* "@([~{} isEqual:~{}])" x y)))
  ([x y & more] `(and (== ~x ~y) (== ~y ~@more))))

(defmacro dec [x]
  `(- ~x 1))

(defmacro inc [x]
  `(+ ~x 1))

(defmacro zero? [x]
  `(== ~x 0))

(defmacro pos? [x]
  `(> ~x 0))

(defmacro neg? [x]
  `(< ~x 0))

(defmacro max
  ([x] x)
  ([x y] (list 'objc* "(([~{} doubleValue] > [~{} doubleValue]) ? ~{} : ~{})" x y x y))
  ([x y & more] `(max (max ~x ~y) ~@more)))

(defmacro min
  ([x] x)
  ([x y] (list 'objc* "(([~{} doubleValue] < [~{} doubleValue]) ? ~{} : ~{})" x y x y))
  ([x y & more] `(min (min ~x ~y) ~@more)))

(defmacro mod [num div]
  (list 'objc* "@([~{} integerValue] % [~{} integerValue])" num div))

(defmacro bit-not [x]
  (list 'objc* "@(~ [~{} integerValue])" x))

(defmacro bit-and
  ([x y] (list 'objc* "@([~{} integerValue] & [~{} integerValue])" x y))
  ([x y & more] `(bit-and (bit-and ~x ~y) ~@more)))

;; internal do not use
(defmacro unsafe-bit-and
  ([x y] (bool-expr (list 'objc* "@([~{} integerValue] & [~{} integerValue])" x y)))
  ([x y & more] `(unsafe-bit-and (unsafe-bit-and ~x ~y) ~@more)))

(defmacro bit-or
  ([x y] (list 'objc* "@([~{} integerValue] | [~{} integerValue])" x y))
  ([x y & more] `(bit-or (bit-or ~x ~y) ~@more)))

(defmacro bit-xor
  ([x y] (list 'objc* "@([~{} integerValue] ^ [~{} integerValue])" x y))
  ([x y & more] `(bit-xor (bit-xor ~x ~y) ~@more)))

(defmacro bit-and-not
  ([x y] (list 'objc* "@([~{} integerValue] & ~[~{} integerValue])" x y))
  ([x y & more] `(bit-and-not (bit-and-not ~x ~y) ~@more)))

(defmacro bit-clear [x n]
  (list 'objc* "@([~{} integerValue] & ~(1 << [~{} integerValue]))" x n))

(defmacro bit-flip [x n]
  (list 'objc* "@([~{} integerValue] ^ (1 << [~{} integerValue]))" x n))

(defmacro bit-test [x n]
  (list 'objc* "@(([~{} integerValue] & (1 << [~{} integerValue])) != 0)" x n))

(defmacro bit-shift-left [x n]
  (list 'objc* "@([~{} integerValue] << [~{} integerValue])" x n))

(defmacro bit-shift-right [x n]
  (list 'objc* "@([~{} integerValue] >> [~{} integerValue])" x n))

(defmacro bit-shift-right-zero-fill [x n]
  (list 'objc* "@([~{} unsignedIntegerValue] >> [~{} unsignedIntegerValue])" x n))

(defmacro bit-set [x n]
  (list 'objc* "@([~{} integerValue] | (1 << [~{} integerValue]))" x n))

;; internal
(defmacro mask [hash shift]
  (list 'objc* "@(([~{} integerValue] >>> [~{} integerValue]) & 0x01f)" hash shift))

;; internal
(defmacro bitpos [hash shift]
  (list 'objc* "@(1 << [~{} integerValue])" `(mask ~hash ~shift)))

;; internal
(defmacro caching-hash [coll hash-fn hash-key]
  `(let [h# ~hash-key]
     (if-not (nil? h#)
       h#
       (let [h# (~hash-fn ~coll)]
         (set! ~hash-key h#)
         h#))))

(defmacro get
  ([coll k]
     `(-lookup ~coll ~k nil))
  ([coll k not-found]
     `(-lookup ~coll ~k ~not-found)))

;;; internal -- reducers-related macros

(defn- do-curried
  [name doc meta args body]
  (let [cargs (vec (butlast args))]
    `(defn ~name ~doc ~meta
       (~cargs (fn [x#] (~name ~@cargs x#)))
       (~args ~@body))))

(defmacro ^:private defcurried
  "Builds another arity of the fn that returns a fn awaiting the last
  param"
  [name doc meta args & body]
  (do-curried name doc meta args body))

(defn- do-rfn [f1 k fkv]
  `(fn
     ([] (~f1))
     ~(clojure.walk/postwalk
       #(if (sequential? %)
          ((if (vector? %) vec identity)
           (core/remove #{k} %))
          %)
       fkv)
     ~fkv))

(defmacro ^:private rfn
  "Builds 3-arity reducing fn given names of wrapped fn and key, and k/v impl."
  [[f1 k] fkv]
  (do-rfn f1 k fkv))

;;; end of reducers macros

(defn protocol-prefix [psym]
  (core/str (-> (core/str psym) (.replace \. \$) (.replace \/ \$)) "$"))

(def #^:private base-type
     {nil "null"
      'object "object"
      'string "string"
      'number "number"
      'array "array"
      'function "function"
      'boolean "boolean"
      'default "_"})

(defmacro reify [& impls]
  (let [class-name-sym (gensym "className")
        t      (vary-meta (gensym "CLJMReifyClass_") assoc :reify true :class-name-sym class-name-sym)
        meta-sym (gensym "meta")
        locals (keys (:locals &env))]
    `(do
         ~(list 'objc* (core/str "id " class-name-sym " = [[~{} stringByAppendingString:[[NSUUID UUID] UUIDString]] stringByReplacingOccurrencesOfString:@\"-\" withString:@\"\"]") (core/str t))
         (deftype ~t [~@locals] ~@impls)
         ~(list 'objc* (core/str "[[NSClassFromString(" class-name-sym ") alloc] init]")))))

(defmacro this-as
  "Defines a scope where JavaScript's implicit \"this\" is bound to the name provided."
  [name & body]
  `(let [~name (~'objc* "this")]
     ~@body))

(defn to-property [sym]
  (symbol (core/str "-" sym)))

(defn- debug-prn
  [& args]
  (.println System/err (core/apply core/str args)))

(defn- stringify-objc-keyword
  [kw]
  (core/str (core/namespace kw) (core/name kw)))

(defn mmunge
  [s]
  (let [ss (string/replace (core/str s) #"\/(.)" ".$1") ; Division is special
        ss (string/replace (core/str s) #"\." "_DOT_")
        ss (apply core/str (map #(if false (core/str % "$") %)
                           (string/split ss #"(?<=\.)|(?=\.)")))
        ms (clojure.lang.Compiler/munge ss)]
    (if (symbol? s)
      (symbol ms)
      ms)))

(defn- add-proto
  [class-name-sym env p]
  (let [resolved-p (cljm.analyzer/resolve-existing-var (dissoc env :locals) p)
        proto (if (= (:ns resolved-p) 'ObjectiveCClass)
                (stringify-objc-keyword p)
                (mmunge (:name resolved-p)))]
    (core/str "class_addProtocol(NSClassFromString(" class-name-sym "), @protocol(" proto "));\n")))

(defn- add-protocols
  [protos class-name-sym env]
  (let [add-protos (core/map (partial add-proto class-name-sym env) protos)]
        (list
          (list 'objc* (apply core/str add-protos)))))

(defn- add-impls
  [p sel meths form class-name-sym env]
  (let [resolved-p (cljm.analyzer/resolve-existing-var (dissoc env :locals) p)
        proto (if (= (:ns resolved-p) 'ObjectiveCClass)
                (stringify-objc-keyword p)
                (mmunge (:name resolved-p)))
        meth (if (vector? (first meths)) 
                  meths 
                  (first meths))
        [sig & body] meth
        sel-from-proto-f #(let [n (mmunge (apply core/str (drop 1 (name %))))]
                            (reduce (fn [x xs] (core/str x ":")) n (drop 1 sig)))
        sel (cond 
              (= (first (name sel)) \-) (core/str proto "_" (sel-from-proto-f sel))
              (= (last (name sel)) \!) (apply core/str (drop-last (name sel)))
              :else (reduce (fn [x xs] (core/str x ":")) (name sel) (drop 1 sig)))
        body (apply concat body)
        args (reduce (fn [xs x] (core/str xs ", " x)) (core/map #(core/str "id " %) sig))
        imp-sym (gensym "imp_")
        fn-sym (gensym "var_")
        class (core/str "NSClassFromString(" class-name-sym ")")
        new-meta (merge {:imp-fn true} (meta form))
        fun (vary-meta `(fn ~meth) merge new-meta)]
    (list
      (list 'objc* (core/str "id " fn-sym " = ~{}") fun)
      (list 'objc* (core/str "IMP " imp-sym " = imp_implementationWithBlock([" fn-sym " block])"))
      (list 'objc* (core/str "class_addMethod(" class ", @selector(" sel "), " imp-sym ", protocol_getMethodDescription(@protocol(" proto "), @selector(" sel "), YES, YES).types)")))))

(declare collect-protocols-with-superclass)

(defn- munge-class-name
  [t env]
  (let [res (cljm.analyzer/resolve-var env t)
        n (:name res)]
    (if (or (= (:ns res) 'ObjectiveCClass) (= (namespace n) (string/upper-case (namespace n))))
        (stringify-objc-keyword t)
        (core/str (mmunge n)))))

(defmacro extend-type [tsym & impls]
  (let [resolve #(let [ret (:name (cljm.analyzer/resolve-var (dissoc &env :locals) %))]
                   (assert ret (core/str "Can't resolve: " %))
                   ret)
        impl-map (loop [ret {} s impls]
                   (if (seq s)
                     (let [p (first s)
                           ex (p ret)
                           ex (if ex
                                ex
                                [])]
                       (recur (assoc ret p (concat ex (take-while seq? (next s))))
                              (drop-while seq? (next s))))
                     ret))
        warn-if-not-protocol #(when-not (= 'Object %)
                                (if cljm.analyzer/*cljm-warn-on-undeclared*
                                  (if-let [var (cljm.analyzer/resolve-existing-var (dissoc &env :locals) %)]
                                    (when-not (:protocol-symbol var)
                                      (cljm.analyzer/warning &env
                                        (core/str "WARNING: Symbol " % " is not a protocol")))
                                    (cljm.analyzer/warning &env
                                      (core/str "WARNING: Can't resolve protocol symbol " %)))))
        skip-flag (set (-> tsym meta :skip-protocol-flag))
        t (resolve tsym)
        reify? (:reify (meta tsym))
        fields (-> tsym meta :fields)
        has-name? (-> tsym meta :class-name-sym)
        class-name-sym (or (-> tsym meta :class-name-sym) (gensym "className"))
        prototype-prefix (fn [sym] (symbol sym))
        assign-impls (fn [[p sigs]]
                            (warn-if-not-protocol p)
                            (concat
                              (mapcat (fn [[f & meths :as form]]
                                        (add-impls p f meths form class-name-sym &env))
                                      sigs)))
        [superclass & protos] (collect-protocols-with-superclass impls &env)
        protos (if has-name?
                  protos
                  (into [superclass] protos))
        cl-name (munge-class-name tsym &env)]
        `(do ~(when-not has-name? 
                (list 'objc* (core/str "id " class-name-sym " = ~{}") cl-name))
              ~@(add-protocols protos class-name-sym &env)
              ~@(mapcat assign-impls impl-map))))

(defn- prepare-protocol-masks [env t impls]
  (let [resolve #(let [ret (:name (cljm.analyzer/resolve-var (dissoc env :locals) %))]
                   (assert ret (core/str "Can't resolve: " %))
                   ret)
        impl-map (loop [ret {} s impls]
                   (if (seq s)
                     (recur (assoc ret (first s) (take-while seq? (next s)))
                            (drop-while seq? (next s)))
                     ret))]
    (if-let [fpp-pbs (seq (keep fast-path-protocols
                                (map resolve
                                     (keys impl-map))))]
      (let [fpps (into #{} (filter (partial contains? fast-path-protocols)
                                   (map resolve
                                        (keys impl-map))))
            fpp-partitions (group-by first fpp-pbs)
            fpp-partitions (into {} (map (juxt key (comp (partial map peek) val))
                                         fpp-partitions))
            fpp-partitions (into {} (map (juxt key (comp (partial reduce core/bit-or) val))
                                         fpp-partitions))]
        [fpps
         (reduce (fn [ps p]
                   (update-in ps [p] (fnil identity 0)))
                 fpp-partitions
                 (range fast-path-protocol-partitions-count))]))))

(defn annotate-specs [annots v [f sigs]]
  (let [t (cons f (map #(cons (second %) (nnext %)) sigs))]
    (conj v
      (vary-meta t
        merge annots))))

(defn dt->et
  ([specs fields]
    (dt->et specs fields false))
  ([specs fields inline]
    (let [annots {:cljm.analyzer/fields fields
                  :protocol-impl true
                  :protocol-inline inline
                  :fields fields}]
      (loop [ret [] specs specs]
        (if (seq specs)
          (let [ret (-> (conj ret (first specs))
                      (into (reduce (partial annotate-specs annots) []
                              (group-by first (take-while seq? (next specs))))))
                specs (drop-while seq? (next specs))]
            (recur ret specs))
          ret)))))

(defn collect-protocols [impls env]
  (->> impls
      (filter symbol?)
      (map #(:name (cljm.analyzer/resolve-var (dissoc env :locals) %)))
      (into #{})))

(defn collect-protocols-with-superclass [impls env]
  (->> impls
      (filter symbol?)
      (map #(:name (cljm.analyzer/resolve-var (dissoc env :locals) %)))
      (into [])))

(defn collect-impls
  [impls]
  (let [divided (partition-by symbol? impls)]
        (map (fn [x y] [(last x) y]) (take-nth 2 divided) (take-nth 2 (rest divided)))))

(defmacro deftype [t fields & impls]
  (let [r (:name (cljm.analyzer/resolve-var (dissoc &env :locals) t))
        [fpps pmasks] (prepare-protocol-masks &env t impls)
        [superclass & protocols] (collect-protocols-with-superclass impls &env)
        protocols (into #{} protocols)
        reify? (:reify (meta t))
        has-name? (-> t meta :class-name-sym)
        class-name-sym (or (-> t meta :class-name-sym) (gensym "className"))
        init-name (core/str (reduce (fn [xs x] (core/str xs ":")) "initWithFields" fields) "!")
        init-stmts (list 'objc* (reduce (fn [xs x] (core/str xs "\n" x)) (map #(core/str "[self set" (string/capitalize (mmunge %)) ":" (mmunge %) "];") fields)))
        init-method `(~'NS/Object (~(symbol init-name) ~(into ['self] fields) (~'do 
                                                                        ~'(objc* "self = [self init]")
                                                                        ~'(objc* "if (self == nil) return nil")
                                                                        ~init-stmts
                                                                        ~'(objc* "self"))))
        impls (if-not reify?
                (concat impls init-method)
                impls)
        t (vary-meta t assoc
            :superclass superclass
            :protocols protocols
            :skip-protocol-flag fpps
            :methods (collect-impls impls)
            :fields fields
            :class-name-sym class-name-sym)
        et (dt->et impls fields true)
        priv-class (gensym "privateClass")
        cl-name (munge-class-name t &env)]
    (if (seq impls)
      `(do
         ~(when-not has-name?
            (list 'objc* (core/str "id " class-name-sym " = ~{}") cl-name))
         ~(list 'objc* (core/str "Class " priv-class " = objc_allocateClassPair(" (stringify-objc-keyword superclass) ".class, [" class-name-sym " UTF8String], 0)"))
         ~(list 'objc* (core/str "if (" priv-class " != Nil) {"))
         ~(list 'objc* (core/str "objc_registerClassPair(" priv-class ")"))
         ~(list 'objc* "}")
         (deftype* ~t ~fields ~pmasks)
         (extend-type ~t ~@et))
      `(do
         ~(when-not has-name?
            (list 'objc* (core/str "id " class-name-sym " = ~{}") cl-name))
         (deftype* ~t ~fields ~pmasks)
         ~t))))

(defn- emit-defrecord
  "Do not use this directly - use defrecord"
  [env tagname rname fields impls]
  (let [hinted-fields fields
        fields (vec (map #(with-meta % nil) fields))
        base-fields fields
        fields (conj fields '__meta '__extmap (with-meta '__hash {:mutable true}))]
    (let [gs (gensym)
          ksym (gensym "k")
          impls (concat
                 impls
                 ['IRecord
                  'IHash
                  `(~'-hash [this#] (caching-hash this# ~'hash-imap ~'__hash))
                  'IEquiv
                  `(~'-equiv [this# other#]
                             (if (and other#
                                      (identical? (.-constructor this#)
                                                  (.-constructor other#))
                                      (equiv-map this# other#))
                               true
                               false))
                  'IMeta
                  `(~'-meta [this#] ~'__meta)
                  'IWithMeta
                  `(~'-with-meta [this# ~gs] (new ~tagname ~@(replace {'__meta gs} fields)))
                  'ILookup
                  `(~'-lookup [this# k#] (-lookup this# k# nil))
                  `(~'-lookup [this# ~ksym else#]
                              (cond
                               ~@(mapcat (fn [f] [`(identical? ~ksym ~(keyword f)) f]) base-fields)
                               :else (get ~'__extmap ~ksym else#)))
                  'ICounted
                  `(~'-count [this#] (+ ~(count base-fields) (count ~'__extmap)))
                  'ICollection
                  `(~'-conj [this# entry#]
                            (if (vector? entry#)
                              (-assoc this# (-nth entry# 0) (-nth entry# 1))
                              (reduce -conj
                                      this#
                                      entry#)))
                  'IAssociative
                  `(~'-assoc [this# k# ~gs]
                             (condp identical? k#
                               ~@(mapcat (fn [fld]
                                           [(keyword fld) (list* `new tagname (replace {fld gs '__hash nil} fields))])
                                         base-fields)
                               (new ~tagname ~@(remove #{'__extmap '__hash} fields) (assoc ~'__extmap k# ~gs) nil)))
                  'IMap
                  `(~'-dissoc [this# k#] (if (contains? #{~@(map keyword base-fields)} k#)
                                           (dissoc (with-meta (into {} this#) ~'__meta) k#)
                                           (new ~tagname ~@(remove #{'__extmap} fields)
                                                (not-empty (dissoc ~'__extmap k#))
                                                nil)))
                  'ISeqable
                  `(~'-seq [this#] (seq (concat [~@(map #(list `vector (keyword %) %) base-fields)]
                                                ~'__extmap)))
                  'IPrintable
                  `(~'-pr-seq [this# opts#]
                              (let [pr-pair# (fn [keyval#] (pr-sequential pr-seq "" " " "" opts# keyval#))]
                                (pr-sequential
                                 pr-pair# (core/str "#" ~(name rname) "{") ", " "}" opts#
                                 (concat [~@(map #(list `vector (keyword %) %) base-fields)]
                                         ~'__extmap))))
                  ])
          [fpps pmasks] (prepare-protocol-masks env tagname impls)
          protocols (collect-protocols impls env)
          tagname (vary-meta tagname assoc
                    :protocols protocols
                    :skip-protocol-flag fpps)]
      `(do
         (~'defrecord* ~tagname ~hinted-fields ~pmasks)
         (extend-type ~tagname ~@(dt->et impls fields true))))))

(defn- build-positional-factory
  [rsym rname fields]
  (let [fn-name (symbol (core/str '-> rsym))]
    `(defn ~fn-name
       [~@fields]
       (new ~rname ~@fields))))

(defn- build-map-factory
  [rsym rname fields]
  (let [fn-name (symbol (core/str 'map-> rsym))
	ms (gensym)
	ks (map keyword fields)
	getters (map (fn [k] `(~k ~ms)) ks)]
    `(defn ~fn-name
       [~ms]
       (new ~rname ~@getters nil (dissoc ~ms ~@ks)))))

(defmacro defrecord [rsym fields & impls]
  (let [r (:name (cljm.analyzer/resolve-var (dissoc &env :locals) rsym))]
    `(let []
       ~(emit-defrecord &env rsym r fields impls)
       (set! (.-cljm$lang$type ~r) true)
       (set! (.-cljm$lang$ctorPrSeq ~r) (fn [this#] (list ~(core/str r))))
       ~(build-positional-factory rsym r fields)
       ~(build-map-factory rsym r fields)
       ~r)))

(comment (defmacro defprotocol [psym & doc+methods]
  (let [p (:name (cljm.analyzer/resolve-var (dissoc &env :locals) psym))
        psym (vary-meta psym assoc :protocol-symbol true)
        ns-name (-> &env :ns :name)
        fqn (fn [n] (symbol (core/str ns-name "." n)))
        prefix (protocol-prefix p)
        methods (if (core/string? (first doc+methods)) (next doc+methods) doc+methods)
        expand-sig (fn [fname slot sig]
                     `(~sig
                       (if (and ~(first sig) (. ~(first sig) ~(symbol (core/str "-" slot)))) ;; Property access needed here.
                         (. ~(first sig) ~slot ~@sig)
                         (let [x# (if (nil? ~(first sig)) nil ~(first sig))]
                           ((or
                             (aget ~(fqn fname) (goog.typeOf x#))
                             (aget ~(fqn fname) "_")
                             (throw (missing-protocol
                                     ~(core/str psym "." fname) ~(first sig))))
                            ~@sig)))))
        method (fn [[fname & sigs]]
                 (let [sigs (take-while vector? sigs)
                       slot (symbol (core/str prefix (name fname)))
                       fname (vary-meta fname assoc :protocol p)]
                   `(defn ~fname ~@(map (fn [sig]
                                          (expand-sig fname
                                                      (symbol (core/str slot "$arity$" (count sig)))
                                                      sig))
                                        sigs))))]
    `(do
       (set! ~'*unchecked-if* true)
       (def ~psym (~'objc* "{}"))
       ~@(map method methods)
       (set! ~'*unchecked-if* false)))))

(defmacro defprotocol [psym & doc+methods]
  (let [p (:name (cljm.analyzer/resolve-var (dissoc &env :locals) psym))
        psym (vary-meta psym assoc :protocol-symbol true)
        ns-name (-> &env :ns :name)
        methods (if (core/string? (first doc+methods)) (next doc+methods) doc+methods)
        expand-sig (fn [fname sig]
                     `(~sig
           ;; FIXME: check satisfies?
           (. ~(first sig) (~fname ~@(rest sig)))))
        method (fn [[fname & sigs]]
                 (let [sigs (take-while vector? sigs)
                       fname (vary-meta fname assoc :protocol p)]
                   `(defn ~fname ~@(map (fn [sig]
                                          (expand-sig fname
                                                      sig))
                                        sigs))))]
    `(do
       (~'defprotocol* ~psym ~@methods)
       ~@(map method methods))))

(defmacro satisfies?
  "Returns true if x satisfies the protocol"
  [psym x]
  (let [p (:name (cljm.analyzer/resolve-var (dissoc &env :locals) psym))
        prefix (protocol-prefix p)
        xsym (bool-expr (gensym))
        [part bit] (fast-path-protocols p)
        msym (symbol (core/str "-cljm$lang$protocol_mask$partition" part "$"))]
    ; `(objc* "@([~{} conformsToProtocol:@protocol(~{})])" x (munge p))))
    ; `(let [~xsym ~x]
    ;    (if ~xsym
    ;      (if (or ~(if bit `(unsafe-bit-and (. ~xsym ~msym) ~bit))
    ;              ~(bool-expr `(. ~xsym ~(symbol (core/str "-" prefix)))))
    ;        true
    ;        (if (coercive-not (. ~xsym ~msym))
    ;          (cljm.core/type_satisfies_ ~psym ~xsym)
    ;          false))
         `(cljm.core/type_satisfies_ ~psym ~x)))

(defmacro lazy-seq [& body]
  `(new cljm.core/LazySeq nil false (fn [] ~@body) nil))

(defmacro delay [& body]
  "Takes a body of expressions and yields a Delay object that will
  invoke the body only the first time it is forced (with force or deref/@), and
  will cache the result and return it on all subsequent force
  calls."
  `(new cljm.core/Delay (atom {:done false, :value nil}) (fn [] ~@body)))

(defmacro binding
  "binding => var-symbol init-expr

  Creates new bindings for the (already-existing) vars, with the
  supplied initial values, executes the exprs in an implicit do, then
  re-establishes the bindings that existed before.  The new bindings
  are made in parallel (unlike let); all init-exprs are evaluated
  before the vars are bound to their new values."
  [bindings & body]
  (let [names (take-nth 2 bindings)
        vals (take-nth 2 (drop 1 bindings))
        tempnames (map (comp gensym name) names)
        binds (map vector names vals)
        resets (reverse (map vector names tempnames))]
    (cljm.analyzer/confirm-bindings &env names)
    `(let [~@(interleave tempnames names)]
       (try
        ~@(map
           (fn [[k v]] (list 'set! k v))
           binds)
        ~@body
        (finally
         ~@(map
            (fn [[k v]] (list 'set! k v))
            resets))))))

(defmacro condp
  "Takes a binary predicate, an expression, and a set of clauses.
  Each clause can take the form of either:

  test-expr result-expr

  test-expr :>> result-fn

  Note :>> is an ordinary keyword.

  For each clause, (pred test-expr expr) is evaluated. If it returns
  logical true, the clause is a match. If a binary clause matches, the
  result-expr is returned, if a ternary clause matches, its result-fn,
  which must be a unary function, is called with the result of the
  predicate as its argument, the result of that call being the return
  value of condp. A single default expression can follow the clauses,
  and its value will be returned if no clause matches. If no default
  expression is provided and no clause matches, an
  IllegalArgumentException is thrown."
  {:added "1.0"}

  [pred expr & clauses]
  (let [gpred (gensym "pred__")
        gexpr (gensym "expr__")
        emit (fn emit [pred expr args]
               (let [[[a b c :as clause] more]
                       (split-at (if (= :>> (second args)) 3 2) args)
                       n (count clause)]
                 (cond
                  (= 0 n) `(throw (js/Error. (core/str "No matching clause: " ~expr)))
                  (= 1 n) a
                  (= 2 n) `(if (~pred ~a ~expr)
                             ~b
                             ~(emit pred expr more))
                  :else `(if-let [p# (~pred ~a ~expr)]
                           (~c p#)
                           ~(emit pred expr more)))))
        gres (gensym "res__")]
    `(let [~gpred ~pred
           ~gexpr ~expr]
       ~(emit gpred gexpr clauses))))

(defmacro case [e & clauses]
  (let [default (if (odd? (count clauses))
                  (last clauses)
                  `(throw (js/Error. (core/str "No matching clause: " ~e))))
        assoc-test (fn assoc-test [m test expr]
                         (if (contains? m test)
                           (throw (clojure.core/IllegalArgumentException.
                                   (core/str "Duplicate case test constant '"
                                             test "'"
                                             (when (:line &env)
                                               (core/str " on line " (:line &env) " "
                                                         cljm.analyzer/*cljm-file*)))))
                           (assoc m test expr)))
        pairs (reduce (fn [m [test expr]]
                        (if (seq? test)
                          (reduce #(assoc-test %1 %2 expr) m test)
                          (assoc-test m test expr)))
                      {} (partition 2 clauses))
        esym (gensym)]
   `(let [~esym ~e]
      (cond
        ~@(mapcat (fn [[m c]] `((cljm.core/= ~m ~esym) ~c)) pairs)
        :else ~default))))

(defmacro try
  "(try expr* catch-clause* finally-clause?)

   Special Form

   catch-clause => (catch protoname name expr*)
   finally-clause => (finally expr*)

  Catches and handles JavaScript exceptions."
  [& forms]
  (let [catch? #(and (list? %) (= (first %) 'catch))
        [body catches] (split-with (complement catch?) forms)
        [catches fin] (split-with catch? catches)
        e (gensym "e")]
    (assert (every? #(clojure.core/> (count %) 2) catches) "catch block must specify a prototype and a name")
    (if (seq catches)
      `(~'try*
        ~@body
        (catch ~e
            (cond
             ~@(mapcat
                (fn [[_ type name & cb]]
                  `[(instance? ~type ~e) (let [~name ~e] ~@cb)])
                catches)
             :else (throw ~e)))
        ~@fin)
      `(~'try*
        ~@body
        ~@fin))))

(defmacro assert
  "Evaluates expr and throws an exception if it does not evaluate to
  logical true."
  ([x]
     (when *assert*
       `(when-not ~x
          (throw (js/Error.
                  (cljm.core/str "Assert failed: " (cljm.core/pr-str '~x)))))))
  ([x message]
     (when *assert*
       `(when-not ~x
          (throw (js/Error.
                  (cljm.core/str "Assert failed: " ~message "\n" (cljm.core/pr-str '~x))))))))

(defmacro for
  "List comprehension. Takes a vector of one or more
   binding-form/collection-expr pairs, each followed by zero or more
   modifiers, and yields a lazy sequence of evaluations of expr.
   Collections are iterated in a nested fashion, rightmost fastest,
   and nested coll-exprs can refer to bindings created in prior
   binding-forms.  Supported modifiers are: :let [binding-form expr ...],
   :while test, :when test.

  (take 100 (for [x (range 100000000) y (range 1000000) :while (< y x)]  [x y]))"
  [seq-exprs body-expr]
  (assert-args for
     (vector? seq-exprs) "a vector for its binding"
     (even? (count seq-exprs)) "an even number of forms in binding vector")
  (let [to-groups (fn [seq-exprs]
                    (reduce (fn [groups [k v]]
                              (if (keyword? k)
                                (conj (pop groups) (conj (peek groups) [k v]))
                                (conj groups [k v])))
                            [] (partition 2 seq-exprs)))
        err (fn [& msg] (throw (apply core/str msg)))
        emit-bind (fn emit-bind [[[bind expr & mod-pairs]
                                  & [[_ next-expr] :as next-groups]]]
                    (let [giter (gensym "iter__")
                          gxs (gensym "s__")
                          do-mod (fn do-mod [[[k v :as pair] & etc]]
                                   (cond
                                     (= k :let) `(let ~v ~(do-mod etc))
                                     (= k :while) `(when ~v ~(do-mod etc))
                                     (= k :when) `(if ~v
                                                    ~(do-mod etc)
                                                    (recur (rest ~gxs)))
                                     (keyword? k) (err "Invalid 'for' keyword " k)
                                     next-groups
                                      `(let [iterys# ~(emit-bind next-groups)
                                             fs# (seq (iterys# ~next-expr))]
                                         (if fs#
                                           (concat fs# (~giter (rest ~gxs)))
                                           (recur (rest ~gxs))))
                                     :else `(cons ~body-expr
                                                  (~giter (rest ~gxs)))))]
                      `(fn ~giter [~gxs]
                         (lazy-seq
                           (loop [~gxs ~gxs]
                             (when-first [~bind ~gxs]
                               ~(do-mod mod-pairs)))))))]
    `(let [iter# ~(emit-bind (to-groups seq-exprs))]
       (iter# ~(second seq-exprs)))))

(defmacro doseq
  "Repeatedly executes body (presumably for side-effects) with
  bindings and filtering as provided by \"for\".  Does not retain
  the head of the sequence. Returns nil."
  [seq-exprs & body]
  (assert-args doseq
     (vector? seq-exprs) "a vector for its binding"
     (even? (count seq-exprs)) "an even number of forms in binding vector")
  (let [step (fn step [recform exprs]
               (if-not exprs
                 [true `(do ~@body)]
                 (let [k (first exprs)
                       v (second exprs)

                       seqsym (when-not (keyword? k) (gensym))
                       recform (if (keyword? k) recform `(recur (first ~seqsym) ~seqsym))
                       steppair (step recform (nnext exprs))
                       needrec (steppair 0)
                       subform (steppair 1)]
                   (cond
                     (= k :let) [needrec `(let ~v ~subform)]
                     (= k :while) [false `(when ~v
                                            ~subform
                                            ~@(when needrec [recform]))]
                     (= k :when) [false `(if ~v
                                           (do
                                             ~subform
                                             ~@(when needrec [recform]))
                                           ~recform)]
                     :else [true `(let [~seqsym (seq ~v)]
                                    (when ~seqsym
                                      (loop [~k (first ~seqsym) ~seqsym ~seqsym]
                                       ~subform
                                       (when-let [~seqsym (next ~seqsym)]
                                        ~@(when needrec [recform])))))]))))]
    (nth (step nil (seq seq-exprs)) 1)))

(defmacro array [& rest]
  (let [xs-str (->> (repeat "~{}")
                    (take (count rest))
                    (interpose ",")
                    (apply core/str))]
   (concat
    (list 'objc* (core/str "@[ " xs-str " ]"))
    rest)))

(defmacro js-obj [& rest]
  (let [kvs-str (->> (repeat "~{}:~{}")
                     (take (quot (count rest) 2))
                     (interpose ",")
                     (apply core/str))]
    (concat
     (list 'objc* (core/str "@{ " kvs-str " }"))
     rest)))

(defmacro alength [a]
  (list 'objc* "@([(NSArray *) ~{} count])" a))

(defmacro aclone [a]
  (list 'objc* "[~{} copy]" a))

(defmacro amap
  "Maps an expression across an array a, using an index named idx, and
  return value named ret, initialized to a clone of a, then setting
  each element of ret to the evaluation of expr, returning the new
  array ret."
  [a idx ret expr]
  `(let [a# ~a
         ~ret (aclone a#)]
     (loop  [~idx 0]
       (if (< ~idx  (alength a#))
         (do
           (aset ~ret ~idx ~expr)
           (recur (inc ~idx)))
         ~ret))))

(defmacro areduce
  "Reduces an expression across an array a, using an index named idx,
  and return value named ret, initialized to init, setting ret to the
  evaluation of expr at each step, returning ret."
  [a idx ret init expr]
  `(let [a# ~a]
     (loop  [~idx 0 ~ret ~init]
       (if (< ~idx  (alength a#))
         (recur (inc ~idx) ~expr)
         ~ret))))

(defmacro dotimes
  "bindings => name n

  Repeatedly executes body (presumably for side-effects) with name
  bound to integers from 0 through n-1."
  [bindings & body]
  (let [i (first bindings)
        n (second bindings)]
    `(let [n# ~n]
       (loop [~i 0]
         (when (< ~i n#)
           ~@body
           (recur (inc ~i)))))))

(defn ^:private check-valid-options
  "Throws an exception if the given option map contains keys not listed
  as valid, else returns nil."
  [options & valid-keys]
  (when (seq (apply disj (apply hash-set (keys options)) valid-keys))
    (throw
     (apply core/str "Only these options are valid: "
	    (first valid-keys)
	    (map #(core/str ", " %) (rest valid-keys))))))

(defmacro defmulti
  "Creates a new multimethod with the associated dispatch function.
  The docstring and attribute-map are optional.

  Options are key-value pairs and may be one of:
    :default    the default dispatch value, defaults to :default
    :hierarchy  the isa? hierarchy to use for dispatching
                defaults to the global hierarchy"
  [mm-name & options]
  (let [docstring   (if (core/string? (first options))
                      (first options)
                      nil)
        options     (if (core/string? (first options))
                      (next options)
                      options)
        m           (if (map? (first options))
                      (first options)
                      {})
        options     (if (map? (first options))
                      (next options)
                      options)
        dispatch-fn (first options)
        options     (next options)
        m           (if docstring
                      (assoc m :doc docstring)
                      m)
        m           (if (meta mm-name)
                      (conj (meta mm-name) m)
                      m)]
    (when (= (count options) 1)
      (throw "The syntax for defmulti has changed. Example: (defmulti name dispatch-fn :default dispatch-value)"))
    (let [options   (apply hash-map options)
          default   (core/get options :default :default)]
      (check-valid-options options :default :hierarchy)
      `(def ~(with-meta mm-name m)
         (let [method-table# (atom {})
               prefer-table# (atom {})
               method-cache# (atom {})
               cached-hierarchy# (atom {})
               hierarchy# (get ~options :hierarchy cljm.core/global-hierarchy)]
           (cljm.core/MultiFn. ~(name mm-name) ~dispatch-fn ~default hierarchy#
                               method-table# prefer-table# method-cache# cached-hierarchy#))))))

(defmacro defmethod
  "Creates and installs a new method of multimethod associated with dispatch-value. "
  [multifn dispatch-val & fn-tail]
  `(-add-method ~(with-meta multifn {:tag 'cljm.core/MultiFn}) ~dispatch-val (fn ~@fn-tail)))

(defmacro time
  "Evaluates expr and prints the time it took. Returns the value of expr."
  [expr]
  `(let [start# (.getTime (js/Date.))
         ret# ~expr]
     (prn (core/str "Elapsed time: " (- (.getTime (js/Date.)) start#) " msecs"))
     ret#))

(defmacro simple-benchmark
  "Runs expr iterations times in the context of a let expression with
  the given bindings, then prints out the bindings and the expr
  followed by number of iterations and total time. The optional
  argument print-fn, defaulting to println, sets function used to
  print the result. expr's string representation will be produced
  using pr-str in any case."
  [bindings expr iterations & {:keys [print-fn] :or {print-fn 'println}}]
  (let [bs-str   (pr-str bindings)
        expr-str (pr-str expr)]
    `(let ~bindings
       (let [start#   (.getTime (js/Date.))
             ret#     (dotimes [_# ~iterations] ~expr)
             end#     (.getTime (js/Date.))
             elapsed# (- end# start#)]
         (~print-fn (str ~bs-str ", " ~expr-str ", "
                         ~iterations " runs, " elapsed# " msecs"))))))

(def cs (into [] (map (comp symbol core/str char) (range 97 118))))

(defn gen-apply-to-helper
  ([] (gen-apply-to-helper 1))
  ([n]
     (let [prop (symbol (core/str "-cljm$lang$arity$" n))
           f (symbol (core/str "cljm$lang$arity$" n))]
       (if (core/<= n 20)
         `(let [~(cs (core/dec n)) (-first ~'args)
                ~'args (-rest ~'args)]
            (if (core/== ~'argc ~n)
              (if (. ~'f ~prop)
                (. ~'f (~f ~@(take n cs)))
                (~'f ~@(take n cs)))
              ~(gen-apply-to-helper (core/inc n))))
         `(throw (js/Error. "Only up to 20 arguments supported on functions"))))))

(defmacro gen-apply-to []
  `(do
     (set! ~'*unchecked-if* true)
     (defn ~'apply-to [~'f ~'argc ~'args]
       (let [~'args (seq ~'args)]
         (if (zero? ~'argc)
           (~'f)
           ~(gen-apply-to-helper))))
     (set! ~'*unchecked-if* false)))

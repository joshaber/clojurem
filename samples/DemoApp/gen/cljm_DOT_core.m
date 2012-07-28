#import "cljm_DOT_core.h"
__attribute__((constructor))
void cljm_DOT_core_SLASH_cljm_ns_init(void) {
@autoreleasepool {
/**
* Each runtime environment provides a diffenent way to print output.
* Whatever function *print-fn* is bound to will be passed any
* Strings which should be printed.
*/
cljm_DOT_core_SLASH__STAR_print_fn_STAR_ = ^id(id s) {
NSLog(@"s");;
return nil;
};
cljm_DOT_core_SLASH_error = ^id(id cause) {
fprintf(stderr, "%s\n", string_get_utf8 (cause));
exit(1);
return nil;
};
/**
* Internal - do not use!
*/
cljm_DOT_core_SLASH_type_satisfies_ = ^id(id p, id x) {
id x__4486 = (cljm_truthy((x == nil))) ?nil:x;
if(cljm_truthy((p[goog_SLASH_typeOf(x__4486)]))) {
return @YES;

} else {
if(cljm_truthy((p[@"_"]))) {
return @YES;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return @NO;

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_is_proto_ = ^id(id x) {
return ([x.constructor.prototype isEqual:x]);
};
/**
* When compiled for a command-line target, whatever
* function *main-fn* is set to will be called with the command-line
* argv as arguments
*/
cljm_DOT_core_SLASH__STAR_main_cli_fn_STAR_ = nil;
cljm_DOT_core_SLASH_missing_protocol = ^id(id proto, id obj) {
return cljm_DOT_core_SLASH_error([@[@"No protocol method ",proto,@" defined for type ",goog_SLASH_typeOf(obj),@": ",obj] join@""]);
};
/**
* Returns a array, cloned from the passed in array
*/
cljm_DOT_core_SLASH_aclone = ^id(id array_like) {
return [array_like copy];
};
/**
* Creates a new array.
*/
cljm_DOT_core_SLASH_array = ^id(id var_args) {
return [Array.prototype.slice callarguments];
};
cljm_DOT_core_SLASH_make_array = (function() {
var make_array = null;
var make_array__1 = ^id(id size) {
return [[NSArray alloc] initWithCapacity:size];
};
var make_array__2 = ^id(id type, id size) {
return make_array(size);
};
make_array = function(type, size){
switch(arguments.length){
case 1:
return make_array__1.call(this,type);
case 2:
return make_array__2.call(this,type, size);
}
throw('Invalid arity: ' + arguments.length);
};
make_array.cljm$lang$arity$1 = make_array__1;
make_array.cljm$lang$arity$2 = make_array__2;
return make_array;
})()
;
/**
* Returns the value at the index.
*/
cljm_DOT_core_SLASH_aget = (function() {
var aget = null;
var aget__2 = ^id(id array, id i) {
return (array[i]);
};
var aget__3 = ^id(id cljm__varargs, id array, id i, ...) {
NSMutableArray *idxs = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[idxs addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_apply(aget, aget(array, i, nil), idxs, nil);
};
aget = function(array, i, var_args){
var idxs = var_args;
switch(arguments.length){
case 2:
return aget__2.call(this,array, i);
default:
return aget__3.cljm$lang$arity$variadic(array, i, cljm.core.array_seq(arguments, 2));
}
throw('Invalid arity: ' + arguments.length);
};
aget.cljm$lang$maxFixedArity = 2;
aget.cljm$lang$applyTo = aget__3.cljm$lang$applyTo;
aget.cljm$lang$arity$2 = aget__2;
aget.cljm$lang$arity$variadic = aget__3.cljm$lang$arity$variadic;
return aget;
})()
;
/**
* Sets the value at the index.
*/
cljm_DOT_core_SLASH_aset = ^id(id array, id i, id val) {
return (array[i] = val);
};
/**
* Returns the length of the array. Works on arrays of all types.
*/
cljm_DOT_core_SLASH_alength = ^id(id array) {
return [@"count" array];
};
cljm_DOT_core_SLASH_into_array = (function() {
var into_array = null;
var into_array__1 = ^id(id aseq) {
return into_array(nil, aseq);
};
var into_array__2 = ^id(id type, id aseq) {
return cljm_DOT_core_SLASH_reduce(^id(id a, id x) {
[@"arrayByAddingObject:" ax];
return a;
}, @[], aseq);
};
into_array = function(type, aseq){
switch(arguments.length){
case 1:
return into_array__1.call(this,type);
case 2:
return into_array__2.call(this,type, aseq);
}
throw('Invalid arity: ' + arguments.length);
};
into_array.cljm$lang$arity$1 = into_array__1;
into_array.cljm$lang$arity$2 = into_array__2;
return into_array;
})()
;
/**
* Tests if 2 arguments are the same object
*/
cljm_DOT_core_SLASH_identical_QMARK_ = ^id(id x, id y) {
return ([x isEqual:y]);
};
/**
* Equality. Returns true if x equals y, false if not. Compares
* numbers and collections in a type-independent manner.  Clojure's immutable data
* structures define -equiv (and thus =) as a value, not an identity,
* comparison.
*/
cljm_DOT_core_SLASH__EQ_ = (function() {
var _EQ_ = null;
var _EQ___1 = ^id(id x) {
return @YES;
};
var _EQ___2 = ^id(id x, id y) {
id or__3824__auto____4488 = ([x isEqual:y]);
if(cljm_truthy(or__3824__auto____4488)) {
return or__3824__auto____4488;

} else {
return cljm_DOT_core_SLASH__equiv(x, y);

}
};
var _EQ___3 = ^id(id cljm__varargs, id x, id y, ...) {
NSMutableArray *more = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[more addObject:cljm__currentObject];
}
va_end(cljm__args);
while(YES) {
if(cljm_truthy(_EQ_(x, y, nil))) {
if(cljm_truthy(cljm_DOT_core_SLASH_next(more))) {
{
var G__4489 = y;
var G__4490 = cljm_DOT_core_SLASH_first(more);
var G__4491 = cljm_DOT_core_SLASH_next(more);
x = G__4489;
y = G__4490;
more = G__4491;
continue;
}

} else {
return _EQ_(y, cljm_DOT_core_SLASH_first(more), nil);

}

} else {
return @NO;

}
break;
}
};
_EQ_ = function(x, y, var_args){
var more = var_args;
switch(arguments.length){
case 1:
return _EQ___1.call(this,x);
case 2:
return _EQ___2.call(this,x, y);
default:
return _EQ___3.cljm$lang$arity$variadic(x, y, cljm.core.array_seq(arguments, 2));
}
throw('Invalid arity: ' + arguments.length);
};
_EQ_.cljm$lang$maxFixedArity = 2;
_EQ_.cljm$lang$applyTo = _EQ___3.cljm$lang$applyTo;
_EQ_.cljm$lang$arity$1 = _EQ___1;
_EQ_.cljm$lang$arity$2 = _EQ___2;
_EQ_.cljm$lang$arity$variadic = _EQ___3.cljm$lang$arity$variadic;
return _EQ_;
})()
;
/**
* Returns true if x is nil, false otherwise.
*/
cljm_DOT_core_SLASH_nil_QMARK_ = ^id(id x) {
return (x == nil);
};
cljm_DOT_core_SLASH_type = ^id(id x) {
if(cljm_truthy((x == nil))) {
return nil;

} else {
return x.constructor;

}
};
cljm_DOT_core_SLASH_instance_QMARK_ = ^id(id t, id o) {
return [o isKindOfClass:[t class]];
};
/**
* Returns a number one greater than num.
*/
cljm_DOT_core_SLASH_inc = ^id(id x) {
return (x + @1);
};
/**
* Accepts any collection which satisfies the ICount and IIndexed protocols and
* reduces them without incurring seq initialization
*/
cljm_DOT_core_SLASH_ci_reduce = (function() {
var ci_reduce = null;
var ci_reduce__2 = ^id(id cicoll, id f) {
id cnt__4504 = cljm_DOT_core_SLASH__count(cicoll);
if(cljm_truthy(([cnt__4504 isEqual:@0]))) {
return f();

} else {
id val__4505 = cljm_DOT_core_SLASH__nth(cicoll, @0);
id n__4506 = @1;
while(YES) {
if(cljm_truthy((n__4506 < cnt__4504))) {
id nval__4507 = f(val__4505, cljm_DOT_core_SLASH__nth(cicoll, n__4506));
if(cljm_truthy(cljm_DOT_core_SLASH_reduced_QMARK_(nval__4507))) {
return cljm_DOT_core_SLASH_deref(nval__4507);

} else {
{
var G__4516 = nval__4507;
var G__4517 = (n__4506 + @1);
val__4505 = G__4516;
n__4506 = G__4517;
continue;
}

}

} else {
return val__4505;

}
break;
}

}
};
var ci_reduce__3 = ^id(id cicoll, id f, id val) {
id cnt__4508 = cljm_DOT_core_SLASH__count(cicoll);
id val__4509 = val;
id n__4510 = @0;
while(YES) {
if(cljm_truthy((n__4510 < cnt__4508))) {
id nval__4511 = f(val__4509, cljm_DOT_core_SLASH__nth(cicoll, n__4510));
if(cljm_truthy(cljm_DOT_core_SLASH_reduced_QMARK_(nval__4511))) {
return cljm_DOT_core_SLASH_deref(nval__4511);

} else {
{
var G__4518 = nval__4511;
var G__4519 = (n__4510 + @1);
val__4509 = G__4518;
n__4510 = G__4519;
continue;
}

}

} else {
return val__4509;

}
break;
}
};
var ci_reduce__4 = ^id(id cicoll, id f, id val, id idx) {
id cnt__4512 = cljm_DOT_core_SLASH__count(cicoll);
id val__4513 = val;
id n__4514 = idx;
while(YES) {
if(cljm_truthy((n__4514 < cnt__4512))) {
id nval__4515 = f(val__4513, cljm_DOT_core_SLASH__nth(cicoll, n__4514));
if(cljm_truthy(cljm_DOT_core_SLASH_reduced_QMARK_(nval__4515))) {
return cljm_DOT_core_SLASH_deref(nval__4515);

} else {
{
var G__4520 = nval__4515;
var G__4521 = (n__4514 + @1);
val__4513 = G__4520;
n__4514 = G__4521;
continue;
}

}

} else {
return val__4513;

}
break;
}
};
ci_reduce = function(cicoll, f, val, idx){
switch(arguments.length){
case 2:
return ci_reduce__2.call(this,cicoll, f);
case 3:
return ci_reduce__3.call(this,cicoll, f, val);
case 4:
return ci_reduce__4.call(this,cicoll, f, val, idx);
}
throw('Invalid arity: ' + arguments.length);
};
ci_reduce.cljm$lang$arity$2 = ci_reduce__2;
ci_reduce.cljm$lang$arity$3 = ci_reduce__3;
ci_reduce.cljm$lang$arity$4 = ci_reduce__4;
return ci_reduce;
})()
;
cljm_DOT_core_SLASH_array_reduce = (function() {
var array_reduce = null;
var array_reduce__2 = ^id(id arr, id f) {
id cnt__4534 = [arr count];
if(cljm_truthy(([[arr count] isEqual:@0]))) {
return f();

} else {
id val__4535 = (arr[@0]);
id n__4536 = @1;
while(YES) {
if(cljm_truthy((n__4536 < cnt__4534))) {
id nval__4537 = f(val__4535, (arr[n__4536]));
if(cljm_truthy(cljm_DOT_core_SLASH_reduced_QMARK_(nval__4537))) {
return cljm_DOT_core_SLASH_deref(nval__4537);

} else {
{
var G__4546 = nval__4537;
var G__4547 = (n__4536 + @1);
val__4535 = G__4546;
n__4536 = G__4547;
continue;
}

}

} else {
return val__4535;

}
break;
}

}
};
var array_reduce__3 = ^id(id arr, id f, id val) {
id cnt__4538 = [arr count];
id val__4539 = val;
id n__4540 = @0;
while(YES) {
if(cljm_truthy((n__4540 < cnt__4538))) {
id nval__4541 = f(val__4539, (arr[n__4540]));
if(cljm_truthy(cljm_DOT_core_SLASH_reduced_QMARK_(nval__4541))) {
return cljm_DOT_core_SLASH_deref(nval__4541);

} else {
{
var G__4548 = nval__4541;
var G__4549 = (n__4540 + @1);
val__4539 = G__4548;
n__4540 = G__4549;
continue;
}

}

} else {
return val__4539;

}
break;
}
};
var array_reduce__4 = ^id(id arr, id f, id val, id idx) {
id cnt__4542 = [arr count];
id val__4543 = val;
id n__4544 = idx;
while(YES) {
if(cljm_truthy((n__4544 < cnt__4542))) {
id nval__4545 = f(val__4543, (arr[n__4544]));
if(cljm_truthy(cljm_DOT_core_SLASH_reduced_QMARK_(nval__4545))) {
return cljm_DOT_core_SLASH_deref(nval__4545);

} else {
{
var G__4550 = nval__4545;
var G__4551 = (n__4544 + @1);
val__4543 = G__4550;
n__4544 = G__4551;
continue;
}

}

} else {
return val__4543;

}
break;
}
};
array_reduce = function(arr, f, val, idx){
switch(arguments.length){
case 2:
return array_reduce__2.call(this,arr, f);
case 3:
return array_reduce__3.call(this,arr, f, val);
case 4:
return array_reduce__4.call(this,arr, f, val, idx);
}
throw('Invalid arity: ' + arguments.length);
};
array_reduce.cljm$lang$arity$2 = array_reduce__2;
array_reduce.cljm$lang$arity$3 = array_reduce__3;
array_reduce.cljm$lang$arity$4 = array_reduce__4;
return array_reduce;
})()
;
cljm_DOT_core_SLASH_prim_seq = (function() {
var prim_seq = null;
var prim_seq__1 = ^id(id prim) {
return prim_seq(prim, @0);
};
var prim_seq__2 = ^id(id prim, id i) {
if(cljm_truthy(([prim.length isEqual:@0]))) {
return nil;

} else {
return [cljm_DOT_core_SLASH_IndexedSeq alloc];

}
};
prim_seq = function(prim, i){
switch(arguments.length){
case 1:
return prim_seq__1.call(this,prim);
case 2:
return prim_seq__2.call(this,prim, i);
}
throw('Invalid arity: ' + arguments.length);
};
prim_seq.cljm$lang$arity$1 = prim_seq__1;
prim_seq.cljm$lang$arity$2 = prim_seq__2;
return prim_seq;
})()
;
cljm_DOT_core_SLASH_array_seq = (function() {
var array_seq = null;
var array_seq__1 = ^id(id array) {
return cljm_DOT_core_SLASH_prim_seq(array, @0);
};
var array_seq__2 = ^id(id array, id i) {
return cljm_DOT_core_SLASH_prim_seq(array, i);
};
array_seq = function(array, i){
switch(arguments.length){
case 1:
return array_seq__1.call(this,array);
case 2:
return array_seq__2.call(this,array, i);
}
throw('Invalid arity: ' + arguments.length);
};
array_seq.cljm$lang$arity$1 = array_seq__1;
array_seq.cljm$lang$arity$2 = array_seq__2;
return array_seq;
})()
;
/**
* Returns a seq on the collection. If the collection is
* empty, returns nil.  (seq nil) returns nil. seq also works on
* Strings.
*/
cljm_DOT_core_SLASH_seq = ^id(id coll) {
if(cljm_truthy((coll == nil))) {
return nil;

} else {
if(cljm_truthy({id G__4555__4556 = coll;
if(cljm_truthy(G__4555__4556)) {
if(cljm_truthy({id or__3824__auto____4557 = (G__4555__4556.cljm$lang$protocol_mask$partition0$ & @32);
if(cljm_truthy(or__3824__auto____4557)) {
return or__3824__auto____4557;

} else {
return G__4555__4556.cljm$core$ASeq$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4555__4556.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_ASeq, G__4555__4556);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_ASeq, G__4555__4556);

}
})) {
return coll;

} else {
return cljm_DOT_core_SLASH__seq(coll);

}

}
};
/**
* Returns the first item in the collection. Calls seq on its
* argument. If coll is nil, returns nil.
*/
cljm_DOT_core_SLASH_first = ^id(id coll) {
if(cljm_truthy((coll == nil))) {
return nil;

} else {
if(cljm_truthy({id G__4562__4563 = coll;
if(cljm_truthy(G__4562__4563)) {
if(cljm_truthy({id or__3824__auto____4564 = (G__4562__4563.cljm$lang$protocol_mask$partition0$ & @64);
if(cljm_truthy(or__3824__auto____4564)) {
return or__3824__auto____4564;

} else {
return G__4562__4563.cljm$core$ISeq$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4562__4563.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_ISeq, G__4562__4563);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_ISeq, G__4562__4563);

}
})) {
return cljm_DOT_core_SLASH__first(coll);

} else {
id s__4565 = cljm_DOT_core_SLASH_seq(coll);
if(cljm_truthy((s__4565 == nil))) {
return nil;

} else {
return cljm_DOT_core_SLASH__first(s__4565);

}

}

}
};
/**
* Returns a possibly empty seq of the items after the first. Calls seq on its
* argument.
*/
cljm_DOT_core_SLASH_rest = ^id(id coll) {
if(cljm_truthy(cljm_DOT_core_SLASH_not((coll == nil)))) {
if(cljm_truthy({id G__4570__4571 = coll;
if(cljm_truthy(G__4570__4571)) {
if(cljm_truthy({id or__3824__auto____4572 = (G__4570__4571.cljm$lang$protocol_mask$partition0$ & @64);
if(cljm_truthy(or__3824__auto____4572)) {
return or__3824__auto____4572;

} else {
return G__4570__4571.cljm$core$ISeq$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4570__4571.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_ISeq, G__4570__4571);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_ISeq, G__4570__4571);

}
})) {
return cljm_DOT_core_SLASH__rest(coll);

} else {
id s__4573 = cljm_DOT_core_SLASH_seq(coll);
if(cljm_truthy(cljm_DOT_core_SLASH_not((s__4573 == nil)))) {
return cljm_DOT_core_SLASH__rest(s__4573);

} else {
return cljm.core.List.EMPTY;

}

}

} else {
return cljm.core.List.EMPTY;

}
};
/**
* Returns a seq of the items after the first. Calls seq on its
* argument.  If there are no more items, returns nil
*/
cljm_DOT_core_SLASH_next = ^id(id coll) {
if(cljm_truthy((coll == nil))) {
return nil;

} else {
if(cljm_truthy({id G__4577__4578 = coll;
if(cljm_truthy(G__4577__4578)) {
if(cljm_truthy({id or__3824__auto____4579 = (G__4577__4578.cljm$lang$protocol_mask$partition0$ & @128);
if(cljm_truthy(or__3824__auto____4579)) {
return or__3824__auto____4579;

} else {
return G__4577__4578.cljm$core$INext$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4577__4578.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_INext, G__4577__4578);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_INext, G__4577__4578);

}
})) {
return cljm_DOT_core_SLASH__next(coll);

} else {
return cljm_DOT_core_SLASH_seq(cljm_DOT_core_SLASH_rest(coll));

}

}
};
/**
* Same as (first (next x))
*/
cljm_DOT_core_SLASH_second = ^id(id coll) {
return cljm_DOT_core_SLASH_first(cljm_DOT_core_SLASH_next(coll));
};
/**
* Same as (first (first x))
*/
cljm_DOT_core_SLASH_ffirst = ^id(id coll) {
return cljm_DOT_core_SLASH_first(cljm_DOT_core_SLASH_first(coll));
};
/**
* Same as (next (first x))
*/
cljm_DOT_core_SLASH_nfirst = ^id(id coll) {
return cljm_DOT_core_SLASH_next(cljm_DOT_core_SLASH_first(coll));
};
/**
* Same as (first (next x))
*/
cljm_DOT_core_SLASH_fnext = ^id(id coll) {
return cljm_DOT_core_SLASH_first(cljm_DOT_core_SLASH_next(coll));
};
/**
* Same as (next (next x))
*/
cljm_DOT_core_SLASH_nnext = ^id(id coll) {
return cljm_DOT_core_SLASH_next(cljm_DOT_core_SLASH_next(coll));
};
/**
* Return the last item in coll, in linear time
*/
cljm_DOT_core_SLASH_last = ^id(id s) {
while(YES) {
id sn__4581 = cljm_DOT_core_SLASH_next(s);
if(cljm_truthy(cljm_DOT_core_SLASH_not((sn__4581 == nil)))) {
{
var G__4582 = sn__4581;
s = G__4582;
continue;
}

} else {
return cljm_DOT_core_SLASH_first(s);

}
break;
}
};
(cljm_DOT_core_SLASH_IEquiv[@"_"] = @YES);
(cljm_DOT_core_SLASH__equiv[@"_"] = ^id(id x, id o) {
return ([x isEqual:o]);
});
/**
* Returns true if x is logical false, false otherwise.
*/
cljm_DOT_core_SLASH_not = ^id(id x) {
if(cljm_truthy(x)) {
return @NO;

} else {
return @YES;

}
};
/**
* conj[oin]. Returns a new collection with the xs
* 'added'. (conj nil item) returns (item).  The 'addition' may
* happen at different 'places' depending on the concrete type.
*/
cljm_DOT_core_SLASH_conj = (function() {
var conj = null;
var conj__2 = ^id(id coll, id x) {
return cljm_DOT_core_SLASH__conj(coll, x);
};
var conj__3 = ^id(id cljm__varargs, id coll, id x, ...) {
NSMutableArray *xs = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[xs addObject:cljm__currentObject];
}
va_end(cljm__args);
while(YES) {
if(cljm_truthy(xs)) {
{
var G__4583 = conj(coll, x, nil);
var G__4584 = cljm_DOT_core_SLASH_first(xs);
var G__4585 = cljm_DOT_core_SLASH_next(xs);
coll = G__4583;
x = G__4584;
xs = G__4585;
continue;
}

} else {
return conj(coll, x, nil);

}
break;
}
};
conj = function(coll, x, var_args){
var xs = var_args;
switch(arguments.length){
case 2:
return conj__2.call(this,coll, x);
default:
return conj__3.cljm$lang$arity$variadic(coll, x, cljm.core.array_seq(arguments, 2));
}
throw('Invalid arity: ' + arguments.length);
};
conj.cljm$lang$maxFixedArity = 2;
conj.cljm$lang$applyTo = conj__3.cljm$lang$applyTo;
conj.cljm$lang$arity$2 = conj__2;
conj.cljm$lang$arity$variadic = conj__3.cljm$lang$arity$variadic;
return conj;
})()
;
/**
* Returns an empty collection of the same category as coll, or nil
*/
cljm_DOT_core_SLASH_empty = ^id(id coll) {
return cljm_DOT_core_SLASH__empty(coll);
};
cljm_DOT_core_SLASH_accumulating_seq_count = ^id(id coll) {
id s__4588 = cljm_DOT_core_SLASH_seq(coll);
id acc__4589 = @0;
while(YES) {
if(cljm_truthy(cljm_DOT_core_SLASH_counted_QMARK_(s__4588))) {
return (acc__4589 + cljm_DOT_core_SLASH__count(s__4588));

} else {
{
var G__4590 = cljm_DOT_core_SLASH_next(s__4588);
var G__4591 = (acc__4589 + @1);
s__4588 = G__4590;
acc__4589 = G__4591;
continue;
}

}
break;
}
};
/**
* Returns the number of items in the collection. (count nil) returns
* 0.  Also works on strings, arrays, and Maps
*/
cljm_DOT_core_SLASH_count = ^id(id coll) {
if(cljm_truthy(cljm_DOT_core_SLASH_counted_QMARK_(coll))) {
return cljm_DOT_core_SLASH__count(coll);

} else {
return cljm_DOT_core_SLASH_accumulating_seq_count(coll);

}
};
cljm_DOT_core_SLASH_linear_traversal_nth = (function() {
var linear_traversal_nth = null;
var linear_traversal_nth__2 = ^id(id coll, id n) {
if(cljm_truthy((coll == nil))) {
return cljm_DOT_core_SLASH_error(@"Index out of bounds");

} else {
if(cljm_truthy(([n isEqual:@0]))) {
if(cljm_truthy(cljm_DOT_core_SLASH_seq(coll))) {
return cljm_DOT_core_SLASH_first(coll);

} else {
return cljm_DOT_core_SLASH_error(@"Index out of bounds");

}

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_indexed_QMARK_(coll))) {
return cljm_DOT_core_SLASH__nth(coll, n);

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_seq(coll))) {
return linear_traversal_nth(cljm_DOT_core_SLASH_next(coll), (n - @1));

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return cljm_DOT_core_SLASH_error(@"Index out of bounds");

} else {
return nil;

}

}

}

}

}
};
var linear_traversal_nth__3 = ^id(id coll, id n, id not_found) {
if(cljm_truthy((coll == nil))) {
return not_found;

} else {
if(cljm_truthy(([n isEqual:@0]))) {
if(cljm_truthy(cljm_DOT_core_SLASH_seq(coll))) {
return cljm_DOT_core_SLASH_first(coll);

} else {
return not_found;

}

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_indexed_QMARK_(coll))) {
return cljm_DOT_core_SLASH__nth(coll, n, not_found);

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_seq(coll))) {
return linear_traversal_nth(cljm_DOT_core_SLASH_next(coll), (n - @1), not_found);

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return not_found;

} else {
return nil;

}

}

}

}

}
};
linear_traversal_nth = function(coll, n, not_found){
switch(arguments.length){
case 2:
return linear_traversal_nth__2.call(this,coll, n);
case 3:
return linear_traversal_nth__3.call(this,coll, n, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
linear_traversal_nth.cljm$lang$arity$2 = linear_traversal_nth__2;
linear_traversal_nth.cljm$lang$arity$3 = linear_traversal_nth__3;
return linear_traversal_nth;
})()
;
/**
* Returns the value at the index. get returns nil if index out of
* bounds, nth throws an exception unless not-found is supplied.  nth
* also works for strings, arrays, regex Matchers and Lists, and,
* in O(n) time, for sequences.
*/
cljm_DOT_core_SLASH_nth = (function() {
var nth = null;
var nth__2 = ^id(id coll, id n) {
if(cljm_truthy((coll == nil))) {
return nil;

} else {
if(cljm_truthy({id G__4598__4599 = coll;
if(cljm_truthy(G__4598__4599)) {
if(cljm_truthy({id or__3824__auto____4600 = (G__4598__4599.cljm$lang$protocol_mask$partition0$ & @16);
if(cljm_truthy(or__3824__auto____4600)) {
return or__3824__auto____4600;

} else {
return G__4598__4599.cljm$core$IIndexed$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4598__4599.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IIndexed, G__4598__4599);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IIndexed, G__4598__4599);

}
})) {
return cljm_DOT_core_SLASH__nth(coll, n);

} else {
return cljm_DOT_core_SLASH_linear_traversal_nth(coll, n);

}

}
};
var nth__3 = ^id(id coll, id n, id not_found) {
if(cljm_truthy(cljm_DOT_core_SLASH_not((coll == nil)))) {
if(cljm_truthy({id G__4601__4602 = coll;
if(cljm_truthy(G__4601__4602)) {
if(cljm_truthy({id or__3824__auto____4603 = (G__4601__4602.cljm$lang$protocol_mask$partition0$ & @16);
if(cljm_truthy(or__3824__auto____4603)) {
return or__3824__auto____4603;

} else {
return G__4601__4602.cljm$core$IIndexed$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4601__4602.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IIndexed, G__4601__4602);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IIndexed, G__4601__4602);

}
})) {
return cljm_DOT_core_SLASH__nth(coll, n, not_found);

} else {
return cljm_DOT_core_SLASH_linear_traversal_nth(coll, n, not_found);

}

} else {
return not_found;

}
};
nth = function(coll, n, not_found){
switch(arguments.length){
case 2:
return nth__2.call(this,coll, n);
case 3:
return nth__3.call(this,coll, n, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
nth.cljm$lang$arity$2 = nth__2;
nth.cljm$lang$arity$3 = nth__3;
return nth;
})()
;
/**
* Returns the value mapped to key, not-found or nil if key not present.
*/
cljm_DOT_core_SLASH_get = (function() {
var get = null;
var get__2 = ^id(id o, id k) {
return cljm_DOT_core_SLASH__lookup(o, k);
};
var get__3 = ^id(id o, id k, id not_found) {
return cljm_DOT_core_SLASH__lookup(o, k, not_found);
};
get = function(o, k, not_found){
switch(arguments.length){
case 2:
return get__2.call(this,o, k);
case 3:
return get__3.call(this,o, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
get.cljm$lang$arity$2 = get__2;
get.cljm$lang$arity$3 = get__3;
return get;
})()
;
/**
* assoc[iate]. When applied to a map, returns a new map of the
* same (hashed/sorted) type, that contains the mapping of key(s) to
* val(s). When applied to a vector, returns a new vector that
* contains val at index.
*/
cljm_DOT_core_SLASH_assoc = (function() {
var assoc = null;
var assoc__3 = ^id(id coll, id k, id v) {
return cljm_DOT_core_SLASH__assoc(coll, k, v);
};
var assoc__4 = ^id(id cljm__varargs, id coll, id k, id v, ...) {
NSMutableArray *kvs = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[kvs addObject:cljm__currentObject];
}
va_end(cljm__args);
while(YES) {
id ret__4605 = assoc(coll, k, v, nil);
if(cljm_truthy(kvs)) {
{
var G__4606 = ret__4605;
var G__4607 = cljm_DOT_core_SLASH_first(kvs);
var G__4608 = cljm_DOT_core_SLASH_second(kvs);
var G__4609 = cljm_DOT_core_SLASH_nnext(kvs);
coll = G__4606;
k = G__4607;
v = G__4608;
kvs = G__4609;
continue;
}

} else {
return ret__4605;

}
break;
}
};
assoc = function(coll, k, v, var_args){
var kvs = var_args;
switch(arguments.length){
case 3:
return assoc__3.call(this,coll, k, v);
default:
return assoc__4.cljm$lang$arity$variadic(coll, k, v, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
assoc.cljm$lang$maxFixedArity = 3;
assoc.cljm$lang$applyTo = assoc__4.cljm$lang$applyTo;
assoc.cljm$lang$arity$3 = assoc__3;
assoc.cljm$lang$arity$variadic = assoc__4.cljm$lang$arity$variadic;
return assoc;
})()
;
/**
* dissoc[iate]. Returns a new map of the same (hashed/sorted) type,
* that does not contain a mapping for key(s).
*/
cljm_DOT_core_SLASH_dissoc = (function() {
var dissoc = null;
var dissoc__1 = ^id(id coll) {
return coll;
};
var dissoc__2 = ^id(id coll, id k) {
return cljm_DOT_core_SLASH__dissoc(coll, k);
};
var dissoc__3 = ^id(id cljm__varargs, id coll, id k, ...) {
NSMutableArray *ks = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[ks addObject:cljm__currentObject];
}
va_end(cljm__args);
while(YES) {
id ret__4611 = dissoc(coll, k, nil);
if(cljm_truthy(ks)) {
{
var G__4612 = ret__4611;
var G__4613 = cljm_DOT_core_SLASH_first(ks);
var G__4614 = cljm_DOT_core_SLASH_next(ks);
coll = G__4612;
k = G__4613;
ks = G__4614;
continue;
}

} else {
return ret__4611;

}
break;
}
};
dissoc = function(coll, k, var_args){
var ks = var_args;
switch(arguments.length){
case 1:
return dissoc__1.call(this,coll);
case 2:
return dissoc__2.call(this,coll, k);
default:
return dissoc__3.cljm$lang$arity$variadic(coll, k, cljm.core.array_seq(arguments, 2));
}
throw('Invalid arity: ' + arguments.length);
};
dissoc.cljm$lang$maxFixedArity = 2;
dissoc.cljm$lang$applyTo = dissoc__3.cljm$lang$applyTo;
dissoc.cljm$lang$arity$1 = dissoc__1;
dissoc.cljm$lang$arity$2 = dissoc__2;
dissoc.cljm$lang$arity$variadic = dissoc__3.cljm$lang$arity$variadic;
return dissoc;
})()
;
/**
* Returns an object of the same type and value as obj, with
* map m as its metadata.
*/
cljm_DOT_core_SLASH_with_meta = ^id(id o, id meta) {
return cljm_DOT_core_SLASH__with_meta(o, meta);
};
/**
* Returns the metadata of obj, returns nil if there is no metadata.
*/
cljm_DOT_core_SLASH_meta = ^id(id o) {
if(cljm_truthy({id G__4618__4619 = o;
if(cljm_truthy(G__4618__4619)) {
if(cljm_truthy({id or__3824__auto____4620 = (G__4618__4619.cljm$lang$protocol_mask$partition0$ & @131072);
if(cljm_truthy(or__3824__auto____4620)) {
return or__3824__auto____4620;

} else {
return G__4618__4619.cljm$core$IMeta$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4618__4619.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IMeta, G__4618__4619);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IMeta, G__4618__4619);

}
})) {
return cljm_DOT_core_SLASH__meta(o);

} else {
return nil;

}
};
/**
* For a list or queue, same as first, for a vector, same as, but much
* more efficient than, last. If the collection is empty, returns nil.
*/
cljm_DOT_core_SLASH_peek = ^id(id coll) {
return cljm_DOT_core_SLASH__peek(coll);
};
/**
* For a list or queue, returns a new list/queue without the first
* item, for a vector, returns a new vector without the last item.
* Note - not the same as next/butlast.
*/
cljm_DOT_core_SLASH_pop = ^id(id coll) {
return cljm_DOT_core_SLASH__pop(coll);
};
/**
* disj[oin]. Returns a new set of the same (hashed/sorted) type, that
* does not contain key(s).
*/
cljm_DOT_core_SLASH_disj = (function() {
var disj = null;
var disj__1 = ^id(id coll) {
return coll;
};
var disj__2 = ^id(id coll, id k) {
return cljm_DOT_core_SLASH__disjoin(coll, k);
};
var disj__3 = ^id(id cljm__varargs, id coll, id k, ...) {
NSMutableArray *ks = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[ks addObject:cljm__currentObject];
}
va_end(cljm__args);
while(YES) {
id ret__4622 = disj(coll, k, nil);
if(cljm_truthy(ks)) {
{
var G__4623 = ret__4622;
var G__4624 = cljm_DOT_core_SLASH_first(ks);
var G__4625 = cljm_DOT_core_SLASH_next(ks);
coll = G__4623;
k = G__4624;
ks = G__4625;
continue;
}

} else {
return ret__4622;

}
break;
}
};
disj = function(coll, k, var_args){
var ks = var_args;
switch(arguments.length){
case 1:
return disj__1.call(this,coll);
case 2:
return disj__2.call(this,coll, k);
default:
return disj__3.cljm$lang$arity$variadic(coll, k, cljm.core.array_seq(arguments, 2));
}
throw('Invalid arity: ' + arguments.length);
};
disj.cljm$lang$maxFixedArity = 2;
disj.cljm$lang$applyTo = disj__3.cljm$lang$applyTo;
disj.cljm$lang$arity$1 = disj__1;
disj.cljm$lang$arity$2 = disj__2;
disj.cljm$lang$arity$variadic = disj__3.cljm$lang$arity$variadic;
return disj;
})()
;
cljm_DOT_core_SLASH_hash = (function() {
var hash = null;
var hash__1 = ^id(id o) {
return hash(o, @YES);
};
var hash__2 = ^id(id o, id check_cache) {
return [@"hash" o];
};
hash = function(o, check_cache){
switch(arguments.length){
case 1:
return hash__1.call(this,o);
case 2:
return hash__2.call(this,o, check_cache);
}
throw('Invalid arity: ' + arguments.length);
};
hash.cljm$lang$arity$1 = hash__1;
hash.cljm$lang$arity$2 = hash__2;
return hash;
})()
;
/**
* Returns true if coll has no items - same as (not (seq coll)).
* Please use the idiom (seq x) rather than (not (empty? x))
*/
cljm_DOT_core_SLASH_empty_QMARK_ = ^id(id coll) {
return cljm_DOT_core_SLASH_not(cljm_DOT_core_SLASH_seq(coll));
};
/**
* Returns true if x satisfies ICollection
*/
cljm_DOT_core_SLASH_coll_QMARK_ = ^id(id x) {
if(cljm_truthy((x == nil))) {
return @NO;

} else {
id G__4629__4630 = x;
if(cljm_truthy(G__4629__4630)) {
if(cljm_truthy({id or__3824__auto____4631 = (G__4629__4630.cljm$lang$protocol_mask$partition0$ & @8);
if(cljm_truthy(or__3824__auto____4631)) {
return or__3824__auto____4631;

} else {
return G__4629__4630.cljm$core$ICollection$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4629__4630.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_ICollection, G__4629__4630);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_ICollection, G__4629__4630);

}

}
};
/**
* Returns true if x satisfies ISet
*/
cljm_DOT_core_SLASH_set_QMARK_ = ^id(id x) {
if(cljm_truthy((x == nil))) {
return @NO;

} else {
id G__4635__4636 = x;
if(cljm_truthy(G__4635__4636)) {
if(cljm_truthy({id or__3824__auto____4637 = (G__4635__4636.cljm$lang$protocol_mask$partition0$ & @4096);
if(cljm_truthy(or__3824__auto____4637)) {
return or__3824__auto____4637;

} else {
return G__4635__4636.cljm$core$ISet$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4635__4636.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_ISet, G__4635__4636);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_ISet, G__4635__4636);

}

}
};
/**
* Returns true if coll implements Associative
*/
cljm_DOT_core_SLASH_associative_QMARK_ = ^id(id x) {
id G__4641__4642 = x;
if(cljm_truthy(G__4641__4642)) {
if(cljm_truthy({id or__3824__auto____4643 = (G__4641__4642.cljm$lang$protocol_mask$partition0$ & @512);
if(cljm_truthy(or__3824__auto____4643)) {
return or__3824__auto____4643;

} else {
return G__4641__4642.cljm$core$IAssociative$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4641__4642.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IAssociative, G__4641__4642);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IAssociative, G__4641__4642);

}
};
/**
* Returns true if coll satisfies ISequential
*/
cljm_DOT_core_SLASH_sequential_QMARK_ = ^id(id x) {
id G__4647__4648 = x;
if(cljm_truthy(G__4647__4648)) {
if(cljm_truthy({id or__3824__auto____4649 = (G__4647__4648.cljm$lang$protocol_mask$partition0$ & @16777216);
if(cljm_truthy(or__3824__auto____4649)) {
return or__3824__auto____4649;

} else {
return G__4647__4648.cljm$core$ISequential$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4647__4648.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_ISequential, G__4647__4648);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_ISequential, G__4647__4648);

}
};
/**
* Returns true if coll implements count in constant time
*/
cljm_DOT_core_SLASH_counted_QMARK_ = ^id(id x) {
id G__4653__4654 = x;
if(cljm_truthy(G__4653__4654)) {
if(cljm_truthy({id or__3824__auto____4655 = (G__4653__4654.cljm$lang$protocol_mask$partition0$ & @2);
if(cljm_truthy(or__3824__auto____4655)) {
return or__3824__auto____4655;

} else {
return G__4653__4654.cljm$core$ICounted$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4653__4654.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_ICounted, G__4653__4654);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_ICounted, G__4653__4654);

}
};
/**
* Returns true if coll implements nth in constant time
*/
cljm_DOT_core_SLASH_indexed_QMARK_ = ^id(id x) {
id G__4659__4660 = x;
if(cljm_truthy(G__4659__4660)) {
if(cljm_truthy({id or__3824__auto____4661 = (G__4659__4660.cljm$lang$protocol_mask$partition0$ & @16);
if(cljm_truthy(or__3824__auto____4661)) {
return or__3824__auto____4661;

} else {
return G__4659__4660.cljm$core$IIndexed$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4659__4660.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IIndexed, G__4659__4660);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IIndexed, G__4659__4660);

}
};
/**
* Returns true if coll satisfies IReduce
*/
cljm_DOT_core_SLASH_reduceable_QMARK_ = ^id(id x) {
id G__4665__4666 = x;
if(cljm_truthy(G__4665__4666)) {
if(cljm_truthy({id or__3824__auto____4667 = (G__4665__4666.cljm$lang$protocol_mask$partition0$ & @524288);
if(cljm_truthy(or__3824__auto____4667)) {
return or__3824__auto____4667;

} else {
return G__4665__4666.cljm$core$IReduce$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4665__4666.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IReduce, G__4665__4666);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IReduce, G__4665__4666);

}
};
/**
* Return true if x satisfies IMap
*/
cljm_DOT_core_SLASH_map_QMARK_ = ^id(id x) {
if(cljm_truthy((x == nil))) {
return @NO;

} else {
id G__4671__4672 = x;
if(cljm_truthy(G__4671__4672)) {
if(cljm_truthy({id or__3824__auto____4673 = (G__4671__4672.cljm$lang$protocol_mask$partition0$ & @1024);
if(cljm_truthy(or__3824__auto____4673)) {
return or__3824__auto____4673;

} else {
return G__4671__4672.cljm$core$IMap$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4671__4672.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IMap, G__4671__4672);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IMap, G__4671__4672);

}

}
};
/**
* Return true if x satisfies IVector
*/
cljm_DOT_core_SLASH_vector_QMARK_ = ^id(id x) {
id G__4677__4678 = x;
if(cljm_truthy(G__4677__4678)) {
if(cljm_truthy({id or__3824__auto____4679 = (G__4677__4678.cljm$lang$protocol_mask$partition0$ & @16384);
if(cljm_truthy(or__3824__auto____4679)) {
return or__3824__auto____4679;

} else {
return G__4677__4678.cljm$core$IVector$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4677__4678.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IVector, G__4677__4678);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IVector, G__4677__4678);

}
};
cljm_DOT_core_SLASH_chunked_seq_QMARK_ = ^id(id x) {
id G__4683__4684 = x;
if(cljm_truthy(G__4683__4684)) {
if(cljm_truthy({id or__3824__auto____4685 = nil;
if(cljm_truthy(or__3824__auto____4685)) {
return or__3824__auto____4685;

} else {
return G__4683__4684.cljm$core$IChunkedSeq$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4683__4684.cljm$lang$protocol_mask$partition$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IChunkedSeq, G__4683__4684);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IChunkedSeq, G__4683__4684);

}
};
/**
* Returns true if x is the value false, false otherwise.
*/
cljm_DOT_core_SLASH_false_QMARK_ = ^id(id x) {
return x === NO;
};
/**
* Returns true if x is the value true, false otherwise.
*/
cljm_DOT_core_SLASH_true_QMARK_ = ^id(id x) {
return x === YES;
};
cljm_DOT_core_SLASH_undefined_QMARK_ = ^id(id x) {
return ((void *) 0) === x);
};
/**
* Return true if s satisfies ISeq
*/
cljm_DOT_core_SLASH_seq_QMARK_ = ^id(id s) {
if(cljm_truthy((s == nil))) {
return @NO;

} else {
id G__4689__4690 = s;
if(cljm_truthy(G__4689__4690)) {
if(cljm_truthy({id or__3824__auto____4691 = (G__4689__4690.cljm$lang$protocol_mask$partition0$ & @64);
if(cljm_truthy(or__3824__auto____4691)) {
return or__3824__auto____4691;

} else {
return G__4689__4690.cljm$core$ISeq$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4689__4690.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_ISeq, G__4689__4690);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_ISeq, G__4689__4690);

}

}
};
/**
* Return true if s satisfies ISeqable
*/
cljm_DOT_core_SLASH_seqable_QMARK_ = ^id(id s) {
id G__4695__4696 = s;
if(cljm_truthy(G__4695__4696)) {
if(cljm_truthy({id or__3824__auto____4697 = (G__4695__4696.cljm$lang$protocol_mask$partition0$ & @8388608);
if(cljm_truthy(or__3824__auto____4697)) {
return or__3824__auto____4697;

} else {
return G__4695__4696.cljm$core$ISeqable$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4695__4696.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_ISeqable, G__4695__4696);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_ISeqable, G__4695__4696);

}
};
cljm_DOT_core_SLASH_boolean = ^id(id x) {
if(cljm_truthy(x)) {
return @YES;

} else {
return @NO;

}
};
cljm_DOT_core_SLASH_string_QMARK_ = ^id(id x) {
id and__3822__auto____4700 = [x isKindOfClass:[NSString class]];
if(cljm_truthy(and__3822__auto____4700)) {
return cljm_DOT_core_SLASH_not({id or__3824__auto____4701 = ([[@"characterAtIndex:" x@0] isEqual:@"\uFDD0"]);
if(cljm_truthy(or__3824__auto____4701)) {
return or__3824__auto____4701;

} else {
return ([[@"characterAtIndex:" x@0] isEqual:@"\uFDD1"]);

}
});

} else {
return and__3822__auto____4700;

}
};
cljm_DOT_core_SLASH_keyword_QMARK_ = ^id(id x) {
id and__3822__auto____4703 = [x isKindOfClass:[NSString class]];
if(cljm_truthy(and__3822__auto____4703)) {
return ([[@"characterAtIndex:" x@0] isEqual:@"\uFDD0"]);

} else {
return and__3822__auto____4703;

}
};
cljm_DOT_core_SLASH_symbol_QMARK_ = ^id(id x) {
id and__3822__auto____4705 = [x isKindOfClass:[NSString class]];
if(cljm_truthy(and__3822__auto____4705)) {
return ([[@"characterAtIndex:" x@0] isEqual:@"\uFDD1"]);

} else {
return and__3822__auto____4705;

}
};
cljm_DOT_core_SLASH_number_QMARK_ = ^id(id n) {
return [n isKindOfClass:[NSNumber class]];
};
cljm_DOT_core_SLASH_fn_QMARK_ = ^id(id f) {
return [f isKindOfClass:[NSBlock class]];
};
cljm_DOT_core_SLASH_ifn_QMARK_ = ^id(id f) {
id or__3824__auto____4710 = cljm_DOT_core_SLASH_fn_QMARK_(f);
if(cljm_truthy(or__3824__auto____4710)) {
return or__3824__auto____4710;

} else {
id G__4711__4712 = f;
if(cljm_truthy(G__4711__4712)) {
if(cljm_truthy({id or__3824__auto____4713 = (G__4711__4712.cljm$lang$protocol_mask$partition0$ & @1);
if(cljm_truthy(or__3824__auto____4713)) {
return or__3824__auto____4713;

} else {
return G__4711__4712.cljm$core$IFn$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4711__4712.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IFn, G__4711__4712);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IFn, G__4711__4712);

}

}
};
/**
* Returns true if n is an integer.  Warning: returns true on underflow condition.
*/
cljm_DOT_core_SLASH_integer_QMARK_ = ^id(id n) {
id and__3822__auto____4715 = cljm_DOT_core_SLASH_number_QMARK_(n);
if(cljm_truthy(and__3822__auto____4715)) {
return (n == [@"integerValue" n]);

} else {
return and__3822__auto____4715;

}
};
/**
* Returns true if key is present in the given collection, otherwise
* returns false.  Note that for numerically indexed collections like
* vectors and arrays, this tests if the numeric key is within the
* range of indexes. 'contains?' operates constant or logarithmic time;
* it will not perform a linear search for a value.  See also 'some'.
*/
cljm_DOT_core_SLASH_contains_QMARK_ = ^id(id coll, id v) {
if(cljm_truthy(([cljm_DOT_core_SLASH__lookup(coll, v, cljm_DOT_core_SLASH_lookup_sentinel) isEqual:cljm_DOT_core_SLASH_lookup_sentinel]))) {
return @NO;

} else {
return @YES;

}
};
/**
* Returns the map entry for key, or nil if key not present.
*/
cljm_DOT_core_SLASH_find = ^id(id coll, id k) {
if(cljm_truthy({id and__3822__auto____4718 = coll;
if(cljm_truthy(and__3822__auto____4718)) {
id and__3822__auto____4719 = cljm_DOT_core_SLASH_associative_QMARK_(coll);
if(cljm_truthy(and__3822__auto____4719)) {
return cljm_DOT_core_SLASH_contains_QMARK_(coll, k);

} else {
return and__3822__auto____4719;

}

} else {
return and__3822__auto____4718;

}
})) {
return @[ k, cljm_DOT_core_SLASH__lookup(coll, k) ];

} else {
return nil;

}
};
/**
* Returns true if no two of the arguments are =
*/
cljm_DOT_core_SLASH_distinct_QMARK_ = (function() {
var distinct_QMARK_ = null;
var distinct_QMARK___1 = ^id(id x) {
return @YES;
};
var distinct_QMARK___2 = ^id(id x, id y) {
return cljm_DOT_core_SLASH_not(cljm_DOT_core_SLASH__EQ_(x, y, nil));
};
var distinct_QMARK___3 = ^id(id cljm__varargs, id x, id y, ...) {
NSMutableArray *more = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[more addObject:cljm__currentObject];
}
va_end(cljm__args);
if(cljm_truthy(cljm_DOT_core_SLASH_not(cljm_DOT_core_SLASH__EQ_(x, y, nil)))) {
id s__4724 = [NSSet setWithObjects:y, x, nil];
id xs__4725 = more;
while(YES) {
id x__4726 = cljm_DOT_core_SLASH_first(xs__4725);
id etc__4727 = cljm_DOT_core_SLASH_next(xs__4725);
if(cljm_truthy(xs__4725)) {
if(cljm_truthy(cljm_DOT_core_SLASH_contains_QMARK_(s__4724, x__4726))) {
return @NO;

} else {
{
var G__4728 = cljm_DOT_core_SLASH_conj(s__4724, x__4726, nil);
var G__4729 = etc__4727;
s__4724 = G__4728;
xs__4725 = G__4729;
continue;
}

}

} else {
return @YES;

}
break;
}

} else {
return @NO;

}
};
distinct_QMARK_ = function(x, y, var_args){
var more = var_args;
switch(arguments.length){
case 1:
return distinct_QMARK___1.call(this,x);
case 2:
return distinct_QMARK___2.call(this,x, y);
default:
return distinct_QMARK___3.cljm$lang$arity$variadic(x, y, cljm.core.array_seq(arguments, 2));
}
throw('Invalid arity: ' + arguments.length);
};
distinct_QMARK_.cljm$lang$maxFixedArity = 2;
distinct_QMARK_.cljm$lang$applyTo = distinct_QMARK___3.cljm$lang$applyTo;
distinct_QMARK_.cljm$lang$arity$1 = distinct_QMARK___1;
distinct_QMARK_.cljm$lang$arity$2 = distinct_QMARK___2;
distinct_QMARK_.cljm$lang$arity$variadic = distinct_QMARK___3.cljm$lang$arity$variadic;
return distinct_QMARK_;
})()
;
/**
* Comparator. Returns a negative number, zero, or a positive number
* when x is logically 'less than', 'equal to', or 'greater than'
* y. Uses IComparable if available and google.array.defaultCompare for objects
* of the same type and special-cases nil to be less than any other object.
*/
cljm_DOT_core_SLASH_compare = ^id(id x, id y) {
if(cljm_truthy(([x isEqual:y]))) {
return @0;

} else {
if(cljm_truthy((x == nil))) {
return @-1;

} else {
if(cljm_truthy((y == nil))) {
return @1;

} else {
if(cljm_truthy(([cljm_DOT_core_SLASH_type(x) isEqual:cljm_DOT_core_SLASH_type(y)]))) {
if(cljm_truthy({id G__4733__4734 = x;
if(cljm_truthy(G__4733__4734)) {
if(cljm_truthy({id or__3824__auto____4735 = nil;
if(cljm_truthy(or__3824__auto____4735)) {
return or__3824__auto____4735;

} else {
return G__4733__4734.cljm$core$IComparable$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4733__4734.cljm$lang$protocol_mask$partition$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IComparable, G__4733__4734);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IComparable, G__4733__4734);

}
})) {
return cljm_DOT_core_SLASH__compare(x, y);

} else {
return garray_SLASH_defaultCompare(x, y);

}

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return cljm_DOT_core_SLASH_error(@"compare on non-nil objects of different types");

} else {
return nil;

}

}

}

}

}
};
/**
* Compare indexed collection.
*/
cljm_DOT_core_SLASH_compare_indexed = (function() {
var compare_indexed = null;
var compare_indexed__2 = ^id(id xs, id ys) {
id xl__4740 = cljm_DOT_core_SLASH_count(xs);
id yl__4741 = cljm_DOT_core_SLASH_count(ys);
if(cljm_truthy((xl__4740 < yl__4741))) {
return @-1;

} else {
if(cljm_truthy((xl__4740 > yl__4741))) {
return @1;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return compare_indexed(xs, ys, xl__4740, @0);

} else {
return nil;

}

}

}
};
var compare_indexed__4 = ^id(id xs, id ys, id len, id n) {
while(YES) {
id d__4742 = cljm_DOT_core_SLASH_compare(cljm_DOT_core_SLASH_nth(xs, n), cljm_DOT_core_SLASH_nth(ys, n));
if(cljm_truthy({id and__3822__auto____4743 = ([d__4742 isEqual:@0]);
if(cljm_truthy(and__3822__auto____4743)) {
return ((n + @1) < len);

} else {
return and__3822__auto____4743;

}
})) {
{
var G__4744 = xs;
var G__4745 = ys;
var G__4746 = len;
var G__4747 = (n + @1);
xs = G__4744;
ys = G__4745;
len = G__4746;
n = G__4747;
continue;
}

} else {
return d__4742;

}
break;
}
};
compare_indexed = function(xs, ys, len, n){
switch(arguments.length){
case 2:
return compare_indexed__2.call(this,xs, ys);
case 4:
return compare_indexed__4.call(this,xs, ys, len, n);
}
throw('Invalid arity: ' + arguments.length);
};
compare_indexed.cljm$lang$arity$2 = compare_indexed__2;
compare_indexed.cljm$lang$arity$4 = compare_indexed__4;
return compare_indexed;
})()
;
/**
* Given a fn that might be boolean valued or a comparator,
* return a fn that is a comparator.
*/
cljm_DOT_core_SLASH_fn__GT_comparator = ^id(id f) {
if(cljm_truthy(cljm_DOT_core_SLASH__EQ_(f, cljm_DOT_core_SLASH_compare, nil))) {
return cljm_DOT_core_SLASH_compare;

} else {
return ^id(id x, id y) {
id r__4749 = f(x, y);
if(cljm_truthy(cljm_DOT_core_SLASH_number_QMARK_(r__4749))) {
return r__4749;

} else {
if(cljm_truthy(r__4749)) {
return @-1;

} else {
if(cljm_truthy(f(y, x))) {
return @1;

} else {
return @0;

}

}

}
};

}
};
/**
* Returns a sorted sequence of the items in coll. Comp can be
* boolean-valued comparison funcion, or a -/0/+ valued comparator.
* Comp defaults to compare.
*/
cljm_DOT_core_SLASH_sort = (function() {
var sort = null;
var sort__1 = ^id(id coll) {
return sort(cljm_DOT_core_SLASH_compare, coll);
};
var sort__2 = ^id(id comp, id coll) {
if(cljm_truthy(cljm_DOT_core_SLASH_seq(coll))) {
id a__4751 = cljm_DOT_core_SLASH_to_array(coll);
garray_SLASH_stableSort(a__4751, cljm_DOT_core_SLASH_fn__GT_comparator(comp));
return cljm_DOT_core_SLASH_seq(a__4751);

} else {
return cljm.core.List.EMPTY;

}
};
sort = function(comp, coll){
switch(arguments.length){
case 1:
return sort__1.call(this,comp);
case 2:
return sort__2.call(this,comp, coll);
}
throw('Invalid arity: ' + arguments.length);
};
sort.cljm$lang$arity$1 = sort__1;
sort.cljm$lang$arity$2 = sort__2;
return sort;
})()
;
/**
* Returns a sorted sequence of the items in coll, where the sort
* order is determined by comparing (keyfn item).  Comp can be
* boolean-valued comparison funcion, or a -/0/+ valued comparator.
* Comp defaults to compare.
*/
cljm_DOT_core_SLASH_sort_by = (function() {
var sort_by = null;
var sort_by__2 = ^id(id keyfn, id coll) {
return sort_by(keyfn, cljm_DOT_core_SLASH_compare, coll);
};
var sort_by__3 = ^id(id keyfn, id comp, id coll) {
return cljm_DOT_core_SLASH_sort(^id(id x, id y) {
return (keyfn(x), keyfn(y));
}, coll);
};
sort_by = function(keyfn, comp, coll){
switch(arguments.length){
case 2:
return sort_by__2.call(this,keyfn, comp);
case 3:
return sort_by__3.call(this,keyfn, comp, coll);
}
throw('Invalid arity: ' + arguments.length);
};
sort_by.cljm$lang$arity$2 = sort_by__2;
sort_by.cljm$lang$arity$3 = sort_by__3;
return sort_by;
})()
;
cljm_DOT_core_SLASH_seq_reduce = (function() {
var seq_reduce = null;
var seq_reduce__2 = ^id(id f, id coll) {
id temp__3971__auto____4757 = cljm_DOT_core_SLASH_seq(coll);
if(cljm_truthy(temp__3971__auto____4757)) {
id s__4758 = temp__3971__auto____4757;
return cljm_DOT_core_SLASH_reduce(f, cljm_DOT_core_SLASH_first(s__4758), cljm_DOT_core_SLASH_next(s__4758));

} else {
return f();

}
};
var seq_reduce__3 = ^id(id f, id val, id coll) {
id val__4759 = val;
id coll__4760 = cljm_DOT_core_SLASH_seq(coll);
while(YES) {
if(cljm_truthy(coll__4760)) {
id nval__4761 = f(val__4759, cljm_DOT_core_SLASH_first(coll__4760));
if(cljm_truthy(cljm_DOT_core_SLASH_reduced_QMARK_(nval__4761))) {
return cljm_DOT_core_SLASH_deref(nval__4761);

} else {
{
var G__4762 = nval__4761;
var G__4763 = cljm_DOT_core_SLASH_next(coll__4760);
val__4759 = G__4762;
coll__4760 = G__4763;
continue;
}

}

} else {
return val__4759;

}
break;
}
};
seq_reduce = function(f, val, coll){
switch(arguments.length){
case 2:
return seq_reduce__2.call(this,f, val);
case 3:
return seq_reduce__3.call(this,f, val, coll);
}
throw('Invalid arity: ' + arguments.length);
};
seq_reduce.cljm$lang$arity$2 = seq_reduce__2;
seq_reduce.cljm$lang$arity$3 = seq_reduce__3;
return seq_reduce;
})()
;
/**
* Return a random permutation of coll
*/
cljm_DOT_core_SLASH_shuffle = ^id(id coll) {
id a__4765 = cljm_DOT_core_SLASH_to_array(coll);
garray_SLASH_shuffle(a__4765);
return cljm_DOT_core_SLASH_vec(a__4765);
};
/**
* f should be a function of 2 arguments. If val is not supplied,
* returns the result of applying f to the first 2 items in coll, then
* applying f to that result and the 3rd item, etc. If coll contains no
* items, f must accept no arguments as well, and reduce returns the
* result of calling f with no arguments.  If coll has only 1 item, it
* is returned and f is not called.  If val is supplied, returns the
* result of applying f to val and the first item in coll, then
* applying f to that result and the 2nd item, etc. If coll contains no
* items, returns val and f is not called.
*/
cljm_DOT_core_SLASH_reduce = (function() {
var reduce = null;
var reduce__2 = ^id(id f, id coll) {
if(cljm_truthy({id G__4772__4773 = coll;
if(cljm_truthy(G__4772__4773)) {
if(cljm_truthy({id or__3824__auto____4774 = (G__4772__4773.cljm$lang$protocol_mask$partition0$ & @524288);
if(cljm_truthy(or__3824__auto____4774)) {
return or__3824__auto____4774;

} else {
return G__4772__4773.cljm$core$IReduce$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4772__4773.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IReduce, G__4772__4773);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IReduce, G__4772__4773);

}
})) {
return cljm_DOT_core_SLASH__reduce(coll, f);

} else {
return cljm_DOT_core_SLASH_seq_reduce(f, coll);

}
};
var reduce__3 = ^id(id f, id val, id coll) {
if(cljm_truthy({id G__4775__4776 = coll;
if(cljm_truthy(G__4775__4776)) {
if(cljm_truthy({id or__3824__auto____4777 = (G__4775__4776.cljm$lang$protocol_mask$partition0$ & @524288);
if(cljm_truthy(or__3824__auto____4777)) {
return or__3824__auto____4777;

} else {
return G__4775__4776.cljm$core$IReduce$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4775__4776.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IReduce, G__4775__4776);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IReduce, G__4775__4776);

}
})) {
return cljm_DOT_core_SLASH__reduce(coll, f, val);

} else {
return cljm_DOT_core_SLASH_seq_reduce(f, val, coll);

}
};
reduce = function(f, val, coll){
switch(arguments.length){
case 2:
return reduce__2.call(this,f, val);
case 3:
return reduce__3.call(this,f, val, coll);
}
throw('Invalid arity: ' + arguments.length);
};
reduce.cljm$lang$arity$2 = reduce__2;
reduce.cljm$lang$arity$3 = reduce__3;
return reduce;
})()
;
/**
* Reduces an associative collection. f should be a function of 3
* arguments. Returns the result of applying f to init, the first key
* and the first value in coll, then applying f to that result and the
* 2nd key and value, etc. If coll contains no entries, returns init
* and f is not called. Note that reduce-kv is supported on vectors,
* where the keys will be the ordinals.
*/
cljm_DOT_core_SLASH_reduce_kv = ^id(id f, id init, id coll) {
return cljm_DOT_core_SLASH__kv_reduce(coll, f, init);
};

/**
* @constructor
*/
cljm_DOT_core_SLASH_Reduced = (function (val){
this.val = val;
this.cljm$lang$protocol_mask$partition1$ = 0;
this.cljm$lang$protocol_mask$partition0$ = 32768;
})
cljm_DOT_core_SLASH_Reduced.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_Reduced.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/Reduced", nil);
};
cljm_DOT_core_SLASH_Reduced.prototype.cljm$core$IDeref$_deref$arity$1 = ^id(id o) {
var this__4778 = this;
return this__4778_DOT_val;
};
cljm_DOT_core_SLASH_Reduced;
/**
* Returns true if x is the result of a call to reduced
*/
cljm_DOT_core_SLASH_reduced_QMARK_ = ^id(id r) {
return cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_Reduced, r);
};
/**
* Wraps x in a way such that a reduce will terminate with the value x
*/
cljm_DOT_core_SLASH_reduced = ^id(id x) {
return [cljm_DOT_core_SLASH_Reduced alloc];
};
/**
* Returns the sum of nums. (+) returns 0.
*/
cljm_DOT_core_SLASH__PLUS_ = (function() {
var _PLUS_ = null;
var _PLUS___0 = ^id() {
return @0;
};
var _PLUS___1 = ^id(id x) {
return x;
};
var _PLUS___2 = ^id(id x, id y) {
return (x + y);
};
var _PLUS___3 = ^id(id cljm__varargs, id x, id y, ...) {
NSMutableArray *more = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[more addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_reduce(_PLUS_, (x + y), more);
};
_PLUS_ = function(x, y, var_args){
var more = var_args;
switch(arguments.length){
case 0:
return _PLUS___0.call(this);
case 1:
return _PLUS___1.call(this,x);
case 2:
return _PLUS___2.call(this,x, y);
default:
return _PLUS___3.cljm$lang$arity$variadic(x, y, cljm.core.array_seq(arguments, 2));
}
throw('Invalid arity: ' + arguments.length);
};
_PLUS_.cljm$lang$maxFixedArity = 2;
_PLUS_.cljm$lang$applyTo = _PLUS___3.cljm$lang$applyTo;
_PLUS_.cljm$lang$arity$0 = _PLUS___0;
_PLUS_.cljm$lang$arity$1 = _PLUS___1;
_PLUS_.cljm$lang$arity$2 = _PLUS___2;
_PLUS_.cljm$lang$arity$variadic = _PLUS___3.cljm$lang$arity$variadic;
return _PLUS_;
})()
;
/**
* If no ys are supplied, returns the negation of x, else subtracts
* the ys from x and returns the result.
*/
cljm_DOT_core_SLASH__ = (function() {
var _ = null;
var ___1 = ^id(id x) {
return (- x);
};
var ___2 = ^id(id x, id y) {
return (x - y);
};
var ___3 = ^id(id cljm__varargs, id x, id y, ...) {
NSMutableArray *more = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[more addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_reduce(_, (x - y), more);
};
_ = function(x, y, var_args){
var more = var_args;
switch(arguments.length){
case 1:
return ___1.call(this,x);
case 2:
return ___2.call(this,x, y);
default:
return ___3.cljm$lang$arity$variadic(x, y, cljm.core.array_seq(arguments, 2));
}
throw('Invalid arity: ' + arguments.length);
};
_.cljm$lang$maxFixedArity = 2;
_.cljm$lang$applyTo = ___3.cljm$lang$applyTo;
_.cljm$lang$arity$1 = ___1;
_.cljm$lang$arity$2 = ___2;
_.cljm$lang$arity$variadic = ___3.cljm$lang$arity$variadic;
return _;
})()
;
/**
* Returns the product of nums. (*) returns 1.
*/
cljm_DOT_core_SLASH__STAR_ = (function() {
var _STAR_ = null;
var _STAR___0 = ^id() {
return @1;
};
var _STAR___1 = ^id(id x) {
return x;
};
var _STAR___2 = ^id(id x, id y) {
return (x * y);
};
var _STAR___3 = ^id(id cljm__varargs, id x, id y, ...) {
NSMutableArray *more = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[more addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_reduce(_STAR_, (x * y), more);
};
_STAR_ = function(x, y, var_args){
var more = var_args;
switch(arguments.length){
case 0:
return _STAR___0.call(this);
case 1:
return _STAR___1.call(this,x);
case 2:
return _STAR___2.call(this,x, y);
default:
return _STAR___3.cljm$lang$arity$variadic(x, y, cljm.core.array_seq(arguments, 2));
}
throw('Invalid arity: ' + arguments.length);
};
_STAR_.cljm$lang$maxFixedArity = 2;
_STAR_.cljm$lang$applyTo = _STAR___3.cljm$lang$applyTo;
_STAR_.cljm$lang$arity$0 = _STAR___0;
_STAR_.cljm$lang$arity$1 = _STAR___1;
_STAR_.cljm$lang$arity$2 = _STAR___2;
_STAR_.cljm$lang$arity$variadic = _STAR___3.cljm$lang$arity$variadic;
return _STAR_;
})()
;
/**
* If no denominators are supplied, returns 1/numerator,
* else returns numerator divided by all of the denominators.
*/
cljm_DOT_core_SLASH__SLASH_ = (function() {
var _SLASH_ = null;
var _SLASH___1 = ^id(id x) {
return _SLASH_(@1, x, nil);
};
var _SLASH___2 = ^id(id x, id y) {
return (x / y);
};
var _SLASH___3 = ^id(id cljm__varargs, id x, id y, ...) {
NSMutableArray *more = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[more addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_reduce(_SLASH_, _SLASH_(x, y, nil), more);
};
_SLASH_ = function(x, y, var_args){
var more = var_args;
switch(arguments.length){
case 1:
return _SLASH___1.call(this,x);
case 2:
return _SLASH___2.call(this,x, y);
default:
return _SLASH___3.cljm$lang$arity$variadic(x, y, cljm.core.array_seq(arguments, 2));
}
throw('Invalid arity: ' + arguments.length);
};
_SLASH_.cljm$lang$maxFixedArity = 2;
_SLASH_.cljm$lang$applyTo = _SLASH___3.cljm$lang$applyTo;
_SLASH_.cljm$lang$arity$1 = _SLASH___1;
_SLASH_.cljm$lang$arity$2 = _SLASH___2;
_SLASH_.cljm$lang$arity$variadic = _SLASH___3.cljm$lang$arity$variadic;
return _SLASH_;
})()
;
/**
* Returns non-nil if nums are in monotonically increasing order,
* otherwise false.
*/
cljm_DOT_core_SLASH__LT_ = (function() {
var _LT_ = null;
var _LT___1 = ^id(id x) {
return @YES;
};
var _LT___2 = ^id(id x, id y) {
return (x < y);
};
var _LT___3 = ^id(id cljm__varargs, id x, id y, ...) {
NSMutableArray *more = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[more addObject:cljm__currentObject];
}
va_end(cljm__args);
while(YES) {
if(cljm_truthy((x < y))) {
if(cljm_truthy(cljm_DOT_core_SLASH_next(more))) {
{
var G__4779 = y;
var G__4780 = cljm_DOT_core_SLASH_first(more);
var G__4781 = cljm_DOT_core_SLASH_next(more);
x = G__4779;
y = G__4780;
more = G__4781;
continue;
}

} else {
return (y < cljm_DOT_core_SLASH_first(more));

}

} else {
return @NO;

}
break;
}
};
_LT_ = function(x, y, var_args){
var more = var_args;
switch(arguments.length){
case 1:
return _LT___1.call(this,x);
case 2:
return _LT___2.call(this,x, y);
default:
return _LT___3.cljm$lang$arity$variadic(x, y, cljm.core.array_seq(arguments, 2));
}
throw('Invalid arity: ' + arguments.length);
};
_LT_.cljm$lang$maxFixedArity = 2;
_LT_.cljm$lang$applyTo = _LT___3.cljm$lang$applyTo;
_LT_.cljm$lang$arity$1 = _LT___1;
_LT_.cljm$lang$arity$2 = _LT___2;
_LT_.cljm$lang$arity$variadic = _LT___3.cljm$lang$arity$variadic;
return _LT_;
})()
;
/**
* Returns non-nil if nums are in monotonically non-decreasing order,
* otherwise false.
*/
cljm_DOT_core_SLASH__LT__EQ_ = (function() {
var _LT__EQ_ = null;
var _LT__EQ___1 = ^id(id x) {
return @YES;
};
var _LT__EQ___2 = ^id(id x, id y) {
return (x <= y);
};
var _LT__EQ___3 = ^id(id cljm__varargs, id x, id y, ...) {
NSMutableArray *more = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[more addObject:cljm__currentObject];
}
va_end(cljm__args);
while(YES) {
if(cljm_truthy((x <= y))) {
if(cljm_truthy(cljm_DOT_core_SLASH_next(more))) {
{
var G__4782 = y;
var G__4783 = cljm_DOT_core_SLASH_first(more);
var G__4784 = cljm_DOT_core_SLASH_next(more);
x = G__4782;
y = G__4783;
more = G__4784;
continue;
}

} else {
return (y <= cljm_DOT_core_SLASH_first(more));

}

} else {
return @NO;

}
break;
}
};
_LT__EQ_ = function(x, y, var_args){
var more = var_args;
switch(arguments.length){
case 1:
return _LT__EQ___1.call(this,x);
case 2:
return _LT__EQ___2.call(this,x, y);
default:
return _LT__EQ___3.cljm$lang$arity$variadic(x, y, cljm.core.array_seq(arguments, 2));
}
throw('Invalid arity: ' + arguments.length);
};
_LT__EQ_.cljm$lang$maxFixedArity = 2;
_LT__EQ_.cljm$lang$applyTo = _LT__EQ___3.cljm$lang$applyTo;
_LT__EQ_.cljm$lang$arity$1 = _LT__EQ___1;
_LT__EQ_.cljm$lang$arity$2 = _LT__EQ___2;
_LT__EQ_.cljm$lang$arity$variadic = _LT__EQ___3.cljm$lang$arity$variadic;
return _LT__EQ_;
})()
;
/**
* Returns non-nil if nums are in monotonically decreasing order,
* otherwise false.
*/
cljm_DOT_core_SLASH__GT_ = (function() {
var _GT_ = null;
var _GT___1 = ^id(id x) {
return @YES;
};
var _GT___2 = ^id(id x, id y) {
return (x > y);
};
var _GT___3 = ^id(id cljm__varargs, id x, id y, ...) {
NSMutableArray *more = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[more addObject:cljm__currentObject];
}
va_end(cljm__args);
while(YES) {
if(cljm_truthy((x > y))) {
if(cljm_truthy(cljm_DOT_core_SLASH_next(more))) {
{
var G__4785 = y;
var G__4786 = cljm_DOT_core_SLASH_first(more);
var G__4787 = cljm_DOT_core_SLASH_next(more);
x = G__4785;
y = G__4786;
more = G__4787;
continue;
}

} else {
return (y > cljm_DOT_core_SLASH_first(more));

}

} else {
return @NO;

}
break;
}
};
_GT_ = function(x, y, var_args){
var more = var_args;
switch(arguments.length){
case 1:
return _GT___1.call(this,x);
case 2:
return _GT___2.call(this,x, y);
default:
return _GT___3.cljm$lang$arity$variadic(x, y, cljm.core.array_seq(arguments, 2));
}
throw('Invalid arity: ' + arguments.length);
};
_GT_.cljm$lang$maxFixedArity = 2;
_GT_.cljm$lang$applyTo = _GT___3.cljm$lang$applyTo;
_GT_.cljm$lang$arity$1 = _GT___1;
_GT_.cljm$lang$arity$2 = _GT___2;
_GT_.cljm$lang$arity$variadic = _GT___3.cljm$lang$arity$variadic;
return _GT_;
})()
;
/**
* Returns non-nil if nums are in monotonically non-increasing order,
* otherwise false.
*/
cljm_DOT_core_SLASH__GT__EQ_ = (function() {
var _GT__EQ_ = null;
var _GT__EQ___1 = ^id(id x) {
return @YES;
};
var _GT__EQ___2 = ^id(id x, id y) {
return (x >= y);
};
var _GT__EQ___3 = ^id(id cljm__varargs, id x, id y, ...) {
NSMutableArray *more = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[more addObject:cljm__currentObject];
}
va_end(cljm__args);
while(YES) {
if(cljm_truthy((x >= y))) {
if(cljm_truthy(cljm_DOT_core_SLASH_next(more))) {
{
var G__4788 = y;
var G__4789 = cljm_DOT_core_SLASH_first(more);
var G__4790 = cljm_DOT_core_SLASH_next(more);
x = G__4788;
y = G__4789;
more = G__4790;
continue;
}

} else {
return (y >= cljm_DOT_core_SLASH_first(more));

}

} else {
return @NO;

}
break;
}
};
_GT__EQ_ = function(x, y, var_args){
var more = var_args;
switch(arguments.length){
case 1:
return _GT__EQ___1.call(this,x);
case 2:
return _GT__EQ___2.call(this,x, y);
default:
return _GT__EQ___3.cljm$lang$arity$variadic(x, y, cljm.core.array_seq(arguments, 2));
}
throw('Invalid arity: ' + arguments.length);
};
_GT__EQ_.cljm$lang$maxFixedArity = 2;
_GT__EQ_.cljm$lang$applyTo = _GT__EQ___3.cljm$lang$applyTo;
_GT__EQ_.cljm$lang$arity$1 = _GT__EQ___1;
_GT__EQ_.cljm$lang$arity$2 = _GT__EQ___2;
_GT__EQ_.cljm$lang$arity$variadic = _GT__EQ___3.cljm$lang$arity$variadic;
return _GT__EQ_;
})()
;
/**
* Returns a number one less than num.
*/
cljm_DOT_core_SLASH_dec = ^id(id x) {
return (x - @1);
};
/**
* Returns the greatest of the nums.
*/
cljm_DOT_core_SLASH_max = (function() {
var max = null;
var max__1 = ^id(id x) {
return x;
};
var max__2 = ^id(id x, id y) {
return ((x > y) ? x : y);
};
var max__3 = ^id(id cljm__varargs, id x, id y, ...) {
NSMutableArray *more = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[more addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_reduce(max, ((x > y) ? x : y), more);
};
max = function(x, y, var_args){
var more = var_args;
switch(arguments.length){
case 1:
return max__1.call(this,x);
case 2:
return max__2.call(this,x, y);
default:
return max__3.cljm$lang$arity$variadic(x, y, cljm.core.array_seq(arguments, 2));
}
throw('Invalid arity: ' + arguments.length);
};
max.cljm$lang$maxFixedArity = 2;
max.cljm$lang$applyTo = max__3.cljm$lang$applyTo;
max.cljm$lang$arity$1 = max__1;
max.cljm$lang$arity$2 = max__2;
max.cljm$lang$arity$variadic = max__3.cljm$lang$arity$variadic;
return max;
})()
;
/**
* Returns the least of the nums.
*/
cljm_DOT_core_SLASH_min = (function() {
var min = null;
var min__1 = ^id(id x) {
return x;
};
var min__2 = ^id(id x, id y) {
return ((x < y) ? x : y);
};
var min__3 = ^id(id cljm__varargs, id x, id y, ...) {
NSMutableArray *more = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[more addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_reduce(min, ((x < y) ? x : y), more);
};
min = function(x, y, var_args){
var more = var_args;
switch(arguments.length){
case 1:
return min__1.call(this,x);
case 2:
return min__2.call(this,x, y);
default:
return min__3.cljm$lang$arity$variadic(x, y, cljm.core.array_seq(arguments, 2));
}
throw('Invalid arity: ' + arguments.length);
};
min.cljm$lang$maxFixedArity = 2;
min.cljm$lang$applyTo = min__3.cljm$lang$applyTo;
min.cljm$lang$arity$1 = min__1;
min.cljm$lang$arity$2 = min__2;
min.cljm$lang$arity$variadic = min__3.cljm$lang$arity$variadic;
return min;
})()
;
cljm_DOT_core_SLASH_fix = ^id(id q) {
if(cljm_truthy((q >= @0))) {
return Math_SLASH_floor(q);

} else {
return Math_SLASH_ceil(q);

}
};
/**
* Coerce to int by stripping decimal places.
*/
cljm_DOT_core_SLASH_int = ^id(id x) {
return cljm_DOT_core_SLASH_fix(x);
};
/**
* Coerce to long by stripping decimal places. Identical to `int'.
*/
cljm_DOT_core_SLASH_long = ^id(id x) {
return cljm_DOT_core_SLASH_fix(x);
};
/**
* Modulus of num and div. Truncates toward negative infinity.
*/
cljm_DOT_core_SLASH_mod = ^id(id n, id d) {
return (n % d);
};
/**
* quot[ient] of dividing numerator by denominator.
*/
cljm_DOT_core_SLASH_quot = ^id(id n, id d) {
id rem__4792 = (n % d);
return cljm_DOT_core_SLASH_fix(((n - rem__4792) / d));
};
/**
* remainder of dividing numerator by denominator.
*/
cljm_DOT_core_SLASH_rem = ^id(id n, id d) {
id q__4794 = cljm_DOT_core_SLASH_quot(n, d);
return (n - (d * q__4794));
};
/**
* Returns a random floating point number between 0 (inclusive) and n (default 1) (exclusive).
*/
cljm_DOT_core_SLASH_rand = (function() {
var rand = null;
var rand__0 = ^id() {
return Math_SLASH_random();
};
var rand__1 = ^id(id n) {
return (n * rand());
};
rand = function(n){
switch(arguments.length){
case 0:
return rand__0.call(this);
case 1:
return rand__1.call(this,n);
}
throw('Invalid arity: ' + arguments.length);
};
rand.cljm$lang$arity$0 = rand__0;
rand.cljm$lang$arity$1 = rand__1;
return rand;
})()
;
/**
* Returns a random integer between 0 (inclusive) and n (exclusive).
*/
cljm_DOT_core_SLASH_rand_int = ^id(id n) {
return cljm_DOT_core_SLASH_fix(cljm_DOT_core_SLASH_rand(n));
};
/**
* Bitwise exclusive or
*/
cljm_DOT_core_SLASH_bit_xor = ^id(id x, id y) {
return (x ^ y);
};
/**
* Bitwise and
*/
cljm_DOT_core_SLASH_bit_and = ^id(id x, id y) {
return (x & y);
};
/**
* Bitwise or
*/
cljm_DOT_core_SLASH_bit_or = ^id(id x, id y) {
return (x | y);
};
/**
* Bitwise and
*/
cljm_DOT_core_SLASH_bit_and_not = ^id(id x, id y) {
return (x & ~y);
};
/**
* Clear bit at index n
*/
cljm_DOT_core_SLASH_bit_clear = ^id(id x, id n) {
return (x & ~(1 << n));
};
/**
* Flip bit at index n
*/
cljm_DOT_core_SLASH_bit_flip = ^id(id x, id n) {
return (x ^ (1 << n));
};
/**
* Bitwise complement
*/
cljm_DOT_core_SLASH_bit_not = ^id(id x) {
return (~ x);
};
/**
* Set bit at index n
*/
cljm_DOT_core_SLASH_bit_set = ^id(id x, id n) {
return (x | (1 << n));
};
/**
* Test bit at index n
*/
cljm_DOT_core_SLASH_bit_test = ^id(id x, id n) {
return ((x & (1 << n)) != 0);
};
/**
* Bitwise shift left
*/
cljm_DOT_core_SLASH_bit_shift_left = ^id(id x, id n) {
return (x << n);
};
/**
* Bitwise shift right
*/
cljm_DOT_core_SLASH_bit_shift_right = ^id(id x, id n) {
return (x >> n);
};
/**
* Bitwise shift right with zero fill
*/
cljm_DOT_core_SLASH_bit_shift_right_zero_fill = ^id(id x, id n) {
return (x >>> n);
};
/**
* Counts the number of bits set in n
*/
cljm_DOT_core_SLASH_bit_count = ^id(id v) {
id v__4797 = (v - ((v >> @1) & @1431655765));
id v__4798 = ((v__4797 & @858993459) + ((v__4797 >> @2) & @858993459));
return ((((v__4798 + (v__4798 >> @4)) & @252645135) * @16843009) >> @24);
};
/**
* Returns non-nil if nums all have the equivalent
* value, otherwise false. Behavior on non nums is
* undefined.
*/
cljm_DOT_core_SLASH__EQ__EQ_ = (function() {
var _EQ__EQ_ = null;
var _EQ__EQ___1 = ^id(id x) {
return @YES;
};
var _EQ__EQ___2 = ^id(id x, id y) {
return cljm_DOT_core_SLASH__equiv(x, y);
};
var _EQ__EQ___3 = ^id(id cljm__varargs, id x, id y, ...) {
NSMutableArray *more = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[more addObject:cljm__currentObject];
}
va_end(cljm__args);
while(YES) {
if(cljm_truthy(_EQ__EQ_(x, y, nil))) {
if(cljm_truthy(cljm_DOT_core_SLASH_next(more))) {
{
var G__4799 = y;
var G__4800 = cljm_DOT_core_SLASH_first(more);
var G__4801 = cljm_DOT_core_SLASH_next(more);
x = G__4799;
y = G__4800;
more = G__4801;
continue;
}

} else {
return _EQ__EQ_(y, cljm_DOT_core_SLASH_first(more), nil);

}

} else {
return @NO;

}
break;
}
};
_EQ__EQ_ = function(x, y, var_args){
var more = var_args;
switch(arguments.length){
case 1:
return _EQ__EQ___1.call(this,x);
case 2:
return _EQ__EQ___2.call(this,x, y);
default:
return _EQ__EQ___3.cljm$lang$arity$variadic(x, y, cljm.core.array_seq(arguments, 2));
}
throw('Invalid arity: ' + arguments.length);
};
_EQ__EQ_.cljm$lang$maxFixedArity = 2;
_EQ__EQ_.cljm$lang$applyTo = _EQ__EQ___3.cljm$lang$applyTo;
_EQ__EQ_.cljm$lang$arity$1 = _EQ__EQ___1;
_EQ__EQ_.cljm$lang$arity$2 = _EQ__EQ___2;
_EQ__EQ_.cljm$lang$arity$variadic = _EQ__EQ___3.cljm$lang$arity$variadic;
return _EQ__EQ_;
})()
;
/**
* Returns true if num is greater than zero, else false
*/
cljm_DOT_core_SLASH_pos_QMARK_ = ^id(id n) {
return (n > @0);
};
cljm_DOT_core_SLASH_zero_QMARK_ = ^id(id n) {
return ([n isEqual:@0]);
};
/**
* Returns true if num is less than zero, else false
*/
cljm_DOT_core_SLASH_neg_QMARK_ = ^id(id x) {
return (x < @0);
};
/**
* Returns the nth next of coll, (seq coll) when n is 0.
*/
cljm_DOT_core_SLASH_nthnext = ^id(id coll, id n) {
id n__4805 = n;
id xs__4806 = cljm_DOT_core_SLASH_seq(coll);
while(YES) {
if(cljm_truthy({id and__3822__auto____4807 = xs__4806;
if(cljm_truthy(and__3822__auto____4807)) {
return (n__4805 > @0);

} else {
return and__3822__auto____4807;

}
})) {
{
var G__4808 = (n__4805 - @1);
var G__4809 = cljm_DOT_core_SLASH_next(xs__4806);
n__4805 = G__4808;
xs__4806 = G__4809;
continue;
}

} else {
return xs__4806;

}
break;
}
};
/**
* Internal - do not use!
*/
cljm_DOT_core_SLASH_str_STAR_ = (function() {
var str_STAR_ = null;
var str_STAR___0 = ^id() {
return @"";
};
var str_STAR___1 = ^id(id x) {
if(cljm_truthy((x == nil))) {
return @"";

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return [@"description" x];

} else {
return nil;

}

}
};
var str_STAR___2 = ^id(id cljm__varargs, id x, ...) {
NSMutableArray *ys = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[ys addObject:cljm__currentObject];
}
va_end(cljm__args);
return ([gstring_SLASH_StringBuffer alloc], ys);
};
str_STAR_ = function(x, var_args){
var ys = var_args;
switch(arguments.length){
case 0:
return str_STAR___0.call(this);
case 1:
return str_STAR___1.call(this,x);
default:
return str_STAR___2.cljm$lang$arity$variadic(x, cljm.core.array_seq(arguments, 1));
}
throw('Invalid arity: ' + arguments.length);
};
str_STAR_.cljm$lang$maxFixedArity = 1;
str_STAR_.cljm$lang$applyTo = str_STAR___2.cljm$lang$applyTo;
str_STAR_.cljm$lang$arity$0 = str_STAR___0;
str_STAR_.cljm$lang$arity$1 = str_STAR___1;
str_STAR_.cljm$lang$arity$variadic = str_STAR___2.cljm$lang$arity$variadic;
return str_STAR_;
})()
;
/**
* With no args, returns the empty string. With one arg x, returns
* x.toString().  (str nil) returns the empty string. With more than
* one arg, returns the concatenation of the str values of the args.
*/
cljm_DOT_core_SLASH_str = (function() {
var str = null;
var str__0 = ^id() {
return @"";
};
var str__1 = ^id(id x) {
if(cljm_truthy(cljm_DOT_core_SLASH_symbol_QMARK_(x))) {
return [x substring@2, x.length, nil];

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_keyword_QMARK_(x))) {
return cljm_DOT_core_SLASH_str_STAR_(@":", [x substring@2, x.length, nil], nil);

} else {
if(cljm_truthy((x == nil))) {
return @"";

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return [@"description" x];

} else {
return nil;

}

}

}

}
};
var str__2 = ^id(id cljm__varargs, id x, ...) {
NSMutableArray *ys = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[ys addObject:cljm__currentObject];
}
va_end(cljm__args);
return ([gstring_SLASH_StringBuffer alloc], ys);
};
str = function(x, var_args){
var ys = var_args;
switch(arguments.length){
case 0:
return str__0.call(this);
case 1:
return str__1.call(this,x);
default:
return str__2.cljm$lang$arity$variadic(x, cljm.core.array_seq(arguments, 1));
}
throw('Invalid arity: ' + arguments.length);
};
str.cljm$lang$maxFixedArity = 1;
str.cljm$lang$applyTo = str__2.cljm$lang$applyTo;
str.cljm$lang$arity$0 = str__0;
str.cljm$lang$arity$1 = str__1;
str.cljm$lang$arity$variadic = str__2.cljm$lang$arity$variadic;
return str;
})()
;
/**
* Returns the substring of s beginning at start inclusive, and ending
* at end (defaults to length of string), exclusive.
*/
cljm_DOT_core_SLASH_subs = (function() {
var subs = null;
var subs__2 = ^id(id s, id start) {
return [s substringstart];
};
var subs__3 = ^id(id s, id start, id end) {
return [s substringstart, end, nil];
};
subs = function(s, start, end){
switch(arguments.length){
case 2:
return subs__2.call(this,s, start);
case 3:
return subs__3.call(this,s, start, end);
}
throw('Invalid arity: ' + arguments.length);
};
subs.cljm$lang$arity$2 = subs__2;
subs.cljm$lang$arity$3 = subs__3;
return subs;
})()
;
/**
* Formats a string using goog.string.format.
*/
cljm_DOT_core_SLASH_format = ^id(id cljm__varargs, id fmt, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_apply(gstring_SLASH_format, fmt, args, nil);
};
/**
* Returns a Symbol with the given namespace and name.
*/
cljm_DOT_core_SLASH_symbol = (function() {
var symbol = null;
var symbol__1 = ^id(id name) {
if(cljm_truthy(cljm_DOT_core_SLASH_symbol_QMARK_(name))) {
name;

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_keyword_QMARK_(name))) {
cljm_DOT_core_SLASH_str_STAR_(@"\uFDD1", @"'", cljm_DOT_core_SLASH_subs(name, @2), nil);

} else {

}

}
return cljm_DOT_core_SLASH_str_STAR_(@"\uFDD1", @"'", name, nil);
};
var symbol__2 = ^id(id ns, id name) {
return symbol(cljm_DOT_core_SLASH_str_STAR_(ns, @"/", name, nil));
};
symbol = function(ns, name){
switch(arguments.length){
case 1:
return symbol__1.call(this,ns);
case 2:
return symbol__2.call(this,ns, name);
}
throw('Invalid arity: ' + arguments.length);
};
symbol.cljm$lang$arity$1 = symbol__1;
symbol.cljm$lang$arity$2 = symbol__2;
return symbol;
})()
;
/**
* Returns a Keyword with the given namespace and name.  Do not use :
* in the keyword strings, it will be added automatically.
*/
cljm_DOT_core_SLASH_keyword = (function() {
var keyword = null;
var keyword__1 = ^id(id name) {
if(cljm_truthy(cljm_DOT_core_SLASH_keyword_QMARK_(name))) {
return name;

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_symbol_QMARK_(name))) {
return cljm_DOT_core_SLASH_str_STAR_(@"\uFDD0", @"'", cljm_DOT_core_SLASH_subs(name, @2), nil);

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return cljm_DOT_core_SLASH_str_STAR_(@"\uFDD0", @"'", name, nil);

} else {
return nil;

}

}

}
};
var keyword__2 = ^id(id ns, id name) {
return keyword(cljm_DOT_core_SLASH_str_STAR_(ns, @"/", name, nil));
};
keyword = function(ns, name){
switch(arguments.length){
case 1:
return keyword__1.call(this,ns);
case 2:
return keyword__2.call(this,ns, name);
}
throw('Invalid arity: ' + arguments.length);
};
keyword.cljm$lang$arity$1 = keyword__1;
keyword.cljm$lang$arity$2 = keyword__2;
return keyword;
})()
;
/**
* Assumes x is sequential. Returns true if x equals y, otherwise
* returns false.
*/
cljm_DOT_core_SLASH_equiv_sequential = ^id(id x, id y) {
return cljm_DOT_core_SLASH_boolean((cljm_truthy(cljm_DOT_core_SLASH_sequential_QMARK_(y))) ?{id xs__4812 = cljm_DOT_core_SLASH_seq(x);
id ys__4813 = cljm_DOT_core_SLASH_seq(y);
while(YES) {
if(cljm_truthy((xs__4812 == nil))) {
return (ys__4813 == nil);

} else {
if(cljm_truthy((ys__4813 == nil))) {
return @NO;

} else {
if(cljm_truthy(cljm_DOT_core_SLASH__EQ_(cljm_DOT_core_SLASH_first(xs__4812), cljm_DOT_core_SLASH_first(ys__4813), nil))) {
{
var G__4814 = cljm_DOT_core_SLASH_next(xs__4812);
var G__4815 = cljm_DOT_core_SLASH_next(ys__4813);
xs__4812 = G__4814;
ys__4813 = G__4815;
continue;
}

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return @NO;

} else {
return nil;

}

}

}

}
break;
}
}:nil);
};
cljm_DOT_core_SLASH_hash_combine = ^id(id seed, id hash) {
return (seed ^ (((hash + @2654435769) + (seed << @6)) + (seed >> @2)));
};
cljm_DOT_core_SLASH_hash_coll = ^id(id coll) {
return cljm_DOT_core_SLASH_reduce(^id(id p1__4816_SHARP_, id p2__4817_SHARP_) {
return cljm_DOT_core_SLASH_hash_combine(p1__4816_SHARP_, cljm_DOT_core_SLASH_hash(p2__4817_SHARP_, @NO));
}, cljm_DOT_core_SLASH_hash(cljm_DOT_core_SLASH_first(coll), @NO), cljm_DOT_core_SLASH_next(coll));
};
cljm_DOT_core_SLASH_hash_imap = ^id(id m) {
id h__4821 = @0;
id s__4822 = cljm_DOT_core_SLASH_seq(m);
while(YES) {
if(cljm_truthy(s__4822)) {
id e__4823 = cljm_DOT_core_SLASH_first(s__4822);
{
var G__4824 = ((h__4821 + (cljm_DOT_core_SLASH_hash(cljm_DOT_core_SLASH_key(e__4823)) ^ cljm_DOT_core_SLASH_hash(cljm_DOT_core_SLASH_val(e__4823)))) % @4503599627370496);
var G__4825 = cljm_DOT_core_SLASH_next(s__4822);
h__4821 = G__4824;
s__4822 = G__4825;
continue;
}

} else {
return h__4821;

}
break;
}
};
cljm_DOT_core_SLASH_hash_iset = ^id(id s) {
id h__4829 = @0;
id s__4830 = cljm_DOT_core_SLASH_seq(s);
while(YES) {
if(cljm_truthy(s__4830)) {
id e__4831 = cljm_DOT_core_SLASH_first(s__4830);
{
var G__4832 = ((h__4829 + cljm_DOT_core_SLASH_hash(e__4831)) % @4503599627370496);
var G__4833 = cljm_DOT_core_SLASH_next(s__4830);
h__4829 = G__4832;
s__4830 = G__4833;
continue;
}

} else {
return h__4829;

}
break;
}
};
/**
* Takes a JavaScript object and a map of names to functions and
* attaches said functions as methods on the object.  Any references to
* JavaScript's implict this (via the this-as macro) will resolve to the
* object that the function is attached.
*/
cljm_DOT_core_SLASH_extend_object_BANG_ = ^id(id obj, id fn_map) {
id G__4854__4855 = cljm_DOT_core_SLASH_seq(fn_map);
if(cljm_truthy(G__4854__4855)) {
id G__4857__4859 = cljm_DOT_core_SLASH_first(G__4854__4855);
id vec__4858__4860 = G__4857__4859;
id key_name__4861 = cljm_DOT_core_SLASH_nth(vec__4858__4860, @0, nil);
id f__4862 = cljm_DOT_core_SLASH_nth(vec__4858__4860, @1, nil);
id G__4854__4863 = G__4854__4855;
id G__4857__4864 = G__4857__4859;
id G__4854__4865 = G__4854__4863;
while(YES) {
id vec__4866__4867 = G__4857__4864;
id key_name__4868 = cljm_DOT_core_SLASH_nth(vec__4866__4867, @0, nil);
id f__4869 = cljm_DOT_core_SLASH_nth(vec__4866__4867, @1, nil);
id G__4854__4870 = G__4854__4865;
id str_name__4871 = cljm_DOT_core_SLASH_name(key_name__4868);
(obj[str_name__4871] = f__4869);
id temp__3974__auto____4872 = cljm_DOT_core_SLASH_next(G__4854__4870);
if(cljm_truthy(temp__3974__auto____4872)) {
id G__4854__4873 = temp__3974__auto____4872;
{
var G__4874 = cljm_DOT_core_SLASH_first(G__4854__4873);
var G__4875 = G__4854__4873;
G__4857__4864 = G__4874;
G__4854__4865 = G__4875;
continue;
}

} else {

}
break;
}

} else {

}
return obj;
};
cljm_DOT_core_DOT_List_SLASH_EMPTY = [cljm_DOT_core_SLASH_EmptyList alloc];
cljm_DOT_core_SLASH_reversible_QMARK_ = ^id(id coll) {
id G__4879__4880 = coll;
if(cljm_truthy(G__4879__4880)) {
if(cljm_truthy({id or__3824__auto____4881 = (G__4879__4880.cljm$lang$protocol_mask$partition0$ & @134217728);
if(cljm_truthy(or__3824__auto____4881)) {
return or__3824__auto____4881;

} else {
return G__4879__4880.cljm$core$IReversible$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4879__4880.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IReversible, G__4879__4880);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IReversible, G__4879__4880);

}
};
cljm_DOT_core_SLASH_rseq = ^id(id coll) {
return cljm_DOT_core_SLASH__rseq(coll);
};
/**
* Returns a seq of the items in coll in reverse order. Not lazy.
*/
cljm_DOT_core_SLASH_reverse = ^id(id coll) {
if(cljm_truthy(cljm_DOT_core_SLASH_reversible_QMARK_(coll))) {
return cljm_DOT_core_SLASH_rseq(coll);

} else {
return cljm_DOT_core_SLASH_reduce(cljm_DOT_core_SLASH_conj, cljm.core.List.EMPTY, coll);

}
};
cljm_DOT_core_SLASH_list = (function() {
var list = null;
var list__0 = ^id() {
return cljm.core.List.EMPTY;
};
var list__1 = ^id(id x) {
return cljm_DOT_core_SLASH_conj(cljm.core.List.EMPTY, x, nil);
};
var list__2 = ^id(id x, id y) {
return cljm_DOT_core_SLASH_conj(list(y, nil), x, nil);
};
var list__3 = ^id(id x, id y, id z) {
return cljm_DOT_core_SLASH_conj(list(y, z, nil), x, nil);
};
var list__4 = ^id(id cljm__varargs, id x, id y, id z, ...) {
NSMutableArray *items = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[items addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_conj(cljm_DOT_core_SLASH_conj(cljm_DOT_core_SLASH_conj(cljm_DOT_core_SLASH_reduce(cljm_DOT_core_SLASH_conj, cljm.core.List.EMPTY, cljm_DOT_core_SLASH_reverse(items)), z, nil), y, nil), x, nil);
};
list = function(x, y, z, var_args){
var items = var_args;
switch(arguments.length){
case 0:
return list__0.call(this);
case 1:
return list__1.call(this,x);
case 2:
return list__2.call(this,x, y);
case 3:
return list__3.call(this,x, y, z);
default:
return list__4.cljm$lang$arity$variadic(x, y, z, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
list.cljm$lang$maxFixedArity = 3;
list.cljm$lang$applyTo = list__4.cljm$lang$applyTo;
list.cljm$lang$arity$0 = list__0;
list.cljm$lang$arity$1 = list__1;
list.cljm$lang$arity$2 = list__2;
list.cljm$lang$arity$3 = list__3;
list.cljm$lang$arity$variadic = list__4.cljm$lang$arity$variadic;
return list;
})()
;
/**
* Returns a new seq where x is the first element and seq is the rest.
*/
cljm_DOT_core_SLASH_cons = ^id(id x, id coll) {
if(cljm_truthy({id or__3824__auto____4886 = (coll == nil);
if(cljm_truthy(or__3824__auto____4886)) {
return or__3824__auto____4886;

} else {
id G__4887__4888 = coll;
if(cljm_truthy(G__4887__4888)) {
if(cljm_truthy({id or__3824__auto____4889 = (G__4887__4888.cljm$lang$protocol_mask$partition0$ & @64);
if(cljm_truthy(or__3824__auto____4889)) {
return or__3824__auto____4889;

} else {
return G__4887__4888.cljm$core$ISeq$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4887__4888.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_ISeq, G__4887__4888);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_ISeq, G__4887__4888);

}

}
})) {
return [cljm_DOT_core_SLASH_Cons alloc];

} else {
return [cljm_DOT_core_SLASH_Cons alloc];

}
};
cljm_DOT_core_SLASH_list_QMARK_ = ^id(id x) {
id G__4893__4894 = x;
if(cljm_truthy(G__4893__4894)) {
if(cljm_truthy({id or__3824__auto____4895 = (G__4893__4894.cljm$lang$protocol_mask$partition0$ & @33554432);
if(cljm_truthy(or__3824__auto____4895)) {
return or__3824__auto____4895;

} else {
return G__4893__4894.cljm$core$IList$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4893__4894.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IList, G__4893__4894);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IList, G__4893__4894);

}
};
cljm_DOT_core_SLASH_chunk_cons = ^id(id chunk, id rest) {
if(cljm_truthy(([cljm_DOT_core_SLASH__count(chunk) isEqual:@0]))) {
return rest;

} else {
return [cljm_DOT_core_SLASH_ChunkedCons alloc];

}
};
cljm_DOT_core_SLASH_chunk_append = ^id(id b, id x) {
return [b addx];
};
cljm_DOT_core_SLASH_chunk = ^id(id b) {
return [b chunk];
};
cljm_DOT_core_SLASH_chunk_first = ^id(id s) {
return cljm_DOT_core_SLASH__chunked_first(s);
};
cljm_DOT_core_SLASH_chunk_rest = ^id(id s) {
return cljm_DOT_core_SLASH__chunked_rest(s);
};
cljm_DOT_core_SLASH_chunk_next = ^id(id s) {
if(cljm_truthy({id G__4899__4900 = s;
if(cljm_truthy(G__4899__4900)) {
if(cljm_truthy({id or__3824__auto____4901 = nil;
if(cljm_truthy(or__3824__auto____4901)) {
return or__3824__auto____4901;

} else {
return G__4899__4900.cljm$core$IChunkedNext$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4899__4900.cljm$lang$protocol_mask$partition$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IChunkedNext, G__4899__4900);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IChunkedNext, G__4899__4900);

}
})) {
return cljm_DOT_core_SLASH__chunked_next(s);

} else {
return cljm_DOT_core_SLASH_seq(cljm_DOT_core_SLASH__chunked_rest(s));

}
};
/**
* Naive impl of to-array as a start.
*/
cljm_DOT_core_SLASH_to_array = ^id(id s) {
id ary__4904 = @[];
id s__4905 = s;
while(YES) {
if(cljm_truthy(cljm_DOT_core_SLASH_seq(s__4905))) {
[ary__4904 pushcljm_DOT_core_SLASH_first(s__4905)];
{
var G__4906 = cljm_DOT_core_SLASH_next(s__4905);
s__4905 = G__4906;
continue;
}

} else {
return ary__4904;

}
break;
}
};
/**
* Returns a (potentially-ragged) 2-dimensional array
* containing the contents of coll.
*/
cljm_DOT_core_SLASH_to_array_2d = ^id(id coll) {
id ret__4910 = cljm_DOT_core_SLASH_make_array(cljm_DOT_core_SLASH_count(coll));
id i__4911 = @0;
id xs__4912 = cljm_DOT_core_SLASH_seq(coll);
while(YES) {
if(cljm_truthy(xs__4912)) {
(ret__4910[i__4911] = cljm_DOT_core_SLASH_to_array(cljm_DOT_core_SLASH_first(xs__4912)));
{
var G__4913 = (i__4911 + @1);
var G__4914 = cljm_DOT_core_SLASH_next(xs__4912);
i__4911 = G__4913;
xs__4912 = G__4914;
continue;
}

} else {

}
break;
}
return ret__4910;
};
cljm_DOT_core_SLASH_long_array = (function() {
var long_array = null;
var long_array__1 = ^id(id size_or_seq) {
if(cljm_truthy(cljm_DOT_core_SLASH_number_QMARK_(size_or_seq))) {
return long_array(size_or_seq, nil);

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_seq_QMARK_(size_or_seq))) {
return cljm_DOT_core_SLASH_into_array(size_or_seq);

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
throw [Error alloc];

} else {
return nil;

}

}

}
};
var long_array__2 = ^id(id size, id init_val_or_seq) {
id a__4922 = cljm_DOT_core_SLASH_make_array(size);
if(cljm_truthy(cljm_DOT_core_SLASH_seq_QMARK_(init_val_or_seq))) {
id s__4923 = cljm_DOT_core_SLASH_seq(init_val_or_seq);
id i__4924 = @0;
id s__4925 = s__4923;
while(YES) {
if(cljm_truthy({id and__3822__auto____4926 = s__4925;
if(cljm_truthy(and__3822__auto____4926)) {
return (i__4924 < size);

} else {
return and__3822__auto____4926;

}
})) {
(a__4922[i__4924] = cljm_DOT_core_SLASH_first(s__4925));
{
var G__4929 = (i__4924 + @1);
var G__4930 = cljm_DOT_core_SLASH_next(s__4925);
i__4924 = G__4929;
s__4925 = G__4930;
continue;
}

} else {
return a__4922;

}
break;
}

} else {
id n__1649__auto____4927 = size;
id i__4928 = @0;
while(YES) {
if(cljm_truthy((i__4928 < n__1649__auto____4927))) {
(a__4922[i__4928] = init_val_or_seq);
{
var G__4931 = (i__4928 + @1);
i__4928 = G__4931;
continue;
}

} else {

}
break;
}
return a__4922;

}
};
long_array = function(size, init_val_or_seq){
switch(arguments.length){
case 1:
return long_array__1.call(this,size);
case 2:
return long_array__2.call(this,size, init_val_or_seq);
}
throw('Invalid arity: ' + arguments.length);
};
long_array.cljm$lang$arity$1 = long_array__1;
long_array.cljm$lang$arity$2 = long_array__2;
return long_array;
})()
;
cljm_DOT_core_SLASH_double_array = (function() {
var double_array = null;
var double_array__1 = ^id(id size_or_seq) {
if(cljm_truthy(cljm_DOT_core_SLASH_number_QMARK_(size_or_seq))) {
return double_array(size_or_seq, nil);

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_seq_QMARK_(size_or_seq))) {
return cljm_DOT_core_SLASH_into_array(size_or_seq);

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
throw [Error alloc];

} else {
return nil;

}

}

}
};
var double_array__2 = ^id(id size, id init_val_or_seq) {
id a__4939 = cljm_DOT_core_SLASH_make_array(size);
if(cljm_truthy(cljm_DOT_core_SLASH_seq_QMARK_(init_val_or_seq))) {
id s__4940 = cljm_DOT_core_SLASH_seq(init_val_or_seq);
id i__4941 = @0;
id s__4942 = s__4940;
while(YES) {
if(cljm_truthy({id and__3822__auto____4943 = s__4942;
if(cljm_truthy(and__3822__auto____4943)) {
return (i__4941 < size);

} else {
return and__3822__auto____4943;

}
})) {
(a__4939[i__4941] = cljm_DOT_core_SLASH_first(s__4942));
{
var G__4946 = (i__4941 + @1);
var G__4947 = cljm_DOT_core_SLASH_next(s__4942);
i__4941 = G__4946;
s__4942 = G__4947;
continue;
}

} else {
return a__4939;

}
break;
}

} else {
id n__1649__auto____4944 = size;
id i__4945 = @0;
while(YES) {
if(cljm_truthy((i__4945 < n__1649__auto____4944))) {
(a__4939[i__4945] = init_val_or_seq);
{
var G__4948 = (i__4945 + @1);
i__4945 = G__4948;
continue;
}

} else {

}
break;
}
return a__4939;

}
};
double_array = function(size, init_val_or_seq){
switch(arguments.length){
case 1:
return double_array__1.call(this,size);
case 2:
return double_array__2.call(this,size, init_val_or_seq);
}
throw('Invalid arity: ' + arguments.length);
};
double_array.cljm$lang$arity$1 = double_array__1;
double_array.cljm$lang$arity$2 = double_array__2;
return double_array;
})()
;
cljm_DOT_core_SLASH_object_array = (function() {
var object_array = null;
var object_array__1 = ^id(id size_or_seq) {
if(cljm_truthy(cljm_DOT_core_SLASH_number_QMARK_(size_or_seq))) {
return object_array(size_or_seq, nil);

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_seq_QMARK_(size_or_seq))) {
return cljm_DOT_core_SLASH_into_array(size_or_seq);

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
throw [Error alloc];

} else {
return nil;

}

}

}
};
var object_array__2 = ^id(id size, id init_val_or_seq) {
id a__4956 = cljm_DOT_core_SLASH_make_array(size);
if(cljm_truthy(cljm_DOT_core_SLASH_seq_QMARK_(init_val_or_seq))) {
id s__4957 = cljm_DOT_core_SLASH_seq(init_val_or_seq);
id i__4958 = @0;
id s__4959 = s__4957;
while(YES) {
if(cljm_truthy({id and__3822__auto____4960 = s__4959;
if(cljm_truthy(and__3822__auto____4960)) {
return (i__4958 < size);

} else {
return and__3822__auto____4960;

}
})) {
(a__4956[i__4958] = cljm_DOT_core_SLASH_first(s__4959));
{
var G__4963 = (i__4958 + @1);
var G__4964 = cljm_DOT_core_SLASH_next(s__4959);
i__4958 = G__4963;
s__4959 = G__4964;
continue;
}

} else {
return a__4956;

}
break;
}

} else {
id n__1649__auto____4961 = size;
id i__4962 = @0;
while(YES) {
if(cljm_truthy((i__4962 < n__1649__auto____4961))) {
(a__4956[i__4962] = init_val_or_seq);
{
var G__4965 = (i__4962 + @1);
i__4962 = G__4965;
continue;
}

} else {

}
break;
}
return a__4956;

}
};
object_array = function(size, init_val_or_seq){
switch(arguments.length){
case 1:
return object_array__1.call(this,size);
case 2:
return object_array__2.call(this,size, init_val_or_seq);
}
throw('Invalid arity: ' + arguments.length);
};
object_array.cljm$lang$arity$1 = object_array__1;
object_array.cljm$lang$arity$2 = object_array__2;
return object_array;
})()
;
cljm_DOT_core_SLASH_bounded_count = ^id(id s, id n) {
if(cljm_truthy(cljm_DOT_core_SLASH_counted_QMARK_(s))) {
return cljm_DOT_core_SLASH_count(s);

} else {
id s__4970 = s;
id i__4971 = n;
id sum__4972 = @0;
while(YES) {
if(cljm_truthy({id and__3822__auto____4973 = (i__4971 > @0);
if(cljm_truthy(and__3822__auto____4973)) {
return cljm_DOT_core_SLASH_seq(s__4970);

} else {
return and__3822__auto____4973;

}
})) {
{
var G__4974 = cljm_DOT_core_SLASH_next(s__4970);
var G__4975 = (i__4971 - @1);
var G__4976 = (sum__4972 + @1);
s__4970 = G__4974;
i__4971 = G__4975;
sum__4972 = G__4976;
continue;
}

} else {
return sum__4972;

}
break;
}

}
};
cljm_DOT_core_SLASH_spread = ^id(id arglist) {
if(cljm_truthy((arglist == nil))) {
return nil;

} else {
if(cljm_truthy((cljm_DOT_core_SLASH_next(arglist) == nil))) {
return cljm_DOT_core_SLASH_seq(cljm_DOT_core_SLASH_first(arglist));

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return cljm_DOT_core_SLASH_cons(cljm_DOT_core_SLASH_first(arglist), spread(cljm_DOT_core_SLASH_next(arglist)));

} else {
return nil;

}

}

}
};
/**
* Returns a lazy seq representing the concatenation of the elements in the supplied colls.
*/
cljm_DOT_core_SLASH_concat = (function() {
var concat = null;
var concat__0 = ^id() {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
var concat__1 = ^id(id x) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
var concat__2 = ^id(id x, id y) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
var concat__3 = ^id(id cljm__varargs, id x, id y, ...) {
NSMutableArray *zs = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[zs addObject:cljm__currentObject];
}
va_end(cljm__args);
id cat__4984 = ^id(id xys, id zs) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
return cat__4984(concat(x, y, nil), zs);
};
concat = function(x, y, var_args){
var zs = var_args;
switch(arguments.length){
case 0:
return concat__0.call(this);
case 1:
return concat__1.call(this,x);
case 2:
return concat__2.call(this,x, y);
default:
return concat__3.cljm$lang$arity$variadic(x, y, cljm.core.array_seq(arguments, 2));
}
throw('Invalid arity: ' + arguments.length);
};
concat.cljm$lang$maxFixedArity = 2;
concat.cljm$lang$applyTo = concat__3.cljm$lang$applyTo;
concat.cljm$lang$arity$0 = concat__0;
concat.cljm$lang$arity$1 = concat__1;
concat.cljm$lang$arity$2 = concat__2;
concat.cljm$lang$arity$variadic = concat__3.cljm$lang$arity$variadic;
return concat;
})()
;
/**
* Creates a new list containing the items prepended to the rest, the
* last of which will be treated as a sequence.
*/
cljm_DOT_core_SLASH_list_STAR_ = (function() {
var list_STAR_ = null;
var list_STAR___1 = ^id(id args) {
return cljm_DOT_core_SLASH_seq(args);
};
var list_STAR___2 = ^id(id a, id args) {
return cljm_DOT_core_SLASH_cons(a, args);
};
var list_STAR___3 = ^id(id a, id b, id args) {
return cljm_DOT_core_SLASH_cons(a, cljm_DOT_core_SLASH_cons(b, args));
};
var list_STAR___4 = ^id(id a, id b, id c, id args) {
return cljm_DOT_core_SLASH_cons(a, cljm_DOT_core_SLASH_cons(b, cljm_DOT_core_SLASH_cons(c, args)));
};
var list_STAR___5 = ^id(id cljm__varargs, id a, id b, id c, id d, ...) {
NSMutableArray *more = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[more addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_cons(a, cljm_DOT_core_SLASH_cons(b, cljm_DOT_core_SLASH_cons(c, cljm_DOT_core_SLASH_cons(d, cljm_DOT_core_SLASH_spread(more)))));
};
list_STAR_ = function(a, b, c, d, var_args){
var more = var_args;
switch(arguments.length){
case 1:
return list_STAR___1.call(this,a);
case 2:
return list_STAR___2.call(this,a, b);
case 3:
return list_STAR___3.call(this,a, b, c);
case 4:
return list_STAR___4.call(this,a, b, c, d);
default:
return list_STAR___5.cljm$lang$arity$variadic(a, b, c, d, cljm.core.array_seq(arguments, 4));
}
throw('Invalid arity: ' + arguments.length);
};
list_STAR_.cljm$lang$maxFixedArity = 4;
list_STAR_.cljm$lang$applyTo = list_STAR___5.cljm$lang$applyTo;
list_STAR_.cljm$lang$arity$1 = list_STAR___1;
list_STAR_.cljm$lang$arity$2 = list_STAR___2;
list_STAR_.cljm$lang$arity$3 = list_STAR___3;
list_STAR_.cljm$lang$arity$4 = list_STAR___4;
list_STAR_.cljm$lang$arity$variadic = list_STAR___5.cljm$lang$arity$variadic;
return list_STAR_;
})()
;
cljm_DOT_core_SLASH_transient = ^id(id coll) {
return cljm_DOT_core_SLASH__as_transient(coll);
};
cljm_DOT_core_SLASH_persistent_BANG_ = ^id(id tcoll) {
return cljm_DOT_core_SLASH__persistent_BANG_(tcoll);
};
cljm_DOT_core_SLASH_conj_BANG_ = ^id(id tcoll, id val) {
return cljm_DOT_core_SLASH__conj_BANG_(tcoll, val);
};
cljm_DOT_core_SLASH_assoc_BANG_ = ^id(id tcoll, id key, id val) {
return cljm_DOT_core_SLASH__assoc_BANG_(tcoll, key, val);
};
cljm_DOT_core_SLASH_dissoc_BANG_ = ^id(id tcoll, id key) {
return cljm_DOT_core_SLASH__dissoc_BANG_(tcoll, key);
};
cljm_DOT_core_SLASH_pop_BANG_ = ^id(id tcoll) {
return cljm_DOT_core_SLASH__pop_BANG_(tcoll);
};
cljm_DOT_core_SLASH_disj_BANG_ = ^id(id tcoll, id val) {
return cljm_DOT_core_SLASH__disjoin_BANG_(tcoll, val);
};
cljm_DOT_core_SLASH_apply_to = ^id(id f, id argc, id args) {
id args__5026 = cljm_DOT_core_SLASH_seq(args);
if(cljm_truthy(([argc isEqual:@0]))) {
return f();

} else {
id a__5027 = cljm_DOT_core_SLASH__first(args__5026);
id args__5028 = cljm_DOT_core_SLASH__rest(args__5026);
if(cljm_truthy(([argc isEqual:@1]))) {
if(cljm_truthy(f.cljm$lang$arity$1)) {
return [f cljma__5027 lang];

} else {
return f(a__5027);

}

} else {
id b__5029 = cljm_DOT_core_SLASH__first(args__5028);
id args__5030 = cljm_DOT_core_SLASH__rest(args__5028);
if(cljm_truthy(([argc isEqual:@2]))) {
if(cljm_truthy(f.cljm$lang$arity$2)) {
return [f cljma__5027 langb__5029 arity];

} else {
return f(a__5027, b__5029);

}

} else {
id c__5031 = cljm_DOT_core_SLASH__first(args__5030);
id args__5032 = cljm_DOT_core_SLASH__rest(args__5030);
if(cljm_truthy(([argc isEqual:@3]))) {
if(cljm_truthy(f.cljm$lang$arity$3)) {
return [f cljma__5027 langb__5029 arityc__5031 3];

} else {
return f(a__5027, b__5029, c__5031);

}

} else {
id d__5033 = cljm_DOT_core_SLASH__first(args__5032);
id args__5034 = cljm_DOT_core_SLASH__rest(args__5032);
if(cljm_truthy(([argc isEqual:@4]))) {
if(cljm_truthy(f.cljm$lang$arity$4)) {
return [f cljma__5027 langb__5029 arityc__5031 4d__5033];

} else {
return f(a__5027, b__5029, c__5031, d__5033);

}

} else {
id e__5035 = cljm_DOT_core_SLASH__first(args__5034);
id args__5036 = cljm_DOT_core_SLASH__rest(args__5034);
if(cljm_truthy(([argc isEqual:@5]))) {
if(cljm_truthy(f.cljm$lang$arity$5)) {
return [f cljma__5027 langb__5029 arityc__5031 5d__5033, e__5035, nil];

} else {
return f(a__5027, b__5029, c__5031, d__5033, e__5035);

}

} else {
id f__5037 = cljm_DOT_core_SLASH__first(args__5036);
id args__5038 = cljm_DOT_core_SLASH__rest(args__5036);
if(cljm_truthy(([argc isEqual:@6]))) {
if(cljm_truthy(f__5037.cljm$lang$arity$6)) {
return [f__5037 cljma__5027 langb__5029 arityc__5031 6d__5033, e__5035, f__5037, nil];

} else {
return f__5037(a__5027, b__5029, c__5031, d__5033, e__5035, f__5037);

}

} else {
id g__5039 = cljm_DOT_core_SLASH__first(args__5038);
id args__5040 = cljm_DOT_core_SLASH__rest(args__5038);
if(cljm_truthy(([argc isEqual:@7]))) {
if(cljm_truthy(f__5037.cljm$lang$arity$7)) {
return [f__5037 cljma__5027 langb__5029 arityc__5031 7d__5033, e__5035, f__5037, g__5039, nil];

} else {
return f__5037(a__5027, b__5029, c__5031, d__5033, e__5035, f__5037, g__5039);

}

} else {
id h__5041 = cljm_DOT_core_SLASH__first(args__5040);
id args__5042 = cljm_DOT_core_SLASH__rest(args__5040);
if(cljm_truthy(([argc isEqual:@8]))) {
if(cljm_truthy(f__5037.cljm$lang$arity$8)) {
return [f__5037 cljma__5027 langb__5029 arityc__5031 8d__5033, e__5035, f__5037, g__5039, h__5041, nil];

} else {
return f__5037(a__5027, b__5029, c__5031, d__5033, e__5035, f__5037, g__5039, h__5041);

}

} else {
id i__5043 = cljm_DOT_core_SLASH__first(args__5042);
id args__5044 = cljm_DOT_core_SLASH__rest(args__5042);
if(cljm_truthy(([argc isEqual:@9]))) {
if(cljm_truthy(f__5037.cljm$lang$arity$9)) {
return [f__5037 cljma__5027 langb__5029 arityc__5031 9d__5033, e__5035, f__5037, g__5039, h__5041, i__5043, nil];

} else {
return f__5037(a__5027, b__5029, c__5031, d__5033, e__5035, f__5037, g__5039, h__5041, i__5043);

}

} else {
id j__5045 = cljm_DOT_core_SLASH__first(args__5044);
id args__5046 = cljm_DOT_core_SLASH__rest(args__5044);
if(cljm_truthy(([argc isEqual:@10]))) {
if(cljm_truthy(f__5037.cljm$lang$arity$10)) {
return [f__5037 cljma__5027 langb__5029 arityc__5031 10d__5033, e__5035, f__5037, g__5039, h__5041, i__5043, j__5045, nil];

} else {
return f__5037(a__5027, b__5029, c__5031, d__5033, e__5035, f__5037, g__5039, h__5041, i__5043, j__5045);

}

} else {
id k__5047 = cljm_DOT_core_SLASH__first(args__5046);
id args__5048 = cljm_DOT_core_SLASH__rest(args__5046);
if(cljm_truthy(([argc isEqual:@11]))) {
if(cljm_truthy(f__5037.cljm$lang$arity$11)) {
return [f__5037 cljma__5027 langb__5029 arityc__5031 11d__5033, e__5035, f__5037, g__5039, h__5041, i__5043, j__5045, k__5047, nil];

} else {
return f__5037(a__5027, b__5029, c__5031, d__5033, e__5035, f__5037, g__5039, h__5041, i__5043, j__5045, k__5047);

}

} else {
id l__5049 = cljm_DOT_core_SLASH__first(args__5048);
id args__5050 = cljm_DOT_core_SLASH__rest(args__5048);
if(cljm_truthy(([argc isEqual:@12]))) {
if(cljm_truthy(f__5037.cljm$lang$arity$12)) {
return [f__5037 cljma__5027 langb__5029 arityc__5031 12d__5033, e__5035, f__5037, g__5039, h__5041, i__5043, j__5045, k__5047, l__5049, nil];

} else {
return f__5037(a__5027, b__5029, c__5031, d__5033, e__5035, f__5037, g__5039, h__5041, i__5043, j__5045, k__5047, l__5049);

}

} else {
id m__5051 = cljm_DOT_core_SLASH__first(args__5050);
id args__5052 = cljm_DOT_core_SLASH__rest(args__5050);
if(cljm_truthy(([argc isEqual:@13]))) {
if(cljm_truthy(f__5037.cljm$lang$arity$13)) {
return [f__5037 cljma__5027 langb__5029 arityc__5031 13d__5033, e__5035, f__5037, g__5039, h__5041, i__5043, j__5045, k__5047, l__5049, m__5051, nil];

} else {
return f__5037(a__5027, b__5029, c__5031, d__5033, e__5035, f__5037, g__5039, h__5041, i__5043, j__5045, k__5047, l__5049, m__5051);

}

} else {
id n__5053 = cljm_DOT_core_SLASH__first(args__5052);
id args__5054 = cljm_DOT_core_SLASH__rest(args__5052);
if(cljm_truthy(([argc isEqual:@14]))) {
if(cljm_truthy(f__5037.cljm$lang$arity$14)) {
return [f__5037 cljma__5027 langb__5029 arityc__5031 14d__5033, e__5035, f__5037, g__5039, h__5041, i__5043, j__5045, k__5047, l__5049, m__5051, n__5053, nil];

} else {
return f__5037(a__5027, b__5029, c__5031, d__5033, e__5035, f__5037, g__5039, h__5041, i__5043, j__5045, k__5047, l__5049, m__5051, n__5053);

}

} else {
id o__5055 = cljm_DOT_core_SLASH__first(args__5054);
id args__5056 = cljm_DOT_core_SLASH__rest(args__5054);
if(cljm_truthy(([argc isEqual:@15]))) {
if(cljm_truthy(f__5037.cljm$lang$arity$15)) {
return [f__5037 cljma__5027 langb__5029 arityc__5031 15d__5033, e__5035, f__5037, g__5039, h__5041, i__5043, j__5045, k__5047, l__5049, m__5051, n__5053, o__5055, nil];

} else {
return f__5037(a__5027, b__5029, c__5031, d__5033, e__5035, f__5037, g__5039, h__5041, i__5043, j__5045, k__5047, l__5049, m__5051, n__5053, o__5055);

}

} else {
id p__5057 = cljm_DOT_core_SLASH__first(args__5056);
id args__5058 = cljm_DOT_core_SLASH__rest(args__5056);
if(cljm_truthy(([argc isEqual:@16]))) {
if(cljm_truthy(f__5037.cljm$lang$arity$16)) {
return [f__5037 cljma__5027 langb__5029 arityc__5031 16d__5033, e__5035, f__5037, g__5039, h__5041, i__5043, j__5045, k__5047, l__5049, m__5051, n__5053, o__5055, p__5057, nil];

} else {
return f__5037(a__5027, b__5029, c__5031, d__5033, e__5035, f__5037, g__5039, h__5041, i__5043, j__5045, k__5047, l__5049, m__5051, n__5053, o__5055, p__5057);

}

} else {
id q__5059 = cljm_DOT_core_SLASH__first(args__5058);
id args__5060 = cljm_DOT_core_SLASH__rest(args__5058);
if(cljm_truthy(([argc isEqual:@17]))) {
if(cljm_truthy(f__5037.cljm$lang$arity$17)) {
return [f__5037 cljma__5027 langb__5029 arityc__5031 17d__5033, e__5035, f__5037, g__5039, h__5041, i__5043, j__5045, k__5047, l__5049, m__5051, n__5053, o__5055, p__5057, q__5059, nil];

} else {
return f__5037(a__5027, b__5029, c__5031, d__5033, e__5035, f__5037, g__5039, h__5041, i__5043, j__5045, k__5047, l__5049, m__5051, n__5053, o__5055, p__5057, q__5059);

}

} else {
id r__5061 = cljm_DOT_core_SLASH__first(args__5060);
id args__5062 = cljm_DOT_core_SLASH__rest(args__5060);
if(cljm_truthy(([argc isEqual:@18]))) {
if(cljm_truthy(f__5037.cljm$lang$arity$18)) {
return [f__5037 cljma__5027 langb__5029 arityc__5031 18d__5033, e__5035, f__5037, g__5039, h__5041, i__5043, j__5045, k__5047, l__5049, m__5051, n__5053, o__5055, p__5057, q__5059, r__5061, nil];

} else {
return f__5037(a__5027, b__5029, c__5031, d__5033, e__5035, f__5037, g__5039, h__5041, i__5043, j__5045, k__5047, l__5049, m__5051, n__5053, o__5055, p__5057, q__5059, r__5061);

}

} else {
id s__5063 = cljm_DOT_core_SLASH__first(args__5062);
id args__5064 = cljm_DOT_core_SLASH__rest(args__5062);
if(cljm_truthy(([argc isEqual:@19]))) {
if(cljm_truthy(f__5037.cljm$lang$arity$19)) {
return [f__5037 cljma__5027 langb__5029 arityc__5031 19d__5033, e__5035, f__5037, g__5039, h__5041, i__5043, j__5045, k__5047, l__5049, m__5051, n__5053, o__5055, p__5057, q__5059, r__5061, s__5063, nil];

} else {
return f__5037(a__5027, b__5029, c__5031, d__5033, e__5035, f__5037, g__5039, h__5041, i__5043, j__5045, k__5047, l__5049, m__5051, n__5053, o__5055, p__5057, q__5059, r__5061, s__5063);

}

} else {
id t__5065 = cljm_DOT_core_SLASH__first(args__5064);
id args__5066 = cljm_DOT_core_SLASH__rest(args__5064);
if(cljm_truthy(([argc isEqual:@20]))) {
if(cljm_truthy(f__5037.cljm$lang$arity$20)) {
return [f__5037 cljma__5027 langb__5029 arityc__5031 20d__5033, e__5035, f__5037, g__5039, h__5041, i__5043, j__5045, k__5047, l__5049, m__5051, n__5053, o__5055, p__5057, q__5059, r__5061, s__5063, t__5065, nil];

} else {
return f__5037(a__5027, b__5029, c__5031, d__5033, e__5035, f__5037, g__5039, h__5041, i__5043, j__5045, k__5047, l__5049, m__5051, n__5053, o__5055, p__5057, q__5059, r__5061, s__5063, t__5065);

}

} else {
throw [Error alloc];

}

}

}

}

}

}

}

}

}

}

}

}

}

}

}

}

}

}

}

}

}
};
/**
* Applies fn f to the argument list formed by prepending intervening arguments to args.
* First cut.  Not lazy.  Needs to use emitted toApply.
*/
cljm_DOT_core_SLASH_apply = (function() {
var apply = null;
var apply__2 = ^id(id f, id args) {
id fixed_arity__5081 = f.cljs$lang$maxFixedArity;
if(cljm_truthy(f.cljs$lang$applyTo)) {
id bc__5082 = cljm_DOT_core_SLASH_bounded_count(args, (fixed_arity__5081 + @1));
if(cljm_truthy((bc__5082 <= fixed_arity__5081))) {
return cljm_DOT_core_SLASH_apply_to(f, bc__5082, args);

} else {
return [f cljsargs lang];

}

} else {
return [f applyf, cljm_DOT_core_SLASH_to_array(args), nil];

}
};
var apply__3 = ^id(id f, id x, id args) {
id arglist__5083 = cljm_DOT_core_SLASH_list_STAR_(x, args, nil);
id fixed_arity__5084 = f.cljs$lang$maxFixedArity;
if(cljm_truthy(f.cljs$lang$applyTo)) {
id bc__5085 = cljm_DOT_core_SLASH_bounded_count(arglist__5083, (fixed_arity__5084 + @1));
if(cljm_truthy((bc__5085 <= fixed_arity__5084))) {
return cljm_DOT_core_SLASH_apply_to(f, bc__5085, arglist__5083);

} else {
return [f cljsarglist__5083 lang];

}

} else {
return [f applyf, cljm_DOT_core_SLASH_to_array(arglist__5083), nil];

}
};
var apply__4 = ^id(id f, id x, id y, id args) {
id arglist__5086 = cljm_DOT_core_SLASH_list_STAR_(x, y, args, nil);
id fixed_arity__5087 = f.cljs$lang$maxFixedArity;
if(cljm_truthy(f.cljs$lang$applyTo)) {
id bc__5088 = cljm_DOT_core_SLASH_bounded_count(arglist__5086, (fixed_arity__5087 + @1));
if(cljm_truthy((bc__5088 <= fixed_arity__5087))) {
return cljm_DOT_core_SLASH_apply_to(f, bc__5088, arglist__5086);

} else {
return [f cljsarglist__5086 lang];

}

} else {
return [f applyf, cljm_DOT_core_SLASH_to_array(arglist__5086), nil];

}
};
var apply__5 = ^id(id f, id x, id y, id z, id args) {
id arglist__5089 = cljm_DOT_core_SLASH_list_STAR_(x, y, z, args, nil);
id fixed_arity__5090 = f.cljs$lang$maxFixedArity;
if(cljm_truthy(f.cljs$lang$applyTo)) {
id bc__5091 = cljm_DOT_core_SLASH_bounded_count(arglist__5089, (fixed_arity__5090 + @1));
if(cljm_truthy((bc__5091 <= fixed_arity__5090))) {
return cljm_DOT_core_SLASH_apply_to(f, bc__5091, arglist__5089);

} else {
return [f cljsarglist__5089 lang];

}

} else {
return [f applyf, cljm_DOT_core_SLASH_to_array(arglist__5089), nil];

}
};
var apply__6 = ^id(id cljm__varargs, id f, id a, id b, id c, id d, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
id arglist__5092 = cljm_DOT_core_SLASH_cons(a, cljm_DOT_core_SLASH_cons(b, cljm_DOT_core_SLASH_cons(c, cljm_DOT_core_SLASH_cons(d, cljm_DOT_core_SLASH_spread(args)))));
id fixed_arity__5093 = f.cljs$lang$maxFixedArity;
if(cljm_truthy(f.cljs$lang$applyTo)) {
id bc__5094 = cljm_DOT_core_SLASH_bounded_count(arglist__5092, (fixed_arity__5093 + @1));
if(cljm_truthy((bc__5094 <= fixed_arity__5093))) {
return cljm_DOT_core_SLASH_apply_to(f, bc__5094, arglist__5092);

} else {
return [f cljsarglist__5092 lang];

}

} else {
return [f applyf, cljm_DOT_core_SLASH_to_array(arglist__5092), nil];

}
};
apply = function(f, a, b, c, d, var_args){
var args = var_args;
switch(arguments.length){
case 2:
return apply__2.call(this,f, a);
case 3:
return apply__3.call(this,f, a, b);
case 4:
return apply__4.call(this,f, a, b, c);
case 5:
return apply__5.call(this,f, a, b, c, d);
default:
return apply__6.cljm$lang$arity$variadic(f, a, b, c, d, cljm.core.array_seq(arguments, 5));
}
throw('Invalid arity: ' + arguments.length);
};
apply.cljm$lang$maxFixedArity = 5;
apply.cljm$lang$applyTo = apply__6.cljm$lang$applyTo;
apply.cljm$lang$arity$2 = apply__2;
apply.cljm$lang$arity$3 = apply__3;
apply.cljm$lang$arity$4 = apply__4;
apply.cljm$lang$arity$5 = apply__5;
apply.cljm$lang$arity$variadic = apply__6.cljm$lang$arity$variadic;
return apply;
})()
;
/**
* Returns an object of the same type and value as obj, with
* (apply f (meta obj) args) as its metadata.
*/
cljm_DOT_core_SLASH_vary_meta = ^id(id cljm__varargs, id obj, id f, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_with_meta(obj, cljm_DOT_core_SLASH_apply(f, cljm_DOT_core_SLASH_meta(obj), args, nil));
};
/**
* Same as (not (= obj1 obj2))
*/
cljm_DOT_core_SLASH_not_EQ_ = (function() {
var not_EQ_ = null;
var not_EQ___1 = ^id(id x) {
return @NO;
};
var not_EQ___2 = ^id(id x, id y) {
return cljm_DOT_core_SLASH_not(cljm_DOT_core_SLASH__EQ_(x, y, nil));
};
var not_EQ___3 = ^id(id cljm__varargs, id x, id y, ...) {
NSMutableArray *more = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[more addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_not(cljm_DOT_core_SLASH_apply(cljm_DOT_core_SLASH__EQ_, x, y, more, nil));
};
not_EQ_ = function(x, y, var_args){
var more = var_args;
switch(arguments.length){
case 1:
return not_EQ___1.call(this,x);
case 2:
return not_EQ___2.call(this,x, y);
default:
return not_EQ___3.cljm$lang$arity$variadic(x, y, cljm.core.array_seq(arguments, 2));
}
throw('Invalid arity: ' + arguments.length);
};
not_EQ_.cljm$lang$maxFixedArity = 2;
not_EQ_.cljm$lang$applyTo = not_EQ___3.cljm$lang$applyTo;
not_EQ_.cljm$lang$arity$1 = not_EQ___1;
not_EQ_.cljm$lang$arity$2 = not_EQ___2;
not_EQ_.cljm$lang$arity$variadic = not_EQ___3.cljm$lang$arity$variadic;
return not_EQ_;
})()
;
/**
* If coll is empty, returns nil, else coll
*/
cljm_DOT_core_SLASH_not_empty = ^id(id coll) {
if(cljm_truthy(cljm_DOT_core_SLASH_seq(coll))) {
return coll;

} else {
return nil;

}
};
/**
* Returns true if (pred x) is logical true for every x in coll, else
* false.
*/
cljm_DOT_core_SLASH_every_QMARK_ = ^id(id pred, id coll) {
while(YES) {
if(cljm_truthy((cljm_DOT_core_SLASH_seq(coll) == nil))) {
return @YES;

} else {
if(cljm_truthy(pred(cljm_DOT_core_SLASH_first(coll)))) {
{
var G__5095 = pred;
var G__5096 = cljm_DOT_core_SLASH_next(coll);
pred = G__5095;
coll = G__5096;
continue;
}

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return @NO;

} else {
return nil;

}

}

}
break;
}
};
/**
* Returns false if (pred x) is logical true for every x in
* coll, else true.
*/
cljm_DOT_core_SLASH_not_every_QMARK_ = ^id(id pred, id coll) {
return cljm_DOT_core_SLASH_not(cljm_DOT_core_SLASH_every_QMARK_(pred, coll));
};
/**
* Returns the first logical true value of (pred x) for any x in coll,
* else nil.  One common idiom is to use a set as pred, for example
* this will return :fred if :fred is in the sequence, otherwise nil:
* (some #{:fred} coll)
*/
cljm_DOT_core_SLASH_some = ^id(id pred, id coll) {
while(YES) {
if(cljm_truthy(cljm_DOT_core_SLASH_seq(coll))) {
id or__3824__auto____5098 = pred(cljm_DOT_core_SLASH_first(coll));
if(cljm_truthy(or__3824__auto____5098)) {
return or__3824__auto____5098;

} else {
{
var G__5099 = pred;
var G__5100 = cljm_DOT_core_SLASH_next(coll);
pred = G__5099;
coll = G__5100;
continue;
}

}

} else {
return nil;

}
break;
}
};
/**
* Returns false if (pred x) is logical true for any x in coll,
* else true.
*/
cljm_DOT_core_SLASH_not_any_QMARK_ = ^id(id pred, id coll) {
return cljm_DOT_core_SLASH_not(cljm_DOT_core_SLASH_some(pred, coll));
};
/**
* Returns true if n is even, throws an exception if n is not an integer
*/
cljm_DOT_core_SLASH_even_QMARK_ = ^id(id n) {
if(cljm_truthy(cljm_DOT_core_SLASH_integer_QMARK_(n))) {
return ([(n & @1) isEqual:@0]);

} else {
throw [Error alloc];

}
};
/**
* Returns true if n is odd, throws an exception if n is not an integer
*/
cljm_DOT_core_SLASH_odd_QMARK_ = ^id(id n) {
return cljm_DOT_core_SLASH_not(cljm_DOT_core_SLASH_even_QMARK_(n));
};
cljm_DOT_core_SLASH_identity = ^id(id x) {
return x;
};
/**
* Takes a fn f and returns a fn that takes the same arguments as f,
* has the same effects, if any, and returns the opposite truth value.
*/
cljm_DOT_core_SLASH_complement = ^id(id f) {
return (function() {
var G__5101 = null;
var G__5101__0 = ^id() {
return cljm_DOT_core_SLASH_not(f());
};
var G__5101__1 = ^id(id x) {
return cljm_DOT_core_SLASH_not(f(x));
};
var G__5101__2 = ^id(id x, id y) {
return cljm_DOT_core_SLASH_not(f(x, y));
};
var G__5101__3 = ^id(id cljm__varargs, id x, id y, ...) {
NSMutableArray *zs = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[zs addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_not(cljm_DOT_core_SLASH_apply(f, x, y, zs, nil));
};
G__5101 = function(x, y, var_args){
var zs = var_args;
switch(arguments.length){
case 0:
return G__5101__0.call(this);
case 1:
return G__5101__1.call(this,x);
case 2:
return G__5101__2.call(this,x, y);
default:
return G__5101__3.cljm$lang$arity$variadic(x, y, cljm.core.array_seq(arguments, 2));
}
throw('Invalid arity: ' + arguments.length);
};
G__5101.cljm$lang$maxFixedArity = 2;
G__5101.cljm$lang$applyTo = G__5101__3.cljm$lang$applyTo;
return G__5101;
})()
};
/**
* Returns a function that takes any number of arguments and returns x.
*/
cljm_DOT_core_SLASH_constantly = ^id(id x) {
return ^id(id cljm__varargs, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return x;
};
};
/**
* Takes a set of functions and returns a fn that is the composition
* of those fns.  The returned fn takes a variable number of args,
* applies the rightmost of fns to the args, the next
* fn (right-to-left) to the result, etc.
*/
cljm_DOT_core_SLASH_comp = (function() {
var comp = null;
var comp__0 = ^id() {
return cljm_DOT_core_SLASH_identity;
};
var comp__1 = ^id(id f) {
return f;
};
var comp__2 = ^id(id f, id g) {
return (function() {
var G__5108 = null;
var G__5108__0 = ^id() {
return f(g());
};
var G__5108__1 = ^id(id x) {
return f(g(x));
};
var G__5108__2 = ^id(id x, id y) {
return f(g(x, y));
};
var G__5108__3 = ^id(id x, id y, id z) {
return f(g(x, y, z));
};
var G__5108__4 = ^id(id cljm__varargs, id x, id y, id z, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return f(cljm_DOT_core_SLASH_apply(g, x, y, z, args, nil));
};
G__5108 = function(x, y, z, var_args){
var args = var_args;
switch(arguments.length){
case 0:
return G__5108__0.call(this);
case 1:
return G__5108__1.call(this,x);
case 2:
return G__5108__2.call(this,x, y);
case 3:
return G__5108__3.call(this,x, y, z);
default:
return G__5108__4.cljm$lang$arity$variadic(x, y, z, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
G__5108.cljm$lang$maxFixedArity = 3;
G__5108.cljm$lang$applyTo = G__5108__4.cljm$lang$applyTo;
return G__5108;
})()
};
var comp__3 = ^id(id f, id g, id h) {
return (function() {
var G__5109 = null;
var G__5109__0 = ^id() {
return f(g(h()));
};
var G__5109__1 = ^id(id x) {
return f(g(h(x)));
};
var G__5109__2 = ^id(id x, id y) {
return f(g(h(x, y)));
};
var G__5109__3 = ^id(id x, id y, id z) {
return f(g(h(x, y, z)));
};
var G__5109__4 = ^id(id cljm__varargs, id x, id y, id z, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return f(g(cljm_DOT_core_SLASH_apply(h, x, y, z, args, nil)));
};
G__5109 = function(x, y, z, var_args){
var args = var_args;
switch(arguments.length){
case 0:
return G__5109__0.call(this);
case 1:
return G__5109__1.call(this,x);
case 2:
return G__5109__2.call(this,x, y);
case 3:
return G__5109__3.call(this,x, y, z);
default:
return G__5109__4.cljm$lang$arity$variadic(x, y, z, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
G__5109.cljm$lang$maxFixedArity = 3;
G__5109.cljm$lang$applyTo = G__5109__4.cljm$lang$applyTo;
return G__5109;
})()
};
var comp__4 = ^id(id cljm__varargs, id f1, id f2, id f3, ...) {
NSMutableArray *fs = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[fs addObject:cljm__currentObject];
}
va_end(cljm__args);
id fs__5105 = cljm_DOT_core_SLASH_reverse(cljm_DOT_core_SLASH_list_STAR_(f1, f2, f3, fs, nil));
return ^id(id cljm__varargs, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
id ret__5106 = cljm_DOT_core_SLASH_apply(cljm_DOT_core_SLASH_first(fs__5105), args, nil);
id fs__5107 = cljm_DOT_core_SLASH_next(fs__5105);
while(YES) {
if(cljm_truthy(fs__5107)) {
{
var G__5110 = (ret__5106);
var G__5111 = cljm_DOT_core_SLASH_next(fs__5107);
ret__5106 = G__5110;
fs__5107 = G__5111;
continue;
}

} else {
return ret__5106;

}
break;
}
};
};
comp = function(f1, f2, f3, var_args){
var fs = var_args;
switch(arguments.length){
case 0:
return comp__0.call(this);
case 1:
return comp__1.call(this,f1);
case 2:
return comp__2.call(this,f1, f2);
case 3:
return comp__3.call(this,f1, f2, f3);
default:
return comp__4.cljm$lang$arity$variadic(f1, f2, f3, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
comp.cljm$lang$maxFixedArity = 3;
comp.cljm$lang$applyTo = comp__4.cljm$lang$applyTo;
comp.cljm$lang$arity$0 = comp__0;
comp.cljm$lang$arity$1 = comp__1;
comp.cljm$lang$arity$2 = comp__2;
comp.cljm$lang$arity$3 = comp__3;
comp.cljm$lang$arity$variadic = comp__4.cljm$lang$arity$variadic;
return comp;
})()
;
/**
* Takes a function f and fewer than the normal arguments to f, and
* returns a fn that takes a variable number of additional args. When
* called, the returned function calls f with args + additional args.
*/
cljm_DOT_core_SLASH_partial = (function() {
var partial = null;
var partial__2 = ^id(id f, id arg1) {
return ^id(id cljm__varargs, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_apply(f, arg1, args, nil);
};
};
var partial__3 = ^id(id f, id arg1, id arg2) {
return ^id(id cljm__varargs, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_apply(f, arg1, arg2, args, nil);
};
};
var partial__4 = ^id(id f, id arg1, id arg2, id arg3) {
return ^id(id cljm__varargs, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_apply(f, arg1, arg2, arg3, args, nil);
};
};
var partial__5 = ^id(id cljm__varargs, id f, id arg1, id arg2, id arg3, ...) {
NSMutableArray *more = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[more addObject:cljm__currentObject];
}
va_end(cljm__args);
return ^id(id cljm__varargs, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_apply(f, arg1, arg2, arg3, cljm_DOT_core_SLASH_concat(more, args, nil), nil);
};
};
partial = function(f, arg1, arg2, arg3, var_args){
var more = var_args;
switch(arguments.length){
case 2:
return partial__2.call(this,f, arg1);
case 3:
return partial__3.call(this,f, arg1, arg2);
case 4:
return partial__4.call(this,f, arg1, arg2, arg3);
default:
return partial__5.cljm$lang$arity$variadic(f, arg1, arg2, arg3, cljm.core.array_seq(arguments, 4));
}
throw('Invalid arity: ' + arguments.length);
};
partial.cljm$lang$maxFixedArity = 4;
partial.cljm$lang$applyTo = partial__5.cljm$lang$applyTo;
partial.cljm$lang$arity$2 = partial__2;
partial.cljm$lang$arity$3 = partial__3;
partial.cljm$lang$arity$4 = partial__4;
partial.cljm$lang$arity$variadic = partial__5.cljm$lang$arity$variadic;
return partial;
})()
;
/**
* Takes a function f, and returns a function that calls f, replacing
* a nil first argument to f with the supplied value x. Higher arity
* versions can replace arguments in the second and third
* positions (y, z). Note that the function f can take any number of
* arguments, not just the one(s) being nil-patched.
*/
cljm_DOT_core_SLASH_fnil = (function() {
var fnil = null;
var fnil__2 = ^id(id f, id x) {
return (function() {
var G__5112 = null;
var G__5112__1 = ^id(id a) {
return f((cljm_truthy((a == nil))) ?x:a);
};
var G__5112__2 = ^id(id a, id b) {
return f((cljm_truthy((a == nil))) ?x:a, b);
};
var G__5112__3 = ^id(id a, id b, id c) {
return f((cljm_truthy((a == nil))) ?x:a, b, c);
};
var G__5112__4 = ^id(id cljm__varargs, id a, id b, id c, ...) {
NSMutableArray *ds = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[ds addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_apply(f, (cljm_truthy((a == nil))) ?x:a, b, c, ds, nil);
};
G__5112 = function(a, b, c, var_args){
var ds = var_args;
switch(arguments.length){
case 1:
return G__5112__1.call(this,a);
case 2:
return G__5112__2.call(this,a, b);
case 3:
return G__5112__3.call(this,a, b, c);
default:
return G__5112__4.cljm$lang$arity$variadic(a, b, c, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
G__5112.cljm$lang$maxFixedArity = 3;
G__5112.cljm$lang$applyTo = G__5112__4.cljm$lang$applyTo;
return G__5112;
})()
};
var fnil__3 = ^id(id f, id x, id y) {
return (function() {
var G__5113 = null;
var G__5113__2 = ^id(id a, id b) {
return f((cljm_truthy((a == nil))) ?x:a, (cljm_truthy((b == nil))) ?y:b);
};
var G__5113__3 = ^id(id a, id b, id c) {
return f((cljm_truthy((a == nil))) ?x:a, (cljm_truthy((b == nil))) ?y:b, c);
};
var G__5113__4 = ^id(id cljm__varargs, id a, id b, id c, ...) {
NSMutableArray *ds = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[ds addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_apply(f, (cljm_truthy((a == nil))) ?x:a, (cljm_truthy((b == nil))) ?y:b, c, ds, nil);
};
G__5113 = function(a, b, c, var_args){
var ds = var_args;
switch(arguments.length){
case 2:
return G__5113__2.call(this,a, b);
case 3:
return G__5113__3.call(this,a, b, c);
default:
return G__5113__4.cljm$lang$arity$variadic(a, b, c, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
G__5113.cljm$lang$maxFixedArity = 3;
G__5113.cljm$lang$applyTo = G__5113__4.cljm$lang$applyTo;
return G__5113;
})()
};
var fnil__4 = ^id(id f, id x, id y, id z) {
return (function() {
var G__5114 = null;
var G__5114__2 = ^id(id a, id b) {
return f((cljm_truthy((a == nil))) ?x:a, (cljm_truthy((b == nil))) ?y:b);
};
var G__5114__3 = ^id(id a, id b, id c) {
return f((cljm_truthy((a == nil))) ?x:a, (cljm_truthy((b == nil))) ?y:b, (cljm_truthy((c == nil))) ?z:c);
};
var G__5114__4 = ^id(id cljm__varargs, id a, id b, id c, ...) {
NSMutableArray *ds = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[ds addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_apply(f, (cljm_truthy((a == nil))) ?x:a, (cljm_truthy((b == nil))) ?y:b, (cljm_truthy((c == nil))) ?z:c, ds, nil);
};
G__5114 = function(a, b, c, var_args){
var ds = var_args;
switch(arguments.length){
case 2:
return G__5114__2.call(this,a, b);
case 3:
return G__5114__3.call(this,a, b, c);
default:
return G__5114__4.cljm$lang$arity$variadic(a, b, c, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
G__5114.cljm$lang$maxFixedArity = 3;
G__5114.cljm$lang$applyTo = G__5114__4.cljm$lang$applyTo;
return G__5114;
})()
};
fnil = function(f, x, y, z){
switch(arguments.length){
case 2:
return fnil__2.call(this,f, x);
case 3:
return fnil__3.call(this,f, x, y);
case 4:
return fnil__4.call(this,f, x, y, z);
}
throw('Invalid arity: ' + arguments.length);
};
fnil.cljm$lang$arity$2 = fnil__2;
fnil.cljm$lang$arity$3 = fnil__3;
fnil.cljm$lang$arity$4 = fnil__4;
return fnil;
})()
;
/**
* Returns a lazy sequence consisting of the result of applying f to 0
* and the first item of coll, followed by applying f to 1 and the second
* item in coll, etc, until coll is exhausted. Thus function f should
* accept 2 arguments, index and item.
*/
cljm_DOT_core_SLASH_map_indexed = ^id(id f, id coll) {
id mapi__5130 = ^id(id idx, id coll) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
return mapi__5130(@0, coll);
};
/**
* Returns a lazy sequence of the non-nil results of (f item). Note,
* this means false return values will be included.  f must be free of
* side-effects.
*/
cljm_DOT_core_SLASH_keep = ^id(id f, id coll) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
/**
* Returns a lazy sequence of the non-nil results of (f index item). Note,
* this means false return values will be included.  f must be free of
* side-effects.
*/
cljm_DOT_core_SLASH_keep_indexed = ^id(id f, id coll) {
id keepi__5188 = ^id(id idx, id coll) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
return keepi__5188(@0, coll);
};
/**
* Takes a set of predicates and returns a function f that returns true if all of its
* composing predicates return a logical true value against all of its arguments, else it returns
* false. Note that f is short-circuiting in that it will stop execution on the first
* argument that triggers a logical false result against the original predicates.
*/
cljm_DOT_core_SLASH_every_pred = (function() {
var every_pred = null;
var every_pred__1 = ^id(id p) {
return (function() {
var ep1 = null;
var ep1__0 = ^id() {
return @YES;
};
var ep1__1 = ^id(id x) {
return cljm_DOT_core_SLASH_boolean(p(x));
};
var ep1__2 = ^id(id x, id y) {
return cljm_DOT_core_SLASH_boolean({id and__3822__auto____5292 = p(x);
if(cljm_truthy(and__3822__auto____5292)) {
return p(y);

} else {
return and__3822__auto____5292;

}
});
};
var ep1__3 = ^id(id x, id y, id z) {
return cljm_DOT_core_SLASH_boolean({id and__3822__auto____5293 = p(x);
if(cljm_truthy(and__3822__auto____5293)) {
id and__3822__auto____5294 = p(y);
if(cljm_truthy(and__3822__auto____5294)) {
return p(z);

} else {
return and__3822__auto____5294;

}

} else {
return and__3822__auto____5293;

}
});
};
var ep1__4 = ^id(id cljm__varargs, id x, id y, id z, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_boolean({id and__3822__auto____5295 = ep1(x, y, z, nil);
if(cljm_truthy(and__3822__auto____5295)) {
return cljm_DOT_core_SLASH_every_QMARK_(p, args);

} else {
return and__3822__auto____5295;

}
});
};
ep1 = function(x, y, z, var_args){
var args = var_args;
switch(arguments.length){
case 0:
return ep1__0.call(this);
case 1:
return ep1__1.call(this,x);
case 2:
return ep1__2.call(this,x, y);
case 3:
return ep1__3.call(this,x, y, z);
default:
return ep1__4.cljm$lang$arity$variadic(x, y, z, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
ep1.cljm$lang$maxFixedArity = 3;
ep1.cljm$lang$applyTo = ep1__4.cljm$lang$applyTo;
ep1.cljm$lang$arity$0 = ep1__0;
ep1.cljm$lang$arity$1 = ep1__1;
ep1.cljm$lang$arity$2 = ep1__2;
ep1.cljm$lang$arity$3 = ep1__3;
ep1.cljm$lang$arity$variadic = ep1__4.cljm$lang$arity$variadic;
return ep1;
})()
};
var every_pred__2 = ^id(id p1, id p2) {
return (function() {
var ep2 = null;
var ep2__0 = ^id() {
return @YES;
};
var ep2__1 = ^id(id x) {
return cljm_DOT_core_SLASH_boolean({id and__3822__auto____5307 = p1(x);
if(cljm_truthy(and__3822__auto____5307)) {
return p2(x);

} else {
return and__3822__auto____5307;

}
});
};
var ep2__2 = ^id(id x, id y) {
return cljm_DOT_core_SLASH_boolean({id and__3822__auto____5308 = p1(x);
if(cljm_truthy(and__3822__auto____5308)) {
id and__3822__auto____5309 = p1(y);
if(cljm_truthy(and__3822__auto____5309)) {
id and__3822__auto____5310 = p2(x);
if(cljm_truthy(and__3822__auto____5310)) {
return p2(y);

} else {
return and__3822__auto____5310;

}

} else {
return and__3822__auto____5309;

}

} else {
return and__3822__auto____5308;

}
});
};
var ep2__3 = ^id(id x, id y, id z) {
return cljm_DOT_core_SLASH_boolean({id and__3822__auto____5311 = p1(x);
if(cljm_truthy(and__3822__auto____5311)) {
id and__3822__auto____5312 = p1(y);
if(cljm_truthy(and__3822__auto____5312)) {
id and__3822__auto____5313 = p1(z);
if(cljm_truthy(and__3822__auto____5313)) {
id and__3822__auto____5314 = p2(x);
if(cljm_truthy(and__3822__auto____5314)) {
id and__3822__auto____5315 = p2(y);
if(cljm_truthy(and__3822__auto____5315)) {
return p2(z);

} else {
return and__3822__auto____5315;

}

} else {
return and__3822__auto____5314;

}

} else {
return and__3822__auto____5313;

}

} else {
return and__3822__auto____5312;

}

} else {
return and__3822__auto____5311;

}
});
};
var ep2__4 = ^id(id cljm__varargs, id x, id y, id z, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_boolean({id and__3822__auto____5316 = ep2(x, y, z, nil);
if(cljm_truthy(and__3822__auto____5316)) {
return cljm_DOT_core_SLASH_every_QMARK_(^id(id p1__5163_SHARP_) {
id and__3822__auto____5317 = p1(p1__5163_SHARP_);
if(cljm_truthy(and__3822__auto____5317)) {
return p2(p1__5163_SHARP_);

} else {
return and__3822__auto____5317;

}
}, args);

} else {
return and__3822__auto____5316;

}
});
};
ep2 = function(x, y, z, var_args){
var args = var_args;
switch(arguments.length){
case 0:
return ep2__0.call(this);
case 1:
return ep2__1.call(this,x);
case 2:
return ep2__2.call(this,x, y);
case 3:
return ep2__3.call(this,x, y, z);
default:
return ep2__4.cljm$lang$arity$variadic(x, y, z, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
ep2.cljm$lang$maxFixedArity = 3;
ep2.cljm$lang$applyTo = ep2__4.cljm$lang$applyTo;
ep2.cljm$lang$arity$0 = ep2__0;
ep2.cljm$lang$arity$1 = ep2__1;
ep2.cljm$lang$arity$2 = ep2__2;
ep2.cljm$lang$arity$3 = ep2__3;
ep2.cljm$lang$arity$variadic = ep2__4.cljm$lang$arity$variadic;
return ep2;
})()
};
var every_pred__3 = ^id(id p1, id p2, id p3) {
return (function() {
var ep3 = null;
var ep3__0 = ^id() {
return @YES;
};
var ep3__1 = ^id(id x) {
return cljm_DOT_core_SLASH_boolean({id and__3822__auto____5336 = p1(x);
if(cljm_truthy(and__3822__auto____5336)) {
id and__3822__auto____5337 = p2(x);
if(cljm_truthy(and__3822__auto____5337)) {
return p3(x);

} else {
return and__3822__auto____5337;

}

} else {
return and__3822__auto____5336;

}
});
};
var ep3__2 = ^id(id x, id y) {
return cljm_DOT_core_SLASH_boolean({id and__3822__auto____5338 = p1(x);
if(cljm_truthy(and__3822__auto____5338)) {
id and__3822__auto____5339 = p2(x);
if(cljm_truthy(and__3822__auto____5339)) {
id and__3822__auto____5340 = p3(x);
if(cljm_truthy(and__3822__auto____5340)) {
id and__3822__auto____5341 = p1(y);
if(cljm_truthy(and__3822__auto____5341)) {
id and__3822__auto____5342 = p2(y);
if(cljm_truthy(and__3822__auto____5342)) {
return p3(y);

} else {
return and__3822__auto____5342;

}

} else {
return and__3822__auto____5341;

}

} else {
return and__3822__auto____5340;

}

} else {
return and__3822__auto____5339;

}

} else {
return and__3822__auto____5338;

}
});
};
var ep3__3 = ^id(id x, id y, id z) {
return cljm_DOT_core_SLASH_boolean({id and__3822__auto____5343 = p1(x);
if(cljm_truthy(and__3822__auto____5343)) {
id and__3822__auto____5344 = p2(x);
if(cljm_truthy(and__3822__auto____5344)) {
id and__3822__auto____5345 = p3(x);
if(cljm_truthy(and__3822__auto____5345)) {
id and__3822__auto____5346 = p1(y);
if(cljm_truthy(and__3822__auto____5346)) {
id and__3822__auto____5347 = p2(y);
if(cljm_truthy(and__3822__auto____5347)) {
id and__3822__auto____5348 = p3(y);
if(cljm_truthy(and__3822__auto____5348)) {
id and__3822__auto____5349 = p1(z);
if(cljm_truthy(and__3822__auto____5349)) {
id and__3822__auto____5350 = p2(z);
if(cljm_truthy(and__3822__auto____5350)) {
return p3(z);

} else {
return and__3822__auto____5350;

}

} else {
return and__3822__auto____5349;

}

} else {
return and__3822__auto____5348;

}

} else {
return and__3822__auto____5347;

}

} else {
return and__3822__auto____5346;

}

} else {
return and__3822__auto____5345;

}

} else {
return and__3822__auto____5344;

}

} else {
return and__3822__auto____5343;

}
});
};
var ep3__4 = ^id(id cljm__varargs, id x, id y, id z, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_boolean({id and__3822__auto____5351 = ep3(x, y, z, nil);
if(cljm_truthy(and__3822__auto____5351)) {
return cljm_DOT_core_SLASH_every_QMARK_(^id(id p1__5164_SHARP_) {
id and__3822__auto____5352 = p1(p1__5164_SHARP_);
if(cljm_truthy(and__3822__auto____5352)) {
id and__3822__auto____5353 = p2(p1__5164_SHARP_);
if(cljm_truthy(and__3822__auto____5353)) {
return p3(p1__5164_SHARP_);

} else {
return and__3822__auto____5353;

}

} else {
return and__3822__auto____5352;

}
}, args);

} else {
return and__3822__auto____5351;

}
});
};
ep3 = function(x, y, z, var_args){
var args = var_args;
switch(arguments.length){
case 0:
return ep3__0.call(this);
case 1:
return ep3__1.call(this,x);
case 2:
return ep3__2.call(this,x, y);
case 3:
return ep3__3.call(this,x, y, z);
default:
return ep3__4.cljm$lang$arity$variadic(x, y, z, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
ep3.cljm$lang$maxFixedArity = 3;
ep3.cljm$lang$applyTo = ep3__4.cljm$lang$applyTo;
ep3.cljm$lang$arity$0 = ep3__0;
ep3.cljm$lang$arity$1 = ep3__1;
ep3.cljm$lang$arity$2 = ep3__2;
ep3.cljm$lang$arity$3 = ep3__3;
ep3.cljm$lang$arity$variadic = ep3__4.cljm$lang$arity$variadic;
return ep3;
})()
};
var every_pred__4 = ^id(id cljm__varargs, id p1, id p2, id p3, ...) {
NSMutableArray *ps = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[ps addObject:cljm__currentObject];
}
va_end(cljm__args);
id ps__5354 = cljm_DOT_core_SLASH_list_STAR_(p1, p2, p3, ps, nil);
return (function() {
var epn = null;
var epn__0 = ^id() {
return @YES;
};
var epn__1 = ^id(id x) {
return cljm_DOT_core_SLASH_every_QMARK_(^id(id p1__5165_SHARP_) {
return p1__5165_SHARP_(x);
}, ps__5354);
};
var epn__2 = ^id(id x, id y) {
return cljm_DOT_core_SLASH_every_QMARK_(^id(id p1__5166_SHARP_) {
id and__3822__auto____5359 = p1__5166_SHARP_(x);
if(cljm_truthy(and__3822__auto____5359)) {
return p1__5166_SHARP_(y);

} else {
return and__3822__auto____5359;

}
}, ps__5354);
};
var epn__3 = ^id(id x, id y, id z) {
return cljm_DOT_core_SLASH_every_QMARK_(^id(id p1__5167_SHARP_) {
id and__3822__auto____5360 = p1__5167_SHARP_(x);
if(cljm_truthy(and__3822__auto____5360)) {
id and__3822__auto____5361 = p1__5167_SHARP_(y);
if(cljm_truthy(and__3822__auto____5361)) {
return p1__5167_SHARP_(z);

} else {
return and__3822__auto____5361;

}

} else {
return and__3822__auto____5360;

}
}, ps__5354);
};
var epn__4 = ^id(id cljm__varargs, id x, id y, id z, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_boolean({id and__3822__auto____5362 = epn(x, y, z, nil);
if(cljm_truthy(and__3822__auto____5362)) {
return cljm_DOT_core_SLASH_every_QMARK_(^id(id p1__5168_SHARP_) {
return cljm_DOT_core_SLASH_every_QMARK_(p1__5168_SHARP_, args);
}, ps__5354);

} else {
return and__3822__auto____5362;

}
});
};
epn = function(x, y, z, var_args){
var args = var_args;
switch(arguments.length){
case 0:
return epn__0.call(this);
case 1:
return epn__1.call(this,x);
case 2:
return epn__2.call(this,x, y);
case 3:
return epn__3.call(this,x, y, z);
default:
return epn__4.cljm$lang$arity$variadic(x, y, z, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
epn.cljm$lang$maxFixedArity = 3;
epn.cljm$lang$applyTo = epn__4.cljm$lang$applyTo;
epn.cljm$lang$arity$0 = epn__0;
epn.cljm$lang$arity$1 = epn__1;
epn.cljm$lang$arity$2 = epn__2;
epn.cljm$lang$arity$3 = epn__3;
epn.cljm$lang$arity$variadic = epn__4.cljm$lang$arity$variadic;
return epn;
})()
};
every_pred = function(p1, p2, p3, var_args){
var ps = var_args;
switch(arguments.length){
case 1:
return every_pred__1.call(this,p1);
case 2:
return every_pred__2.call(this,p1, p2);
case 3:
return every_pred__3.call(this,p1, p2, p3);
default:
return every_pred__4.cljm$lang$arity$variadic(p1, p2, p3, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
every_pred.cljm$lang$maxFixedArity = 3;
every_pred.cljm$lang$applyTo = every_pred__4.cljm$lang$applyTo;
every_pred.cljm$lang$arity$1 = every_pred__1;
every_pred.cljm$lang$arity$2 = every_pred__2;
every_pred.cljm$lang$arity$3 = every_pred__3;
every_pred.cljm$lang$arity$variadic = every_pred__4.cljm$lang$arity$variadic;
return every_pred;
})()
;
/**
* Takes a set of predicates and returns a function f that returns the first logical true value
* returned by one of its composing predicates against any of its arguments, else it returns
* logical false. Note that f is short-circuiting in that it will stop execution on the first
* argument that triggers a logical true result against the original predicates.
*/
cljm_DOT_core_SLASH_some_fn = (function() {
var some_fn = null;
var some_fn__1 = ^id(id p) {
return (function() {
var sp1 = null;
var sp1__0 = ^id() {
return nil;
};
var sp1__1 = ^id(id x) {
return p(x);
};
var sp1__2 = ^id(id x, id y) {
id or__3824__auto____5443 = p(x);
if(cljm_truthy(or__3824__auto____5443)) {
return or__3824__auto____5443;

} else {
return p(y);

}
};
var sp1__3 = ^id(id x, id y, id z) {
id or__3824__auto____5444 = p(x);
if(cljm_truthy(or__3824__auto____5444)) {
return or__3824__auto____5444;

} else {
id or__3824__auto____5445 = p(y);
if(cljm_truthy(or__3824__auto____5445)) {
return or__3824__auto____5445;

} else {
return p(z);

}

}
};
var sp1__4 = ^id(id cljm__varargs, id x, id y, id z, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
id or__3824__auto____5446 = sp1(x, y, z, nil);
if(cljm_truthy(or__3824__auto____5446)) {
return or__3824__auto____5446;

} else {
return cljm_DOT_core_SLASH_some(p, args);

}
};
sp1 = function(x, y, z, var_args){
var args = var_args;
switch(arguments.length){
case 0:
return sp1__0.call(this);
case 1:
return sp1__1.call(this,x);
case 2:
return sp1__2.call(this,x, y);
case 3:
return sp1__3.call(this,x, y, z);
default:
return sp1__4.cljm$lang$arity$variadic(x, y, z, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
sp1.cljm$lang$maxFixedArity = 3;
sp1.cljm$lang$applyTo = sp1__4.cljm$lang$applyTo;
sp1.cljm$lang$arity$0 = sp1__0;
sp1.cljm$lang$arity$1 = sp1__1;
sp1.cljm$lang$arity$2 = sp1__2;
sp1.cljm$lang$arity$3 = sp1__3;
sp1.cljm$lang$arity$variadic = sp1__4.cljm$lang$arity$variadic;
return sp1;
})()
};
var some_fn__2 = ^id(id p1, id p2) {
return (function() {
var sp2 = null;
var sp2__0 = ^id() {
return nil;
};
var sp2__1 = ^id(id x) {
id or__3824__auto____5458 = p1(x);
if(cljm_truthy(or__3824__auto____5458)) {
return or__3824__auto____5458;

} else {
return p2(x);

}
};
var sp2__2 = ^id(id x, id y) {
id or__3824__auto____5459 = p1(x);
if(cljm_truthy(or__3824__auto____5459)) {
return or__3824__auto____5459;

} else {
id or__3824__auto____5460 = p1(y);
if(cljm_truthy(or__3824__auto____5460)) {
return or__3824__auto____5460;

} else {
id or__3824__auto____5461 = p2(x);
if(cljm_truthy(or__3824__auto____5461)) {
return or__3824__auto____5461;

} else {
return p2(y);

}

}

}
};
var sp2__3 = ^id(id x, id y, id z) {
id or__3824__auto____5462 = p1(x);
if(cljm_truthy(or__3824__auto____5462)) {
return or__3824__auto____5462;

} else {
id or__3824__auto____5463 = p1(y);
if(cljm_truthy(or__3824__auto____5463)) {
return or__3824__auto____5463;

} else {
id or__3824__auto____5464 = p1(z);
if(cljm_truthy(or__3824__auto____5464)) {
return or__3824__auto____5464;

} else {
id or__3824__auto____5465 = p2(x);
if(cljm_truthy(or__3824__auto____5465)) {
return or__3824__auto____5465;

} else {
id or__3824__auto____5466 = p2(y);
if(cljm_truthy(or__3824__auto____5466)) {
return or__3824__auto____5466;

} else {
return p2(z);

}

}

}

}

}
};
var sp2__4 = ^id(id cljm__varargs, id x, id y, id z, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
id or__3824__auto____5467 = sp2(x, y, z, nil);
if(cljm_truthy(or__3824__auto____5467)) {
return or__3824__auto____5467;

} else {
return cljm_DOT_core_SLASH_some(^id(id p1__5207_SHARP_) {
id or__3824__auto____5468 = p1(p1__5207_SHARP_);
if(cljm_truthy(or__3824__auto____5468)) {
return or__3824__auto____5468;

} else {
return p2(p1__5207_SHARP_);

}
}, args);

}
};
sp2 = function(x, y, z, var_args){
var args = var_args;
switch(arguments.length){
case 0:
return sp2__0.call(this);
case 1:
return sp2__1.call(this,x);
case 2:
return sp2__2.call(this,x, y);
case 3:
return sp2__3.call(this,x, y, z);
default:
return sp2__4.cljm$lang$arity$variadic(x, y, z, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
sp2.cljm$lang$maxFixedArity = 3;
sp2.cljm$lang$applyTo = sp2__4.cljm$lang$applyTo;
sp2.cljm$lang$arity$0 = sp2__0;
sp2.cljm$lang$arity$1 = sp2__1;
sp2.cljm$lang$arity$2 = sp2__2;
sp2.cljm$lang$arity$3 = sp2__3;
sp2.cljm$lang$arity$variadic = sp2__4.cljm$lang$arity$variadic;
return sp2;
})()
};
var some_fn__3 = ^id(id p1, id p2, id p3) {
return (function() {
var sp3 = null;
var sp3__0 = ^id() {
return nil;
};
var sp3__1 = ^id(id x) {
id or__3824__auto____5487 = p1(x);
if(cljm_truthy(or__3824__auto____5487)) {
return or__3824__auto____5487;

} else {
id or__3824__auto____5488 = p2(x);
if(cljm_truthy(or__3824__auto____5488)) {
return or__3824__auto____5488;

} else {
return p3(x);

}

}
};
var sp3__2 = ^id(id x, id y) {
id or__3824__auto____5489 = p1(x);
if(cljm_truthy(or__3824__auto____5489)) {
return or__3824__auto____5489;

} else {
id or__3824__auto____5490 = p2(x);
if(cljm_truthy(or__3824__auto____5490)) {
return or__3824__auto____5490;

} else {
id or__3824__auto____5491 = p3(x);
if(cljm_truthy(or__3824__auto____5491)) {
return or__3824__auto____5491;

} else {
id or__3824__auto____5492 = p1(y);
if(cljm_truthy(or__3824__auto____5492)) {
return or__3824__auto____5492;

} else {
id or__3824__auto____5493 = p2(y);
if(cljm_truthy(or__3824__auto____5493)) {
return or__3824__auto____5493;

} else {
return p3(y);

}

}

}

}

}
};
var sp3__3 = ^id(id x, id y, id z) {
id or__3824__auto____5494 = p1(x);
if(cljm_truthy(or__3824__auto____5494)) {
return or__3824__auto____5494;

} else {
id or__3824__auto____5495 = p2(x);
if(cljm_truthy(or__3824__auto____5495)) {
return or__3824__auto____5495;

} else {
id or__3824__auto____5496 = p3(x);
if(cljm_truthy(or__3824__auto____5496)) {
return or__3824__auto____5496;

} else {
id or__3824__auto____5497 = p1(y);
if(cljm_truthy(or__3824__auto____5497)) {
return or__3824__auto____5497;

} else {
id or__3824__auto____5498 = p2(y);
if(cljm_truthy(or__3824__auto____5498)) {
return or__3824__auto____5498;

} else {
id or__3824__auto____5499 = p3(y);
if(cljm_truthy(or__3824__auto____5499)) {
return or__3824__auto____5499;

} else {
id or__3824__auto____5500 = p1(z);
if(cljm_truthy(or__3824__auto____5500)) {
return or__3824__auto____5500;

} else {
id or__3824__auto____5501 = p2(z);
if(cljm_truthy(or__3824__auto____5501)) {
return or__3824__auto____5501;

} else {
return p3(z);

}

}

}

}

}

}

}

}
};
var sp3__4 = ^id(id cljm__varargs, id x, id y, id z, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
id or__3824__auto____5502 = sp3(x, y, z, nil);
if(cljm_truthy(or__3824__auto____5502)) {
return or__3824__auto____5502;

} else {
return cljm_DOT_core_SLASH_some(^id(id p1__5208_SHARP_) {
id or__3824__auto____5503 = p1(p1__5208_SHARP_);
if(cljm_truthy(or__3824__auto____5503)) {
return or__3824__auto____5503;

} else {
id or__3824__auto____5504 = p2(p1__5208_SHARP_);
if(cljm_truthy(or__3824__auto____5504)) {
return or__3824__auto____5504;

} else {
return p3(p1__5208_SHARP_);

}

}
}, args);

}
};
sp3 = function(x, y, z, var_args){
var args = var_args;
switch(arguments.length){
case 0:
return sp3__0.call(this);
case 1:
return sp3__1.call(this,x);
case 2:
return sp3__2.call(this,x, y);
case 3:
return sp3__3.call(this,x, y, z);
default:
return sp3__4.cljm$lang$arity$variadic(x, y, z, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
sp3.cljm$lang$maxFixedArity = 3;
sp3.cljm$lang$applyTo = sp3__4.cljm$lang$applyTo;
sp3.cljm$lang$arity$0 = sp3__0;
sp3.cljm$lang$arity$1 = sp3__1;
sp3.cljm$lang$arity$2 = sp3__2;
sp3.cljm$lang$arity$3 = sp3__3;
sp3.cljm$lang$arity$variadic = sp3__4.cljm$lang$arity$variadic;
return sp3;
})()
};
var some_fn__4 = ^id(id cljm__varargs, id p1, id p2, id p3, ...) {
NSMutableArray *ps = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[ps addObject:cljm__currentObject];
}
va_end(cljm__args);
id ps__5505 = cljm_DOT_core_SLASH_list_STAR_(p1, p2, p3, ps, nil);
return (function() {
var spn = null;
var spn__0 = ^id() {
return nil;
};
var spn__1 = ^id(id x) {
return cljm_DOT_core_SLASH_some(^id(id p1__5209_SHARP_) {
return p1__5209_SHARP_(x);
}, ps__5505);
};
var spn__2 = ^id(id x, id y) {
return cljm_DOT_core_SLASH_some(^id(id p1__5210_SHARP_) {
id or__3824__auto____5510 = p1__5210_SHARP_(x);
if(cljm_truthy(or__3824__auto____5510)) {
return or__3824__auto____5510;

} else {
return p1__5210_SHARP_(y);

}
}, ps__5505);
};
var spn__3 = ^id(id x, id y, id z) {
return cljm_DOT_core_SLASH_some(^id(id p1__5211_SHARP_) {
id or__3824__auto____5511 = p1__5211_SHARP_(x);
if(cljm_truthy(or__3824__auto____5511)) {
return or__3824__auto____5511;

} else {
id or__3824__auto____5512 = p1__5211_SHARP_(y);
if(cljm_truthy(or__3824__auto____5512)) {
return or__3824__auto____5512;

} else {
return p1__5211_SHARP_(z);

}

}
}, ps__5505);
};
var spn__4 = ^id(id cljm__varargs, id x, id y, id z, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
id or__3824__auto____5513 = spn(x, y, z, nil);
if(cljm_truthy(or__3824__auto____5513)) {
return or__3824__auto____5513;

} else {
return cljm_DOT_core_SLASH_some(^id(id p1__5212_SHARP_) {
return cljm_DOT_core_SLASH_some(p1__5212_SHARP_, args);
}, ps__5505);

}
};
spn = function(x, y, z, var_args){
var args = var_args;
switch(arguments.length){
case 0:
return spn__0.call(this);
case 1:
return spn__1.call(this,x);
case 2:
return spn__2.call(this,x, y);
case 3:
return spn__3.call(this,x, y, z);
default:
return spn__4.cljm$lang$arity$variadic(x, y, z, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
spn.cljm$lang$maxFixedArity = 3;
spn.cljm$lang$applyTo = spn__4.cljm$lang$applyTo;
spn.cljm$lang$arity$0 = spn__0;
spn.cljm$lang$arity$1 = spn__1;
spn.cljm$lang$arity$2 = spn__2;
spn.cljm$lang$arity$3 = spn__3;
spn.cljm$lang$arity$variadic = spn__4.cljm$lang$arity$variadic;
return spn;
})()
};
some_fn = function(p1, p2, p3, var_args){
var ps = var_args;
switch(arguments.length){
case 1:
return some_fn__1.call(this,p1);
case 2:
return some_fn__2.call(this,p1, p2);
case 3:
return some_fn__3.call(this,p1, p2, p3);
default:
return some_fn__4.cljm$lang$arity$variadic(p1, p2, p3, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
some_fn.cljm$lang$maxFixedArity = 3;
some_fn.cljm$lang$applyTo = some_fn__4.cljm$lang$applyTo;
some_fn.cljm$lang$arity$1 = some_fn__1;
some_fn.cljm$lang$arity$2 = some_fn__2;
some_fn.cljm$lang$arity$3 = some_fn__3;
some_fn.cljm$lang$arity$variadic = some_fn__4.cljm$lang$arity$variadic;
return some_fn;
})()
;
/**
* Returns a lazy sequence consisting of the result of applying f to the
* set of first items of each coll, followed by applying f to the set
* of second items in each coll, until any one of the colls is
* exhausted.  Any remaining items in other colls are ignored. Function
* f should accept number-of-colls arguments.
*/
cljm_DOT_core_SLASH_map = (function() {
var map = null;
var map__2 = ^id(id f, id coll) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
var map__3 = ^id(id f, id c1, id c2) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
var map__4 = ^id(id f, id c1, id c2, id c3) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
var map__5 = ^id(id cljm__varargs, id f, id c1, id c2, id c3, ...) {
NSMutableArray *colls = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[colls addObject:cljm__currentObject];
}
va_end(cljm__args);
id step__5549 = ^id(id cs) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
return map(^id(id p1__5363_SHARP_) {
return cljm_DOT_core_SLASH_apply(f, p1__5363_SHARP_, nil);
}, step__5549(cljm_DOT_core_SLASH_conj(colls, c3, c2, c1, nil)), nil);
};
map = function(f, c1, c2, c3, var_args){
var colls = var_args;
switch(arguments.length){
case 2:
return map__2.call(this,f, c1);
case 3:
return map__3.call(this,f, c1, c2);
case 4:
return map__4.call(this,f, c1, c2, c3);
default:
return map__5.cljm$lang$arity$variadic(f, c1, c2, c3, cljm.core.array_seq(arguments, 4));
}
throw('Invalid arity: ' + arguments.length);
};
map.cljm$lang$maxFixedArity = 4;
map.cljm$lang$applyTo = map__5.cljm$lang$applyTo;
map.cljm$lang$arity$2 = map__2;
map.cljm$lang$arity$3 = map__3;
map.cljm$lang$arity$4 = map__4;
map.cljm$lang$arity$variadic = map__5.cljm$lang$arity$variadic;
return map;
})()
;
/**
* Returns a lazy sequence of the first n items in coll, or all items if
* there are fewer than n.
*/
cljm_DOT_core_SLASH_take = ^id(id n, id coll) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
/**
* Returns a lazy sequence of all but the first n items in coll.
*/
cljm_DOT_core_SLASH_drop = ^id(id n, id coll) {
id step__5559 = ^id(id n, id coll) {
while(YES) {
id s__5557 = cljm_DOT_core_SLASH_seq(coll);
if(cljm_truthy({id and__3822__auto____5558 = (n > @0);
if(cljm_truthy(and__3822__auto____5558)) {
return s__5557;

} else {
return and__3822__auto____5558;

}
})) {
{
var G__5560 = (n - @1);
var G__5561 = cljm_DOT_core_SLASH_rest(s__5557);
n = G__5560;
coll = G__5561;
continue;
}

} else {
return s__5557;

}
break;
}
};
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
/**
* Return a lazy sequence of all but the last n (default 1) items in coll
*/
cljm_DOT_core_SLASH_drop_last = (function() {
var drop_last = null;
var drop_last__1 = ^id(id s) {
return drop_last(@1, s);
};
var drop_last__2 = ^id(id n, id s) {
return cljm_DOT_core_SLASH_map(^id(id x, id _) {
return x;
}, s, cljm_DOT_core_SLASH_drop(n, s), nil);
};
drop_last = function(n, s){
switch(arguments.length){
case 1:
return drop_last__1.call(this,n);
case 2:
return drop_last__2.call(this,n, s);
}
throw('Invalid arity: ' + arguments.length);
};
drop_last.cljm$lang$arity$1 = drop_last__1;
drop_last.cljm$lang$arity$2 = drop_last__2;
return drop_last;
})()
;
/**
* Returns a seq of the last n items in coll.  Depending on the type
* of coll may be no better than linear time.  For vectors, see also subvec.
*/
cljm_DOT_core_SLASH_take_last = ^id(id n, id coll) {
id s__5564 = cljm_DOT_core_SLASH_seq(coll);
id lead__5565 = cljm_DOT_core_SLASH_seq(cljm_DOT_core_SLASH_drop(n, coll));
while(YES) {
if(cljm_truthy(lead__5565)) {
{
var G__5566 = cljm_DOT_core_SLASH_next(s__5564);
var G__5567 = cljm_DOT_core_SLASH_next(lead__5565);
s__5564 = G__5566;
lead__5565 = G__5567;
continue;
}

} else {
return s__5564;

}
break;
}
};
/**
* Returns a lazy sequence of the items in coll starting from the first
* item for which (pred item) returns nil.
*/
cljm_DOT_core_SLASH_drop_while = ^id(id pred, id coll) {
id step__5573 = ^id(id pred, id coll) {
while(YES) {
id s__5571 = cljm_DOT_core_SLASH_seq(coll);
if(cljm_truthy({id and__3822__auto____5572 = s__5571;
if(cljm_truthy(and__3822__auto____5572)) {
return pred(cljm_DOT_core_SLASH_first(s__5571));

} else {
return and__3822__auto____5572;

}
})) {
{
var G__5574 = pred;
var G__5575 = cljm_DOT_core_SLASH_rest(s__5571);
pred = G__5574;
coll = G__5575;
continue;
}

} else {
return s__5571;

}
break;
}
};
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
/**
* Returns a lazy (infinite!) sequence of repetitions of the items in coll.
*/
cljm_DOT_core_SLASH_cycle = ^id(id coll) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
/**
* Returns a vector of [(take n coll) (drop n coll)]
*/
cljm_DOT_core_SLASH_split_at = ^id(id n, id coll) {
return @[ cljm_DOT_core_SLASH_take(n, coll), cljm_DOT_core_SLASH_drop(n, coll) ];
};
/**
* Returns a lazy (infinite!, or length n if supplied) sequence of xs.
*/
cljm_DOT_core_SLASH_repeat = (function() {
var repeat = null;
var repeat__1 = ^id(id x) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
var repeat__2 = ^id(id n, id x) {
return cljm_DOT_core_SLASH_take(n, repeat(x));
};
repeat = function(n, x){
switch(arguments.length){
case 1:
return repeat__1.call(this,n);
case 2:
return repeat__2.call(this,n, x);
}
throw('Invalid arity: ' + arguments.length);
};
repeat.cljm$lang$arity$1 = repeat__1;
repeat.cljm$lang$arity$2 = repeat__2;
return repeat;
})()
;
/**
* Returns a lazy seq of n xs.
*/
cljm_DOT_core_SLASH_replicate = ^id(id n, id x) {
return cljm_DOT_core_SLASH_take(n, cljm_DOT_core_SLASH_repeat(x));
};
/**
* Takes a function of no args, presumably with side effects, and
* returns an infinite (or length n if supplied) lazy sequence of calls
* to it
*/
cljm_DOT_core_SLASH_repeatedly = (function() {
var repeatedly = null;
var repeatedly__1 = ^id(id f) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
var repeatedly__2 = ^id(id n, id f) {
return cljm_DOT_core_SLASH_take(n, repeatedly(f));
};
repeatedly = function(n, f){
switch(arguments.length){
case 1:
return repeatedly__1.call(this,n);
case 2:
return repeatedly__2.call(this,n, f);
}
throw('Invalid arity: ' + arguments.length);
};
repeatedly.cljm$lang$arity$1 = repeatedly__1;
repeatedly.cljm$lang$arity$2 = repeatedly__2;
return repeatedly;
})()
;
/**
* Returns a lazy sequence of x, (f x), (f (f x)) etc. f must be free of side-effects
*/
cljm_DOT_core_SLASH_iterate = ^id(id f, id x) {
return cljm_DOT_core_SLASH_cons(x, [cljm_DOT_core_SLASH_LazySeq alloc]);
};
/**
* Returns a lazy seq of the first item in each coll, then the second etc.
*/
cljm_DOT_core_SLASH_interleave = (function() {
var interleave = null;
var interleave__2 = ^id(id c1, id c2) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
var interleave__3 = ^id(id cljm__varargs, id c1, id c2, ...) {
NSMutableArray *colls = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[colls addObject:cljm__currentObject];
}
va_end(cljm__args);
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
interleave = function(c1, c2, var_args){
var colls = var_args;
switch(arguments.length){
case 2:
return interleave__2.call(this,c1, c2);
default:
return interleave__3.cljm$lang$arity$variadic(c1, c2, cljm.core.array_seq(arguments, 2));
}
throw('Invalid arity: ' + arguments.length);
};
interleave.cljm$lang$maxFixedArity = 2;
interleave.cljm$lang$applyTo = interleave__3.cljm$lang$applyTo;
interleave.cljm$lang$arity$2 = interleave__2;
interleave.cljm$lang$arity$variadic = interleave__3.cljm$lang$arity$variadic;
return interleave;
})()
;
/**
* Returns a lazy seq of the elements of coll separated by sep
*/
cljm_DOT_core_SLASH_interpose = ^id(id sep, id coll) {
return cljm_DOT_core_SLASH_drop(@1, cljm_DOT_core_SLASH_interleave(cljm_DOT_core_SLASH_repeat(sep), coll, nil));
};
/**
* Take a collection of collections, and return a lazy seq
* of items from the inner collection
*/
cljm_DOT_core_SLASH_flatten1 = ^id(id colls) {
id cat__5597 = ^id(id coll, id colls) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
return cat__5597(nil, colls);
};
/**
* Returns the result of applying concat to the result of applying map
* to f and colls.  Thus function f should return a collection.
*/
cljm_DOT_core_SLASH_mapcat = (function() {
var mapcat = null;
var mapcat__2 = ^id(id f, id coll) {
return cljm_DOT_core_SLASH_flatten1(cljm_DOT_core_SLASH_map(f, coll, nil));
};
var mapcat__3 = ^id(id cljm__varargs, id f, id coll, ...) {
NSMutableArray *colls = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[colls addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_flatten1(cljm_DOT_core_SLASH_apply(cljm_DOT_core_SLASH_map, f, coll, colls, nil));
};
mapcat = function(f, coll, var_args){
var colls = var_args;
switch(arguments.length){
case 2:
return mapcat__2.call(this,f, coll);
default:
return mapcat__3.cljm$lang$arity$variadic(f, coll, cljm.core.array_seq(arguments, 2));
}
throw('Invalid arity: ' + arguments.length);
};
mapcat.cljm$lang$maxFixedArity = 2;
mapcat.cljm$lang$applyTo = mapcat__3.cljm$lang$applyTo;
mapcat.cljm$lang$arity$2 = mapcat__2;
mapcat.cljm$lang$arity$variadic = mapcat__3.cljm$lang$arity$variadic;
return mapcat;
})()
;
/**
* Returns a lazy sequence of the items in coll for which
* (pred item) returns true. pred must be free of side-effects.
*/
cljm_DOT_core_SLASH_filter = ^id(id pred, id coll) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
/**
* Returns a lazy sequence of the items in coll for which
* (pred item) returns false. pred must be free of side-effects.
*/
cljm_DOT_core_SLASH_remove = ^id(id pred, id coll) {
return cljm_DOT_core_SLASH_filter(cljm_DOT_core_SLASH_complement(pred), coll);
};
/**
* Returns a lazy sequence of the nodes in a tree, via a depth-first walk.
* branch? must be a fn of one arg that returns true if passed a node
* that can have children (but may not).  children must be a fn of one
* arg that returns a sequence of the children. Will only be called on
* nodes for which branch? returns true. Root is the root node of the
* tree.
*/
cljm_DOT_core_SLASH_tree_seq = ^id(id branch_QMARK_, id children, id root) {
id walk__5618 = ^id(id node) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
return walk__5618(root);
};
/**
* Takes any nested combination of sequential things (lists, vectors,
* etc.) and returns their contents as a single, flat sequence.
* (flatten nil) returns nil.
*/
cljm_DOT_core_SLASH_flatten = ^id(id x) {
return cljm_DOT_core_SLASH_filter(^id(id p1__5616_SHARP_) {
return cljm_DOT_core_SLASH_not(cljm_DOT_core_SLASH_sequential_QMARK_(p1__5616_SHARP_));
}, cljm_DOT_core_SLASH_rest(cljm_DOT_core_SLASH_tree_seq(cljm_DOT_core_SLASH_sequential_QMARK_, cljm_DOT_core_SLASH_seq, x)));
};
/**
* Returns a new coll consisting of to-coll with all of the items of
* from-coll conjoined.
*/
cljm_DOT_core_SLASH_into = ^id(id to, id from) {
if(cljm_truthy({id G__5622__5623 = to;
if(cljm_truthy(G__5622__5623)) {
if(cljm_truthy({id or__3824__auto____5624 = (G__5622__5623.cljm$lang$protocol_mask$partition1$ & @1);
if(cljm_truthy(or__3824__auto____5624)) {
return or__3824__auto____5624;

} else {
return G__5622__5623.cljm$core$IEditableCollection$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__5622__5623.cljm$lang$protocol_mask$partition1$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IEditableCollection, G__5622__5623);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IEditableCollection, G__5622__5623);

}
})) {
return cljm_DOT_core_SLASH_persistent_BANG_(cljm_DOT_core_SLASH_reduce(cljm_DOT_core_SLASH__conj_BANG_, cljm_DOT_core_SLASH_transient(to), from));

} else {
return cljm_DOT_core_SLASH_reduce(cljm_DOT_core_SLASH__conj, to, from);

}
};
/**
* Returns a vector consisting of the result of applying f to the
* set of first items of each coll, followed by applying f to the set
* of second items in each coll, until any one of the colls is
* exhausted.  Any remaining items in other colls are ignored. Function
* f should accept number-of-colls arguments.
*/
cljm_DOT_core_SLASH_mapv = (function() {
var mapv = null;
var mapv__2 = ^id(id f, id coll) {
return cljm_DOT_core_SLASH_persistent_BANG_(cljm_DOT_core_SLASH_reduce(^id(id v, id o) {
return cljm_DOT_core_SLASH_conj_BANG_(v, f(o));
}, cljm_DOT_core_SLASH_transient(@[]), coll));
};
var mapv__3 = ^id(id f, id c1, id c2) {
return cljm_DOT_core_SLASH_into(@[], cljm_DOT_core_SLASH_map(f, c1, c2, nil));
};
var mapv__4 = ^id(id f, id c1, id c2, id c3) {
return cljm_DOT_core_SLASH_into(@[], cljm_DOT_core_SLASH_map(f, c1, c2, c3, nil));
};
var mapv__5 = ^id(id cljm__varargs, id f, id c1, id c2, id c3, ...) {
NSMutableArray *colls = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[colls addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_into(@[], cljm_DOT_core_SLASH_apply(cljm_DOT_core_SLASH_map, f, c1, c2, c3, colls, nil));
};
mapv = function(f, c1, c2, c3, var_args){
var colls = var_args;
switch(arguments.length){
case 2:
return mapv__2.call(this,f, c1);
case 3:
return mapv__3.call(this,f, c1, c2);
case 4:
return mapv__4.call(this,f, c1, c2, c3);
default:
return mapv__5.cljm$lang$arity$variadic(f, c1, c2, c3, cljm.core.array_seq(arguments, 4));
}
throw('Invalid arity: ' + arguments.length);
};
mapv.cljm$lang$maxFixedArity = 4;
mapv.cljm$lang$applyTo = mapv__5.cljm$lang$applyTo;
mapv.cljm$lang$arity$2 = mapv__2;
mapv.cljm$lang$arity$3 = mapv__3;
mapv.cljm$lang$arity$4 = mapv__4;
mapv.cljm$lang$arity$variadic = mapv__5.cljm$lang$arity$variadic;
return mapv;
})()
;
/**
* Returns a vector of the items in coll for which
* (pred item) returns true. pred must be free of side-effects.
*/
cljm_DOT_core_SLASH_filterv = ^id(id pred, id coll) {
return cljm_DOT_core_SLASH_persistent_BANG_(cljm_DOT_core_SLASH_reduce(^id(id v, id o) {
if(cljm_truthy(pred(o))) {
return cljm_DOT_core_SLASH_conj_BANG_(v, o);

} else {
return v;

}
}, cljm_DOT_core_SLASH_transient(@[]), coll));
};
/**
* Returns a lazy sequence of lists of n items each, at offsets step
* apart. If step is not supplied, defaults to n, i.e. the partitions
* do not overlap. If a pad collection is supplied, use its elements as
* necessary to complete last partition upto n items. In case there are
* not enough padding elements, return a partition with less than n items.
*/
cljm_DOT_core_SLASH_partition = (function() {
var partition = null;
var partition__2 = ^id(id n, id coll) {
return partition(n, n, coll);
};
var partition__3 = ^id(id n, id step, id coll) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
var partition__4 = ^id(id n, id step, id pad, id coll) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
partition = function(n, step, pad, coll){
switch(arguments.length){
case 2:
return partition__2.call(this,n, step);
case 3:
return partition__3.call(this,n, step, pad);
case 4:
return partition__4.call(this,n, step, pad, coll);
}
throw('Invalid arity: ' + arguments.length);
};
partition.cljm$lang$arity$2 = partition__2;
partition.cljm$lang$arity$3 = partition__3;
partition.cljm$lang$arity$4 = partition__4;
return partition;
})()
;
/**
* Returns the value in a nested associative structure,
* where ks is a sequence of keys. Returns nil if the key is not present,
* or the not-found value if supplied.
*/
cljm_DOT_core_SLASH_get_in = (function() {
var get_in = null;
var get_in__2 = ^id(id m, id ks) {
return cljm_DOT_core_SLASH_reduce(cljm_DOT_core_SLASH_get, m, ks);
};
var get_in__3 = ^id(id m, id ks, id not_found) {
id sentinel__5641 = cljm_DOT_core_SLASH_lookup_sentinel;
id m__5642 = m;
id ks__5643 = cljm_DOT_core_SLASH_seq(ks);
while(YES) {
if(cljm_truthy(ks__5643)) {
id m__5644 = cljm_DOT_core_SLASH__lookup(m__5642, cljm_DOT_core_SLASH_first(ks__5643), sentinel__5641);
if(cljm_truthy(([sentinel__5641 isEqual:m__5644]))) {
return not_found;

} else {
{
var G__5645 = sentinel__5641;
var G__5646 = m__5644;
var G__5647 = cljm_DOT_core_SLASH_next(ks__5643);
sentinel__5641 = G__5645;
m__5642 = G__5646;
ks__5643 = G__5647;
continue;
}

}

} else {
return m__5642;

}
break;
}
};
get_in = function(m, ks, not_found){
switch(arguments.length){
case 2:
return get_in__2.call(this,m, ks);
case 3:
return get_in__3.call(this,m, ks, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
get_in.cljm$lang$arity$2 = get_in__2;
get_in.cljm$lang$arity$3 = get_in__3;
return get_in;
})()
;
/**
* Associates a value in a nested associative structure, where ks is a
* sequence of keys and v is the new value and returns a new nested structure.
* If any levels do not exist, hash-maps will be created.
*/
cljm_DOT_core_SLASH_assoc_in = ^id(id m, id p__5648, id v) {
id vec__5653__5654 = p__5648;
id k__5655 = cljm_DOT_core_SLASH_nth(vec__5653__5654, @0, nil);
id ks__5656 = cljm_DOT_core_SLASH_nthnext(vec__5653__5654, @1);
if(cljm_truthy(ks__5656)) {
return cljm_DOT_core_SLASH_assoc(m, k__5655, assoc_in(cljm_DOT_core_SLASH__lookup(m, k__5655, nil), ks__5656, v), nil);

} else {
return cljm_DOT_core_SLASH_assoc(m, k__5655, v, nil);

}
};
/**
* 'Updates' a value in a nested associative structure, where ks is a
* sequence of keys and f is a function that will take the old value
* and any supplied args and return the new value, and returns a new
* nested structure.  If any levels do not exist, hash-maps will be
* created.
*/
cljm_DOT_core_SLASH_update_in = ^id(id cljm__varargs, id m, id p__5657, id f, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
id vec__5662__5663 = p__5657;
id k__5664 = cljm_DOT_core_SLASH_nth(vec__5662__5663, @0, nil);
id ks__5665 = cljm_DOT_core_SLASH_nthnext(vec__5662__5663, @1);
if(cljm_truthy(ks__5665)) {
return cljm_DOT_core_SLASH_assoc(m, k__5664, cljm_DOT_core_SLASH_apply(update_in, cljm_DOT_core_SLASH__lookup(m, k__5664, nil), ks__5665, f, args, nil), nil);

} else {
return cljm_DOT_core_SLASH_assoc(m, k__5664, cljm_DOT_core_SLASH_apply(f, cljm_DOT_core_SLASH__lookup(m, k__5664, nil), args, nil), nil);

}
};

/**
* @constructor
*/
cljm_DOT_core_SLASH_Vector = (function (meta, array, __hash){
this.meta = meta;
this.array = array;
this.__hash = __hash;
this.cljm$lang$protocol_mask$partition1$ = 0;
this.cljm$lang$protocol_mask$partition0$ = 32400159;
})
cljm_DOT_core_SLASH_Vector.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_Vector.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/Vector", nil);
};
cljm_DOT_core_SLASH_Vector.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__5668 = this;
id h__1314__auto____5669 = this__5668_DOT___hash;
if(cljm_truthy(cljm_DOT_core_SLASH_not((h__1314__auto____5669 == nil)))) {
return h__1314__auto____5669;

} else {
id h__1314__auto____5670 = cljm_DOT_core_SLASH_hash_coll(coll);
this__5668_DOT___hash = h__1314__auto____5670;
return h__1314__auto____5670;

}
};
cljm_DOT_core_SLASH_Vector.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id coll, id k) {
var this__5671 = this;
return cljm_DOT_core_SLASH__nth(coll, k, nil);
};
cljm_DOT_core_SLASH_Vector.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id coll, id k, id not_found) {
var this__5672 = this;
return cljm_DOT_core_SLASH__nth(coll, k, not_found);
};
cljm_DOT_core_SLASH_Vector.prototype.cljm$core$IAssociative$_assoc$arity$3 = ^id(id coll, id k, id v) {
var this__5673 = this;
id new_array__5674 = this__5673_DOT_array.slice();
(new_array__5674[k] = v);
return [cljm_DOT_core_SLASH_Vector alloc];
};
cljm_DOT_core_SLASH_Vector.prototype.call = (function() {
var G__5705 = null;
var G__5705__2 = ^id(id this_sym5675, id k) {
var this__5677 = this;
id this_sym5675__5678 = this;
id coll__5679 = this_sym5675__5678;
return cljm_DOT_core_SLASH__lookup(coll__5679, k);
};
var G__5705__3 = ^id(id this_sym5676, id k, id not_found) {
var this__5677 = this;
id this_sym5676__5680 = this;
id coll__5681 = this_sym5676__5680;
return cljm_DOT_core_SLASH__lookup(coll__5681, k, not_found);
};
G__5705 = function(this_sym5676, k, not_found){
switch(arguments.length){
case 2:
return G__5705__2.call(this,this_sym5676, k);
case 3:
return G__5705__3.call(this,this_sym5676, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__5705;
})()
;
cljm_DOT_core_SLASH_Vector.prototype.apply = ^id(id this_sym5666, id args5667) {
var this__5682 = this;
return [this_sym5666.call applythis_sym5666, [@[this_sym5666] concatargs5667.slice()], nil];
};
cljm_DOT_core_SLASH_Vector.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id o) {
var this__5683 = this;
id new_array__5684 = this__5683_DOT_array.slice();
[new_array__5684 pusho];
return [cljm_DOT_core_SLASH_Vector alloc];
};
cljm_DOT_core_SLASH_Vector.prototype.toString = ^id() {
var this__5685 = this;
id this__5686 = this;
return cljm_DOT_core_SLASH_pr_str(this__5686, nil);
};
cljm_DOT_core_SLASH_Vector.prototype.cljm$core$IReduce$_reduce$arity$2 = ^id(id v, id f) {
var this__5687 = this;
return cljm_DOT_core_SLASH_ci_reduce(this__5687_DOT_array, f);
};
cljm_DOT_core_SLASH_Vector.prototype.cljm$core$IReduce$_reduce$arity$3 = ^id(id v, id f, id start) {
var this__5688 = this;
return cljm_DOT_core_SLASH_ci_reduce(this__5688_DOT_array, f, start);
};
cljm_DOT_core_SLASH_Vector.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id coll) {
var this__5689 = this;
if(cljm_truthy((this__5689_DOT_array.length > @0))) {
id vector_seq__5690 = ^id(id i) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
return vector_seq__5690(@0);

} else {
return nil;

}
};
cljm_DOT_core_SLASH_Vector.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__5691 = this;
return this__5691_DOT_array.length;
};
cljm_DOT_core_SLASH_Vector.prototype.cljm$core$IStack$_peek$arity$1 = ^id(id coll) {
var this__5692 = this;
id count__5693 = this__5692_DOT_array.length;
if(cljm_truthy((count__5693 > @0))) {
return (this__5692_DOT_array[(count__5693 - @1)]);

} else {
return nil;

}
};
cljm_DOT_core_SLASH_Vector.prototype.cljm$core$IStack$_pop$arity$1 = ^id(id coll) {
var this__5694 = this;
if(cljm_truthy((this__5694_DOT_array.length > @0))) {
id new_array__5695 = this__5694_DOT_array.slice();
[new_array__5695 pop];
return [cljm_DOT_core_SLASH_Vector alloc];

} else {
throw [Error alloc];

}
};
cljm_DOT_core_SLASH_Vector.prototype.cljm$core$IVector$_assoc_n$arity$3 = ^id(id coll, id n, id val) {
var this__5696 = this;
return cljm_DOT_core_SLASH__assoc(coll, n, val);
};
cljm_DOT_core_SLASH_Vector.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__5697 = this;
return cljm_DOT_core_SLASH_equiv_sequential(coll, other);
};
cljm_DOT_core_SLASH_Vector.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__5698 = this;
return [cljm_DOT_core_SLASH_Vector alloc];
};
cljm_DOT_core_SLASH_Vector.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__5699 = this;
return this__5699_DOT_meta;
};
cljm_DOT_core_SLASH_Vector.prototype.cljm$core$IIndexed$_nth$arity$2 = ^id(id coll, id n) {
var this__5700 = this;
if(cljm_truthy({id and__3822__auto____5701 = (@0 <= n);
if(cljm_truthy(and__3822__auto____5701)) {
return (n < this__5700_DOT_array.length);

} else {
return and__3822__auto____5701;

}
})) {
return (this__5700_DOT_array[n]);

} else {
return nil;

}
};
cljm_DOT_core_SLASH_Vector.prototype.cljm$core$IIndexed$_nth$arity$3 = ^id(id coll, id n, id not_found) {
var this__5702 = this;
if(cljm_truthy({id and__3822__auto____5703 = (@0 <= n);
if(cljm_truthy(and__3822__auto____5703)) {
return (n < this__5702_DOT_array.length);

} else {
return and__3822__auto____5703;

}
})) {
return (this__5702_DOT_array[n]);

} else {
return not_found;

}
};
cljm_DOT_core_SLASH_Vector.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__5704 = this;
return cljm_DOT_core_SLASH_with_meta(cljs_DOT_core_DOT_Vector_SLASH_EMPTY, this__5704_DOT_meta);
};
cljm_DOT_core_SLASH_Vector;
cljs_DOT_core_DOT_Vector_SLASH_EMPTY = [cljm_DOT_core_SLASH_Vector alloc];
cljs_DOT_core_DOT_Vector_SLASH_fromArray = ^id(id xs) {
return [cljm_DOT_core_SLASH_Vector alloc];
};

/**
* @constructor
*/
cljm_DOT_core_SLASH_VectorNode = (function (edit, arr){
this.edit = edit;
this.arr = arr;
})
cljm_DOT_core_SLASH_VectorNode.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_VectorNode.cljm$lang$ctorPrSeq = ^id(id this__1432__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/VectorNode", nil);
};
cljm_DOT_core_SLASH_VectorNode;
cljm_DOT_core_SLASH_pv_fresh_node = ^id(id edit) {
return [cljm_DOT_core_SLASH_VectorNode alloc];
};
cljm_DOT_core_SLASH_pv_aget = ^id(id node, id idx) {
return (node.arr[idx]);
};
cljm_DOT_core_SLASH_pv_aset = ^id(id node, id idx, id val) {
return (node.arr[idx] = val);
};
cljm_DOT_core_SLASH_pv_clone_node = ^id(id node) {
return [cljm_DOT_core_SLASH_VectorNode alloc];
};
cljm_DOT_core_SLASH_tail_off = ^id(id pv) {
id cnt__5707 = pv.cnt;
if(cljm_truthy((cnt__5707 < @32))) {
return @0;

} else {
return (((cnt__5707 - @1) >>> @5) << @5);

}
};
cljm_DOT_core_SLASH_new_path = ^id(id edit, id level, id node) {
id ll__5713 = level;
id ret__5714 = node;
while(YES) {
if(cljm_truthy(([ll__5713 isEqual:@0]))) {
return ret__5714;

} else {
id embed__5715 = ret__5714;
id r__5716 = cljm_DOT_core_SLASH_pv_fresh_node(edit);
id ___5717 = cljm_DOT_core_SLASH_pv_aset(r__5716, @0, embed__5715);
{
var G__5718 = (ll__5713 - @5);
var G__5719 = r__5716;
ll__5713 = G__5718;
ret__5714 = G__5719;
continue;
}

}
break;
}
};
cljm_DOT_core_SLASH_push_tail = ^id(id pv, id level, id parent, id tailnode) {
id ret__5725 = cljm_DOT_core_SLASH_pv_clone_node(parent);
id subidx__5726 = (((pv.cnt - @1) >>> level) & @31);
if(cljm_truthy(([@5 isEqual:level]))) {
cljm_DOT_core_SLASH_pv_aset(ret__5725, subidx__5726, tailnode);
return ret__5725;

} else {
id child__5727 = cljm_DOT_core_SLASH_pv_aget(parent, subidx__5726);
if(cljm_truthy(cljm_DOT_core_SLASH_not((child__5727 == nil)))) {
id node_to_insert__5728 = push_tail(pv, (level - @5), child__5727, tailnode);
cljm_DOT_core_SLASH_pv_aset(ret__5725, subidx__5726, node_to_insert__5728);
return ret__5725;

} else {
id node_to_insert__5729 = cljm_DOT_core_SLASH_new_path(nil, (level - @5), tailnode);
cljm_DOT_core_SLASH_pv_aset(ret__5725, subidx__5726, node_to_insert__5729);
return ret__5725;

}

}
};
cljm_DOT_core_SLASH_array_for = ^id(id pv, id i) {
if(cljm_truthy({id and__3822__auto____5733 = (@0 <= i);
if(cljm_truthy(and__3822__auto____5733)) {
return (i < pv.cnt);

} else {
return and__3822__auto____5733;

}
})) {
if(cljm_truthy((i >= cljm_DOT_core_SLASH_tail_off(pv)))) {
return pv.tail;

} else {
id node__5734 = pv.root;
id level__5735 = pv.shift;
while(YES) {
if(cljm_truthy((level__5735 > @0))) {
{
var G__5736 = cljm_DOT_core_SLASH_pv_aget(node__5734, ((i >>> level__5735) & @31));
var G__5737 = (level__5735 - @5);
node__5734 = G__5736;
level__5735 = G__5737;
continue;
}

} else {
return node__5734.arr;

}
break;
}

}

} else {
throw [Error alloc];

}
};
cljm_DOT_core_SLASH_do_assoc = ^id(id pv, id level, id node, id i, id val) {
id ret__5740 = cljm_DOT_core_SLASH_pv_clone_node(node);
if(cljm_truthy(([level isEqual:@0]))) {
cljm_DOT_core_SLASH_pv_aset(ret__5740, (i & @31), val);
return ret__5740;

} else {
id subidx__5741 = ((i >>> level) & @31);
cljm_DOT_core_SLASH_pv_aset(ret__5740, subidx__5741, do_assoc(pv, (level - @5), cljm_DOT_core_SLASH_pv_aget(node, subidx__5741), i, val));
return ret__5740;

}
};
cljm_DOT_core_SLASH_pop_tail = ^id(id pv, id level, id node) {
id subidx__5747 = (((pv.cnt - @2) >>> level) & @31);
if(cljm_truthy((level > @5))) {
id new_child__5748 = pop_tail(pv, (level - @5), cljm_DOT_core_SLASH_pv_aget(node, subidx__5747));
if(cljm_truthy({id and__3822__auto____5749 = (new_child__5748 == nil);
if(cljm_truthy(and__3822__auto____5749)) {
return ([subidx__5747 isEqual:@0]);

} else {
return and__3822__auto____5749;

}
})) {
return nil;

} else {
id ret__5750 = cljm_DOT_core_SLASH_pv_clone_node(node);
cljm_DOT_core_SLASH_pv_aset(ret__5750, subidx__5747, new_child__5748);
return ret__5750;

}

} else {
if(cljm_truthy(([subidx__5747 isEqual:@0]))) {
return nil;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
id ret__5751 = cljm_DOT_core_SLASH_pv_clone_node(node);
cljm_DOT_core_SLASH_pv_aset(ret__5751, subidx__5747, nil);
return ret__5751;

} else {
return nil;

}

}

}
};

/**
* @constructor
*/
cljm_DOT_core_SLASH_PersistentVector = (function (meta, cnt, shift, root, tail, __hash){
this.meta = meta;
this.cnt = cnt;
this.shift = shift;
this.root = root;
this.tail = tail;
this.__hash = __hash;
this.cljm$lang$protocol_mask$partition1$ = 1;
this.cljm$lang$protocol_mask$partition0$ = 167668511;
})
cljm_DOT_core_SLASH_PersistentVector.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_PersistentVector.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/PersistentVector", nil);
};
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$IEditableCollection$_as_transient$arity$1 = ^id(id coll) {
var this__5754 = this;
return [cljm_DOT_core_SLASH_TransientVector alloc];
};
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__5755 = this;
id h__1314__auto____5756 = this__5755_DOT___hash;
if(cljm_truthy(cljm_DOT_core_SLASH_not((h__1314__auto____5756 == nil)))) {
return h__1314__auto____5756;

} else {
id h__1314__auto____5757 = cljm_DOT_core_SLASH_hash_coll(coll);
this__5755_DOT___hash = h__1314__auto____5757;
return h__1314__auto____5757;

}
};
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id coll, id k) {
var this__5758 = this;
return cljm_DOT_core_SLASH__nth(coll, k, nil);
};
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id coll, id k, id not_found) {
var this__5759 = this;
return cljm_DOT_core_SLASH__nth(coll, k, not_found);
};
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$IAssociative$_assoc$arity$3 = ^id(id coll, id k, id v) {
var this__5760 = this;
if(cljm_truthy({id and__3822__auto____5761 = (@0 <= k);
if(cljm_truthy(and__3822__auto____5761)) {
return (k < this__5760_DOT_cnt);

} else {
return and__3822__auto____5761;

}
})) {
if(cljm_truthy((cljm_DOT_core_SLASH_tail_off(coll) <= k))) {
id new_tail__5762 = this__5760_DOT_tail.slice();
(new_tail__5762[(k & @31)] = v);
return [cljm_DOT_core_SLASH_PersistentVector alloc];

} else {
return [cljm_DOT_core_SLASH_PersistentVector alloc];

}

} else {
if(cljm_truthy(([k isEqual:this__5760_DOT_cnt]))) {
return cljm_DOT_core_SLASH__conj(coll, v);

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
throw [Error alloc];

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_PersistentVector.prototype.call = (function() {
var G__5810 = null;
var G__5810__2 = ^id(id this_sym5763, id k) {
var this__5765 = this;
id this_sym5763__5766 = this;
id coll__5767 = this_sym5763__5766;
return cljm_DOT_core_SLASH__lookup(coll__5767, k);
};
var G__5810__3 = ^id(id this_sym5764, id k, id not_found) {
var this__5765 = this;
id this_sym5764__5768 = this;
id coll__5769 = this_sym5764__5768;
return cljm_DOT_core_SLASH__lookup(coll__5769, k, not_found);
};
G__5810 = function(this_sym5764, k, not_found){
switch(arguments.length){
case 2:
return G__5810__2.call(this,this_sym5764, k);
case 3:
return G__5810__3.call(this,this_sym5764, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__5810;
})()
;
cljm_DOT_core_SLASH_PersistentVector.prototype.apply = ^id(id this_sym5752, id args5753) {
var this__5770 = this;
return [this_sym5752.call applythis_sym5752, [@[this_sym5752] concatargs5753.slice()], nil];
};
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$IKVReduce$_kv_reduce$arity$3 = ^id(id v, id f, id init) {
var this__5771 = this;
id step_init__5772 = @[@0,init];
id i__5773 = @0;
while(YES) {
if(cljm_truthy((i__5773 < this__5771_DOT_cnt))) {
id arr__5774 = cljm_DOT_core_SLASH_array_for(v, i__5773);
id len__5775 = arr__5774.length;
id init__5779 = {id j__5776 = @0;
id init__5777 = (step_init__5772[@1]);
while(YES) {
if(cljm_truthy((j__5776 < len__5775))) {
id init__5778 = f(init__5777, (j__5776 + i__5773), (arr__5774[j__5776]));
if(cljm_truthy(cljm_DOT_core_SLASH_reduced_QMARK_(init__5778))) {
return init__5778;

} else {
{
var G__5811 = (j__5776 + @1);
var G__5812 = init__5778;
j__5776 = G__5811;
init__5777 = G__5812;
continue;
}

}

} else {
(step_init__5772[@0] = len__5775);
(step_init__5772[@1] = init__5777);
return init__5777;

}
break;
}
};
if(cljm_truthy(cljm_DOT_core_SLASH_reduced_QMARK_(init__5779))) {
return cljm_DOT_core_SLASH_deref(init__5779);

} else {
{
var G__5813 = (i__5773 + (step_init__5772[@0]));
i__5773 = G__5813;
continue;
}

}

} else {
return (step_init__5772[@1]);

}
break;
}
};
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id o) {
var this__5780 = this;
if(cljm_truthy(((this__5780_DOT_cnt - cljm_DOT_core_SLASH_tail_off(coll)) < @32))) {
id new_tail__5781 = this__5780_DOT_tail.slice();
[new_tail__5781 pusho];
return [cljm_DOT_core_SLASH_PersistentVector alloc];

} else {
id root_overflow_QMARK___5782 = ((this__5780_DOT_cnt >>> @5) > (@1 << this__5780_DOT_shift));
id new_shift__5783 = (cljm_truthy(root_overflow_QMARK___5782)) ?(this__5780_DOT_shift + @5):this__5780_DOT_shift;
id new_root__5785 = (cljm_truthy(root_overflow_QMARK___5782)) ?{id n_r__5784 = cljm_DOT_core_SLASH_pv_fresh_node(nil);
cljm_DOT_core_SLASH_pv_aset(n_r__5784, @0, this__5780_DOT_root);
cljm_DOT_core_SLASH_pv_aset(n_r__5784, @1, cljm_DOT_core_SLASH_new_path(nil, this__5780_DOT_shift, [cljm_DOT_core_SLASH_VectorNode alloc]));
return n_r__5784;
}:cljm_DOT_core_SLASH_push_tail(coll, this__5780_DOT_shift, this__5780_DOT_root, [cljm_DOT_core_SLASH_VectorNode alloc]);
return [cljm_DOT_core_SLASH_PersistentVector alloc];

}
};
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$IReversible$_rseq$arity$1 = ^id(id coll) {
var this__5786 = this;
if(cljm_truthy((this__5786_DOT_cnt > @0))) {
return [cljm_DOT_core_SLASH_RSeq alloc];

} else {
return cljm.core.List.EMPTY;

}
};
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$IMapEntry$_key$arity$1 = ^id(id coll) {
var this__5787 = this;
return cljm_DOT_core_SLASH__nth(coll, @0);
};
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$IMapEntry$_val$arity$1 = ^id(id coll) {
var this__5788 = this;
return cljm_DOT_core_SLASH__nth(coll, @1);
};
cljm_DOT_core_SLASH_PersistentVector.prototype.toString = ^id() {
var this__5789 = this;
id this__5790 = this;
return cljm_DOT_core_SLASH_pr_str(this__5790, nil);
};
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$IReduce$_reduce$arity$2 = ^id(id v, id f) {
var this__5791 = this;
return cljm_DOT_core_SLASH_ci_reduce(v, f);
};
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$IReduce$_reduce$arity$3 = ^id(id v, id f, id start) {
var this__5792 = this;
return cljm_DOT_core_SLASH_ci_reduce(v, f, start);
};
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id coll) {
var this__5793 = this;
if(cljm_truthy(([this__5793_DOT_cnt isEqual:@0]))) {
return nil;

} else {
return cljm_DOT_core_SLASH_chunked_seq(coll, @0, @0);

}
};
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__5794 = this;
return this__5794_DOT_cnt;
};
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$IStack$_peek$arity$1 = ^id(id coll) {
var this__5795 = this;
if(cljm_truthy((this__5795_DOT_cnt > @0))) {
return cljm_DOT_core_SLASH__nth(coll, (this__5795_DOT_cnt - @1));

} else {
return nil;

}
};
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$IStack$_pop$arity$1 = ^id(id coll) {
var this__5796 = this;
if(cljm_truthy(([this__5796_DOT_cnt isEqual:@0]))) {
throw [Error alloc];

} else {
if(cljm_truthy(([@1 isEqual:this__5796_DOT_cnt]))) {
return cljm_DOT_core_SLASH__with_meta(cljs_DOT_core_DOT_PersistentVector_SLASH_EMPTY, this__5796_DOT_meta);

} else {
if(cljm_truthy((@1 < (this__5796_DOT_cnt - cljm_DOT_core_SLASH_tail_off(coll))))) {
return [cljm_DOT_core_SLASH_PersistentVector alloc];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
id new_tail__5797 = cljm_DOT_core_SLASH_array_for(coll, (this__5796_DOT_cnt - @2));
id nr__5798 = cljm_DOT_core_SLASH_pop_tail(coll, this__5796_DOT_shift, this__5796_DOT_root);
id new_root__5799 = (cljm_truthy((nr__5798 == nil))) ?cljs_DOT_core_DOT_PersistentVector_SLASH_EMPTY_NODE:nr__5798;
id cnt_1__5800 = (this__5796_DOT_cnt - @1);
if(cljm_truthy({id and__3822__auto____5801 = (@5 < this__5796_DOT_shift);
if(cljm_truthy(and__3822__auto____5801)) {
return (cljm_DOT_core_SLASH_pv_aget(new_root__5799, @1) == nil);

} else {
return and__3822__auto____5801;

}
})) {
return [cljm_DOT_core_SLASH_PersistentVector alloc];

} else {
return [cljm_DOT_core_SLASH_PersistentVector alloc];

}

} else {
return nil;

}

}

}

}
};
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$IVector$_assoc_n$arity$3 = ^id(id coll, id n, id val) {
var this__5802 = this;
return cljm_DOT_core_SLASH__assoc(coll, n, val);
};
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__5803 = this;
return cljm_DOT_core_SLASH_equiv_sequential(coll, other);
};
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__5804 = this;
return [cljm_DOT_core_SLASH_PersistentVector alloc];
};
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__5805 = this;
return this__5805_DOT_meta;
};
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$IIndexed$_nth$arity$2 = ^id(id coll, id n) {
var this__5806 = this;
return (cljm_DOT_core_SLASH_array_for(coll, n)[(n & @31)]);
};
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$IIndexed$_nth$arity$3 = ^id(id coll, id n, id not_found) {
var this__5807 = this;
if(cljm_truthy({id and__3822__auto____5808 = (@0 <= n);
if(cljm_truthy(and__3822__auto____5808)) {
return (n < this__5807_DOT_cnt);

} else {
return and__3822__auto____5808;

}
})) {
return cljm_DOT_core_SLASH__nth(coll, n);

} else {
return not_found;

}
};
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__5809 = this;
return cljm_DOT_core_SLASH_with_meta(cljs_DOT_core_DOT_PersistentVector_SLASH_EMPTY, this__5809_DOT_meta);
};
cljm_DOT_core_SLASH_PersistentVector;
cljs_DOT_core_DOT_PersistentVector_SLASH_EMPTY_NODE = cljm_DOT_core_SLASH_pv_fresh_node(nil);
cljs_DOT_core_DOT_PersistentVector_SLASH_EMPTY = [cljm_DOT_core_SLASH_PersistentVector alloc];
cljs_DOT_core_DOT_PersistentVector_SLASH_fromArray = ^id(id xs, id no_clone) {
id l__5814 = [xs count];
id xs__5815 = (cljm_truthy(([no_clone isEqual:@YES]))) ?xs:xs.slice();
if(cljm_truthy((l__5814 < @32))) {
return [cljm_DOT_core_SLASH_PersistentVector alloc];

} else {
id node__5816 = [xs__5815 slice@0, @32, nil];
id v__5817 = [cljm_DOT_core_SLASH_PersistentVector alloc];
id i__5818 = @32;
id out__5819 = cljm_DOT_core_SLASH__as_transient(v__5817);
while(YES) {
if(cljm_truthy((i__5818 < l__5814))) {
{
var G__5820 = (i__5818 + @1);
var G__5821 = cljm_DOT_core_SLASH_conj_BANG_(out__5819, (xs__5815[i__5818]));
i__5818 = G__5820;
out__5819 = G__5821;
continue;
}

} else {
return cljm_DOT_core_SLASH_persistent_BANG_(out__5819);

}
break;
}

}
};
cljm_DOT_core_SLASH_vec = ^id(id coll) {
return cljm_DOT_core_SLASH__persistent_BANG_(cljm_DOT_core_SLASH_reduce(cljm_DOT_core_SLASH__conj_BANG_, cljm_DOT_core_SLASH__as_transient(cljs_DOT_core_DOT_PersistentVector_SLASH_EMPTY), coll));
};
cljm_DOT_core_SLASH_vector = ^id(id cljm__varargs, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_vec(args);
};

/**
* @constructor
*/
cljm_DOT_core_SLASH_ChunkedSeq = (function (vec, node, i, off, meta){
this.vec = vec;
this.node = node;
this.i = i;
this.off = off;
this.meta = meta;
this.cljm$lang$protocol_mask$partition1$ = 0;
this.cljm$lang$protocol_mask$partition0$ = 27525356;
})
cljm_DOT_core_SLASH_ChunkedSeq.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_ChunkedSeq.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/ChunkedSeq", nil);
};
cljm_DOT_core_SLASH_ChunkedSeq.prototype.cljm$core$INext$_next$arity$1 = ^id(id coll) {
var this__5822 = this;
if(cljm_truthy(((this__5822_DOT_off + @1) < [this__5822_DOT_node count]))) {
id s__5823 = cljm_DOT_core_SLASH_chunked_seq(this__5822_DOT_vec, this__5822_DOT_node, this__5822_DOT_i, (this__5822_DOT_off + @1));
if(cljm_truthy((s__5823 == nil))) {
return nil;

} else {
return s__5823;

}

} else {
return cljm_DOT_core_SLASH__chunked_next(coll);

}
};
cljm_DOT_core_SLASH_ChunkedSeq.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id o) {
var this__5824 = this;
return cljm_DOT_core_SLASH_cons(o, coll);
};
cljm_DOT_core_SLASH_ChunkedSeq.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id coll) {
var this__5825 = this;
return coll;
};
cljm_DOT_core_SLASH_ChunkedSeq.prototype.cljm$core$ISeq$_first$arity$1 = ^id(id coll) {
var this__5826 = this;
return (this__5826_DOT_node[this__5826_DOT_off]);
};
cljm_DOT_core_SLASH_ChunkedSeq.prototype.cljm$core$ISeq$_rest$arity$1 = ^id(id coll) {
var this__5827 = this;
if(cljm_truthy(((this__5827_DOT_off + @1) < [this__5827_DOT_node count]))) {
id s__5828 = cljm_DOT_core_SLASH_chunked_seq(this__5827_DOT_vec, this__5827_DOT_node, this__5827_DOT_i, (this__5827_DOT_off + @1));
if(cljm_truthy((s__5828 == nil))) {
return cljm.core.List.EMPTY;

} else {
return s__5828;

}

} else {
return cljm_DOT_core_SLASH__chunked_rest(coll);

}
};
cljm_DOT_core_SLASH_ChunkedSeq.prototype.cljm$core$IChunkedNext$ = @YES;
cljm_DOT_core_SLASH_ChunkedSeq.prototype.cljm$core$IChunkedNext$_chunked_next$arity$1 = ^id(id coll) {
var this__5829 = this;
id l__5830 = [this__5829_DOT_node count];
id s__5831 = (cljm_truthy(((this__5829_DOT_i + l__5830) < cljm_DOT_core_SLASH__count(this__5829_DOT_vec)))) ?cljm_DOT_core_SLASH_chunked_seq(this__5829_DOT_vec, (this__5829_DOT_i + l__5830), @0):nil;
if(cljm_truthy((s__5831 == nil))) {
return nil;

} else {
return s__5831;

}
};
cljm_DOT_core_SLASH_ChunkedSeq.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__5832 = this;
return cljm_DOT_core_SLASH_equiv_sequential(coll, other);
};
cljm_DOT_core_SLASH_ChunkedSeq.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id m) {
var this__5833 = this;
return cljm_DOT_core_SLASH_chunked_seq(this__5833_DOT_vec, this__5833_DOT_node, this__5833_DOT_i, this__5833_DOT_off, m);
};
cljm_DOT_core_SLASH_ChunkedSeq.prototype.cljm$core$IWithMeta$_meta$arity$1 = ^id(id coll) {
var this__5834 = this;
return this__5834_DOT_meta;
};
cljm_DOT_core_SLASH_ChunkedSeq.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__5835 = this;
return cljm_DOT_core_SLASH_with_meta(cljs_DOT_core_DOT_PersistentVector_SLASH_EMPTY, this__5835_DOT_meta);
};
cljm_DOT_core_SLASH_ChunkedSeq.prototype.cljm$core$IChunkedSeq$ = @YES;
cljm_DOT_core_SLASH_ChunkedSeq.prototype.cljm$core$IChunkedSeq$_chunked_first$arity$1 = ^id(id coll) {
var this__5836 = this;
return cljm_DOT_core_SLASH_array_chunk(this__5836_DOT_node, this__5836_DOT_off);
};
cljm_DOT_core_SLASH_ChunkedSeq.prototype.cljm$core$IChunkedSeq$_chunked_rest$arity$1 = ^id(id coll) {
var this__5837 = this;
id l__5838 = [this__5837_DOT_node count];
id s__5839 = (cljm_truthy(((this__5837_DOT_i + l__5838) < cljm_DOT_core_SLASH__count(this__5837_DOT_vec)))) ?cljm_DOT_core_SLASH_chunked_seq(this__5837_DOT_vec, (this__5837_DOT_i + l__5838), @0):nil;
if(cljm_truthy((s__5839 == nil))) {
return cljm.core.List.EMPTY;

} else {
return s__5839;

}
};
cljm_DOT_core_SLASH_ChunkedSeq;
cljm_DOT_core_SLASH_chunked_seq = (function() {
var chunked_seq = null;
var chunked_seq__3 = ^id(id vec, id i, id off) {
return chunked_seq(vec, cljm_DOT_core_SLASH_array_for(vec, i), i, off, nil);
};
var chunked_seq__4 = ^id(id vec, id node, id i, id off) {
return chunked_seq(vec, node, i, off, nil);
};
var chunked_seq__5 = ^id(id vec, id node, id i, id off, id meta) {
return [cljm_DOT_core_SLASH_ChunkedSeq alloc];
};
chunked_seq = function(vec, node, i, off, meta){
switch(arguments.length){
case 3:
return chunked_seq__3.call(this,vec, node, i);
case 4:
return chunked_seq__4.call(this,vec, node, i, off);
case 5:
return chunked_seq__5.call(this,vec, node, i, off, meta);
}
throw('Invalid arity: ' + arguments.length);
};
chunked_seq.cljm$lang$arity$3 = chunked_seq__3;
chunked_seq.cljm$lang$arity$4 = chunked_seq__4;
chunked_seq.cljm$lang$arity$5 = chunked_seq__5;
return chunked_seq;
})()
;

/**
* @constructor
*/
cljm_DOT_core_SLASH_Subvec = (function (meta, v, start, end, __hash){
this.meta = meta;
this.v = v;
this.start = start;
this.end = end;
this.__hash = __hash;
this.cljm$lang$protocol_mask$partition1$ = 0;
this.cljm$lang$protocol_mask$partition0$ = 32400159;
})
cljm_DOT_core_SLASH_Subvec.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_Subvec.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/Subvec", nil);
};
cljm_DOT_core_SLASH_Subvec.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__5842 = this;
id h__1314__auto____5843 = this__5842_DOT___hash;
if(cljm_truthy(cljm_DOT_core_SLASH_not((h__1314__auto____5843 == nil)))) {
return h__1314__auto____5843;

} else {
id h__1314__auto____5844 = cljm_DOT_core_SLASH_hash_coll(coll);
this__5842_DOT___hash = h__1314__auto____5844;
return h__1314__auto____5844;

}
};
cljm_DOT_core_SLASH_Subvec.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id coll, id k) {
var this__5845 = this;
return cljm_DOT_core_SLASH__nth(coll, k, nil);
};
cljm_DOT_core_SLASH_Subvec.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id coll, id k, id not_found) {
var this__5846 = this;
return cljm_DOT_core_SLASH__nth(coll, k, not_found);
};
cljm_DOT_core_SLASH_Subvec.prototype.cljm$core$IAssociative$_assoc$arity$3 = ^id(id coll, id key, id val) {
var this__5847 = this;
id v_pos__5848 = (this__5847_DOT_start + key);
return [cljm_DOT_core_SLASH_Subvec alloc];
};
cljm_DOT_core_SLASH_Subvec.prototype.call = (function() {
var G__5874 = null;
var G__5874__2 = ^id(id this_sym5849, id k) {
var this__5851 = this;
id this_sym5849__5852 = this;
id coll__5853 = this_sym5849__5852;
return cljm_DOT_core_SLASH__lookup(coll__5853, k);
};
var G__5874__3 = ^id(id this_sym5850, id k, id not_found) {
var this__5851 = this;
id this_sym5850__5854 = this;
id coll__5855 = this_sym5850__5854;
return cljm_DOT_core_SLASH__lookup(coll__5855, k, not_found);
};
G__5874 = function(this_sym5850, k, not_found){
switch(arguments.length){
case 2:
return G__5874__2.call(this,this_sym5850, k);
case 3:
return G__5874__3.call(this,this_sym5850, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__5874;
})()
;
cljm_DOT_core_SLASH_Subvec.prototype.apply = ^id(id this_sym5840, id args5841) {
var this__5856 = this;
return [this_sym5840.call applythis_sym5840, [@[this_sym5840] concatargs5841.slice()], nil];
};
cljm_DOT_core_SLASH_Subvec.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id o) {
var this__5857 = this;
return [cljm_DOT_core_SLASH_Subvec alloc];
};
cljm_DOT_core_SLASH_Subvec.prototype.toString = ^id() {
var this__5858 = this;
id this__5859 = this;
return cljm_DOT_core_SLASH_pr_str(this__5859, nil);
};
cljm_DOT_core_SLASH_Subvec.prototype.cljm$core$IReduce$_reduce$arity$2 = ^id(id coll, id f) {
var this__5860 = this;
return cljm_DOT_core_SLASH_ci_reduce(coll, f);
};
cljm_DOT_core_SLASH_Subvec.prototype.cljm$core$IReduce$_reduce$arity$3 = ^id(id coll, id f, id start) {
var this__5861 = this;
return cljm_DOT_core_SLASH_ci_reduce(coll, f, start);
};
cljm_DOT_core_SLASH_Subvec.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id coll) {
var this__5862 = this;
id subvec_seq__5863 = ^id(id i) {
if(cljm_truthy(([i isEqual:this__5862_DOT_end]))) {
return nil;

} else {
return cljm_DOT_core_SLASH_cons(cljm_DOT_core_SLASH__nth(this__5862_DOT_v, i), [cljm_DOT_core_SLASH_LazySeq alloc]);

}
};
return subvec_seq__5863(this__5862_DOT_start);
};
cljm_DOT_core_SLASH_Subvec.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__5864 = this;
return (this__5864_DOT_end - this__5864_DOT_start);
};
cljm_DOT_core_SLASH_Subvec.prototype.cljm$core$IStack$_peek$arity$1 = ^id(id coll) {
var this__5865 = this;
return cljm_DOT_core_SLASH__nth(this__5865_DOT_v, (this__5865_DOT_end - @1));
};
cljm_DOT_core_SLASH_Subvec.prototype.cljm$core$IStack$_pop$arity$1 = ^id(id coll) {
var this__5866 = this;
if(cljm_truthy(([this__5866_DOT_start isEqual:this__5866_DOT_end]))) {
throw [Error alloc];

} else {
return [cljm_DOT_core_SLASH_Subvec alloc];

}
};
cljm_DOT_core_SLASH_Subvec.prototype.cljm$core$IVector$_assoc_n$arity$3 = ^id(id coll, id n, id val) {
var this__5867 = this;
return cljm_DOT_core_SLASH__assoc(coll, n, val);
};
cljm_DOT_core_SLASH_Subvec.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__5868 = this;
return cljm_DOT_core_SLASH_equiv_sequential(coll, other);
};
cljm_DOT_core_SLASH_Subvec.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__5869 = this;
return [cljm_DOT_core_SLASH_Subvec alloc];
};
cljm_DOT_core_SLASH_Subvec.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__5870 = this;
return this__5870_DOT_meta;
};
cljm_DOT_core_SLASH_Subvec.prototype.cljm$core$IIndexed$_nth$arity$2 = ^id(id coll, id n) {
var this__5871 = this;
return cljm_DOT_core_SLASH__nth(this__5871_DOT_v, (this__5871_DOT_start + n));
};
cljm_DOT_core_SLASH_Subvec.prototype.cljm$core$IIndexed$_nth$arity$3 = ^id(id coll, id n, id not_found) {
var this__5872 = this;
return cljm_DOT_core_SLASH__nth(this__5872_DOT_v, (this__5872_DOT_start + n), not_found);
};
cljm_DOT_core_SLASH_Subvec.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__5873 = this;
return cljm_DOT_core_SLASH_with_meta(cljs_DOT_core_DOT_Vector_SLASH_EMPTY, this__5873_DOT_meta);
};
cljm_DOT_core_SLASH_Subvec;
/**
* Returns a persistent vector of the items in vector from
* start (inclusive) to end (exclusive).  If end is not supplied,
* defaults to (count vector). This operation is O(1) and very fast, as
* the resulting vector shares structure with the original and no
* trimming is done.
*/
cljm_DOT_core_SLASH_subvec = (function() {
var subvec = null;
var subvec__2 = ^id(id v, id start) {
return subvec(v, start, cljm_DOT_core_SLASH_count(v));
};
var subvec__3 = ^id(id v, id start, id end) {
return [cljm_DOT_core_SLASH_Subvec alloc];
};
subvec = function(v, start, end){
switch(arguments.length){
case 2:
return subvec__2.call(this,v, start);
case 3:
return subvec__3.call(this,v, start, end);
}
throw('Invalid arity: ' + arguments.length);
};
subvec.cljm$lang$arity$2 = subvec__2;
subvec.cljm$lang$arity$3 = subvec__3;
return subvec;
})()
;
cljm_DOT_core_SLASH_tv_ensure_editable = ^id(id edit, id node) {
if(cljm_truthy(([edit isEqual:node.edit]))) {
return node;

} else {
return [cljm_DOT_core_SLASH_VectorNode alloc];

}
};
cljm_DOT_core_SLASH_tv_editable_root = ^id(id node) {
return [cljm_DOT_core_SLASH_VectorNode alloc];
};
cljm_DOT_core_SLASH_tv_editable_tail = ^id(id tl) {
id ret__5876 = cljm_DOT_core_SLASH_make_array(@32);
cljm_DOT_core_SLASH_array_copy(tl, @0, ret__5876, @0, tl.length);
return ret__5876;
};
cljm_DOT_core_SLASH_tv_push_tail = ^id(id tv, id level, id parent, id tail_node) {
id ret__5880 = cljm_DOT_core_SLASH_tv_ensure_editable(tv.root.edit, parent);
id subidx__5881 = (((tv.cnt - @1) >>> level) & @31);
cljm_DOT_core_SLASH_pv_aset(ret__5880, subidx__5881, (cljm_truthy(([level isEqual:@5]))) ?tail_node:{id child__5882 = cljm_DOT_core_SLASH_pv_aget(ret__5880, subidx__5881);
if(cljm_truthy(cljm_DOT_core_SLASH_not((child__5882 == nil)))) {
return tv_push_tail(tv, (level - @5), child__5882, tail_node);

} else {
return cljm_DOT_core_SLASH_new_path(tv.root.edit, (level - @5), tail_node);

}
});
return ret__5880;
};
cljm_DOT_core_SLASH_tv_pop_tail = ^id(id tv, id level, id node) {
id node__5887 = cljm_DOT_core_SLASH_tv_ensure_editable(tv.root.edit, node);
id subidx__5888 = (((tv.cnt - @2) >>> level) & @31);
if(cljm_truthy((level > @5))) {
id new_child__5889 = tv_pop_tail(tv, (level - @5), cljm_DOT_core_SLASH_pv_aget(node__5887, subidx__5888));
if(cljm_truthy({id and__3822__auto____5890 = (new_child__5889 == nil);
if(cljm_truthy(and__3822__auto____5890)) {
return ([subidx__5888 isEqual:@0]);

} else {
return and__3822__auto____5890;

}
})) {
return nil;

} else {
cljm_DOT_core_SLASH_pv_aset(node__5887, subidx__5888, new_child__5889);
return node__5887;

}

} else {
if(cljm_truthy(([subidx__5888 isEqual:@0]))) {
return nil;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
cljm_DOT_core_SLASH_pv_aset(node__5887, subidx__5888, nil);
return node__5887;

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_editable_array_for = ^id(id tv, id i) {
if(cljm_truthy({id and__3822__auto____5895 = (@0 <= i);
if(cljm_truthy(and__3822__auto____5895)) {
return (i < tv.cnt);

} else {
return and__3822__auto____5895;

}
})) {
if(cljm_truthy((i >= cljm_DOT_core_SLASH_tail_off(tv)))) {
return tv.tail;

} else {
id root__5896 = tv.root;
id node__5897 = root__5896;
id level__5898 = tv.shift;
while(YES) {
if(cljm_truthy((level__5898 > @0))) {
{
var G__5899 = cljm_DOT_core_SLASH_tv_ensure_editable(root__5896.edit, cljm_DOT_core_SLASH_pv_aget(node__5897, ((i >>> level__5898) & @31)));
var G__5900 = (level__5898 - @5);
node__5897 = G__5899;
level__5898 = G__5900;
continue;
}

} else {
return node__5897.arr;

}
break;
}

}

} else {
throw [Error alloc];

}
};

/**
* @constructor
*/
cljm_DOT_core_SLASH_TransientVector = (function (cnt, shift, root, tail){
this.cnt = cnt;
this.shift = shift;
this.root = root;
this.tail = tail;
this.cljm$lang$protocol_mask$partition0$ = 275;
this.cljm$lang$protocol_mask$partition1$ = 22;
})
cljm_DOT_core_SLASH_TransientVector.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_TransientVector.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/TransientVector", nil);
};
cljm_DOT_core_SLASH_TransientVector.prototype.call = (function() {
var G__5940 = null;
var G__5940__2 = ^id(id this_sym5903, id k) {
var this__5905 = this;
id this_sym5903__5906 = this;
id coll__5907 = this_sym5903__5906;
return cljm_DOT_core_SLASH__lookup(coll__5907, k);
};
var G__5940__3 = ^id(id this_sym5904, id k, id not_found) {
var this__5905 = this;
id this_sym5904__5908 = this;
id coll__5909 = this_sym5904__5908;
return cljm_DOT_core_SLASH__lookup(coll__5909, k, not_found);
};
G__5940 = function(this_sym5904, k, not_found){
switch(arguments.length){
case 2:
return G__5940__2.call(this,this_sym5904, k);
case 3:
return G__5940__3.call(this,this_sym5904, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__5940;
})()
;
cljm_DOT_core_SLASH_TransientVector.prototype.apply = ^id(id this_sym5901, id args5902) {
var this__5910 = this;
return [this_sym5901.call applythis_sym5901, [@[this_sym5901] concatargs5902.slice()], nil];
};
cljm_DOT_core_SLASH_TransientVector.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id coll, id k) {
var this__5911 = this;
return cljm_DOT_core_SLASH__nth(coll, k, nil);
};
cljm_DOT_core_SLASH_TransientVector.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id coll, id k, id not_found) {
var this__5912 = this;
return cljm_DOT_core_SLASH__nth(coll, k, not_found);
};
cljm_DOT_core_SLASH_TransientVector.prototype.cljm$core$IIndexed$_nth$arity$2 = ^id(id coll, id n) {
var this__5913 = this;
if(cljm_truthy(this__5913_DOT_root.edit)) {
return (cljm_DOT_core_SLASH_array_for(coll, n)[(n & @31)]);

} else {
throw [Error alloc];

}
};
cljm_DOT_core_SLASH_TransientVector.prototype.cljm$core$IIndexed$_nth$arity$3 = ^id(id coll, id n, id not_found) {
var this__5914 = this;
if(cljm_truthy({id and__3822__auto____5915 = (@0 <= n);
if(cljm_truthy(and__3822__auto____5915)) {
return (n < this__5914_DOT_cnt);

} else {
return and__3822__auto____5915;

}
})) {
return cljm_DOT_core_SLASH__nth(coll, n);

} else {
return not_found;

}
};
cljm_DOT_core_SLASH_TransientVector.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__5916 = this;
if(cljm_truthy(this__5916_DOT_root.edit)) {
return this__5916_DOT_cnt;

} else {
throw [Error alloc];

}
};
cljm_DOT_core_SLASH_TransientVector.prototype.cljm$core$ITransientVector$_assoc_n_BANG_$arity$3 = ^id(id tcoll, id n, id val) {
var this__5917 = this;
if(cljm_truthy(this__5917_DOT_root.edit)) {
if(cljm_truthy({id and__3822__auto____5918 = (@0 <= n);
if(cljm_truthy(and__3822__auto____5918)) {
return (n < this__5917_DOT_cnt);

} else {
return and__3822__auto____5918;

}
})) {
if(cljm_truthy((cljm_DOT_core_SLASH_tail_off(tcoll) <= n))) {
(this__5917_DOT_tail[(n & @31)] = val);
return tcoll;

} else {
id new_root__5923 = (this__5917_DOT_shift, this__5917_DOT_root);
this__5917_DOT_root = new_root__5923;
return tcoll;

}

} else {
if(cljm_truthy(([n isEqual:this__5917_DOT_cnt]))) {
return cljm_DOT_core_SLASH__conj_BANG_(tcoll, val);

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
throw [Error alloc];

} else {
return nil;

}

}

}

} else {
throw [Error alloc];

}
};
cljm_DOT_core_SLASH_TransientVector.prototype.cljm$core$ITransientVector$_pop_BANG_$arity$1 = ^id(id tcoll) {
var this__5924 = this;
if(cljm_truthy(this__5924_DOT_root.edit)) {
if(cljm_truthy(([this__5924_DOT_cnt isEqual:@0]))) {
throw [Error alloc];

} else {
if(cljm_truthy(([@1 isEqual:this__5924_DOT_cnt]))) {
this__5924_DOT_cnt = @0;
return tcoll;

} else {
if(cljm_truthy((((this__5924_DOT_cnt - @1) & @31) > @0))) {
this__5924_DOT_cnt = (this__5924_DOT_cnt - @1);
return tcoll;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
id new_tail__5925 = cljm_DOT_core_SLASH_editable_array_for(tcoll, (this__5924_DOT_cnt - @2));
id new_root__5927 = {id nr__5926 = cljm_DOT_core_SLASH_tv_pop_tail(tcoll, this__5924_DOT_shift, this__5924_DOT_root);
if(cljm_truthy(cljm_DOT_core_SLASH_not((nr__5926 == nil)))) {
return nr__5926;

} else {
return [cljm_DOT_core_SLASH_VectorNode alloc];

}
};
if(cljm_truthy({id and__3822__auto____5928 = (@5 < this__5924_DOT_shift);
if(cljm_truthy(and__3822__auto____5928)) {
return (cljm_DOT_core_SLASH_pv_aget(new_root__5927, @1) == nil);

} else {
return and__3822__auto____5928;

}
})) {
id new_root__5929 = cljm_DOT_core_SLASH_tv_ensure_editable(this__5924_DOT_root.edit, cljm_DOT_core_SLASH_pv_aget(new_root__5927, @0));
this__5924_DOT_root = new_root__5929;
this__5924_DOT_shift = (this__5924_DOT_shift - @5);
this__5924_DOT_cnt = (this__5924_DOT_cnt - @1);
this__5924_DOT_tail = new_tail__5925;
return tcoll;

} else {
this__5924_DOT_root = new_root__5927;
this__5924_DOT_cnt = (this__5924_DOT_cnt - @1);
this__5924_DOT_tail = new_tail__5925;
return tcoll;

}

} else {
return nil;

}

}

}

}

} else {
throw [Error alloc];

}
};
cljm_DOT_core_SLASH_TransientVector.prototype.cljm$core$ITransientAssociative$_assoc_BANG_$arity$3 = ^id(id tcoll, id key, id val) {
var this__5930 = this;
return cljm_DOT_core_SLASH__assoc_n_BANG_(tcoll, key, val);
};
cljm_DOT_core_SLASH_TransientVector.prototype.cljm$core$ITransientCollection$_conj_BANG_$arity$2 = ^id(id tcoll, id o) {
var this__5931 = this;
if(cljm_truthy(this__5931_DOT_root.edit)) {
if(cljm_truthy(((this__5931_DOT_cnt - cljm_DOT_core_SLASH_tail_off(tcoll)) < @32))) {
(this__5931_DOT_tail[(this__5931_DOT_cnt & @31)] = o);
this__5931_DOT_cnt = (this__5931_DOT_cnt + @1);
return tcoll;

} else {
id tail_node__5932 = [cljm_DOT_core_SLASH_VectorNode alloc];
id new_tail__5933 = cljm_DOT_core_SLASH_make_array(@32);
(new_tail__5933[@0] = o);
this__5931_DOT_tail = new_tail__5933;
if(cljm_truthy(((this__5931_DOT_cnt >>> @5) > (@1 << this__5931_DOT_shift)))) {
id new_root_array__5934 = cljm_DOT_core_SLASH_make_array(@32);
id new_shift__5935 = (this__5931_DOT_shift + @5);
(new_root_array__5934[@0] = this__5931_DOT_root);
(new_root_array__5934[@1] = cljm_DOT_core_SLASH_new_path(this__5931_DOT_root.edit, this__5931_DOT_shift, tail_node__5932));
this__5931_DOT_root = [cljm_DOT_core_SLASH_VectorNode alloc];
this__5931_DOT_shift = new_shift__5935;
this__5931_DOT_cnt = (this__5931_DOT_cnt + @1);
return tcoll;

} else {
id new_root__5936 = cljm_DOT_core_SLASH_tv_push_tail(tcoll, this__5931_DOT_shift, this__5931_DOT_root, tail_node__5932);
this__5931_DOT_root = new_root__5936;
this__5931_DOT_cnt = (this__5931_DOT_cnt + @1);
return tcoll;

}

}

} else {
throw [Error alloc];

}
};
cljm_DOT_core_SLASH_TransientVector.prototype.cljm$core$ITransientCollection$_persistent_BANG_$arity$1 = ^id(id tcoll) {
var this__5937 = this;
if(cljm_truthy(this__5937_DOT_root.edit)) {
this__5937_DOT_root.edit = nil;
id len__5938 = (this__5937_DOT_cnt - cljm_DOT_core_SLASH_tail_off(tcoll));
id trimmed_tail__5939 = cljm_DOT_core_SLASH_make_array(len__5938);
cljm_DOT_core_SLASH_array_copy(this__5937_DOT_tail, @0, trimmed_tail__5939, @0, len__5938);
return [cljm_DOT_core_SLASH_PersistentVector alloc];

} else {
throw [Error alloc];

}
};
cljm_DOT_core_SLASH_TransientVector;

/**
* @constructor
*/
cljm_DOT_core_SLASH_PersistentQueueSeq = (function (meta, front, rear, __hash){
this.meta = meta;
this.front = front;
this.rear = rear;
this.__hash = __hash;
this.cljm$lang$protocol_mask$partition1$ = 0;
this.cljm$lang$protocol_mask$partition0$ = 31850572;
})
cljm_DOT_core_SLASH_PersistentQueueSeq.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_PersistentQueueSeq.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/PersistentQueueSeq", nil);
};
cljm_DOT_core_SLASH_PersistentQueueSeq.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__5941 = this;
id h__1314__auto____5942 = this__5941_DOT___hash;
if(cljm_truthy(cljm_DOT_core_SLASH_not((h__1314__auto____5942 == nil)))) {
return h__1314__auto____5942;

} else {
id h__1314__auto____5943 = cljm_DOT_core_SLASH_hash_coll(coll);
this__5941_DOT___hash = h__1314__auto____5943;
return h__1314__auto____5943;

}
};
cljm_DOT_core_SLASH_PersistentQueueSeq.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id o) {
var this__5944 = this;
return cljm_DOT_core_SLASH_cons(o, coll);
};
cljm_DOT_core_SLASH_PersistentQueueSeq.prototype.toString = ^id() {
var this__5945 = this;
id this__5946 = this;
return cljm_DOT_core_SLASH_pr_str(this__5946, nil);
};
cljm_DOT_core_SLASH_PersistentQueueSeq.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id coll) {
var this__5947 = this;
return coll;
};
cljm_DOT_core_SLASH_PersistentQueueSeq.prototype.cljm$core$ISeq$_first$arity$1 = ^id(id coll) {
var this__5948 = this;
return cljm_DOT_core_SLASH__first(this__5948_DOT_front);
};
cljm_DOT_core_SLASH_PersistentQueueSeq.prototype.cljm$core$ISeq$_rest$arity$1 = ^id(id coll) {
var this__5949 = this;
id temp__3971__auto____5950 = cljm_DOT_core_SLASH_next(this__5949_DOT_front);
if(cljm_truthy(temp__3971__auto____5950)) {
id f1__5951 = temp__3971__auto____5950;
return [cljm_DOT_core_SLASH_PersistentQueueSeq alloc];

} else {
if(cljm_truthy((this__5949_DOT_rear == nil))) {
return cljm_DOT_core_SLASH__empty(coll);

} else {
return [cljm_DOT_core_SLASH_PersistentQueueSeq alloc];

}

}
};
cljm_DOT_core_SLASH_PersistentQueueSeq.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__5952 = this;
return cljm_DOT_core_SLASH_equiv_sequential(coll, other);
};
cljm_DOT_core_SLASH_PersistentQueueSeq.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__5953 = this;
return [cljm_DOT_core_SLASH_PersistentQueueSeq alloc];
};
cljm_DOT_core_SLASH_PersistentQueueSeq.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__5954 = this;
return this__5954_DOT_meta;
};
cljm_DOT_core_SLASH_PersistentQueueSeq.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__5955 = this;
return cljm_DOT_core_SLASH_with_meta(cljs_DOT_core_DOT_List_SLASH_EMPTY, this__5955_DOT_meta);
};
cljm_DOT_core_SLASH_PersistentQueueSeq;

/**
* @constructor
*/
cljm_DOT_core_SLASH_PersistentQueue = (function (meta, count, front, rear, __hash){
this.meta = meta;
this.count = count;
this.front = front;
this.rear = rear;
this.__hash = __hash;
this.cljm$lang$protocol_mask$partition1$ = 0;
this.cljm$lang$protocol_mask$partition0$ = 31858766;
})
cljm_DOT_core_SLASH_PersistentQueue.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_PersistentQueue.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/PersistentQueue", nil);
};
cljm_DOT_core_SLASH_PersistentQueue.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__5956 = this;
id h__1314__auto____5957 = this__5956_DOT___hash;
if(cljm_truthy(cljm_DOT_core_SLASH_not((h__1314__auto____5957 == nil)))) {
return h__1314__auto____5957;

} else {
id h__1314__auto____5958 = cljm_DOT_core_SLASH_hash_coll(coll);
this__5956_DOT___hash = h__1314__auto____5958;
return h__1314__auto____5958;

}
};
cljm_DOT_core_SLASH_PersistentQueue.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id o) {
var this__5959 = this;
if(cljm_truthy(this__5959_DOT_front)) {
return [cljm_DOT_core_SLASH_PersistentQueue alloc];

} else {
return [cljm_DOT_core_SLASH_PersistentQueue alloc];

}
};
cljm_DOT_core_SLASH_PersistentQueue.prototype.toString = ^id() {
var this__5961 = this;
id this__5962 = this;
return cljm_DOT_core_SLASH_pr_str(this__5962, nil);
};
cljm_DOT_core_SLASH_PersistentQueue.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id coll) {
var this__5963 = this;
id rear__5964 = cljm_DOT_core_SLASH_seq(this__5963_DOT_rear);
if(cljm_truthy({id or__3824__auto____5965 = this__5963_DOT_front;
if(cljm_truthy(or__3824__auto____5965)) {
return or__3824__auto____5965;

} else {
return rear__5964;

}
})) {
return [cljm_DOT_core_SLASH_PersistentQueueSeq alloc];

} else {
return nil;

}
};
cljm_DOT_core_SLASH_PersistentQueue.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__5966 = this;
return this__5966_DOT_count;
};
cljm_DOT_core_SLASH_PersistentQueue.prototype.cljm$core$IStack$_peek$arity$1 = ^id(id coll) {
var this__5967 = this;
return cljm_DOT_core_SLASH__first(this__5967_DOT_front);
};
cljm_DOT_core_SLASH_PersistentQueue.prototype.cljm$core$IStack$_pop$arity$1 = ^id(id coll) {
var this__5968 = this;
if(cljm_truthy(this__5968_DOT_front)) {
id temp__3971__auto____5969 = cljm_DOT_core_SLASH_next(this__5968_DOT_front);
if(cljm_truthy(temp__3971__auto____5969)) {
id f1__5970 = temp__3971__auto____5969;
return [cljm_DOT_core_SLASH_PersistentQueue alloc];

} else {
return [cljm_DOT_core_SLASH_PersistentQueue alloc];

}

} else {
return coll;

}
};
cljm_DOT_core_SLASH_PersistentQueue.prototype.cljm$core$ISeq$_first$arity$1 = ^id(id coll) {
var this__5971 = this;
return cljm_DOT_core_SLASH_first(this__5971_DOT_front);
};
cljm_DOT_core_SLASH_PersistentQueue.prototype.cljm$core$ISeq$_rest$arity$1 = ^id(id coll) {
var this__5972 = this;
return cljm_DOT_core_SLASH_rest(cljm_DOT_core_SLASH_seq(coll));
};
cljm_DOT_core_SLASH_PersistentQueue.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__5973 = this;
return cljm_DOT_core_SLASH_equiv_sequential(coll, other);
};
cljm_DOT_core_SLASH_PersistentQueue.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__5974 = this;
return [cljm_DOT_core_SLASH_PersistentQueue alloc];
};
cljm_DOT_core_SLASH_PersistentQueue.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__5975 = this;
return this__5975_DOT_meta;
};
cljm_DOT_core_SLASH_PersistentQueue.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__5976 = this;
return cljs_DOT_core_DOT_PersistentQueue_SLASH_EMPTY;
};
cljm_DOT_core_SLASH_PersistentQueue;
cljs_DOT_core_DOT_PersistentQueue_SLASH_EMPTY = [cljm_DOT_core_SLASH_PersistentQueue alloc];

/**
* @constructor
*/
cljm_DOT_core_SLASH_NeverEquiv = (function (){
this.cljm$lang$protocol_mask$partition1$ = 0;
this.cljm$lang$protocol_mask$partition0$ = 2097152;
})
cljm_DOT_core_SLASH_NeverEquiv.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_NeverEquiv.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/NeverEquiv", nil);
};
cljm_DOT_core_SLASH_NeverEquiv.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id o, id other) {
var this__5977 = this;
return @NO;
};
cljm_DOT_core_SLASH_NeverEquiv;
cljm_DOT_core_SLASH_never_equiv = [cljm_DOT_core_SLASH_NeverEquiv alloc];
/**
* Assumes y is a map. Returns true if x equals y, otherwise returns
* false.
*/
cljm_DOT_core_SLASH_equiv_map = ^id(id x, id y) {
return cljm_DOT_core_SLASH_boolean((cljm_truthy(cljm_DOT_core_SLASH_map_QMARK_(y))) ?(cljm_truthy(([cljm_DOT_core_SLASH_count(x) isEqual:cljm_DOT_core_SLASH_count(y)]))) ?cljm_DOT_core_SLASH_every_QMARK_(cljm_DOT_core_SLASH_identity, cljm_DOT_core_SLASH_map(^id(id xkv) {
return cljm_DOT_core_SLASH__EQ_(cljm_DOT_core_SLASH__lookup(y, cljm_DOT_core_SLASH_first(xkv), cljm_DOT_core_SLASH_never_equiv), cljm_DOT_core_SLASH_second(xkv), nil);
}, x, nil)):nil:nil);
};
cljm_DOT_core_SLASH_scan_array = ^id(id incr, id k, id array) {
id len__5980 = [array count];
id i__5981 = @0;
while(YES) {
if(cljm_truthy((i__5981 < len__5980))) {
if(cljm_truthy(([k isEqual:(array[i__5981])]))) {
return i__5981;

} else {
{
var G__5982 = (i__5981 + incr);
i__5981 = G__5982;
continue;
}

}

} else {
return nil;

}
break;
}
};
cljm_DOT_core_SLASH_obj_map_compare_keys = ^id(id a, id b) {
id a__5985 = cljm_DOT_core_SLASH_hash(a);
id b__5986 = cljm_DOT_core_SLASH_hash(b);
if(cljm_truthy((a__5985 < b__5986))) {
return @-1;

} else {
if(cljm_truthy((a__5985 > b__5986))) {
return @1;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return @0;

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_obj_map__GT_hash_map = ^id(id m, id k, id v) {
id ks__5994 = m.keys;
id len__5995 = ks__5994.length;
id so__5996 = m.strobj;
id out__5997 = cljm_DOT_core_SLASH_with_meta(cljs_DOT_core_DOT_PersistentHashMap_SLASH_EMPTY, cljm_DOT_core_SLASH_meta(m));
id i__5998 = @0;
id out__5999 = cljm_DOT_core_SLASH_transient(out__5997);
while(YES) {
if(cljm_truthy((i__5998 < len__5995))) {
id k__6000 = (ks__5994[i__5998]);
{
var G__6001 = (i__5998 + @1);
var G__6002 = cljm_DOT_core_SLASH_assoc_BANG_(out__5999, k__6000, (so__5996[k__6000]));
i__5998 = G__6001;
out__5999 = G__6002;
continue;
}

} else {
return cljm_DOT_core_SLASH_persistent_BANG_(cljm_DOT_core_SLASH_assoc_BANG_(out__5999, k, v));

}
break;
}
};
cljm_DOT_core_SLASH_obj_clone = ^id(id obj, id ks) {
id new_obj__6008 = @{};
id l__6009 = [ks count];
id i__6010 = @0;
while(YES) {
if(cljm_truthy((i__6010 < l__6009))) {
id k__6011 = (ks[i__6010]);
(new_obj__6008[k__6011] = (obj[k__6011]));
{
var G__6012 = (i__6010 + @1);
i__6010 = G__6012;
continue;
}

} else {

}
break;
}
return new_obj__6008;
};

/**
* @constructor
*/
cljm_DOT_core_SLASH_ObjMap = (function (meta, keys, strobj, update_count, __hash){
this.meta = meta;
this.keys = keys;
this.strobj = strobj;
this.update_count = update_count;
this.__hash = __hash;
this.cljm$lang$protocol_mask$partition1$ = 1;
this.cljm$lang$protocol_mask$partition0$ = 15075087;
})
cljm_DOT_core_SLASH_ObjMap.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_ObjMap.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/ObjMap", nil);
};
cljm_DOT_core_SLASH_ObjMap.prototype.cljm$core$IEditableCollection$_as_transient$arity$1 = ^id(id coll) {
var this__6015 = this;
return cljm_DOT_core_SLASH_transient(cljm_DOT_core_SLASH_into(cljm_DOT_core_SLASH_hash_map(, nil), coll));
};
cljm_DOT_core_SLASH_ObjMap.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__6016 = this;
id h__1314__auto____6017 = this__6016_DOT___hash;
if(cljm_truthy(cljm_DOT_core_SLASH_not((h__1314__auto____6017 == nil)))) {
return h__1314__auto____6017;

} else {
id h__1314__auto____6018 = cljm_DOT_core_SLASH_hash_imap(coll);
this__6016_DOT___hash = h__1314__auto____6018;
return h__1314__auto____6018;

}
};
cljm_DOT_core_SLASH_ObjMap.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id coll, id k) {
var this__6019 = this;
return cljm_DOT_core_SLASH__lookup(coll, k, nil);
};
cljm_DOT_core_SLASH_ObjMap.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id coll, id k, id not_found) {
var this__6020 = this;
if(cljm_truthy({id and__3822__auto____6021 = goog_SLASH_isString(k);
if(cljm_truthy(and__3822__auto____6021)) {
return cljm_DOT_core_SLASH_not((cljm_DOT_core_SLASH_scan_array(@1, k, this__6020_DOT_keys) == nil));

} else {
return and__3822__auto____6021;

}
})) {
return (this__6020_DOT_strobj[k]);

} else {
return not_found;

}
};
cljm_DOT_core_SLASH_ObjMap.prototype.cljm$core$IAssociative$_assoc$arity$3 = ^id(id coll, id k, id v) {
var this__6022 = this;
if(cljm_truthy(goog_SLASH_isString(k))) {
if(cljm_truthy({id or__3824__auto____6023 = (this__6022_DOT_update_count > cljs_DOT_core_DOT_ObjMap_SLASH_HASHMAP_THRESHOLD);
if(cljm_truthy(or__3824__auto____6023)) {
return or__3824__auto____6023;

} else {
return ([this__6022_DOT_keys count] >= cljs_DOT_core_DOT_ObjMap_SLASH_HASHMAP_THRESHOLD);

}
})) {
return cljm_DOT_core_SLASH_obj_map__GT_hash_map(coll, k, v);

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_not((cljm_DOT_core_SLASH_scan_array(@1, k, this__6022_DOT_keys) == nil)))) {
id new_strobj__6024 = cljm_DOT_core_SLASH_obj_clone(this__6022_DOT_strobj, this__6022_DOT_keys);
(new_strobj__6024[k] = v);
return [cljm_DOT_core_SLASH_ObjMap alloc];

} else {
id new_strobj__6025 = cljm_DOT_core_SLASH_obj_clone(this__6022_DOT_strobj, this__6022_DOT_keys);
id new_keys__6026 = this__6022_DOT_keys.slice();
(new_strobj__6025[k] = v);
[new_keys__6026 pushk];
return [cljm_DOT_core_SLASH_ObjMap alloc];

}

}

} else {
return cljm_DOT_core_SLASH_obj_map__GT_hash_map(coll, k, v);

}
};
cljm_DOT_core_SLASH_ObjMap.prototype.cljm$core$IAssociative$_contains_key_QMARK_$arity$2 = ^id(id coll, id k) {
var this__6027 = this;
if(cljm_truthy({id and__3822__auto____6028 = goog_SLASH_isString(k);
if(cljm_truthy(and__3822__auto____6028)) {
return cljm_DOT_core_SLASH_not((cljm_DOT_core_SLASH_scan_array(@1, k, this__6027_DOT_keys) == nil));

} else {
return and__3822__auto____6028;

}
})) {
return @YES;

} else {
return @NO;

}
};
cljm_DOT_core_SLASH_ObjMap.prototype.call = (function() {
var G__6050 = null;
var G__6050__2 = ^id(id this_sym6029, id k) {
var this__6031 = this;
id this_sym6029__6032 = this;
id coll__6033 = this_sym6029__6032;
return cljm_DOT_core_SLASH__lookup(coll__6033, k);
};
var G__6050__3 = ^id(id this_sym6030, id k, id not_found) {
var this__6031 = this;
id this_sym6030__6034 = this;
id coll__6035 = this_sym6030__6034;
return cljm_DOT_core_SLASH__lookup(coll__6035, k, not_found);
};
G__6050 = function(this_sym6030, k, not_found){
switch(arguments.length){
case 2:
return G__6050__2.call(this,this_sym6030, k);
case 3:
return G__6050__3.call(this,this_sym6030, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__6050;
})()
;
cljm_DOT_core_SLASH_ObjMap.prototype.apply = ^id(id this_sym6013, id args6014) {
var this__6036 = this;
return [this_sym6013.call applythis_sym6013, [@[this_sym6013] concatargs6014.slice()], nil];
};
cljm_DOT_core_SLASH_ObjMap.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id entry) {
var this__6037 = this;
if(cljm_truthy(cljm_DOT_core_SLASH_vector_QMARK_(entry))) {
return cljm_DOT_core_SLASH__assoc(coll, cljm_DOT_core_SLASH__nth(entry, @0), cljm_DOT_core_SLASH__nth(entry, @1));

} else {
return cljm_DOT_core_SLASH_reduce(cljm_DOT_core_SLASH__conj, coll, entry);

}
};
cljm_DOT_core_SLASH_ObjMap.prototype.toString = ^id() {
var this__6038 = this;
id this__6039 = this;
return cljm_DOT_core_SLASH_pr_str(this__6039, nil);
};
cljm_DOT_core_SLASH_ObjMap.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id coll) {
var this__6040 = this;
if(cljm_truthy((this__6040_DOT_keys.length > @0))) {
return cljm_DOT_core_SLASH_map(^id(id p1__6003_SHARP_) {
return cljm_DOT_core_SLASH_vector(p1__6003_SHARP_, (this__6040_DOT_strobj[p1__6003_SHARP_]), nil);
}, [this__6040_DOT_keys sortcljm_DOT_core_SLASH_obj_map_compare_keys], nil);

} else {
return nil;

}
};
cljm_DOT_core_SLASH_ObjMap.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__6041 = this;
return this__6041_DOT_keys.length;
};
cljm_DOT_core_SLASH_ObjMap.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__6042 = this;
return cljm_DOT_core_SLASH_equiv_map(coll, other);
};
cljm_DOT_core_SLASH_ObjMap.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__6043 = this;
return [cljm_DOT_core_SLASH_ObjMap alloc];
};
cljm_DOT_core_SLASH_ObjMap.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__6044 = this;
return this__6044_DOT_meta;
};
cljm_DOT_core_SLASH_ObjMap.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__6045 = this;
return cljm_DOT_core_SLASH_with_meta(cljs_DOT_core_DOT_ObjMap_SLASH_EMPTY, this__6045_DOT_meta);
};
cljm_DOT_core_SLASH_ObjMap.prototype.cljm$core$IMap$_dissoc$arity$2 = ^id(id coll, id k) {
var this__6046 = this;
if(cljm_truthy({id and__3822__auto____6047 = goog_SLASH_isString(k);
if(cljm_truthy(and__3822__auto____6047)) {
return cljm_DOT_core_SLASH_not((cljm_DOT_core_SLASH_scan_array(@1, k, this__6046_DOT_keys) == nil));

} else {
return and__3822__auto____6047;

}
})) {
id new_keys__6048 = this__6046_DOT_keys.slice();
id new_strobj__6049 = cljm_DOT_core_SLASH_obj_clone(this__6046_DOT_strobj, this__6046_DOT_keys);
[new_keys__6048 splicecljm_DOT_core_SLASH_scan_array(@1, k, new_keys__6048), @1, nil];
cljm_DOT_core_SLASH_js_delete(new_strobj__6049, k);
return [cljm_DOT_core_SLASH_ObjMap alloc];

} else {
return coll;

}
};
cljm_DOT_core_SLASH_ObjMap;
cljs_DOT_core_DOT_ObjMap_SLASH_EMPTY = [cljm_DOT_core_SLASH_ObjMap alloc];
cljs_DOT_core_DOT_ObjMap_SLASH_HASHMAP_THRESHOLD = @32;
cljs_DOT_core_DOT_ObjMap_SLASH_fromObject = ^id(id ks, id obj) {
return [cljm_DOT_core_SLASH_ObjMap alloc];
};

/**
* @constructor
*/
cljm_DOT_core_SLASH_HashMap = (function (meta, count, hashobj, __hash){
this.meta = meta;
this.count = count;
this.hashobj = hashobj;
this.__hash = __hash;
this.cljm$lang$protocol_mask$partition1$ = 0;
this.cljm$lang$protocol_mask$partition0$ = 15075087;
})
cljm_DOT_core_SLASH_HashMap.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_HashMap.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/HashMap", nil);
};
cljm_DOT_core_SLASH_HashMap.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__6054 = this;
id h__1314__auto____6055 = this__6054_DOT___hash;
if(cljm_truthy(cljm_DOT_core_SLASH_not((h__1314__auto____6055 == nil)))) {
return h__1314__auto____6055;

} else {
id h__1314__auto____6056 = cljm_DOT_core_SLASH_hash_imap(coll);
this__6054_DOT___hash = h__1314__auto____6056;
return h__1314__auto____6056;

}
};
cljm_DOT_core_SLASH_HashMap.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id coll, id k) {
var this__6057 = this;
return cljm_DOT_core_SLASH__lookup(coll, k, nil);
};
cljm_DOT_core_SLASH_HashMap.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id coll, id k, id not_found) {
var this__6058 = this;
id bucket__6059 = (this__6058_DOT_hashobj[cljm_DOT_core_SLASH_hash(k)]);
id i__6060 = (cljm_truthy(bucket__6059)) ?cljm_DOT_core_SLASH_scan_array(@2, k, bucket__6059):nil;
if(cljm_truthy(i__6060)) {
return (bucket__6059[(i__6060 + @1)]);

} else {
return not_found;

}
};
cljm_DOT_core_SLASH_HashMap.prototype.cljm$core$IAssociative$_assoc$arity$3 = ^id(id coll, id k, id v) {
var this__6061 = this;
id h__6062 = cljm_DOT_core_SLASH_hash(k);
id bucket__6063 = (this__6061_DOT_hashobj[h__6062]);
if(cljm_truthy(bucket__6063)) {
id new_bucket__6064 = bucket__6063.slice();
id new_hashobj__6065 = goog_DOT_object_SLASH_clone(this__6061_DOT_hashobj);
(new_hashobj__6065[h__6062] = new_bucket__6064);
id temp__3971__auto____6066 = cljm_DOT_core_SLASH_scan_array(@2, k, new_bucket__6064);
if(cljm_truthy(temp__3971__auto____6066)) {
id i__6067 = temp__3971__auto____6066;
(new_bucket__6064[(i__6067 + @1)] = v);
return [cljm_DOT_core_SLASH_HashMap alloc];

} else {
[new_bucket__6064 pushk, v, nil];
return [cljm_DOT_core_SLASH_HashMap alloc];

}

} else {
id new_hashobj__6068 = goog_DOT_object_SLASH_clone(this__6061_DOT_hashobj);
(new_hashobj__6068[h__6062] = @[k,v]);
return [cljm_DOT_core_SLASH_HashMap alloc];

}
};
cljm_DOT_core_SLASH_HashMap.prototype.cljm$core$IAssociative$_contains_key_QMARK_$arity$2 = ^id(id coll, id k) {
var this__6069 = this;
id bucket__6070 = (this__6069_DOT_hashobj[cljm_DOT_core_SLASH_hash(k)]);
id i__6071 = (cljm_truthy(bucket__6070)) ?cljm_DOT_core_SLASH_scan_array(@2, k, bucket__6070):nil;
if(cljm_truthy(i__6071)) {
return @YES;

} else {
return @NO;

}
};
cljm_DOT_core_SLASH_HashMap.prototype.call = (function() {
var G__6096 = null;
var G__6096__2 = ^id(id this_sym6072, id k) {
var this__6074 = this;
id this_sym6072__6075 = this;
id coll__6076 = this_sym6072__6075;
return cljm_DOT_core_SLASH__lookup(coll__6076, k);
};
var G__6096__3 = ^id(id this_sym6073, id k, id not_found) {
var this__6074 = this;
id this_sym6073__6077 = this;
id coll__6078 = this_sym6073__6077;
return cljm_DOT_core_SLASH__lookup(coll__6078, k, not_found);
};
G__6096 = function(this_sym6073, k, not_found){
switch(arguments.length){
case 2:
return G__6096__2.call(this,this_sym6073, k);
case 3:
return G__6096__3.call(this,this_sym6073, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__6096;
})()
;
cljm_DOT_core_SLASH_HashMap.prototype.apply = ^id(id this_sym6052, id args6053) {
var this__6079 = this;
return [this_sym6052.call applythis_sym6052, [@[this_sym6052] concatargs6053.slice()], nil];
};
cljm_DOT_core_SLASH_HashMap.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id entry) {
var this__6080 = this;
if(cljm_truthy(cljm_DOT_core_SLASH_vector_QMARK_(entry))) {
return cljm_DOT_core_SLASH__assoc(coll, cljm_DOT_core_SLASH__nth(entry, @0), cljm_DOT_core_SLASH__nth(entry, @1));

} else {
return cljm_DOT_core_SLASH_reduce(cljm_DOT_core_SLASH__conj, coll, entry);

}
};
cljm_DOT_core_SLASH_HashMap.prototype.toString = ^id() {
var this__6081 = this;
id this__6082 = this;
return cljm_DOT_core_SLASH_pr_str(this__6082, nil);
};
cljm_DOT_core_SLASH_HashMap.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id coll) {
var this__6083 = this;
if(cljm_truthy((this__6083_DOT_count > @0))) {
id hashes__6084 = [cljm_DOT_core_SLASH_js_keys(this__6083_DOT_hashobj) sort];
return cljm_DOT_core_SLASH_mapcat(^id(id p1__6051_SHARP_) {
return cljm_DOT_core_SLASH_map(cljm_DOT_core_SLASH_vec, cljm_DOT_core_SLASH_partition(@2, (this__6083_DOT_hashobj[p1__6051_SHARP_])), nil);
}, hashes__6084, nil);

} else {
return nil;

}
};
cljm_DOT_core_SLASH_HashMap.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__6085 = this;
return this__6085_DOT_count;
};
cljm_DOT_core_SLASH_HashMap.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__6086 = this;
return cljm_DOT_core_SLASH_equiv_map(coll, other);
};
cljm_DOT_core_SLASH_HashMap.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__6087 = this;
return [cljm_DOT_core_SLASH_HashMap alloc];
};
cljm_DOT_core_SLASH_HashMap.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__6088 = this;
return this__6088_DOT_meta;
};
cljm_DOT_core_SLASH_HashMap.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__6089 = this;
return cljm_DOT_core_SLASH_with_meta(cljs_DOT_core_DOT_HashMap_SLASH_EMPTY, this__6089_DOT_meta);
};
cljm_DOT_core_SLASH_HashMap.prototype.cljm$core$IMap$_dissoc$arity$2 = ^id(id coll, id k) {
var this__6090 = this;
id h__6091 = cljm_DOT_core_SLASH_hash(k);
id bucket__6092 = (this__6090_DOT_hashobj[h__6091]);
id i__6093 = (cljm_truthy(bucket__6092)) ?cljm_DOT_core_SLASH_scan_array(@2, k, bucket__6092):nil;
if(cljm_truthy(cljm_DOT_core_SLASH_not(i__6093))) {
return coll;

} else {
id new_hashobj__6094 = goog_DOT_object_SLASH_clone(this__6090_DOT_hashobj);
if(cljm_truthy((@3 > bucket__6092.length))) {
cljm_DOT_core_SLASH_js_delete(new_hashobj__6094, h__6091);

} else {
id new_bucket__6095 = bucket__6092.slice();
[new_bucket__6095 splicei__6093, @2, nil];
(new_hashobj__6094[h__6091] = new_bucket__6095);

}
return [cljm_DOT_core_SLASH_HashMap alloc];

}
};
cljm_DOT_core_SLASH_HashMap;
cljs_DOT_core_DOT_HashMap_SLASH_EMPTY = [cljm_DOT_core_SLASH_HashMap alloc];
cljs_DOT_core_DOT_HashMap_SLASH_fromArrays = ^id(id ks, id vs) {
id len__6097 = ks.length;
id i__6098 = @0;
id out__6099 = cljs_DOT_core_DOT_HashMap_SLASH_EMPTY;
while(YES) {
if(cljm_truthy((i__6098 < len__6097))) {
{
var G__6100 = (i__6098 + @1);
var G__6101 = cljm_DOT_core_SLASH_assoc(out__6099, (ks[i__6098]), (vs[i__6098]), nil);
i__6098 = G__6100;
out__6099 = G__6101;
continue;
}

} else {
return out__6099;

}
break;
}
};
cljm_DOT_core_SLASH_array_map_index_of = ^id(id m, id k) {
id arr__6105 = m.arr;
id len__6106 = arr__6105.length;
id i__6107 = @0;
while(YES) {
if(cljm_truthy((len__6106 <= i__6107))) {
return @-1;

} else {
if(cljm_truthy(cljm_DOT_core_SLASH__EQ_((arr__6105[i__6107]), k, nil))) {
return i__6107;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
{
var G__6108 = (i__6107 + @2);
i__6107 = G__6108;
continue;
}

} else {
return nil;

}

}

}
break;
}
};

/**
* @constructor
*/
cljm_DOT_core_SLASH_PersistentArrayMap = (function (meta, cnt, arr, __hash){
this.meta = meta;
this.cnt = cnt;
this.arr = arr;
this.__hash = __hash;
this.cljm$lang$protocol_mask$partition1$ = 1;
this.cljm$lang$protocol_mask$partition0$ = 16123663;
})
cljm_DOT_core_SLASH_PersistentArrayMap.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_PersistentArrayMap.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/PersistentArrayMap", nil);
};
cljm_DOT_core_SLASH_PersistentArrayMap.prototype.cljm$core$IEditableCollection$_as_transient$arity$1 = ^id(id coll) {
var this__6111 = this;
return [cljm_DOT_core_SLASH_TransientArrayMap alloc];
};
cljm_DOT_core_SLASH_PersistentArrayMap.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__6112 = this;
id h__1314__auto____6113 = this__6112_DOT___hash;
if(cljm_truthy(cljm_DOT_core_SLASH_not((h__1314__auto____6113 == nil)))) {
return h__1314__auto____6113;

} else {
id h__1314__auto____6114 = cljm_DOT_core_SLASH_hash_imap(coll);
this__6112_DOT___hash = h__1314__auto____6114;
return h__1314__auto____6114;

}
};
cljm_DOT_core_SLASH_PersistentArrayMap.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id coll, id k) {
var this__6115 = this;
return cljm_DOT_core_SLASH__lookup(coll, k, nil);
};
cljm_DOT_core_SLASH_PersistentArrayMap.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id coll, id k, id not_found) {
var this__6116 = this;
id idx__6117 = cljm_DOT_core_SLASH_array_map_index_of(coll, k);
if(cljm_truthy(([idx__6117 isEqual:@-1]))) {
return not_found;

} else {
return (this__6116_DOT_arr[(idx__6117 + @1)]);

}
};
cljm_DOT_core_SLASH_PersistentArrayMap.prototype.cljm$core$IAssociative$_assoc$arity$3 = ^id(id coll, id k, id v) {
var this__6118 = this;
id idx__6119 = cljm_DOT_core_SLASH_array_map_index_of(coll, k);
if(cljm_truthy(([idx__6119 isEqual:@-1]))) {
if(cljm_truthy((this__6118_DOT_cnt < cljs_DOT_core_DOT_PersistentArrayMap_SLASH_HASHMAP_THRESHOLD))) {
return [cljm_DOT_core_SLASH_PersistentArrayMap alloc];

} else {
return cljm_DOT_core_SLASH_persistent_BANG_(cljm_DOT_core_SLASH_assoc_BANG_(cljm_DOT_core_SLASH_transient(cljm_DOT_core_SLASH_into(cljs_DOT_core_DOT_PersistentHashMap_SLASH_EMPTY, coll)), k, v));

}

} else {
if(cljm_truthy(([v isEqual:(this__6118_DOT_arr[(idx__6119 + @1)])]))) {
return coll;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return [cljm_DOT_core_SLASH_PersistentArrayMap alloc];

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_PersistentArrayMap.prototype.cljm$core$IAssociative$_contains_key_QMARK_$arity$2 = ^id(id coll, id k) {
var this__6124 = this;
return cljm_DOT_core_SLASH_not(([cljm_DOT_core_SLASH_array_map_index_of(coll, k) isEqual:@-1]));
};
cljm_DOT_core_SLASH_PersistentArrayMap.prototype.call = (function() {
var G__6156 = null;
var G__6156__2 = ^id(id this_sym6125, id k) {
var this__6127 = this;
id this_sym6125__6128 = this;
id coll__6129 = this_sym6125__6128;
return cljm_DOT_core_SLASH__lookup(coll__6129, k);
};
var G__6156__3 = ^id(id this_sym6126, id k, id not_found) {
var this__6127 = this;
id this_sym6126__6130 = this;
id coll__6131 = this_sym6126__6130;
return cljm_DOT_core_SLASH__lookup(coll__6131, k, not_found);
};
G__6156 = function(this_sym6126, k, not_found){
switch(arguments.length){
case 2:
return G__6156__2.call(this,this_sym6126, k);
case 3:
return G__6156__3.call(this,this_sym6126, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__6156;
})()
;
cljm_DOT_core_SLASH_PersistentArrayMap.prototype.apply = ^id(id this_sym6109, id args6110) {
var this__6132 = this;
return [this_sym6109.call applythis_sym6109, [@[this_sym6109] concatargs6110.slice()], nil];
};
cljm_DOT_core_SLASH_PersistentArrayMap.prototype.cljm$core$IKVReduce$_kv_reduce$arity$3 = ^id(id coll, id f, id init) {
var this__6133 = this;
id len__6134 = this__6133_DOT_arr.length;
id i__6135 = @0;
id init__6136 = init;
while(YES) {
if(cljm_truthy((i__6135 < len__6134))) {
id init__6137 = f(init__6136, (this__6133_DOT_arr[i__6135]), (this__6133_DOT_arr[(i__6135 + @1)]));
if(cljm_truthy(cljm_DOT_core_SLASH_reduced_QMARK_(init__6137))) {
return cljm_DOT_core_SLASH_deref(init__6137);

} else {
{
var G__6157 = (i__6135 + @2);
var G__6158 = init__6137;
i__6135 = G__6157;
init__6136 = G__6158;
continue;
}

}

} else {
return nil;

}
break;
}
};
cljm_DOT_core_SLASH_PersistentArrayMap.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id entry) {
var this__6138 = this;
if(cljm_truthy(cljm_DOT_core_SLASH_vector_QMARK_(entry))) {
return cljm_DOT_core_SLASH__assoc(coll, cljm_DOT_core_SLASH__nth(entry, @0), cljm_DOT_core_SLASH__nth(entry, @1));

} else {
return cljm_DOT_core_SLASH_reduce(cljm_DOT_core_SLASH__conj, coll, entry);

}
};
cljm_DOT_core_SLASH_PersistentArrayMap.prototype.toString = ^id() {
var this__6139 = this;
id this__6140 = this;
return cljm_DOT_core_SLASH_pr_str(this__6140, nil);
};
cljm_DOT_core_SLASH_PersistentArrayMap.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id coll) {
var this__6141 = this;
if(cljm_truthy((this__6141_DOT_cnt > @0))) {
id len__6142 = this__6141_DOT_arr.length;
id array_map_seq__6143 = ^id(id i) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
return array_map_seq__6143(@0);

} else {
return nil;

}
};
cljm_DOT_core_SLASH_PersistentArrayMap.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__6144 = this;
return this__6144_DOT_cnt;
};
cljm_DOT_core_SLASH_PersistentArrayMap.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__6145 = this;
return cljm_DOT_core_SLASH_equiv_map(coll, other);
};
cljm_DOT_core_SLASH_PersistentArrayMap.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__6146 = this;
return [cljm_DOT_core_SLASH_PersistentArrayMap alloc];
};
cljm_DOT_core_SLASH_PersistentArrayMap.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__6147 = this;
return this__6147_DOT_meta;
};
cljm_DOT_core_SLASH_PersistentArrayMap.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__6148 = this;
return cljm_DOT_core_SLASH__with_meta(cljs_DOT_core_DOT_PersistentArrayMap_SLASH_EMPTY, this__6148_DOT_meta);
};
cljm_DOT_core_SLASH_PersistentArrayMap.prototype.cljm$core$IMap$_dissoc$arity$2 = ^id(id coll, id k) {
var this__6149 = this;
id idx__6150 = cljm_DOT_core_SLASH_array_map_index_of(coll, k);
if(cljm_truthy((idx__6150 >= @0))) {
id len__6151 = this__6149_DOT_arr.length;
id new_len__6152 = (len__6151 - @2);
if(cljm_truthy(([new_len__6152 isEqual:@0]))) {
return cljm_DOT_core_SLASH__empty(coll);

} else {
id new_arr__6153 = cljm_DOT_core_SLASH_make_array(new_len__6152);
id s__6154 = @0;
id d__6155 = @0;
while(YES) {
if(cljm_truthy((s__6154 >= len__6151))) {
return [cljm_DOT_core_SLASH_PersistentArrayMap alloc];

} else {
if(cljm_truthy(cljm_DOT_core_SLASH__EQ_(k, (this__6149_DOT_arr[s__6154]), nil))) {
{
var G__6159 = (s__6154 + @2);
var G__6160 = d__6155;
s__6154 = G__6159;
d__6155 = G__6160;
continue;
}

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
(new_arr__6153[d__6155] = (this__6149_DOT_arr[s__6154]));
(new_arr__6153[(d__6155 + @1)] = (this__6149_DOT_arr[(s__6154 + @1)]));
{
var G__6161 = (s__6154 + @2);
var G__6162 = (d__6155 + @2);
s__6154 = G__6161;
d__6155 = G__6162;
continue;
}

} else {
return nil;

}

}

}
break;
}

}

} else {
return coll;

}
};
cljm_DOT_core_SLASH_PersistentArrayMap;
cljs_DOT_core_DOT_PersistentArrayMap_SLASH_EMPTY = [cljm_DOT_core_SLASH_PersistentArrayMap alloc];
cljs_DOT_core_DOT_PersistentArrayMap_SLASH_HASHMAP_THRESHOLD = @16;
cljs_DOT_core_DOT_PersistentArrayMap_SLASH_fromArrays = ^id(id ks, id vs) {
id len__6163 = cljm_DOT_core_SLASH_count(ks);
id i__6164 = @0;
id out__6165 = cljm_DOT_core_SLASH_transient(cljs_DOT_core_DOT_PersistentArrayMap_SLASH_EMPTY);
while(YES) {
if(cljm_truthy((i__6164 < len__6163))) {
{
var G__6166 = (i__6164 + @1);
var G__6167 = cljm_DOT_core_SLASH_assoc_BANG_(out__6165, (ks[i__6164]), (vs[i__6164]));
i__6164 = G__6166;
out__6165 = G__6167;
continue;
}

} else {
return cljm_DOT_core_SLASH_persistent_BANG_(out__6165);

}
break;
}
};

/**
* @constructor
*/
cljm_DOT_core_SLASH_TransientArrayMap = (function (editable_QMARK_, len, arr){
this.editable_QMARK_ = editable_QMARK_;
this.len = len;
this.arr = arr;
this.cljm$lang$protocol_mask$partition1$ = 14;
this.cljm$lang$protocol_mask$partition0$ = 258;
})
cljm_DOT_core_SLASH_TransientArrayMap.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_TransientArrayMap.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/TransientArrayMap", nil);
};
cljm_DOT_core_SLASH_TransientArrayMap.prototype.cljm$core$ITransientMap$_dissoc_BANG_$arity$2 = ^id(id tcoll, id key) {
var this__6168 = this;
if(cljm_truthy(this__6168_DOT_editable_QMARK_)) {
id idx__6169 = cljm_DOT_core_SLASH_array_map_index_of(tcoll, key);
if(cljm_truthy((idx__6169 >= @0))) {
(this__6168_DOT_arr[idx__6169] = (this__6168_DOT_arr[(this__6168_DOT_len - @2)]));
(this__6168_DOT_arr[(idx__6169 + @1)] = (this__6168_DOT_arr[(this__6168_DOT_len - @1)]));
id G__6170__6171 = this__6168_DOT_arr;
[G__6170__6171 pop];
[G__6170__6171 pop];
G__6170__6171;
this__6168_DOT_len = (this__6168_DOT_len - @2);

} else {

}
return tcoll;

} else {
throw [Error alloc];

}
};
cljm_DOT_core_SLASH_TransientArrayMap.prototype.cljm$core$ITransientAssociative$_assoc_BANG_$arity$3 = ^id(id tcoll, id key, id val) {
var this__6172 = this;
if(cljm_truthy(this__6172_DOT_editable_QMARK_)) {
id idx__6173 = cljm_DOT_core_SLASH_array_map_index_of(tcoll, key);
if(cljm_truthy(([idx__6173 isEqual:@-1]))) {
if(cljm_truthy(((this__6172_DOT_len + @2) <= (@2 * cljs_DOT_core_DOT_PersistentArrayMap_SLASH_HASHMAP_THRESHOLD)))) {
this__6172_DOT_len = (this__6172_DOT_len + @2);
[this__6172_DOT_arr pushkey];
[this__6172_DOT_arr pushval];
return tcoll;

} else {
return cljm_DOT_core_SLASH_assoc_BANG_(cljm_DOT_core_SLASH_array__GT_transient_hash_map(this__6172_DOT_len, this__6172_DOT_arr), key, val);

}

} else {
if(cljm_truthy(([val isEqual:(this__6172_DOT_arr[(idx__6173 + @1)])]))) {
return tcoll;

} else {
(this__6172_DOT_arr[(idx__6173 + @1)] = val);
return tcoll;

}

}

} else {
throw [Error alloc];

}
};
cljm_DOT_core_SLASH_TransientArrayMap.prototype.cljm$core$ITransientCollection$_conj_BANG_$arity$2 = ^id(id tcoll, id o) {
var this__6174 = this;
if(cljm_truthy(this__6174_DOT_editable_QMARK_)) {
if(cljm_truthy({id G__6175__6176 = o;
if(cljm_truthy(G__6175__6176)) {
if(cljm_truthy({id or__3824__auto____6177 = (G__6175__6176.cljm$lang$protocol_mask$partition0$ & @2048);
if(cljm_truthy(or__3824__auto____6177)) {
return or__3824__auto____6177;

} else {
return G__6175__6176.cljm$core$IMapEntry$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__6175__6176.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IMapEntry, G__6175__6176);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IMapEntry, G__6175__6176);

}
})) {
return cljm_DOT_core_SLASH__assoc_BANG_(tcoll, cljm_DOT_core_SLASH_key(o), cljm_DOT_core_SLASH_val(o));

} else {
id es__6178 = cljm_DOT_core_SLASH_seq(o);
id tcoll__6179 = tcoll;
while(YES) {
id temp__3971__auto____6180 = cljm_DOT_core_SLASH_first(es__6178);
if(cljm_truthy(temp__3971__auto____6180)) {
id e__6181 = temp__3971__auto____6180;
{
var G__6187 = cljm_DOT_core_SLASH_next(es__6178);
var G__6188 = cljm_DOT_core_SLASH__assoc_BANG_(tcoll__6179, cljm_DOT_core_SLASH_key(e__6181), cljm_DOT_core_SLASH_val(e__6181));
es__6178 = G__6187;
tcoll__6179 = G__6188;
continue;
}

} else {
return tcoll__6179;

}
break;
}

}

} else {
throw [Error alloc];

}
};
cljm_DOT_core_SLASH_TransientArrayMap.prototype.cljm$core$ITransientCollection$_persistent_BANG_$arity$1 = ^id(id tcoll) {
var this__6182 = this;
if(cljm_truthy(this__6182_DOT_editable_QMARK_)) {
this__6182_DOT_editable_QMARK_ = @NO;
return [cljm_DOT_core_SLASH_PersistentArrayMap alloc];

} else {
throw [Error alloc];

}
};
cljm_DOT_core_SLASH_TransientArrayMap.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id tcoll, id k) {
var this__6183 = this;
return cljm_DOT_core_SLASH__lookup(tcoll, k, nil);
};
cljm_DOT_core_SLASH_TransientArrayMap.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id tcoll, id k, id not_found) {
var this__6184 = this;
if(cljm_truthy(this__6184_DOT_editable_QMARK_)) {
id idx__6185 = cljm_DOT_core_SLASH_array_map_index_of(tcoll, k);
if(cljm_truthy(([idx__6185 isEqual:@-1]))) {
return not_found;

} else {
return (this__6184_DOT_arr[(idx__6185 + @1)]);

}

} else {
throw [Error alloc];

}
};
cljm_DOT_core_SLASH_TransientArrayMap.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id tcoll) {
var this__6186 = this;
if(cljm_truthy(this__6186_DOT_editable_QMARK_)) {
return cljm_DOT_core_SLASH_quot(this__6186_DOT_len, @2);

} else {
throw [Error alloc];

}
};
cljm_DOT_core_SLASH_TransientArrayMap;
cljm_DOT_core_SLASH_array__GT_transient_hash_map = ^id(id len, id arr) {
id out__6191 = cljm_DOT_core_SLASH_transient(@{});
id i__6192 = @0;
while(YES) {
if(cljm_truthy((i__6192 < len))) {
{
var G__6193 = cljm_DOT_core_SLASH_assoc_BANG_(out__6191, (arr[i__6192]), (arr[(i__6192 + @1)]));
var G__6194 = (i__6192 + @2);
out__6191 = G__6193;
i__6192 = G__6194;
continue;
}

} else {
return out__6191;

}
break;
}
};

/**
* @constructor
*/
cljm_DOT_core_SLASH_Box = (function (val){
this.val = val;
})
cljm_DOT_core_SLASH_Box.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_Box.cljm$lang$ctorPrSeq = ^id(id this__1432__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/Box", nil);
};
cljm_DOT_core_SLASH_Box;
cljm_DOT_core_SLASH_key_test = ^id(id key, id other) {
if(cljm_truthy(goog_SLASH_isString(key))) {
return ([key isEqual:other]);

} else {
return cljm_DOT_core_SLASH__EQ_(key, other, nil);

}
};
cljm_DOT_core_SLASH_mask = ^id(id hash, id shift) {
return ((hash >>> shift) & @31);
};
cljm_DOT_core_SLASH_clone_and_set = (function() {
var clone_and_set = null;
var clone_and_set__3 = ^id(id arr, id i, id a) {
id G__6199__6200 = arr.slice();
(G__6199__6200[i] = a);
return G__6199__6200;
};
var clone_and_set__5 = ^id(id arr, id i, id a, id j, id b) {
id G__6201__6202 = arr.slice();
(G__6201__6202[i] = a);
(G__6201__6202[j] = b);
return G__6201__6202;
};
clone_and_set = function(arr, i, a, j, b){
switch(arguments.length){
case 3:
return clone_and_set__3.call(this,arr, i, a);
case 5:
return clone_and_set__5.call(this,arr, i, a, j, b);
}
throw('Invalid arity: ' + arguments.length);
};
clone_and_set.cljm$lang$arity$3 = clone_and_set__3;
clone_and_set.cljm$lang$arity$5 = clone_and_set__5;
return clone_and_set;
})()
;
cljm_DOT_core_SLASH_remove_pair = ^id(id arr, id i) {
id new_arr__6204 = cljm_DOT_core_SLASH_make_array((arr.length - @2));
cljm_DOT_core_SLASH_array_copy(arr, @0, new_arr__6204, @0, (@2 * i));
cljm_DOT_core_SLASH_array_copy(arr, (@2 * (i + @1)), new_arr__6204, (@2 * i), (new_arr__6204.length - (@2 * i)));
return new_arr__6204;
};
cljm_DOT_core_SLASH_bitmap_indexed_node_index = ^id(id bitmap, id bit) {
return cljm_DOT_core_SLASH_bit_count((bitmap & (bit - @1)));
};
cljm_DOT_core_SLASH_bitpos = ^id(id hash, id shift) {
return (@1 << ((hash >>> shift) & 0x01f));
};
cljm_DOT_core_SLASH_edit_and_set = (function() {
var edit_and_set = null;
var edit_and_set__4 = ^id(id inode, id edit, id i, id a) {
id editable__6207 = [inode ensureedit editable];
(editable__6207.arr[i] = a);
return editable__6207;
};
var edit_and_set__6 = ^id(id inode, id edit, id i, id a, id j, id b) {
id editable__6208 = [inode ensureedit editable];
(editable__6208.arr[i] = a);
(editable__6208.arr[j] = b);
return editable__6208;
};
edit_and_set = function(inode, edit, i, a, j, b){
switch(arguments.length){
case 4:
return edit_and_set__4.call(this,inode, edit, i, a);
case 6:
return edit_and_set__6.call(this,inode, edit, i, a, j, b);
}
throw('Invalid arity: ' + arguments.length);
};
edit_and_set.cljm$lang$arity$4 = edit_and_set__4;
edit_and_set.cljm$lang$arity$6 = edit_and_set__6;
return edit_and_set;
})()
;
cljm_DOT_core_SLASH_inode_kv_reduce = ^id(id arr, id f, id init) {
id len__6215 = arr.length;
id i__6216 = @0;
id init__6217 = init;
while(YES) {
if(cljm_truthy((i__6216 < len__6215))) {
id init__6220 = {id k__6218 = (arr[i__6216]);
if(cljm_truthy(cljm_DOT_core_SLASH_not((k__6218 == nil)))) {
return f(init__6217, k__6218, (arr[(i__6216 + @1)]));

} else {
id node__6219 = (arr[(i__6216 + @1)]);
if(cljm_truthy(cljm_DOT_core_SLASH_not((node__6219 == nil)))) {
return [node__6219 kvf reduceinit__6217];

} else {
return init__6217;

}

}
};
if(cljm_truthy(cljm_DOT_core_SLASH_reduced_QMARK_(init__6220))) {
return cljm_DOT_core_SLASH_deref(init__6220);

} else {
{
var G__6221 = (i__6216 + @2);
var G__6222 = init__6220;
i__6216 = G__6221;
init__6217 = G__6222;
continue;
}

}

} else {
return init__6217;

}
break;
}
};

/**
* @constructor
*/
cljm_DOT_core_SLASH_BitmapIndexedNode = (function (edit, bitmap, arr){
this.edit = edit;
this.bitmap = bitmap;
this.arr = arr;
})
cljm_DOT_core_SLASH_BitmapIndexedNode.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_BitmapIndexedNode.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/BitmapIndexedNode", nil);
};
cljm_DOT_core_SLASH_BitmapIndexedNode.prototype.edit_and_remove_pair = ^id(id e, id bit, id i) {
var this__6223 = this;
id inode__6224 = this;
if(cljm_truthy(([this__6223_DOT_bitmap isEqual:bit]))) {
return nil;

} else {
id editable__6225 = [inode__6224 ensuree editable];
id earr__6226 = editable__6225.arr;
id len__6227 = earr__6226.length;
editable__6225.bitmap = (bit ^ editable__6225.bitmap);
cljm_DOT_core_SLASH_array_copy(earr__6226, (@2 * (i + @1)), earr__6226, (@2 * i), (len__6227 - (@2 * (i + @1))));
(earr__6226[(len__6227 - @2)] = nil);
(earr__6226[(len__6227 - @1)] = nil);
return editable__6225;

}
};
cljm_DOT_core_SLASH_BitmapIndexedNode.prototype.inode_assoc_BANG_ = ^id(id edit, id shift, id hash, id key, id val, id added_leaf_QMARK_) {
var this__6228 = this;
id inode__6229 = this;
id bit__6230 = (1 << ((hash >>> shift) & 0x01f));
id idx__6231 = cljm_DOT_core_SLASH_bitmap_indexed_node_index(this__6228_DOT_bitmap, bit__6230);
if(cljm_truthy(([(this__6228_DOT_bitmap & bit__6230) isEqual:@0]))) {
id n__6232 = cljm_DOT_core_SLASH_bit_count(this__6228_DOT_bitmap);
if(cljm_truthy(((@2 * n__6232) < this__6228_DOT_arr.length))) {
id editable__6233 = [inode__6229 ensureedit editable];
id earr__6234 = editable__6233.arr;
added_leaf_QMARK_.val = @YES;
cljm_DOT_core_SLASH_array_copy_downward(earr__6234, (@2 * idx__6231), earr__6234, (@2 * (idx__6231 + @1)), (@2 * (n__6232 - idx__6231)));
(earr__6234[(@2 * idx__6231)] = key);
(earr__6234[((@2 * idx__6231) + @1)] = val);
editable__6233.bitmap = (editable__6233.bitmap | bit__6230);
return editable__6233;

} else {
if(cljm_truthy((n__6232 >= @16))) {
id nodes__6235 = cljm_DOT_core_SLASH_make_array(@32);
id jdx__6236 = ((hash >>> shift) & 0x01f);
(nodes__6235[jdx__6236] = [cljs_DOT_core_DOT_BitmapIndexedNode_SLASH_EMPTY inodeedit assoc(shift + @5), hash, key, val, added_leaf_QMARK_, nil]);
id i__6237 = @0;
id j__6238 = @0;
while(YES) {
if(cljm_truthy((i__6237 < @32))) {
if(cljm_truthy(([((this__6228_DOT_bitmap >>> i__6237) & @1) isEqual:@0]))) {
{
var G__6291 = (i__6237 + @1);
var G__6292 = j__6238;
i__6237 = G__6291;
j__6238 = G__6292;
continue;
}

} else {
(nodes__6235[i__6237] = (cljm_truthy(cljm_DOT_core_SLASH_not(((this__6228_DOT_arr[j__6238]) == nil)))) ?[cljs_DOT_core_DOT_BitmapIndexedNode_SLASH_EMPTY inodeedit assoc(shift + @5), cljs_DOT_core_SLASH_hash((this__6228_DOT_arr[j__6238])), (this__6228_DOT_arr[j__6238]), (this__6228_DOT_arr[(j__6238 + @1)]), added_leaf_QMARK_, nil]:(this__6228_DOT_arr[(j__6238 + @1)]));
{
var G__6293 = (i__6237 + @1);
var G__6294 = (j__6238 + @2);
i__6237 = G__6293;
j__6238 = G__6294;
continue;
}

}

} else {

}
break;
}
return [cljm_DOT_core_SLASH_ArrayNode alloc];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
id new_arr__6239 = cljm_DOT_core_SLASH_make_array((@2 * (n__6232 + @4)));
cljm_DOT_core_SLASH_array_copy(this__6228_DOT_arr, @0, new_arr__6239, @0, (@2 * idx__6231));
(new_arr__6239[(@2 * idx__6231)] = key);
(new_arr__6239[((@2 * idx__6231) + @1)] = val);
cljm_DOT_core_SLASH_array_copy(this__6228_DOT_arr, (@2 * idx__6231), new_arr__6239, (@2 * (idx__6231 + @1)), (@2 * (n__6232 - idx__6231)));
added_leaf_QMARK_.val = @YES;
id editable__6240 = [inode__6229 ensureedit editable];
editable__6240.arr = new_arr__6239;
editable__6240.bitmap = (editable__6240.bitmap | bit__6230);
return editable__6240;

} else {
return nil;

}

}

}

} else {
id key_or_nil__6241 = (this__6228_DOT_arr[(@2 * idx__6231)]);
id val_or_node__6242 = (this__6228_DOT_arr[((@2 * idx__6231) + @1)]);
if(cljm_truthy((key_or_nil__6241 == nil))) {
id n__6243 = [val_or_node__6242 inodeedit assoc(shift + @5), hash, key, val, added_leaf_QMARK_, nil];
if(cljm_truthy(([n__6243 isEqual:val_or_node__6242]))) {
return inode__6229;

} else {
return cljm_DOT_core_SLASH_edit_and_set(inode__6229, edit, ((@2 * idx__6231) + @1), n__6243);

}

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_key_test(key, key_or_nil__6241))) {
if(cljm_truthy(([val isEqual:val_or_node__6242]))) {
return inode__6229;

} else {
return cljm_DOT_core_SLASH_edit_and_set(inode__6229, edit, ((@2 * idx__6231) + @1), val);

}

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
added_leaf_QMARK_.val = @YES;
return cljm_DOT_core_SLASH_edit_and_set(inode__6229, edit, (@2 * idx__6231), nil, ((@2 * idx__6231) + @1), cljm_DOT_core_SLASH_create_node(edit, (shift + @5), key_or_nil__6241, val_or_node__6242, hash, key, val));

} else {
return nil;

}

}

}

}
};
cljm_DOT_core_SLASH_BitmapIndexedNode.prototype.inode_seq = ^id() {
var this__6244 = this;
id inode__6245 = this;
return cljm_DOT_core_SLASH_create_inode_seq(this__6244_DOT_arr);
};
cljm_DOT_core_SLASH_BitmapIndexedNode.prototype.inode_without_BANG_ = ^id(id edit, id shift, id hash, id key, id removed_leaf_QMARK_) {
var this__6246 = this;
id inode__6247 = this;
id bit__6248 = (1 << ((hash >>> shift) & 0x01f));
if(cljm_truthy(([(this__6246_DOT_bitmap & bit__6248) isEqual:@0]))) {
return inode__6247;

} else {
id idx__6249 = cljm_DOT_core_SLASH_bitmap_indexed_node_index(this__6246_DOT_bitmap, bit__6248);
id key_or_nil__6250 = (this__6246_DOT_arr[(@2 * idx__6249)]);
id val_or_node__6251 = (this__6246_DOT_arr[((@2 * idx__6249) + @1)]);
if(cljm_truthy((key_or_nil__6250 == nil))) {
id n__6252 = [val_or_node__6251 inodeedit without(shift + @5), hash, key, removed_leaf_QMARK_, nil];
if(cljm_truthy(([n__6252 isEqual:val_or_node__6251]))) {
return inode__6247;

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_not((n__6252 == nil)))) {
return cljm_DOT_core_SLASH_edit_and_set(inode__6247, edit, ((@2 * idx__6249) + @1), n__6252);

} else {
if(cljm_truthy(([this__6246_DOT_bitmap isEqual:bit__6248]))) {
return nil;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return [inode__6247 editedit andbit__6248 removeidx__6249 pair];

} else {
return nil;

}

}

}

}

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_key_test(key, key_or_nil__6250))) {
(removed_leaf_QMARK_[@0] = @YES);
return [inode__6247 editedit andbit__6248 removeidx__6249 pair];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return inode__6247;

} else {
return nil;

}

}

}

}
};
cljm_DOT_core_SLASH_BitmapIndexedNode.prototype.ensure_editable = ^id(id e) {
var this__6253 = this;
id inode__6254 = this;
if(cljm_truthy(([e isEqual:this__6253_DOT_edit]))) {
return inode__6254;

} else {
id n__6255 = cljm_DOT_core_SLASH_bit_count(this__6253_DOT_bitmap);
id new_arr__6256 = cljm_DOT_core_SLASH_make_array((cljm_truthy((n__6255 < @0))) ?@4:(@2 * (n__6255 + @1)));
cljm_DOT_core_SLASH_array_copy(this__6253_DOT_arr, @0, new_arr__6256, @0, (@2 * n__6255));
return [cljm_DOT_core_SLASH_BitmapIndexedNode alloc];

}
};
cljm_DOT_core_SLASH_BitmapIndexedNode.prototype.kv_reduce = ^id(id f, id init) {
var this__6257 = this;
id inode__6258 = this;
return cljm_DOT_core_SLASH_inode_kv_reduce(this__6257_DOT_arr, f, init);
};
cljm_DOT_core_SLASH_BitmapIndexedNode.prototype.inode_find = ^id(id shift, id hash, id key, id not_found) {
var this__6259 = this;
id inode__6260 = this;
id bit__6261 = (1 << ((hash >>> shift) & 0x01f));
if(cljm_truthy(([(this__6259_DOT_bitmap & bit__6261) isEqual:@0]))) {
return not_found;

} else {
id idx__6262 = cljm_DOT_core_SLASH_bitmap_indexed_node_index(this__6259_DOT_bitmap, bit__6261);
id key_or_nil__6263 = (this__6259_DOT_arr[(@2 * idx__6262)]);
id val_or_node__6264 = (this__6259_DOT_arr[((@2 * idx__6262) + @1)]);
if(cljm_truthy((key_or_nil__6263 == nil))) {
return [val_or_node__6264 inode(shift + @5) findhash, key, not_found, nil];

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_key_test(key, key_or_nil__6263))) {
return @[ key_or_nil__6263, val_or_node__6264 ];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return not_found;

} else {
return nil;

}

}

}

}
};
cljm_DOT_core_SLASH_BitmapIndexedNode.prototype.inode_without = ^id(id shift, id hash, id key) {
var this__6265 = this;
id inode__6266 = this;
id bit__6267 = (1 << ((hash >>> shift) & 0x01f));
if(cljm_truthy(([(this__6265_DOT_bitmap & bit__6267) isEqual:@0]))) {
return inode__6266;

} else {
id idx__6268 = cljm_DOT_core_SLASH_bitmap_indexed_node_index(this__6265_DOT_bitmap, bit__6267);
id key_or_nil__6269 = (this__6265_DOT_arr[(@2 * idx__6268)]);
id val_or_node__6270 = (this__6265_DOT_arr[((@2 * idx__6268) + @1)]);
if(cljm_truthy((key_or_nil__6269 == nil))) {
id n__6271 = [val_or_node__6270 inode(shift + @5) withouthash, key, nil];
if(cljm_truthy(([n__6271 isEqual:val_or_node__6270]))) {
return inode__6266;

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_not((n__6271 == nil)))) {
return [cljm_DOT_core_SLASH_BitmapIndexedNode alloc];

} else {
if(cljm_truthy(([this__6265_DOT_bitmap isEqual:bit__6267]))) {
return nil;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return [cljm_DOT_core_SLASH_BitmapIndexedNode alloc];

} else {
return nil;

}

}

}

}

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_key_test(key, key_or_nil__6269))) {
return [cljm_DOT_core_SLASH_BitmapIndexedNode alloc];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return inode__6266;

} else {
return nil;

}

}

}

}
};
cljm_DOT_core_SLASH_BitmapIndexedNode.prototype.inode_assoc = ^id(id shift, id hash, id key, id val, id added_leaf_QMARK_) {
var this__6272 = this;
id inode__6273 = this;
id bit__6274 = (1 << ((hash >>> shift) & 0x01f));
id idx__6275 = cljm_DOT_core_SLASH_bitmap_indexed_node_index(this__6272_DOT_bitmap, bit__6274);
if(cljm_truthy(([(this__6272_DOT_bitmap & bit__6274) isEqual:@0]))) {
id n__6276 = cljm_DOT_core_SLASH_bit_count(this__6272_DOT_bitmap);
if(cljm_truthy((n__6276 >= @16))) {
id nodes__6277 = cljm_DOT_core_SLASH_make_array(@32);
id jdx__6278 = ((hash >>> shift) & 0x01f);
(nodes__6277[jdx__6278] = [cljs_DOT_core_DOT_BitmapIndexedNode_SLASH_EMPTY inode(shift + @5) assochash, key, val, added_leaf_QMARK_, nil]);
id i__6279 = @0;
id j__6280 = @0;
while(YES) {
if(cljm_truthy((i__6279 < @32))) {
if(cljm_truthy(([((this__6272_DOT_bitmap >>> i__6279) & @1) isEqual:@0]))) {
{
var G__6295 = (i__6279 + @1);
var G__6296 = j__6280;
i__6279 = G__6295;
j__6280 = G__6296;
continue;
}

} else {
(nodes__6277[i__6279] = (cljm_truthy(cljm_DOT_core_SLASH_not(((this__6272_DOT_arr[j__6280]) == nil)))) ?[cljs_DOT_core_DOT_BitmapIndexedNode_SLASH_EMPTY inode(shift + @5) assoccljs_DOT_core_SLASH_hash((this__6272_DOT_arr[j__6280])), (this__6272_DOT_arr[j__6280]), (this__6272_DOT_arr[(j__6280 + @1)]), added_leaf_QMARK_, nil]:(this__6272_DOT_arr[(j__6280 + @1)]));
{
var G__6297 = (i__6279 + @1);
var G__6298 = (j__6280 + @2);
i__6279 = G__6297;
j__6280 = G__6298;
continue;
}

}

} else {

}
break;
}
return [cljm_DOT_core_SLASH_ArrayNode alloc];

} else {
id new_arr__6281 = cljm_DOT_core_SLASH_make_array((@2 * (n__6276 + @1)));
cljm_DOT_core_SLASH_array_copy(this__6272_DOT_arr, @0, new_arr__6281, @0, (@2 * idx__6275));
(new_arr__6281[(@2 * idx__6275)] = key);
(new_arr__6281[((@2 * idx__6275) + @1)] = val);
cljm_DOT_core_SLASH_array_copy(this__6272_DOT_arr, (@2 * idx__6275), new_arr__6281, (@2 * (idx__6275 + @1)), (@2 * (n__6276 - idx__6275)));
added_leaf_QMARK_.val = @YES;
return [cljm_DOT_core_SLASH_BitmapIndexedNode alloc];

}

} else {
id key_or_nil__6282 = (this__6272_DOT_arr[(@2 * idx__6275)]);
id val_or_node__6283 = (this__6272_DOT_arr[((@2 * idx__6275) + @1)]);
if(cljm_truthy((key_or_nil__6282 == nil))) {
id n__6284 = [val_or_node__6283 inode(shift + @5) assochash, key, val, added_leaf_QMARK_, nil];
if(cljm_truthy(([n__6284 isEqual:val_or_node__6283]))) {
return inode__6273;

} else {
return [cljm_DOT_core_SLASH_BitmapIndexedNode alloc];

}

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_key_test(key, key_or_nil__6282))) {
if(cljm_truthy(([val isEqual:val_or_node__6283]))) {
return inode__6273;

} else {
return [cljm_DOT_core_SLASH_BitmapIndexedNode alloc];

}

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
added_leaf_QMARK_.val = @YES;
return [cljm_DOT_core_SLASH_BitmapIndexedNode alloc];

} else {
return nil;

}

}

}

}
};
cljm_DOT_core_SLASH_BitmapIndexedNode.prototype.inode_lookup = ^id(id shift, id hash, id key, id not_found) {
var this__6285 = this;
id inode__6286 = this;
id bit__6287 = (1 << ((hash >>> shift) & 0x01f));
if(cljm_truthy(([(this__6285_DOT_bitmap & bit__6287) isEqual:@0]))) {
return not_found;

} else {
id idx__6288 = cljm_DOT_core_SLASH_bitmap_indexed_node_index(this__6285_DOT_bitmap, bit__6287);
id key_or_nil__6289 = (this__6285_DOT_arr[(@2 * idx__6288)]);
id val_or_node__6290 = (this__6285_DOT_arr[((@2 * idx__6288) + @1)]);
if(cljm_truthy((key_or_nil__6289 == nil))) {
return [val_or_node__6290 inode(shift + @5) lookuphash, key, not_found, nil];

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_key_test(key, key_or_nil__6289))) {
return val_or_node__6290;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return not_found;

} else {
return nil;

}

}

}

}
};
cljm_DOT_core_SLASH_BitmapIndexedNode;
cljs_DOT_core_DOT_BitmapIndexedNode_SLASH_EMPTY = [cljm_DOT_core_SLASH_BitmapIndexedNode alloc];
cljm_DOT_core_SLASH_pack_array_node = ^id(id array_node, id edit, id idx) {
id arr__6306 = array_node.arr;
id len__6307 = (@2 * (array_node.cnt - @1));
id new_arr__6308 = cljm_DOT_core_SLASH_make_array(len__6307);
id i__6309 = @0;
id j__6310 = @1;
id bitmap__6311 = @0;
while(YES) {
if(cljm_truthy((i__6309 < len__6307))) {
if(cljm_truthy({id and__3822__auto____6312 = cljm_DOT_core_SLASH_not(([i__6309 isEqual:idx]));
if(cljm_truthy(and__3822__auto____6312)) {
return cljm_DOT_core_SLASH_not(((arr__6306[i__6309]) == nil));

} else {
return and__3822__auto____6312;

}
})) {
(new_arr__6308[j__6310] = (arr__6306[i__6309]));
{
var G__6313 = (i__6309 + @1);
var G__6314 = (j__6310 + @2);
var G__6315 = (bitmap__6311 | (@1 << i__6309));
i__6309 = G__6313;
j__6310 = G__6314;
bitmap__6311 = G__6315;
continue;
}

} else {
{
var G__6316 = (i__6309 + @1);
var G__6317 = j__6310;
var G__6318 = bitmap__6311;
i__6309 = G__6316;
j__6310 = G__6317;
bitmap__6311 = G__6318;
continue;
}

}

} else {
return [cljm_DOT_core_SLASH_BitmapIndexedNode alloc];

}
break;
}
};

/**
* @constructor
*/
cljm_DOT_core_SLASH_ArrayNode = (function (edit, cnt, arr){
this.edit = edit;
this.cnt = cnt;
this.arr = arr;
})
cljm_DOT_core_SLASH_ArrayNode.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_ArrayNode.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/ArrayNode", nil);
};
cljm_DOT_core_SLASH_ArrayNode.prototype.inode_assoc_BANG_ = ^id(id edit, id shift, id hash, id key, id val, id added_leaf_QMARK_) {
var this__6319 = this;
id inode__6320 = this;
id idx__6321 = ((hash >>> shift) & 0x01f);
id node__6322 = (this__6319_DOT_arr[idx__6321]);
if(cljm_truthy((node__6322 == nil))) {
id editable__6323 = cljm_DOT_core_SLASH_edit_and_set(inode__6320, edit, idx__6321, [cljs_DOT_core_DOT_BitmapIndexedNode_SLASH_EMPTY inodeedit assoc(shift + @5), hash, key, val, added_leaf_QMARK_, nil]);
editable__6323.cnt = (editable__6323.cnt + @1);
return editable__6323;

} else {
id n__6324 = [node__6322 inodeedit assoc(shift + @5), hash, key, val, added_leaf_QMARK_, nil];
if(cljm_truthy(([n__6324 isEqual:node__6322]))) {
return inode__6320;

} else {
return cljm_DOT_core_SLASH_edit_and_set(inode__6320, edit, idx__6321, n__6324);

}

}
};
cljm_DOT_core_SLASH_ArrayNode.prototype.inode_seq = ^id() {
var this__6325 = this;
id inode__6326 = this;
return cljm_DOT_core_SLASH_create_array_node_seq(this__6325_DOT_arr);
};
cljm_DOT_core_SLASH_ArrayNode.prototype.inode_without_BANG_ = ^id(id edit, id shift, id hash, id key, id removed_leaf_QMARK_) {
var this__6327 = this;
id inode__6328 = this;
id idx__6329 = ((hash >>> shift) & 0x01f);
id node__6330 = (this__6327_DOT_arr[idx__6329]);
if(cljm_truthy((node__6330 == nil))) {
return inode__6328;

} else {
id n__6331 = [node__6330 inodeedit without(shift + @5), hash, key, removed_leaf_QMARK_, nil];
if(cljm_truthy(([n__6331 isEqual:node__6330]))) {
return inode__6328;

} else {
if(cljm_truthy((n__6331 == nil))) {
if(cljm_truthy((this__6327_DOT_cnt <= @8))) {
return cljm_DOT_core_SLASH_pack_array_node(inode__6328, edit, idx__6329);

} else {
id editable__6332 = cljm_DOT_core_SLASH_edit_and_set(inode__6328, edit, idx__6329, n__6331);
editable__6332.cnt = (editable__6332.cnt - @1);
return editable__6332;

}

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return cljm_DOT_core_SLASH_edit_and_set(inode__6328, edit, idx__6329, n__6331);

} else {
return nil;

}

}

}

}
};
cljm_DOT_core_SLASH_ArrayNode.prototype.ensure_editable = ^id(id e) {
var this__6333 = this;
id inode__6334 = this;
if(cljm_truthy(([e isEqual:this__6333_DOT_edit]))) {
return inode__6334;

} else {
return [cljm_DOT_core_SLASH_ArrayNode alloc];

}
};
cljm_DOT_core_SLASH_ArrayNode.prototype.kv_reduce = ^id(id f, id init) {
var this__6335 = this;
id inode__6336 = this;
id len__6337 = this__6335_DOT_arr.length;
id i__6338 = @0;
id init__6339 = init;
while(YES) {
if(cljm_truthy((i__6338 < len__6337))) {
id node__6340 = (this__6335_DOT_arr[i__6338]);
if(cljm_truthy(cljm_DOT_core_SLASH_not((node__6340 == nil)))) {
id init__6341 = [node__6340 kvf reduceinit__6339];
if(cljm_truthy(cljm_DOT_core_SLASH_reduced_QMARK_(init__6341))) {
return cljm_DOT_core_SLASH_deref(init__6341);

} else {
{
var G__6360 = (i__6338 + @1);
var G__6361 = init__6341;
i__6338 = G__6360;
init__6339 = G__6361;
continue;
}

}

} else {
return nil;

}

} else {
return init__6339;

}
break;
}
};
cljm_DOT_core_SLASH_ArrayNode.prototype.inode_find = ^id(id shift, id hash, id key, id not_found) {
var this__6342 = this;
id inode__6343 = this;
id idx__6344 = ((hash >>> shift) & 0x01f);
id node__6345 = (this__6342_DOT_arr[idx__6344]);
if(cljm_truthy(cljm_DOT_core_SLASH_not((node__6345 == nil)))) {
return [node__6345 inode(shift + @5) findhash, key, not_found, nil];

} else {
return not_found;

}
};
cljm_DOT_core_SLASH_ArrayNode.prototype.inode_without = ^id(id shift, id hash, id key) {
var this__6346 = this;
id inode__6347 = this;
id idx__6348 = ((hash >>> shift) & 0x01f);
id node__6349 = (this__6346_DOT_arr[idx__6348]);
if(cljm_truthy(cljm_DOT_core_SLASH_not((node__6349 == nil)))) {
id n__6350 = [node__6349 inode(shift + @5) withouthash, key, nil];
if(cljm_truthy(([n__6350 isEqual:node__6349]))) {
return inode__6347;

} else {
if(cljm_truthy((n__6350 == nil))) {
if(cljm_truthy((this__6346_DOT_cnt <= @8))) {
return cljm_DOT_core_SLASH_pack_array_node(inode__6347, nil, idx__6348);

} else {
return [cljm_DOT_core_SLASH_ArrayNode alloc];

}

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return [cljm_DOT_core_SLASH_ArrayNode alloc];

} else {
return nil;

}

}

}

} else {
return inode__6347;

}
};
cljm_DOT_core_SLASH_ArrayNode.prototype.inode_assoc = ^id(id shift, id hash, id key, id val, id added_leaf_QMARK_) {
var this__6351 = this;
id inode__6352 = this;
id idx__6353 = ((hash >>> shift) & 0x01f);
id node__6354 = (this__6351_DOT_arr[idx__6353]);
if(cljm_truthy((node__6354 == nil))) {
return [cljm_DOT_core_SLASH_ArrayNode alloc];

} else {
id n__6355 = [node__6354 inode(shift + @5) assochash, key, val, added_leaf_QMARK_, nil];
if(cljm_truthy(([n__6355 isEqual:node__6354]))) {
return inode__6352;

} else {
return [cljm_DOT_core_SLASH_ArrayNode alloc];

}

}
};
cljm_DOT_core_SLASH_ArrayNode.prototype.inode_lookup = ^id(id shift, id hash, id key, id not_found) {
var this__6356 = this;
id inode__6357 = this;
id idx__6358 = ((hash >>> shift) & 0x01f);
id node__6359 = (this__6356_DOT_arr[idx__6358]);
if(cljm_truthy(cljm_DOT_core_SLASH_not((node__6359 == nil)))) {
return [node__6359 inode(shift + @5) lookuphash, key, not_found, nil];

} else {
return not_found;

}
};
cljm_DOT_core_SLASH_ArrayNode;
cljm_DOT_core_SLASH_hash_collision_node_find_index = ^id(id arr, id cnt, id key) {
id lim__6364 = (@2 * cnt);
id i__6365 = @0;
while(YES) {
if(cljm_truthy((i__6365 < lim__6364))) {
if(cljm_truthy(cljm_DOT_core_SLASH_key_test(key, (arr[i__6365])))) {
return i__6365;

} else {
{
var G__6366 = (i__6365 + @2);
i__6365 = G__6366;
continue;
}

}

} else {
return @-1;

}
break;
}
};

/**
* @constructor
*/
cljm_DOT_core_SLASH_HashCollisionNode = (function (edit, collision_hash, cnt, arr){
this.edit = edit;
this.collision_hash = collision_hash;
this.cnt = cnt;
this.arr = arr;
})
cljm_DOT_core_SLASH_HashCollisionNode.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_HashCollisionNode.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/HashCollisionNode", nil);
};
cljm_DOT_core_SLASH_HashCollisionNode.prototype.inode_assoc_BANG_ = ^id(id edit, id shift, id hash, id key, id val, id added_leaf_QMARK_) {
var this__6367 = this;
id inode__6368 = this;
if(cljm_truthy(([hash isEqual:this__6367_DOT_collision_hash]))) {
id idx__6369 = cljm_DOT_core_SLASH_hash_collision_node_find_index(this__6367_DOT_arr, this__6367_DOT_cnt, key);
if(cljm_truthy(([idx__6369 isEqual:@-1]))) {
if(cljm_truthy((this__6367_DOT_arr.length > (@2 * this__6367_DOT_cnt)))) {
id editable__6370 = cljm_DOT_core_SLASH_edit_and_set(inode__6368, edit, (@2 * this__6367_DOT_cnt), key, ((@2 * this__6367_DOT_cnt) + @1), val);
added_leaf_QMARK_.val = @YES;
editable__6370.cnt = (editable__6370.cnt + @1);
return editable__6370;

} else {
id len__6371 = this__6367_DOT_arr.length;
id new_arr__6372 = cljm_DOT_core_SLASH_make_array((len__6371 + @2));
cljm_DOT_core_SLASH_array_copy(this__6367_DOT_arr, @0, new_arr__6372, @0, len__6371);
(new_arr__6372[len__6371] = key);
(new_arr__6372[(len__6371 + @1)] = val);
added_leaf_QMARK_.val = @YES;
return [inode__6368 ensureedit editable(this__6367_DOT_cnt + @1) arraynew_arr__6372];

}

} else {
if(cljm_truthy(([(this__6367_DOT_arr[(idx__6369 + @1)]) isEqual:val]))) {
return inode__6368;

} else {
return cljm_DOT_core_SLASH_edit_and_set(inode__6368, edit, (idx__6369 + @1), val);

}

}

} else {
return [[cljm_DOT_core_SLASH_BitmapIndexedNode alloc] inodeedit assocshift, hash, key, val, added_leaf_QMARK_, nil];

}
};
cljm_DOT_core_SLASH_HashCollisionNode.prototype.inode_seq = ^id() {
var this__6373 = this;
id inode__6374 = this;
return cljm_DOT_core_SLASH_create_inode_seq(this__6373_DOT_arr);
};
cljm_DOT_core_SLASH_HashCollisionNode.prototype.inode_without_BANG_ = ^id(id edit, id shift, id hash, id key, id removed_leaf_QMARK_) {
var this__6375 = this;
id inode__6376 = this;
id idx__6377 = cljm_DOT_core_SLASH_hash_collision_node_find_index(this__6375_DOT_arr, this__6375_DOT_cnt, key);
if(cljm_truthy(([idx__6377 isEqual:@-1]))) {
return inode__6376;

} else {
(removed_leaf_QMARK_[@0] = @YES);
if(cljm_truthy(([this__6375_DOT_cnt isEqual:@1]))) {
return nil;

} else {
id editable__6378 = [inode__6376 ensureedit editable];
id earr__6379 = editable__6378.arr;
(earr__6379[idx__6377] = (earr__6379[((@2 * this__6375_DOT_cnt) - @2)]));
(earr__6379[(idx__6377 + @1)] = (earr__6379[((@2 * this__6375_DOT_cnt) - @1)]));
(earr__6379[((@2 * this__6375_DOT_cnt) - @1)] = nil);
(earr__6379[((@2 * this__6375_DOT_cnt) - @2)] = nil);
editable__6378.cnt = (editable__6378.cnt - @1);
return editable__6378;

}

}
};
cljm_DOT_core_SLASH_HashCollisionNode.prototype.ensure_editable = ^id(id e) {
var this__6380 = this;
id inode__6381 = this;
if(cljm_truthy(([e isEqual:this__6380_DOT_edit]))) {
return inode__6381;

} else {
id new_arr__6382 = cljm_DOT_core_SLASH_make_array((@2 * (this__6380_DOT_cnt + @1)));
cljm_DOT_core_SLASH_array_copy(this__6380_DOT_arr, @0, new_arr__6382, @0, (@2 * this__6380_DOT_cnt));
return [cljm_DOT_core_SLASH_HashCollisionNode alloc];

}
};
cljm_DOT_core_SLASH_HashCollisionNode.prototype.kv_reduce = ^id(id f, id init) {
var this__6383 = this;
id inode__6384 = this;
return cljm_DOT_core_SLASH_inode_kv_reduce(this__6383_DOT_arr, f, init);
};
cljm_DOT_core_SLASH_HashCollisionNode.prototype.inode_find = ^id(id shift, id hash, id key, id not_found) {
var this__6385 = this;
id inode__6386 = this;
id idx__6387 = cljm_DOT_core_SLASH_hash_collision_node_find_index(this__6385_DOT_arr, this__6385_DOT_cnt, key);
if(cljm_truthy((idx__6387 < @0))) {
return not_found;

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_key_test(key, (this__6385_DOT_arr[idx__6387])))) {
return @[ (this__6385_DOT_arr[idx__6387]), (this__6385_DOT_arr[(idx__6387 + @1)]) ];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return not_found;

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_HashCollisionNode.prototype.inode_without = ^id(id shift, id hash, id key) {
var this__6388 = this;
id inode__6389 = this;
id idx__6390 = cljm_DOT_core_SLASH_hash_collision_node_find_index(this__6388_DOT_arr, this__6388_DOT_cnt, key);
if(cljm_truthy(([idx__6390 isEqual:@-1]))) {
return inode__6389;

} else {
if(cljm_truthy(([this__6388_DOT_cnt isEqual:@1]))) {
return nil;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return [cljm_DOT_core_SLASH_HashCollisionNode alloc];

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_HashCollisionNode.prototype.inode_assoc = ^id(id shift, id hash, id key, id val, id added_leaf_QMARK_) {
var this__6391 = this;
id inode__6392 = this;
if(cljm_truthy(([hash isEqual:this__6391_DOT_collision_hash]))) {
id idx__6393 = cljm_DOT_core_SLASH_hash_collision_node_find_index(this__6391_DOT_arr, this__6391_DOT_cnt, key);
if(cljm_truthy(([idx__6393 isEqual:@-1]))) {
id len__6394 = this__6391_DOT_arr.length;
id new_arr__6395 = cljm_DOT_core_SLASH_make_array((len__6394 + @2));
cljm_DOT_core_SLASH_array_copy(this__6391_DOT_arr, @0, new_arr__6395, @0, len__6394);
(new_arr__6395[len__6394] = key);
(new_arr__6395[(len__6394 + @1)] = val);
added_leaf_QMARK_.val = @YES;
return [cljm_DOT_core_SLASH_HashCollisionNode alloc];

} else {
if(cljm_truthy(cljm_DOT_core_SLASH__EQ_((this__6391_DOT_arr[idx__6393]), val, nil))) {
return inode__6392;

} else {
return [cljm_DOT_core_SLASH_HashCollisionNode alloc];

}

}

} else {
return [[cljm_DOT_core_SLASH_BitmapIndexedNode alloc] inodeshift assochash, key, val, added_leaf_QMARK_, nil];

}
};
cljm_DOT_core_SLASH_HashCollisionNode.prototype.inode_lookup = ^id(id shift, id hash, id key, id not_found) {
var this__6396 = this;
id inode__6397 = this;
id idx__6398 = cljm_DOT_core_SLASH_hash_collision_node_find_index(this__6396_DOT_arr, this__6396_DOT_cnt, key);
if(cljm_truthy((idx__6398 < @0))) {
return not_found;

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_key_test(key, (this__6396_DOT_arr[idx__6398])))) {
return (this__6396_DOT_arr[(idx__6398 + @1)]);

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return not_found;

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_HashCollisionNode.prototype.ensure_editable_array = ^id(id e, id count, id array) {
var this__6399 = this;
id inode__6400 = this;
if(cljm_truthy(([e isEqual:this__6399_DOT_edit]))) {
this__6399_DOT_arr = array;
this__6399_DOT_cnt = count;
return inode__6400;

} else {
return [cljm_DOT_core_SLASH_HashCollisionNode alloc];

}
};
cljm_DOT_core_SLASH_HashCollisionNode;
cljm_DOT_core_SLASH_create_node = (function() {
var create_node = null;
var create_node__6 = ^id(id shift, id key1, id val1, id key2hash, id key2, id val2) {
id key1hash__6405 = cljm_DOT_core_SLASH_hash(key1);
if(cljm_truthy(([key1hash__6405 isEqual:key2hash]))) {
return [cljm_DOT_core_SLASH_HashCollisionNode alloc];

} else {
id added_leaf_QMARK___6406 = [cljm_DOT_core_SLASH_Box alloc];
return [[cljs_DOT_core_DOT_BitmapIndexedNode_SLASH_EMPTY inodeshift assockey1hash__6405, key1, val1, added_leaf_QMARK___6406, nil] inodeshift assockey2hash, key2, val2, added_leaf_QMARK___6406, nil];

}
};
var create_node__7 = ^id(id edit, id shift, id key1, id val1, id key2hash, id key2, id val2) {
id key1hash__6407 = cljm_DOT_core_SLASH_hash(key1);
if(cljm_truthy(([key1hash__6407 isEqual:key2hash]))) {
return [cljm_DOT_core_SLASH_HashCollisionNode alloc];

} else {
id added_leaf_QMARK___6408 = [cljm_DOT_core_SLASH_Box alloc];
return [[cljs_DOT_core_DOT_BitmapIndexedNode_SLASH_EMPTY inodeedit assocshift, key1hash__6407, key1, val1, added_leaf_QMARK___6408, nil] inodeedit assocshift, key2hash, key2, val2, added_leaf_QMARK___6408, nil];

}
};
create_node = function(edit, shift, key1, val1, key2hash, key2, val2){
switch(arguments.length){
case 6:
return create_node__6.call(this,edit, shift, key1, val1, key2hash, key2);
case 7:
return create_node__7.call(this,edit, shift, key1, val1, key2hash, key2, val2);
}
throw('Invalid arity: ' + arguments.length);
};
create_node.cljm$lang$arity$6 = create_node__6;
create_node.cljm$lang$arity$7 = create_node__7;
return create_node;
})()
;

/**
* @constructor
*/
cljm_DOT_core_SLASH_NodeSeq = (function (meta, nodes, i, s, __hash){
this.meta = meta;
this.nodes = nodes;
this.i = i;
this.s = s;
this.__hash = __hash;
this.cljm$lang$protocol_mask$partition1$ = 0;
this.cljm$lang$protocol_mask$partition0$ = 31850572;
})
cljm_DOT_core_SLASH_NodeSeq.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_NodeSeq.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/NodeSeq", nil);
};
cljm_DOT_core_SLASH_NodeSeq.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__6409 = this;
id h__1314__auto____6410 = this__6409_DOT___hash;
if(cljm_truthy(cljm_DOT_core_SLASH_not((h__1314__auto____6410 == nil)))) {
return h__1314__auto____6410;

} else {
id h__1314__auto____6411 = cljm_DOT_core_SLASH_hash_coll(coll);
this__6409_DOT___hash = h__1314__auto____6411;
return h__1314__auto____6411;

}
};
cljm_DOT_core_SLASH_NodeSeq.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id o) {
var this__6412 = this;
return cljm_DOT_core_SLASH_cons(o, coll);
};
cljm_DOT_core_SLASH_NodeSeq.prototype.toString = ^id() {
var this__6413 = this;
id this__6414 = this;
return cljm_DOT_core_SLASH_pr_str(this__6414, nil);
};
cljm_DOT_core_SLASH_NodeSeq.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id this$) {
var this__6415 = this;
return this$;
};
cljm_DOT_core_SLASH_NodeSeq.prototype.cljm$core$ISeq$_first$arity$1 = ^id(id coll) {
var this__6416 = this;
if(cljm_truthy((this__6416_DOT_s == nil))) {
return @[ (this__6416_DOT_nodes[this__6416_DOT_i]), (this__6416_DOT_nodes[(this__6416_DOT_i + @1)]) ];

} else {
return cljm_DOT_core_SLASH_first(this__6416_DOT_s);

}
};
cljm_DOT_core_SLASH_NodeSeq.prototype.cljm$core$ISeq$_rest$arity$1 = ^id(id coll) {
var this__6417 = this;
if(cljm_truthy((this__6417_DOT_s == nil))) {
return cljm_DOT_core_SLASH_create_inode_seq(this__6417_DOT_nodes, (this__6417_DOT_i + @2), nil);

} else {
return cljm_DOT_core_SLASH_create_inode_seq(this__6417_DOT_nodes, this__6417_DOT_i, cljm_DOT_core_SLASH_next(this__6417_DOT_s));

}
};
cljm_DOT_core_SLASH_NodeSeq.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__6418 = this;
return cljm_DOT_core_SLASH_equiv_sequential(coll, other);
};
cljm_DOT_core_SLASH_NodeSeq.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__6419 = this;
return [cljm_DOT_core_SLASH_NodeSeq alloc];
};
cljm_DOT_core_SLASH_NodeSeq.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__6420 = this;
return this__6420_DOT_meta;
};
cljm_DOT_core_SLASH_NodeSeq.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__6421 = this;
return cljm_DOT_core_SLASH_with_meta(cljs_DOT_core_DOT_List_SLASH_EMPTY, this__6421_DOT_meta);
};
cljm_DOT_core_SLASH_NodeSeq;
cljm_DOT_core_SLASH_create_inode_seq = (function() {
var create_inode_seq = null;
var create_inode_seq__1 = ^id(id nodes) {
return create_inode_seq(nodes, @0, nil);
};
var create_inode_seq__3 = ^id(id nodes, id i, id s) {
if(cljm_truthy((s == nil))) {
id len__6428 = nodes.length;
id j__6429 = i;
while(YES) {
if(cljm_truthy((j__6429 < len__6428))) {
if(cljm_truthy(cljm_DOT_core_SLASH_not(((nodes[j__6429]) == nil)))) {
return [cljm_DOT_core_SLASH_NodeSeq alloc];

} else {
id temp__3971__auto____6430 = (nodes[(j__6429 + @1)]);
if(cljm_truthy(temp__3971__auto____6430)) {
id node__6431 = temp__3971__auto____6430;
id temp__3971__auto____6432 = [node__6431 inode];
if(cljm_truthy(temp__3971__auto____6432)) {
id node_seq__6433 = temp__3971__auto____6432;
return [cljm_DOT_core_SLASH_NodeSeq alloc];

} else {
{
var G__6434 = (j__6429 + @2);
j__6429 = G__6434;
continue;
}

}

} else {
{
var G__6435 = (j__6429 + @2);
j__6429 = G__6435;
continue;
}

}

}

} else {
return nil;

}
break;
}

} else {
return [cljm_DOT_core_SLASH_NodeSeq alloc];

}
};
create_inode_seq = function(nodes, i, s){
switch(arguments.length){
case 1:
return create_inode_seq__1.call(this,nodes);
case 3:
return create_inode_seq__3.call(this,nodes, i, s);
}
throw('Invalid arity: ' + arguments.length);
};
create_inode_seq.cljm$lang$arity$1 = create_inode_seq__1;
create_inode_seq.cljm$lang$arity$3 = create_inode_seq__3;
return create_inode_seq;
})()
;

/**
* @constructor
*/
cljm_DOT_core_SLASH_ArrayNodeSeq = (function (meta, nodes, i, s, __hash){
this.meta = meta;
this.nodes = nodes;
this.i = i;
this.s = s;
this.__hash = __hash;
this.cljm$lang$protocol_mask$partition1$ = 0;
this.cljm$lang$protocol_mask$partition0$ = 31850572;
})
cljm_DOT_core_SLASH_ArrayNodeSeq.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_ArrayNodeSeq.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/ArrayNodeSeq", nil);
};
cljm_DOT_core_SLASH_ArrayNodeSeq.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__6436 = this;
id h__1314__auto____6437 = this__6436_DOT___hash;
if(cljm_truthy(cljm_DOT_core_SLASH_not((h__1314__auto____6437 == nil)))) {
return h__1314__auto____6437;

} else {
id h__1314__auto____6438 = cljm_DOT_core_SLASH_hash_coll(coll);
this__6436_DOT___hash = h__1314__auto____6438;
return h__1314__auto____6438;

}
};
cljm_DOT_core_SLASH_ArrayNodeSeq.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id o) {
var this__6439 = this;
return cljm_DOT_core_SLASH_cons(o, coll);
};
cljm_DOT_core_SLASH_ArrayNodeSeq.prototype.toString = ^id() {
var this__6440 = this;
id this__6441 = this;
return cljm_DOT_core_SLASH_pr_str(this__6441, nil);
};
cljm_DOT_core_SLASH_ArrayNodeSeq.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id this$) {
var this__6442 = this;
return this$;
};
cljm_DOT_core_SLASH_ArrayNodeSeq.prototype.cljm$core$ISeq$_first$arity$1 = ^id(id coll) {
var this__6443 = this;
return cljm_DOT_core_SLASH_first(this__6443_DOT_s);
};
cljm_DOT_core_SLASH_ArrayNodeSeq.prototype.cljm$core$ISeq$_rest$arity$1 = ^id(id coll) {
var this__6444 = this;
return cljm_DOT_core_SLASH_create_array_node_seq(nil, this__6444_DOT_nodes, this__6444_DOT_i, cljm_DOT_core_SLASH_next(this__6444_DOT_s));
};
cljm_DOT_core_SLASH_ArrayNodeSeq.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__6445 = this;
return cljm_DOT_core_SLASH_equiv_sequential(coll, other);
};
cljm_DOT_core_SLASH_ArrayNodeSeq.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__6446 = this;
return [cljm_DOT_core_SLASH_ArrayNodeSeq alloc];
};
cljm_DOT_core_SLASH_ArrayNodeSeq.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__6447 = this;
return this__6447_DOT_meta;
};
cljm_DOT_core_SLASH_ArrayNodeSeq.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__6448 = this;
return cljm_DOT_core_SLASH_with_meta(cljs_DOT_core_DOT_List_SLASH_EMPTY, this__6448_DOT_meta);
};
cljm_DOT_core_SLASH_ArrayNodeSeq;
cljm_DOT_core_SLASH_create_array_node_seq = (function() {
var create_array_node_seq = null;
var create_array_node_seq__1 = ^id(id nodes) {
return create_array_node_seq(nil, nodes, @0, nil);
};
var create_array_node_seq__4 = ^id(id meta, id nodes, id i, id s) {
if(cljm_truthy((s == nil))) {
id len__6455 = nodes.length;
id j__6456 = i;
while(YES) {
if(cljm_truthy((j__6456 < len__6455))) {
id temp__3971__auto____6457 = (nodes[j__6456]);
if(cljm_truthy(temp__3971__auto____6457)) {
id nj__6458 = temp__3971__auto____6457;
id temp__3971__auto____6459 = [nj__6458 inode];
if(cljm_truthy(temp__3971__auto____6459)) {
id ns__6460 = temp__3971__auto____6459;
return [cljm_DOT_core_SLASH_ArrayNodeSeq alloc];

} else {
{
var G__6461 = (j__6456 + @1);
j__6456 = G__6461;
continue;
}

}

} else {
{
var G__6462 = (j__6456 + @1);
j__6456 = G__6462;
continue;
}

}

} else {
return nil;

}
break;
}

} else {
return [cljm_DOT_core_SLASH_ArrayNodeSeq alloc];

}
};
create_array_node_seq = function(meta, nodes, i, s){
switch(arguments.length){
case 1:
return create_array_node_seq__1.call(this,meta);
case 4:
return create_array_node_seq__4.call(this,meta, nodes, i, s);
}
throw('Invalid arity: ' + arguments.length);
};
create_array_node_seq.cljm$lang$arity$1 = create_array_node_seq__1;
create_array_node_seq.cljm$lang$arity$4 = create_array_node_seq__4;
return create_array_node_seq;
})()
;

/**
* @constructor
*/
cljm_DOT_core_SLASH_PersistentHashMap = (function (meta, cnt, root, has_nil_QMARK_, nil_val, __hash){
this.meta = meta;
this.cnt = cnt;
this.root = root;
this.has_nil_QMARK_ = has_nil_QMARK_;
this.nil_val = nil_val;
this.__hash = __hash;
this.cljm$lang$protocol_mask$partition1$ = 1;
this.cljm$lang$protocol_mask$partition0$ = 16123663;
})
cljm_DOT_core_SLASH_PersistentHashMap.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_PersistentHashMap.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/PersistentHashMap", nil);
};
cljm_DOT_core_SLASH_PersistentHashMap.prototype.cljm$core$IEditableCollection$_as_transient$arity$1 = ^id(id coll) {
var this__6465 = this;
return [cljm_DOT_core_SLASH_TransientHashMap alloc];
};
cljm_DOT_core_SLASH_PersistentHashMap.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__6466 = this;
id h__1314__auto____6467 = this__6466_DOT___hash;
if(cljm_truthy(cljm_DOT_core_SLASH_not((h__1314__auto____6467 == nil)))) {
return h__1314__auto____6467;

} else {
id h__1314__auto____6468 = cljm_DOT_core_SLASH_hash_imap(coll);
this__6466_DOT___hash = h__1314__auto____6468;
return h__1314__auto____6468;

}
};
cljm_DOT_core_SLASH_PersistentHashMap.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id coll, id k) {
var this__6469 = this;
return cljm_DOT_core_SLASH__lookup(coll, k, nil);
};
cljm_DOT_core_SLASH_PersistentHashMap.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id coll, id k, id not_found) {
var this__6470 = this;
if(cljm_truthy((k == nil))) {
if(cljm_truthy(this__6470_DOT_has_nil_QMARK_)) {
return this__6470_DOT_nil_val;

} else {
return not_found;

}

} else {
if(cljm_truthy((this__6470_DOT_root == nil))) {
return not_found;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return [this__6470_DOT_root inode@0 lookupcljm_DOT_core_SLASH_hash(k), k, not_found, nil];

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_PersistentHashMap.prototype.cljm$core$IAssociative$_assoc$arity$3 = ^id(id coll, id k, id v) {
var this__6471 = this;
if(cljm_truthy((k == nil))) {
if(cljm_truthy({id and__3822__auto____6472 = this__6471_DOT_has_nil_QMARK_;
if(cljm_truthy(and__3822__auto____6472)) {
return ([v isEqual:this__6471_DOT_nil_val]);

} else {
return and__3822__auto____6472;

}
})) {
return coll;

} else {
return [cljm_DOT_core_SLASH_PersistentHashMap alloc];

}

} else {
id added_leaf_QMARK___6473 = [cljm_DOT_core_SLASH_Box alloc];
id new_root__6474 = [(cljm_truthy((this__6471_DOT_root == nil))) ?cljs_DOT_core_DOT_BitmapIndexedNode_SLASH_EMPTY:this__6471_DOT_root inode@0 assoccljm_DOT_core_SLASH_hash(k), k, v, added_leaf_QMARK___6473, nil];
if(cljm_truthy(([new_root__6474 isEqual:this__6471_DOT_root]))) {
return coll;

} else {
return [cljm_DOT_core_SLASH_PersistentHashMap alloc];

}

}
};
cljm_DOT_core_SLASH_PersistentHashMap.prototype.cljm$core$IAssociative$_contains_key_QMARK_$arity$2 = ^id(id coll, id k) {
var this__6475 = this;
if(cljm_truthy((k == nil))) {
return this__6475_DOT_has_nil_QMARK_;

} else {
if(cljm_truthy((this__6475_DOT_root == nil))) {
return @NO;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return cljm_DOT_core_SLASH_not(([[this__6475_DOT_root inode@0 lookupcljm_DOT_core_SLASH_hash(k), k, cljm_DOT_core_SLASH_lookup_sentinel, nil] isEqual:cljm_DOT_core_SLASH_lookup_sentinel]));

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_PersistentHashMap.prototype.call = (function() {
var G__6498 = null;
var G__6498__2 = ^id(id this_sym6476, id k) {
var this__6478 = this;
id this_sym6476__6479 = this;
id coll__6480 = this_sym6476__6479;
return cljm_DOT_core_SLASH__lookup(coll__6480, k);
};
var G__6498__3 = ^id(id this_sym6477, id k, id not_found) {
var this__6478 = this;
id this_sym6477__6481 = this;
id coll__6482 = this_sym6477__6481;
return cljm_DOT_core_SLASH__lookup(coll__6482, k, not_found);
};
G__6498 = function(this_sym6477, k, not_found){
switch(arguments.length){
case 2:
return G__6498__2.call(this,this_sym6477, k);
case 3:
return G__6498__3.call(this,this_sym6477, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__6498;
})()
;
cljm_DOT_core_SLASH_PersistentHashMap.prototype.apply = ^id(id this_sym6463, id args6464) {
var this__6483 = this;
return [this_sym6463.call applythis_sym6463, [@[this_sym6463] concatargs6464.slice()], nil];
};
cljm_DOT_core_SLASH_PersistentHashMap.prototype.cljm$core$IKVReduce$_kv_reduce$arity$3 = ^id(id coll, id f, id init) {
var this__6484 = this;
id init__6485 = (cljm_truthy(this__6484_DOT_has_nil_QMARK_)) ?f(init, nil, this__6484_DOT_nil_val):init;
if(cljm_truthy(cljm_DOT_core_SLASH_reduced_QMARK_(init__6485))) {
return cljm_DOT_core_SLASH_deref(init__6485);

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_not((this__6484_DOT_root == nil)))) {
return [this__6484_DOT_root kvf reduceinit__6485];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return init__6485;

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_PersistentHashMap.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id entry) {
var this__6486 = this;
if(cljm_truthy(cljm_DOT_core_SLASH_vector_QMARK_(entry))) {
return cljm_DOT_core_SLASH__assoc(coll, cljm_DOT_core_SLASH__nth(entry, @0), cljm_DOT_core_SLASH__nth(entry, @1));

} else {
return cljm_DOT_core_SLASH_reduce(cljm_DOT_core_SLASH__conj, coll, entry);

}
};
cljm_DOT_core_SLASH_PersistentHashMap.prototype.toString = ^id() {
var this__6487 = this;
id this__6488 = this;
return cljm_DOT_core_SLASH_pr_str(this__6488, nil);
};
cljm_DOT_core_SLASH_PersistentHashMap.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id coll) {
var this__6489 = this;
if(cljm_truthy((this__6489_DOT_cnt > @0))) {
id s__6490 = (cljm_truthy(cljm_DOT_core_SLASH_not((this__6489_DOT_root == nil)))) ?[this__6489_DOT_root inode]:nil;
if(cljm_truthy(this__6489_DOT_has_nil_QMARK_)) {
return cljm_DOT_core_SLASH_cons(@[ nil, this__6489_DOT_nil_val ], s__6490);

} else {
return s__6490;

}

} else {
return nil;

}
};
cljm_DOT_core_SLASH_PersistentHashMap.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__6491 = this;
return this__6491_DOT_cnt;
};
cljm_DOT_core_SLASH_PersistentHashMap.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__6492 = this;
return cljm_DOT_core_SLASH_equiv_map(coll, other);
};
cljm_DOT_core_SLASH_PersistentHashMap.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__6493 = this;
return [cljm_DOT_core_SLASH_PersistentHashMap alloc];
};
cljm_DOT_core_SLASH_PersistentHashMap.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__6494 = this;
return this__6494_DOT_meta;
};
cljm_DOT_core_SLASH_PersistentHashMap.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__6495 = this;
return cljm_DOT_core_SLASH__with_meta(cljs_DOT_core_DOT_PersistentHashMap_SLASH_EMPTY, this__6495_DOT_meta);
};
cljm_DOT_core_SLASH_PersistentHashMap.prototype.cljm$core$IMap$_dissoc$arity$2 = ^id(id coll, id k) {
var this__6496 = this;
if(cljm_truthy((k == nil))) {
if(cljm_truthy(this__6496_DOT_has_nil_QMARK_)) {
return [cljm_DOT_core_SLASH_PersistentHashMap alloc];

} else {
return coll;

}

} else {
if(cljm_truthy((this__6496_DOT_root == nil))) {
return coll;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
id new_root__6497 = [this__6496_DOT_root inode@0 withoutcljm_DOT_core_SLASH_hash(k), k, nil];
if(cljm_truthy(([new_root__6497 isEqual:this__6496_DOT_root]))) {
return coll;

} else {
return [cljm_DOT_core_SLASH_PersistentHashMap alloc];

}

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_PersistentHashMap;
cljs_DOT_core_DOT_PersistentHashMap_SLASH_EMPTY = [cljm_DOT_core_SLASH_PersistentHashMap alloc];
cljs_DOT_core_DOT_PersistentHashMap_SLASH_fromArrays = ^id(id ks, id vs) {
id len__6499 = ks.length;
id i__6500 = @0;
id out__6501 = cljm_DOT_core_SLASH_transient(cljs_DOT_core_DOT_PersistentHashMap_SLASH_EMPTY);
while(YES) {
if(cljm_truthy((i__6500 < len__6499))) {
{
var G__6502 = (i__6500 + @1);
var G__6503 = cljm_DOT_core_SLASH_assoc_BANG_(out__6501, (ks[i__6500]), (vs[i__6500]));
i__6500 = G__6502;
out__6501 = G__6503;
continue;
}

} else {
return cljm_DOT_core_SLASH_persistent_BANG_(out__6501);

}
break;
}
};

/**
* @constructor
*/
cljm_DOT_core_SLASH_TransientHashMap = (function (edit, root, count, has_nil_QMARK_, nil_val){
this.edit = edit;
this.root = root;
this.count = count;
this.has_nil_QMARK_ = has_nil_QMARK_;
this.nil_val = nil_val;
this.cljm$lang$protocol_mask$partition1$ = 14;
this.cljm$lang$protocol_mask$partition0$ = 258;
})
cljm_DOT_core_SLASH_TransientHashMap.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_TransientHashMap.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/TransientHashMap", nil);
};
cljm_DOT_core_SLASH_TransientHashMap.prototype.cljm$core$ITransientMap$_dissoc_BANG_$arity$2 = ^id(id tcoll, id key) {
var this__6504 = this;
return [tcoll withoutkey];
};
cljm_DOT_core_SLASH_TransientHashMap.prototype.cljm$core$ITransientAssociative$_assoc_BANG_$arity$3 = ^id(id tcoll, id key, id val) {
var this__6505 = this;
return [tcoll assockey, val, nil];
};
cljm_DOT_core_SLASH_TransientHashMap.prototype.cljm$core$ITransientCollection$_conj_BANG_$arity$2 = ^id(id tcoll, id val) {
var this__6506 = this;
return [tcoll conjval];
};
cljm_DOT_core_SLASH_TransientHashMap.prototype.cljm$core$ITransientCollection$_persistent_BANG_$arity$1 = ^id(id tcoll) {
var this__6507 = this;
return [tcoll persistent];
};
cljm_DOT_core_SLASH_TransientHashMap.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id tcoll, id k) {
var this__6508 = this;
if(cljm_truthy((k == nil))) {
if(cljm_truthy(this__6508_DOT_has_nil_QMARK_)) {
return this__6508_DOT_nil_val;

} else {
return nil;

}

} else {
if(cljm_truthy((this__6508_DOT_root == nil))) {
return nil;

} else {
return [this__6508_DOT_root inode@0 lookupcljm_DOT_core_SLASH_hash(k), k, nil];

}

}
};
cljm_DOT_core_SLASH_TransientHashMap.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id tcoll, id k, id not_found) {
var this__6509 = this;
if(cljm_truthy((k == nil))) {
if(cljm_truthy(this__6509_DOT_has_nil_QMARK_)) {
return this__6509_DOT_nil_val;

} else {
return not_found;

}

} else {
if(cljm_truthy((this__6509_DOT_root == nil))) {
return not_found;

} else {
return [this__6509_DOT_root inode@0 lookupcljm_DOT_core_SLASH_hash(k), k, not_found, nil];

}

}
};
cljm_DOT_core_SLASH_TransientHashMap.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__6510 = this;
if(cljm_truthy(this__6510_DOT_edit)) {
return this__6510_DOT_count;

} else {
throw [Error alloc];

}
};
cljm_DOT_core_SLASH_TransientHashMap.prototype.conj_BANG_ = ^id(id o) {
var this__6511 = this;
id tcoll__6512 = this;
if(cljm_truthy(this__6511_DOT_edit)) {
if(cljm_truthy({id G__6513__6514 = o;
if(cljm_truthy(G__6513__6514)) {
if(cljm_truthy({id or__3824__auto____6515 = (G__6513__6514.cljm$lang$protocol_mask$partition0$ & @2048);
if(cljm_truthy(or__3824__auto____6515)) {
return or__3824__auto____6515;

} else {
return G__6513__6514.cljm$core$IMapEntry$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__6513__6514.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IMapEntry, G__6513__6514);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IMapEntry, G__6513__6514);

}
})) {
return [tcoll__6512 assoccljm_DOT_core_SLASH_key(o), cljm_DOT_core_SLASH_val(o), nil];

} else {
id es__6516 = cljm_DOT_core_SLASH_seq(o);
id tcoll__6517 = tcoll__6512;
while(YES) {
id temp__3971__auto____6518 = cljm_DOT_core_SLASH_first(es__6516);
if(cljm_truthy(temp__3971__auto____6518)) {
id e__6519 = temp__3971__auto____6518;
{
var G__6530 = cljm_DOT_core_SLASH_next(es__6516);
var G__6531 = [tcoll__6517 assoccljm_DOT_core_SLASH_key(e__6519), cljm_DOT_core_SLASH_val(e__6519), nil];
es__6516 = G__6530;
tcoll__6517 = G__6531;
continue;
}

} else {
return tcoll__6517;

}
break;
}

}

} else {
throw [Error alloc];

}
};
cljm_DOT_core_SLASH_TransientHashMap.prototype.assoc_BANG_ = ^id(id k, id v) {
var this__6520 = this;
id tcoll__6521 = this;
if(cljm_truthy(this__6520_DOT_edit)) {
if(cljm_truthy((k == nil))) {
if(cljm_truthy(([this__6520_DOT_nil_val isEqual:v]))) {

} else {
this__6520_DOT_nil_val = v;

}
if(cljm_truthy(this__6520_DOT_has_nil_QMARK_)) {

} else {
this__6520_DOT_count = (this__6520_DOT_count + @1);
this__6520_DOT_has_nil_QMARK_ = @YES;

}
return tcoll__6521;

} else {
id added_leaf_QMARK___6522 = [cljm_DOT_core_SLASH_Box alloc];
id node__6523 = [(cljm_truthy((this__6520_DOT_root == nil))) ?cljs_DOT_core_DOT_BitmapIndexedNode_SLASH_EMPTY:this__6520_DOT_root inodethis__6520_DOT_edit assoc@0, cljm_DOT_core_SLASH_hash(k), k, v, added_leaf_QMARK___6522, nil];
if(cljm_truthy(([node__6523 isEqual:this__6520_DOT_root]))) {

} else {
this__6520_DOT_root = node__6523;

}
if(cljm_truthy(added_leaf_QMARK___6522.val)) {
this__6520_DOT_count = (this__6520_DOT_count + @1);

} else {

}
return tcoll__6521;

}

} else {
throw [Error alloc];

}
};
cljm_DOT_core_SLASH_TransientHashMap.prototype.without_BANG_ = ^id(id k) {
var this__6524 = this;
id tcoll__6525 = this;
if(cljm_truthy(this__6524_DOT_edit)) {
if(cljm_truthy((k == nil))) {
if(cljm_truthy(this__6524_DOT_has_nil_QMARK_)) {
this__6524_DOT_has_nil_QMARK_ = @NO;
this__6524_DOT_nil_val = nil;
this__6524_DOT_count = (this__6524_DOT_count - @1);
return tcoll__6525;

} else {
return tcoll__6525;

}

} else {
if(cljm_truthy((this__6524_DOT_root == nil))) {
return tcoll__6525;

} else {
id removed_leaf_QMARK___6526 = [cljm_DOT_core_SLASH_Box alloc];
id node__6527 = [this__6524_DOT_root inodethis__6524_DOT_edit without@0, cljm_DOT_core_SLASH_hash(k), k, removed_leaf_QMARK___6526, nil];
if(cljm_truthy(([node__6527 isEqual:this__6524_DOT_root]))) {

} else {
this__6524_DOT_root = node__6527;

}
if(cljm_truthy((removed_leaf_QMARK___6526[@0]))) {
this__6524_DOT_count = (this__6524_DOT_count - @1);

} else {

}
return tcoll__6525;

}

}

} else {
throw [Error alloc];

}
};
cljm_DOT_core_SLASH_TransientHashMap.prototype.persistent_BANG_ = ^id() {
var this__6528 = this;
id tcoll__6529 = this;
if(cljm_truthy(this__6528_DOT_edit)) {
this__6528_DOT_edit = nil;
return [cljm_DOT_core_SLASH_PersistentHashMap alloc];

} else {
throw [Error alloc];

}
};
cljm_DOT_core_SLASH_TransientHashMap;
cljm_DOT_core_SLASH_tree_map_seq_push = ^id(id node, id stack, id ascending_QMARK_) {
id t__6534 = node;
id stack__6535 = stack;
while(YES) {
if(cljm_truthy(cljm_DOT_core_SLASH_not((t__6534 == nil)))) {
{
var G__6536 = (cljm_truthy(ascending_QMARK_)) ?t__6534.left:t__6534.right;
var G__6537 = cljm_DOT_core_SLASH_conj(stack__6535, t__6534, nil);
t__6534 = G__6536;
stack__6535 = G__6537;
continue;
}

} else {
return stack__6535;

}
break;
}
};

/**
* @constructor
*/
cljm_DOT_core_SLASH_PersistentTreeMapSeq = (function (meta, stack, ascending_QMARK_, cnt, __hash){
this.meta = meta;
this.stack = stack;
this.ascending_QMARK_ = ascending_QMARK_;
this.cnt = cnt;
this.__hash = __hash;
this.cljm$lang$protocol_mask$partition1$ = 0;
this.cljm$lang$protocol_mask$partition0$ = 31850570;
})
cljm_DOT_core_SLASH_PersistentTreeMapSeq.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_PersistentTreeMapSeq.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/PersistentTreeMapSeq", nil);
};
cljm_DOT_core_SLASH_PersistentTreeMapSeq.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__6538 = this;
id h__1314__auto____6539 = this__6538_DOT___hash;
if(cljm_truthy(cljm_DOT_core_SLASH_not((h__1314__auto____6539 == nil)))) {
return h__1314__auto____6539;

} else {
id h__1314__auto____6540 = cljm_DOT_core_SLASH_hash_coll(coll);
this__6538_DOT___hash = h__1314__auto____6540;
return h__1314__auto____6540;

}
};
cljm_DOT_core_SLASH_PersistentTreeMapSeq.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id o) {
var this__6541 = this;
return cljm_DOT_core_SLASH_cons(o, coll);
};
cljm_DOT_core_SLASH_PersistentTreeMapSeq.prototype.toString = ^id() {
var this__6542 = this;
id this__6543 = this;
return cljm_DOT_core_SLASH_pr_str(this__6543, nil);
};
cljm_DOT_core_SLASH_PersistentTreeMapSeq.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id this$) {
var this__6544 = this;
return this$;
};
cljm_DOT_core_SLASH_PersistentTreeMapSeq.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__6545 = this;
if(cljm_truthy((this__6545_DOT_cnt < @0))) {
return (cljm_DOT_core_SLASH_count(cljm_DOT_core_SLASH_next(coll)) + @1);

} else {
return this__6545_DOT_cnt;

}
};
cljm_DOT_core_SLASH_PersistentTreeMapSeq.prototype.cljm$core$ISeq$_first$arity$1 = ^id(id this$) {
var this__6546 = this;
return cljm_DOT_core_SLASH_peek(this__6546_DOT_stack);
};
cljm_DOT_core_SLASH_PersistentTreeMapSeq.prototype.cljm$core$ISeq$_rest$arity$1 = ^id(id this$) {
var this__6547 = this;
id t__6548 = cljm_DOT_core_SLASH_first(this__6547_DOT_stack);
id next_stack__6549 = cljm_DOT_core_SLASH_tree_map_seq_push((cljm_truthy(this__6547_DOT_ascending_QMARK_)) ?t__6548.right:t__6548.left, cljm_DOT_core_SLASH_next(this__6547_DOT_stack), this__6547_DOT_ascending_QMARK_);
if(cljm_truthy(cljm_DOT_core_SLASH_not((next_stack__6549 == nil)))) {
return [cljm_DOT_core_SLASH_PersistentTreeMapSeq alloc];

} else {
return cljm.core.List.EMPTY;

}
};
cljm_DOT_core_SLASH_PersistentTreeMapSeq.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__6550 = this;
return cljm_DOT_core_SLASH_equiv_sequential(coll, other);
};
cljm_DOT_core_SLASH_PersistentTreeMapSeq.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__6551 = this;
return [cljm_DOT_core_SLASH_PersistentTreeMapSeq alloc];
};
cljm_DOT_core_SLASH_PersistentTreeMapSeq.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__6552 = this;
return this__6552_DOT_meta;
};
cljm_DOT_core_SLASH_PersistentTreeMapSeq;
cljm_DOT_core_SLASH_create_tree_map_seq = ^id(id tree, id ascending_QMARK_, id cnt) {
return [cljm_DOT_core_SLASH_PersistentTreeMapSeq alloc];
};
cljm_DOT_core_SLASH_balance_left = ^id(id key, id val, id ins, id right) {
if(cljm_truthy(cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_RedNode, ins))) {
if(cljm_truthy(cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_RedNode, ins.left))) {
return [cljm_DOT_core_SLASH_RedNode alloc];

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_RedNode, ins.right))) {
return [cljm_DOT_core_SLASH_RedNode alloc];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return [cljm_DOT_core_SLASH_BlackNode alloc];

} else {
return nil;

}

}

}

} else {
return [cljm_DOT_core_SLASH_BlackNode alloc];

}
};
cljm_DOT_core_SLASH_balance_right = ^id(id key, id val, id left, id ins) {
if(cljm_truthy(cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_RedNode, ins))) {
if(cljm_truthy(cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_RedNode, ins.right))) {
return [cljm_DOT_core_SLASH_RedNode alloc];

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_RedNode, ins.left))) {
return [cljm_DOT_core_SLASH_RedNode alloc];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return [cljm_DOT_core_SLASH_BlackNode alloc];

} else {
return nil;

}

}

}

} else {
return [cljm_DOT_core_SLASH_BlackNode alloc];

}
};
cljm_DOT_core_SLASH_balance_left_del = ^id(id key, id val, id del, id right) {
if(cljm_truthy(cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_RedNode, del))) {
return [cljm_DOT_core_SLASH_RedNode alloc];

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_BlackNode, right))) {
return cljm_DOT_core_SLASH_balance_right(key, val, del, [right redden]);

} else {
if(cljm_truthy({id and__3822__auto____6554 = cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_RedNode, right);
if(cljm_truthy(and__3822__auto____6554)) {
return cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_BlackNode, right.left);

} else {
return and__3822__auto____6554;

}
})) {
return [cljm_DOT_core_SLASH_RedNode alloc];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
throw [Error alloc];

} else {
return nil;

}

}

}

}
};
cljm_DOT_core_SLASH_balance_right_del = ^id(id key, id val, id left, id del) {
if(cljm_truthy(cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_RedNode, del))) {
return [cljm_DOT_core_SLASH_RedNode alloc];

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_BlackNode, left))) {
return cljm_DOT_core_SLASH_balance_left(key, val, [left redden], del);

} else {
if(cljm_truthy({id and__3822__auto____6556 = cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_RedNode, left);
if(cljm_truthy(and__3822__auto____6556)) {
return cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_BlackNode, left.right);

} else {
return and__3822__auto____6556;

}
})) {
return [cljm_DOT_core_SLASH_RedNode alloc];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
throw [Error alloc];

} else {
return nil;

}

}

}

}
};
cljm_DOT_core_SLASH_tree_map_kv_reduce = ^id(id node, id f, id init) {
id init__6560 = f(init, node.key, node.val);
if(cljm_truthy(cljm_DOT_core_SLASH_reduced_QMARK_(init__6560))) {
return cljm_DOT_core_SLASH_deref(init__6560);

} else {
id init__6561 = (cljm_truthy(cljm_DOT_core_SLASH_not((node.left == nil)))) ?tree_map_kv_reduce(node.left, f, init__6560):init__6560;
if(cljm_truthy(cljm_DOT_core_SLASH_reduced_QMARK_(init__6561))) {
return cljm_DOT_core_SLASH_deref(init__6561);

} else {
id init__6562 = (cljm_truthy(cljm_DOT_core_SLASH_not((node.right == nil)))) ?tree_map_kv_reduce(node.right, f, init__6561):init__6561;
if(cljm_truthy(cljm_DOT_core_SLASH_reduced_QMARK_(init__6562))) {
return cljm_DOT_core_SLASH_deref(init__6562);

} else {
return init__6562;

}

}

}
};

/**
* @constructor
*/
cljm_DOT_core_SLASH_BlackNode = (function (key, val, left, right, __hash){
this.key = key;
this.val = val;
this.left = left;
this.right = right;
this.__hash = __hash;
this.cljm$lang$protocol_mask$partition1$ = 0;
this.cljm$lang$protocol_mask$partition0$ = 32402207;
})
cljm_DOT_core_SLASH_BlackNode.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_BlackNode.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/BlackNode", nil);
};
cljm_DOT_core_SLASH_BlackNode.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__6565 = this;
id h__1314__auto____6566 = this__6565_DOT___hash;
if(cljm_truthy(cljm_DOT_core_SLASH_not((h__1314__auto____6566 == nil)))) {
return h__1314__auto____6566;

} else {
id h__1314__auto____6567 = cljm_DOT_core_SLASH_hash_coll(coll);
this__6565_DOT___hash = h__1314__auto____6567;
return h__1314__auto____6567;

}
};
cljm_DOT_core_SLASH_BlackNode.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id node, id k) {
var this__6568 = this;
return cljm_DOT_core_SLASH__nth(node, k, nil);
};
cljm_DOT_core_SLASH_BlackNode.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id node, id k, id not_found) {
var this__6569 = this;
return cljm_DOT_core_SLASH__nth(node, k, not_found);
};
cljm_DOT_core_SLASH_BlackNode.prototype.cljm$core$IAssociative$_assoc$arity$3 = ^id(id node, id k, id v) {
var this__6570 = this;
return cljm_DOT_core_SLASH_assoc(@[ this__6570_DOT_key, this__6570_DOT_val ], k, v, nil);
};
cljm_DOT_core_SLASH_BlackNode.prototype.call = (function() {
var G__6618 = null;
var G__6618__2 = ^id(id this_sym6571, id k) {
var this__6573 = this;
id this_sym6571__6574 = this;
id node__6575 = this_sym6571__6574;
return cljm_DOT_core_SLASH__lookup(node__6575, k);
};
var G__6618__3 = ^id(id this_sym6572, id k, id not_found) {
var this__6573 = this;
id this_sym6572__6576 = this;
id node__6577 = this_sym6572__6576;
return cljm_DOT_core_SLASH__lookup(node__6577, k, not_found);
};
G__6618 = function(this_sym6572, k, not_found){
switch(arguments.length){
case 2:
return G__6618__2.call(this,this_sym6572, k);
case 3:
return G__6618__3.call(this,this_sym6572, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__6618;
})()
;
cljm_DOT_core_SLASH_BlackNode.prototype.apply = ^id(id this_sym6563, id args6564) {
var this__6578 = this;
return [this_sym6563.call applythis_sym6563, [@[this_sym6563] concatargs6564.slice()], nil];
};
cljm_DOT_core_SLASH_BlackNode.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id node, id o) {
var this__6579 = this;
return @[ this__6579_DOT_key, this__6579_DOT_val, o ];
};
cljm_DOT_core_SLASH_BlackNode.prototype.cljm$core$IMapEntry$_key$arity$1 = ^id(id node) {
var this__6580 = this;
return this__6580_DOT_key;
};
cljm_DOT_core_SLASH_BlackNode.prototype.cljm$core$IMapEntry$_val$arity$1 = ^id(id node) {
var this__6581 = this;
return this__6581_DOT_val;
};
cljm_DOT_core_SLASH_BlackNode.prototype.add_right = ^id(id ins) {
var this__6582 = this;
id node__6583 = this;
return [ins balancenode__6583 right];
};
cljm_DOT_core_SLASH_BlackNode.prototype.redden = ^id() {
var this__6584 = this;
id node__6585 = this;
return [cljm_DOT_core_SLASH_RedNode alloc];
};
cljm_DOT_core_SLASH_BlackNode.prototype.remove_right = ^id(id del) {
var this__6586 = this;
id node__6587 = this;
return cljm_DOT_core_SLASH_balance_right_del(this__6586_DOT_key, this__6586_DOT_val, this__6586_DOT_left, del);
};
cljm_DOT_core_SLASH_BlackNode.prototype.replace = ^id(id key, id val, id left, id right) {
var this__6588 = this;
id node__6589 = this;
return [cljm_DOT_core_SLASH_BlackNode alloc];
};
cljm_DOT_core_SLASH_BlackNode.prototype.kv_reduce = ^id(id f, id init) {
var this__6590 = this;
id node__6591 = this;
return cljm_DOT_core_SLASH_tree_map_kv_reduce(node__6591, f, init);
};
cljm_DOT_core_SLASH_BlackNode.prototype.remove_left = ^id(id del) {
var this__6592 = this;
id node__6593 = this;
return cljm_DOT_core_SLASH_balance_left_del(this__6592_DOT_key, this__6592_DOT_val, del, this__6592_DOT_right);
};
cljm_DOT_core_SLASH_BlackNode.prototype.add_left = ^id(id ins) {
var this__6594 = this;
id node__6595 = this;
return [ins balancenode__6595 left];
};
cljm_DOT_core_SLASH_BlackNode.prototype.balance_left = ^id(id parent) {
var this__6596 = this;
id node__6597 = this;
return [cljm_DOT_core_SLASH_BlackNode alloc];
};
cljm_DOT_core_SLASH_BlackNode.prototype.toString = (function() {
var G__6619 = null;
var G__6619__0 = ^id() {
var this__6598 = this;
id this__6600 = this;
return cljm_DOT_core_SLASH_pr_str(this__6600, nil);
};
G__6619 = function(){
switch(arguments.length){
case 0:
return G__6619__0.call(this);
}
throw('Invalid arity: ' + arguments.length);
};
return G__6619;
})()
;
cljm_DOT_core_SLASH_BlackNode.prototype.balance_right = ^id(id parent) {
var this__6601 = this;
id node__6602 = this;
return [cljm_DOT_core_SLASH_BlackNode alloc];
};
cljm_DOT_core_SLASH_BlackNode.prototype.blacken = ^id() {
var this__6603 = this;
id node__6604 = this;
return node__6604;
};
cljm_DOT_core_SLASH_BlackNode.prototype.cljm$core$IReduce$_reduce$arity$2 = ^id(id node, id f) {
var this__6605 = this;
return cljm_DOT_core_SLASH_ci_reduce(node, f);
};
cljm_DOT_core_SLASH_BlackNode.prototype.cljm$core$IReduce$_reduce$arity$3 = ^id(id node, id f, id start) {
var this__6606 = this;
return cljm_DOT_core_SLASH_ci_reduce(node, f, start);
};
cljm_DOT_core_SLASH_BlackNode.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id node) {
var this__6607 = this;
return cljm_DOT_core_SLASH_list(this__6607_DOT_key, this__6607_DOT_val, nil);
};
cljm_DOT_core_SLASH_BlackNode.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id node) {
var this__6608 = this;
return @2;
};
cljm_DOT_core_SLASH_BlackNode.prototype.cljm$core$IStack$_peek$arity$1 = ^id(id node) {
var this__6609 = this;
return this__6609_DOT_val;
};
cljm_DOT_core_SLASH_BlackNode.prototype.cljm$core$IStack$_pop$arity$1 = ^id(id node) {
var this__6610 = this;
return @[ this__6610_DOT_key ];
};
cljm_DOT_core_SLASH_BlackNode.prototype.cljm$core$IVector$_assoc_n$arity$3 = ^id(id node, id n, id v) {
var this__6611 = this;
return cljm_DOT_core_SLASH__assoc_n(@[ this__6611_DOT_key, this__6611_DOT_val ], n, v);
};
cljm_DOT_core_SLASH_BlackNode.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__6612 = this;
return cljm_DOT_core_SLASH_equiv_sequential(coll, other);
};
cljm_DOT_core_SLASH_BlackNode.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id node, id meta) {
var this__6613 = this;
return cljm_DOT_core_SLASH_with_meta(@[ this__6613_DOT_key, this__6613_DOT_val ], meta);
};
cljm_DOT_core_SLASH_BlackNode.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id node) {
var this__6614 = this;
return nil;
};
cljm_DOT_core_SLASH_BlackNode.prototype.cljm$core$IIndexed$_nth$arity$2 = ^id(id node, id n) {
var this__6615 = this;
if(cljm_truthy(([n isEqual:@0]))) {
return this__6615_DOT_key;

} else {
if(cljm_truthy(([n isEqual:@1]))) {
return this__6615_DOT_val;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return nil;

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_BlackNode.prototype.cljm$core$IIndexed$_nth$arity$3 = ^id(id node, id n, id not_found) {
var this__6616 = this;
if(cljm_truthy(([n isEqual:@0]))) {
return this__6616_DOT_key;

} else {
if(cljm_truthy(([n isEqual:@1]))) {
return this__6616_DOT_val;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return not_found;

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_BlackNode.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id node) {
var this__6617 = this;
return @[];
};
cljm_DOT_core_SLASH_BlackNode;

/**
* @constructor
*/
cljm_DOT_core_SLASH_RedNode = (function (key, val, left, right, __hash){
this.key = key;
this.val = val;
this.left = left;
this.right = right;
this.__hash = __hash;
this.cljm$lang$protocol_mask$partition1$ = 0;
this.cljm$lang$protocol_mask$partition0$ = 32402207;
})
cljm_DOT_core_SLASH_RedNode.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_RedNode.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/RedNode", nil);
};
cljm_DOT_core_SLASH_RedNode.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__6622 = this;
id h__1314__auto____6623 = this__6622_DOT___hash;
if(cljm_truthy(cljm_DOT_core_SLASH_not((h__1314__auto____6623 == nil)))) {
return h__1314__auto____6623;

} else {
id h__1314__auto____6624 = cljm_DOT_core_SLASH_hash_coll(coll);
this__6622_DOT___hash = h__1314__auto____6624;
return h__1314__auto____6624;

}
};
cljm_DOT_core_SLASH_RedNode.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id node, id k) {
var this__6625 = this;
return cljm_DOT_core_SLASH__nth(node, k, nil);
};
cljm_DOT_core_SLASH_RedNode.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id node, id k, id not_found) {
var this__6626 = this;
return cljm_DOT_core_SLASH__nth(node, k, not_found);
};
cljm_DOT_core_SLASH_RedNode.prototype.cljm$core$IAssociative$_assoc$arity$3 = ^id(id node, id k, id v) {
var this__6627 = this;
return cljm_DOT_core_SLASH_assoc(@[ this__6627_DOT_key, this__6627_DOT_val ], k, v, nil);
};
cljm_DOT_core_SLASH_RedNode.prototype.call = (function() {
var G__6675 = null;
var G__6675__2 = ^id(id this_sym6628, id k) {
var this__6630 = this;
id this_sym6628__6631 = this;
id node__6632 = this_sym6628__6631;
return cljm_DOT_core_SLASH__lookup(node__6632, k);
};
var G__6675__3 = ^id(id this_sym6629, id k, id not_found) {
var this__6630 = this;
id this_sym6629__6633 = this;
id node__6634 = this_sym6629__6633;
return cljm_DOT_core_SLASH__lookup(node__6634, k, not_found);
};
G__6675 = function(this_sym6629, k, not_found){
switch(arguments.length){
case 2:
return G__6675__2.call(this,this_sym6629, k);
case 3:
return G__6675__3.call(this,this_sym6629, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__6675;
})()
;
cljm_DOT_core_SLASH_RedNode.prototype.apply = ^id(id this_sym6620, id args6621) {
var this__6635 = this;
return [this_sym6620.call applythis_sym6620, [@[this_sym6620] concatargs6621.slice()], nil];
};
cljm_DOT_core_SLASH_RedNode.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id node, id o) {
var this__6636 = this;
return @[ this__6636_DOT_key, this__6636_DOT_val, o ];
};
cljm_DOT_core_SLASH_RedNode.prototype.cljm$core$IMapEntry$_key$arity$1 = ^id(id node) {
var this__6637 = this;
return this__6637_DOT_key;
};
cljm_DOT_core_SLASH_RedNode.prototype.cljm$core$IMapEntry$_val$arity$1 = ^id(id node) {
var this__6638 = this;
return this__6638_DOT_val;
};
cljm_DOT_core_SLASH_RedNode.prototype.add_right = ^id(id ins) {
var this__6639 = this;
id node__6640 = this;
return [cljm_DOT_core_SLASH_RedNode alloc];
};
cljm_DOT_core_SLASH_RedNode.prototype.redden = ^id() {
var this__6641 = this;
id node__6642 = this;
throw [Error alloc];
};
cljm_DOT_core_SLASH_RedNode.prototype.remove_right = ^id(id del) {
var this__6643 = this;
id node__6644 = this;
return [cljm_DOT_core_SLASH_RedNode alloc];
};
cljm_DOT_core_SLASH_RedNode.prototype.replace = ^id(id key, id val, id left, id right) {
var this__6645 = this;
id node__6646 = this;
return [cljm_DOT_core_SLASH_RedNode alloc];
};
cljm_DOT_core_SLASH_RedNode.prototype.kv_reduce = ^id(id f, id init) {
var this__6647 = this;
id node__6648 = this;
return cljm_DOT_core_SLASH_tree_map_kv_reduce(node__6648, f, init);
};
cljm_DOT_core_SLASH_RedNode.prototype.remove_left = ^id(id del) {
var this__6649 = this;
id node__6650 = this;
return [cljm_DOT_core_SLASH_RedNode alloc];
};
cljm_DOT_core_SLASH_RedNode.prototype.add_left = ^id(id ins) {
var this__6651 = this;
id node__6652 = this;
return [cljm_DOT_core_SLASH_RedNode alloc];
};
cljm_DOT_core_SLASH_RedNode.prototype.balance_left = ^id(id parent) {
var this__6653 = this;
id node__6654 = this;
if(cljm_truthy(cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_RedNode, this__6653_DOT_left))) {
return [cljm_DOT_core_SLASH_RedNode alloc];

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_RedNode, this__6653_DOT_right))) {
return [cljm_DOT_core_SLASH_RedNode alloc];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return [cljm_DOT_core_SLASH_BlackNode alloc];

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_RedNode.prototype.toString = (function() {
var G__6676 = null;
var G__6676__0 = ^id() {
var this__6655 = this;
id this__6657 = this;
return cljm_DOT_core_SLASH_pr_str(this__6657, nil);
};
G__6676 = function(){
switch(arguments.length){
case 0:
return G__6676__0.call(this);
}
throw('Invalid arity: ' + arguments.length);
};
return G__6676;
})()
;
cljm_DOT_core_SLASH_RedNode.prototype.balance_right = ^id(id parent) {
var this__6658 = this;
id node__6659 = this;
if(cljm_truthy(cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_RedNode, this__6658_DOT_right))) {
return [cljm_DOT_core_SLASH_RedNode alloc];

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_RedNode, this__6658_DOT_left))) {
return [cljm_DOT_core_SLASH_RedNode alloc];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return [cljm_DOT_core_SLASH_BlackNode alloc];

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_RedNode.prototype.blacken = ^id() {
var this__6660 = this;
id node__6661 = this;
return [cljm_DOT_core_SLASH_BlackNode alloc];
};
cljm_DOT_core_SLASH_RedNode.prototype.cljm$core$IReduce$_reduce$arity$2 = ^id(id node, id f) {
var this__6662 = this;
return cljm_DOT_core_SLASH_ci_reduce(node, f);
};
cljm_DOT_core_SLASH_RedNode.prototype.cljm$core$IReduce$_reduce$arity$3 = ^id(id node, id f, id start) {
var this__6663 = this;
return cljm_DOT_core_SLASH_ci_reduce(node, f, start);
};
cljm_DOT_core_SLASH_RedNode.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id node) {
var this__6664 = this;
return cljm_DOT_core_SLASH_list(this__6664_DOT_key, this__6664_DOT_val, nil);
};
cljm_DOT_core_SLASH_RedNode.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id node) {
var this__6665 = this;
return @2;
};
cljm_DOT_core_SLASH_RedNode.prototype.cljm$core$IStack$_peek$arity$1 = ^id(id node) {
var this__6666 = this;
return this__6666_DOT_val;
};
cljm_DOT_core_SLASH_RedNode.prototype.cljm$core$IStack$_pop$arity$1 = ^id(id node) {
var this__6667 = this;
return @[ this__6667_DOT_key ];
};
cljm_DOT_core_SLASH_RedNode.prototype.cljm$core$IVector$_assoc_n$arity$3 = ^id(id node, id n, id v) {
var this__6668 = this;
return cljm_DOT_core_SLASH__assoc_n(@[ this__6668_DOT_key, this__6668_DOT_val ], n, v);
};
cljm_DOT_core_SLASH_RedNode.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__6669 = this;
return cljm_DOT_core_SLASH_equiv_sequential(coll, other);
};
cljm_DOT_core_SLASH_RedNode.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id node, id meta) {
var this__6670 = this;
return cljm_DOT_core_SLASH_with_meta(@[ this__6670_DOT_key, this__6670_DOT_val ], meta);
};
cljm_DOT_core_SLASH_RedNode.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id node) {
var this__6671 = this;
return nil;
};
cljm_DOT_core_SLASH_RedNode.prototype.cljm$core$IIndexed$_nth$arity$2 = ^id(id node, id n) {
var this__6672 = this;
if(cljm_truthy(([n isEqual:@0]))) {
return this__6672_DOT_key;

} else {
if(cljm_truthy(([n isEqual:@1]))) {
return this__6672_DOT_val;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return nil;

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_RedNode.prototype.cljm$core$IIndexed$_nth$arity$3 = ^id(id node, id n, id not_found) {
var this__6673 = this;
if(cljm_truthy(([n isEqual:@0]))) {
return this__6673_DOT_key;

} else {
if(cljm_truthy(([n isEqual:@1]))) {
return this__6673_DOT_val;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return not_found;

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_RedNode.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id node) {
var this__6674 = this;
return @[];
};
cljm_DOT_core_SLASH_RedNode;
cljm_DOT_core_SLASH_tree_map_add = ^id(id comp, id tree, id k, id v, id found) {
if(cljm_truthy((tree == nil))) {
return [cljm_DOT_core_SLASH_RedNode alloc];

} else {
id c__6680 = comp(k, tree.key);
if(cljm_truthy(([c__6680 isEqual:@0]))) {
(found[@0] = tree);
return nil;

} else {
if(cljm_truthy((c__6680 < @0))) {
id ins__6681 = tree_map_add(comp, tree.left, k, v, found);
if(cljm_truthy(cljm_DOT_core_SLASH_not((ins__6681 == nil)))) {
return [tree addins__6681 left];

} else {
return nil;

}

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
id ins__6682 = tree_map_add(comp, tree.right, k, v, found);
if(cljm_truthy(cljm_DOT_core_SLASH_not((ins__6682 == nil)))) {
return [tree addins__6682 right];

} else {
return nil;

}

} else {
return nil;

}

}

}

}
};
cljm_DOT_core_SLASH_tree_map_append = ^id(id left, id right) {
if(cljm_truthy((left == nil))) {
return right;

} else {
if(cljm_truthy((right == nil))) {
return left;

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_RedNode, left))) {
if(cljm_truthy(cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_RedNode, right))) {
id app__6685 = tree_map_append(left.right, right.left);
if(cljm_truthy(cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_RedNode, app__6685))) {
return [cljm_DOT_core_SLASH_RedNode alloc];

} else {
return [cljm_DOT_core_SLASH_RedNode alloc];

}

} else {
return [cljm_DOT_core_SLASH_RedNode alloc];

}

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_RedNode, right))) {
return [cljm_DOT_core_SLASH_RedNode alloc];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
id app__6686 = tree_map_append(left.right, right.left);
if(cljm_truthy(cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_RedNode, app__6686))) {
return [cljm_DOT_core_SLASH_RedNode alloc];

} else {
return cljm_DOT_core_SLASH_balance_left_del(left.key, left.val, left.left, [cljm_DOT_core_SLASH_BlackNode alloc]);

}

} else {
return nil;

}

}

}

}

}
};
cljm_DOT_core_SLASH_tree_map_remove = ^id(id comp, id tree, id k, id found) {
if(cljm_truthy(cljm_DOT_core_SLASH_not((tree == nil)))) {
id c__6692 = comp(k, tree.key);
if(cljm_truthy(([c__6692 isEqual:@0]))) {
(found[@0] = tree);
return cljm_DOT_core_SLASH_tree_map_append(tree.left, tree.right);

} else {
if(cljm_truthy((c__6692 < @0))) {
id del__6693 = tree_map_remove(comp, tree.left, k, found);
if(cljm_truthy({id or__3824__auto____6694 = cljm_DOT_core_SLASH_not((del__6693 == nil));
if(cljm_truthy(or__3824__auto____6694)) {
return or__3824__auto____6694;

} else {
return cljm_DOT_core_SLASH_not(((found[@0]) == nil));

}
})) {
if(cljm_truthy(cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_BlackNode, tree.left))) {
return cljm_DOT_core_SLASH_balance_left_del(tree.key, tree.val, del__6693, tree.right);

} else {
return [cljm_DOT_core_SLASH_RedNode alloc];

}

} else {
return nil;

}

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
id del__6695 = tree_map_remove(comp, tree.right, k, found);
if(cljm_truthy({id or__3824__auto____6696 = cljm_DOT_core_SLASH_not((del__6695 == nil));
if(cljm_truthy(or__3824__auto____6696)) {
return or__3824__auto____6696;

} else {
return cljm_DOT_core_SLASH_not(((found[@0]) == nil));

}
})) {
if(cljm_truthy(cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_BlackNode, tree.right))) {
return cljm_DOT_core_SLASH_balance_right_del(tree.key, tree.val, tree.left, del__6695);

} else {
return [cljm_DOT_core_SLASH_RedNode alloc];

}

} else {
return nil;

}

} else {
return nil;

}

}

}

} else {
return nil;

}
};
cljm_DOT_core_SLASH_tree_map_replace = ^id(id comp, id tree, id k, id v) {
id tk__6699 = tree.key;
id c__6700 = comp(k, tk__6699);
if(cljm_truthy(([c__6700 isEqual:@0]))) {
return [tree replacetk__6699, v, tree.left, tree.right, nil];

} else {
if(cljm_truthy((c__6700 < @0))) {
return [tree replacetk__6699, tree.val, tree_map_replace(comp, tree.left, k, v), tree.right, nil];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return [tree replacetk__6699, tree.val, tree.left, tree_map_replace(comp, tree.right, k, v), nil];

} else {
return nil;

}

}

}
};

/**
* @constructor
*/
cljm_DOT_core_SLASH_PersistentTreeMap = (function (comp, tree, cnt, meta, __hash){
this.comp = comp;
this.tree = tree;
this.cnt = cnt;
this.meta = meta;
this.__hash = __hash;
this.cljm$lang$protocol_mask$partition1$ = 0;
this.cljm$lang$protocol_mask$partition0$ = 418776847;
})
cljm_DOT_core_SLASH_PersistentTreeMap.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_PersistentTreeMap.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/PersistentTreeMap", nil);
};
cljm_DOT_core_SLASH_PersistentTreeMap.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__6703 = this;
id h__1314__auto____6704 = this__6703_DOT___hash;
if(cljm_truthy(cljm_DOT_core_SLASH_not((h__1314__auto____6704 == nil)))) {
return h__1314__auto____6704;

} else {
id h__1314__auto____6705 = cljm_DOT_core_SLASH_hash_imap(coll);
this__6703_DOT___hash = h__1314__auto____6705;
return h__1314__auto____6705;

}
};
cljm_DOT_core_SLASH_PersistentTreeMap.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id coll, id k) {
var this__6706 = this;
return cljm_DOT_core_SLASH__lookup(coll, k, nil);
};
cljm_DOT_core_SLASH_PersistentTreeMap.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id coll, id k, id not_found) {
var this__6707 = this;
id n__6708 = [coll entryk at];
if(cljm_truthy(cljm_DOT_core_SLASH_not((n__6708 == nil)))) {
return n__6708.val;

} else {
return not_found;

}
};
cljm_DOT_core_SLASH_PersistentTreeMap.prototype.cljm$core$IAssociative$_assoc$arity$3 = ^id(id coll, id k, id v) {
var this__6709 = this;
id found__6710 = @[nil];
id t__6711 = cljm_DOT_core_SLASH_tree_map_add(this__6709_DOT_comp, this__6709_DOT_tree, k, v, found__6710);
if(cljm_truthy((t__6711 == nil))) {
id found_node__6712 = cljm_DOT_core_SLASH_nth(found__6710, @0);
if(cljm_truthy(cljm_DOT_core_SLASH__EQ_(v, found_node__6712.val, nil))) {
return coll;

} else {
return [cljm_DOT_core_SLASH_PersistentTreeMap alloc];

}

} else {
return [cljm_DOT_core_SLASH_PersistentTreeMap alloc];

}
};
cljm_DOT_core_SLASH_PersistentTreeMap.prototype.cljm$core$IAssociative$_contains_key_QMARK_$arity$2 = ^id(id coll, id k) {
var this__6713 = this;
return cljm_DOT_core_SLASH_not(([coll entryk at] == nil));
};
cljm_DOT_core_SLASH_PersistentTreeMap.prototype.call = (function() {
var G__6747 = null;
var G__6747__2 = ^id(id this_sym6714, id k) {
var this__6716 = this;
id this_sym6714__6717 = this;
id coll__6718 = this_sym6714__6717;
return cljm_DOT_core_SLASH__lookup(coll__6718, k);
};
var G__6747__3 = ^id(id this_sym6715, id k, id not_found) {
var this__6716 = this;
id this_sym6715__6719 = this;
id coll__6720 = this_sym6715__6719;
return cljm_DOT_core_SLASH__lookup(coll__6720, k, not_found);
};
G__6747 = function(this_sym6715, k, not_found){
switch(arguments.length){
case 2:
return G__6747__2.call(this,this_sym6715, k);
case 3:
return G__6747__3.call(this,this_sym6715, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__6747;
})()
;
cljm_DOT_core_SLASH_PersistentTreeMap.prototype.apply = ^id(id this_sym6701, id args6702) {
var this__6721 = this;
return [this_sym6701.call applythis_sym6701, [@[this_sym6701] concatargs6702.slice()], nil];
};
cljm_DOT_core_SLASH_PersistentTreeMap.prototype.cljm$core$IKVReduce$_kv_reduce$arity$3 = ^id(id coll, id f, id init) {
var this__6722 = this;
if(cljm_truthy(cljm_DOT_core_SLASH_not((this__6722_DOT_tree == nil)))) {
return cljm_DOT_core_SLASH_tree_map_kv_reduce(this__6722_DOT_tree, f, init);

} else {
return init;

}
};
cljm_DOT_core_SLASH_PersistentTreeMap.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id entry) {
var this__6723 = this;
if(cljm_truthy(cljm_DOT_core_SLASH_vector_QMARK_(entry))) {
return cljm_DOT_core_SLASH__assoc(coll, cljm_DOT_core_SLASH__nth(entry, @0), cljm_DOT_core_SLASH__nth(entry, @1));

} else {
return cljm_DOT_core_SLASH_reduce(cljm_DOT_core_SLASH__conj, coll, entry);

}
};
cljm_DOT_core_SLASH_PersistentTreeMap.prototype.cljm$core$IReversible$_rseq$arity$1 = ^id(id coll) {
var this__6724 = this;
if(cljm_truthy((this__6724_DOT_cnt > @0))) {
return cljm_DOT_core_SLASH_create_tree_map_seq(this__6724_DOT_tree, @NO, this__6724_DOT_cnt);

} else {
return nil;

}
};
cljm_DOT_core_SLASH_PersistentTreeMap.prototype.toString = ^id() {
var this__6725 = this;
id this__6726 = this;
return cljm_DOT_core_SLASH_pr_str(this__6726, nil);
};
cljm_DOT_core_SLASH_PersistentTreeMap.prototype.entry_at = ^id(id k) {
var this__6727 = this;
id coll__6728 = this;
id t__6729 = this__6727_DOT_tree;
while(YES) {
if(cljm_truthy(cljm_DOT_core_SLASH_not((t__6729 == nil)))) {
id c__6730 = this__6727_DOT_comp(k, t__6729.key);
if(cljm_truthy(([c__6730 isEqual:@0]))) {
return t__6729;

} else {
if(cljm_truthy((c__6730 < @0))) {
{
var G__6748 = t__6729.left;
t__6729 = G__6748;
continue;
}

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
{
var G__6749 = t__6729.right;
t__6729 = G__6749;
continue;
}

} else {
return nil;

}

}

}

} else {
return nil;

}
break;
}
};
cljm_DOT_core_SLASH_PersistentTreeMap.prototype.cljm$core$ISorted$_sorted_seq$arity$2 = ^id(id coll, id ascending_QMARK_) {
var this__6731 = this;
if(cljm_truthy((this__6731_DOT_cnt > @0))) {
return cljm_DOT_core_SLASH_create_tree_map_seq(this__6731_DOT_tree, ascending_QMARK_, this__6731_DOT_cnt);

} else {
return nil;

}
};
cljm_DOT_core_SLASH_PersistentTreeMap.prototype.cljm$core$ISorted$_sorted_seq_from$arity$3 = ^id(id coll, id k, id ascending_QMARK_) {
var this__6732 = this;
if(cljm_truthy((this__6732_DOT_cnt > @0))) {
id stack__6733 = nil;
id t__6734 = this__6732_DOT_tree;
while(YES) {
if(cljm_truthy(cljm_DOT_core_SLASH_not((t__6734 == nil)))) {
id c__6735 = this__6732_DOT_comp(k, t__6734.key);
if(cljm_truthy(([c__6735 isEqual:@0]))) {
return [cljm_DOT_core_SLASH_PersistentTreeMapSeq alloc];

} else {
if(cljm_truthy(ascending_QMARK_)) {
if(cljm_truthy((c__6735 < @0))) {
{
var G__6750 = cljm_DOT_core_SLASH_conj(stack__6733, t__6734, nil);
var G__6751 = t__6734.left;
stack__6733 = G__6750;
t__6734 = G__6751;
continue;
}

} else {
{
var G__6752 = stack__6733;
var G__6753 = t__6734.right;
stack__6733 = G__6752;
t__6734 = G__6753;
continue;
}

}

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
if(cljm_truthy((c__6735 > @0))) {
{
var G__6754 = cljm_DOT_core_SLASH_conj(stack__6733, t__6734, nil);
var G__6755 = t__6734.right;
stack__6733 = G__6754;
t__6734 = G__6755;
continue;
}

} else {
{
var G__6756 = stack__6733;
var G__6757 = t__6734.left;
stack__6733 = G__6756;
t__6734 = G__6757;
continue;
}

}

} else {
return nil;

}

}

}

} else {
if(cljm_truthy((stack__6733 == nil))) {
return [cljm_DOT_core_SLASH_PersistentTreeMapSeq alloc];

} else {
return nil;

}

}
break;
}

} else {
return nil;

}
};
cljm_DOT_core_SLASH_PersistentTreeMap.prototype.cljm$core$ISorted$_entry_key$arity$2 = ^id(id coll, id entry) {
var this__6736 = this;
return cljm_DOT_core_SLASH_key(entry);
};
cljm_DOT_core_SLASH_PersistentTreeMap.prototype.cljm$core$ISorted$_comparator$arity$1 = ^id(id coll) {
var this__6737 = this;
return this__6737_DOT_comp;
};
cljm_DOT_core_SLASH_PersistentTreeMap.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id coll) {
var this__6738 = this;
if(cljm_truthy((this__6738_DOT_cnt > @0))) {
return cljm_DOT_core_SLASH_create_tree_map_seq(this__6738_DOT_tree, @YES, this__6738_DOT_cnt);

} else {
return nil;

}
};
cljm_DOT_core_SLASH_PersistentTreeMap.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__6739 = this;
return this__6739_DOT_cnt;
};
cljm_DOT_core_SLASH_PersistentTreeMap.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__6740 = this;
return cljm_DOT_core_SLASH_equiv_map(coll, other);
};
cljm_DOT_core_SLASH_PersistentTreeMap.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__6741 = this;
return [cljm_DOT_core_SLASH_PersistentTreeMap alloc];
};
cljm_DOT_core_SLASH_PersistentTreeMap.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__6742 = this;
return this__6742_DOT_meta;
};
cljm_DOT_core_SLASH_PersistentTreeMap.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__6743 = this;
return cljm_DOT_core_SLASH_with_meta(cljs_DOT_core_DOT_PersistentTreeMap_SLASH_EMPTY, this__6743_DOT_meta);
};
cljm_DOT_core_SLASH_PersistentTreeMap.prototype.cljm$core$IMap$_dissoc$arity$2 = ^id(id coll, id k) {
var this__6744 = this;
id found__6745 = @[nil];
id t__6746 = cljm_DOT_core_SLASH_tree_map_remove(this__6744_DOT_comp, this__6744_DOT_tree, k, found__6745);
if(cljm_truthy((t__6746 == nil))) {
if(cljm_truthy((cljm_DOT_core_SLASH_nth(found__6745, @0) == nil))) {
return coll;

} else {
return [cljm_DOT_core_SLASH_PersistentTreeMap alloc];

}

} else {
return [cljm_DOT_core_SLASH_PersistentTreeMap alloc];

}
};
cljm_DOT_core_SLASH_PersistentTreeMap;
cljs_DOT_core_DOT_PersistentTreeMap_SLASH_EMPTY = [cljm_DOT_core_SLASH_PersistentTreeMap alloc];
/**
* keyval => key val
* Returns a new hash map with supplied mappings.
*/
cljm_DOT_core_SLASH_hash_map = ^id(id cljm__varargs, ...) {
NSMutableArray *keyvals = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[keyvals addObject:cljm__currentObject];
}
va_end(cljm__args);
id in__6760 = cljm_DOT_core_SLASH_seq(keyvals);
id out__6761 = cljm_DOT_core_SLASH_transient(cljs_DOT_core_DOT_PersistentHashMap_SLASH_EMPTY);
while(YES) {
if(cljm_truthy(in__6760)) {
{
var G__6762 = cljm_DOT_core_SLASH_nnext(in__6760);
var G__6763 = cljm_DOT_core_SLASH_assoc_BANG_(out__6761, cljm_DOT_core_SLASH_first(in__6760), cljm_DOT_core_SLASH_second(in__6760));
in__6760 = G__6762;
out__6761 = G__6763;
continue;
}

} else {
return cljm_DOT_core_SLASH_persistent_BANG_(out__6761);

}
break;
}
};
/**
* keyval => key val
* Returns a new array map with supplied mappings.
*/
cljm_DOT_core_SLASH_array_map = ^id(id cljm__varargs, ...) {
NSMutableArray *keyvals = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[keyvals addObject:cljm__currentObject];
}
va_end(cljm__args);
return [cljm_DOT_core_SLASH_PersistentArrayMap alloc];
};
/**
* keyval => key val
* Returns a new object map with supplied mappings.
*/
cljm_DOT_core_SLASH_obj_map = ^id(id cljm__varargs, ...) {
NSMutableArray *keyvals = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[keyvals addObject:cljm__currentObject];
}
va_end(cljm__args);
id ks__6767 = @[];
id obj__6768 = @{};
id kvs__6769 = cljm_DOT_core_SLASH_seq(keyvals);
while(YES) {
if(cljm_truthy(kvs__6769)) {
[ks__6767 pushcljm_DOT_core_SLASH_first(kvs__6769)];
(obj__6768[cljm_DOT_core_SLASH_first(kvs__6769)] = cljm_DOT_core_SLASH_second(kvs__6769));
{
var G__6770 = cljm_DOT_core_SLASH_nnext(kvs__6769);
kvs__6769 = G__6770;
continue;
}

} else {
return cljs_DOT_core_DOT_ObjMap_SLASH_fromObject(ks__6767, obj__6768);

}
break;
}
};
/**
* keyval => key val
* Returns a new sorted map with supplied mappings.
*/
cljm_DOT_core_SLASH_sorted_map = ^id(id cljm__varargs, ...) {
NSMutableArray *keyvals = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[keyvals addObject:cljm__currentObject];
}
va_end(cljm__args);
id in__6773 = cljm_DOT_core_SLASH_seq(keyvals);
id out__6774 = cljs_DOT_core_DOT_PersistentTreeMap_SLASH_EMPTY;
while(YES) {
if(cljm_truthy(in__6773)) {
{
var G__6775 = cljm_DOT_core_SLASH_nnext(in__6773);
var G__6776 = cljm_DOT_core_SLASH_assoc(out__6774, cljm_DOT_core_SLASH_first(in__6773), cljm_DOT_core_SLASH_second(in__6773), nil);
in__6773 = G__6775;
out__6774 = G__6776;
continue;
}

} else {
return out__6774;

}
break;
}
};
/**
* keyval => key val
* Returns a new sorted map with supplied mappings, using the supplied comparator.
*/
cljm_DOT_core_SLASH_sorted_map_by = ^id(id cljm__varargs, id comparator, ...) {
NSMutableArray *keyvals = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[keyvals addObject:cljm__currentObject];
}
va_end(cljm__args);
id in__6779 = cljm_DOT_core_SLASH_seq(keyvals);
id out__6780 = [cljs_SLASH_core_DOT_PersistentTreeMap alloc];
while(YES) {
if(cljm_truthy(in__6779)) {
{
var G__6781 = cljm_DOT_core_SLASH_nnext(in__6779);
var G__6782 = cljm_DOT_core_SLASH_assoc(out__6780, cljm_DOT_core_SLASH_first(in__6779), cljm_DOT_core_SLASH_second(in__6779), nil);
in__6779 = G__6781;
out__6780 = G__6782;
continue;
}

} else {
return out__6780;

}
break;
}
};
/**
* Returns a sequence of the map's keys.
*/
cljm_DOT_core_SLASH_keys = ^id(id hash_map) {
return cljm_DOT_core_SLASH_seq(cljm_DOT_core_SLASH_map(cljm_DOT_core_SLASH_first, hash_map, nil));
};
/**
* Returns the key of the map entry.
*/
cljm_DOT_core_SLASH_key = ^id(id map_entry) {
return cljm_DOT_core_SLASH__key(map_entry);
};
/**
* Returns a sequence of the map's values.
*/
cljm_DOT_core_SLASH_vals = ^id(id hash_map) {
return cljm_DOT_core_SLASH_seq(cljm_DOT_core_SLASH_map(cljm_DOT_core_SLASH_second, hash_map, nil));
};
/**
* Returns the value in the map entry.
*/
cljm_DOT_core_SLASH_val = ^id(id map_entry) {
return cljm_DOT_core_SLASH__val(map_entry);
};
/**
* Returns a map that consists of the rest of the maps conj-ed onto
* the first.  If a key occurs in more than one map, the mapping from
* the latter (left-to-right) will be the mapping in the result.
*/
cljm_DOT_core_SLASH_merge = ^id(id cljm__varargs, ...) {
NSMutableArray *maps = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[maps addObject:cljm__currentObject];
}
va_end(cljm__args);
if(cljm_truthy(cljm_DOT_core_SLASH_some(cljm_DOT_core_SLASH_identity, maps))) {
return cljm_DOT_core_SLASH_reduce(^id(id p1__6783_SHARP_, id p2__6784_SHARP_) {
return cljm_DOT_core_SLASH_conj({id or__3824__auto____6786 = p1__6783_SHARP_;
if(cljm_truthy(or__3824__auto____6786)) {
return or__3824__auto____6786;

} else {
return @{};

}
}, p2__6784_SHARP_, nil);
}, maps);

} else {
return nil;

}
};
/**
* Returns a map that consists of the rest of the maps conj-ed onto
* the first.  If a key occurs in more than one map, the mapping(s)
* from the latter (left-to-right) will be combined with the mapping in
* the result by calling (f val-in-result val-in-latter).
*/
cljm_DOT_core_SLASH_merge_with = ^id(id cljm__varargs, id f, ...) {
NSMutableArray *maps = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[maps addObject:cljm__currentObject];
}
va_end(cljm__args);
if(cljm_truthy(cljm_DOT_core_SLASH_some(cljm_DOT_core_SLASH_identity, maps))) {
id merge_entry__6794 = ^id(id m, id e) {
id k__6792 = cljm_DOT_core_SLASH_first(e);
id v__6793 = cljm_DOT_core_SLASH_second(e);
if(cljm_truthy(cljm_DOT_core_SLASH_contains_QMARK_(m, k__6792))) {
return cljm_DOT_core_SLASH_assoc(m, k__6792, f(cljm_DOT_core_SLASH__lookup(m, k__6792, nil), v__6793), nil);

} else {
return cljm_DOT_core_SLASH_assoc(m, k__6792, v__6793, nil);

}
};
id merge2__6796 = ^id(id m1, id m2) {
return cljm_DOT_core_SLASH_reduce(merge_entry__6794, {id or__3824__auto____6795 = m1;
if(cljm_truthy(or__3824__auto____6795)) {
return or__3824__auto____6795;

} else {
return @{};

}
}, cljm_DOT_core_SLASH_seq(m2));
};
return cljm_DOT_core_SLASH_reduce(merge2__6796, maps);

} else {
return nil;

}
};
/**
* Returns a map containing only those entries in map whose key is in keys
*/
cljm_DOT_core_SLASH_select_keys = ^id(id map, id keyseq) {
id ret__6801 = @{};
id keys__6802 = cljm_DOT_core_SLASH_seq(keyseq);
while(YES) {
if(cljm_truthy(keys__6802)) {
id key__6803 = cljm_DOT_core_SLASH_first(keys__6802);
id entry__6804 = cljm_DOT_core_SLASH__lookup(map, key__6803, cljm_keyword(@":cljm.core/not-found"));
{
var G__6805 = (cljm_truthy(cljm_DOT_core_SLASH_not_EQ_(entry__6804, cljm_keyword(@":cljm.core/not-found"), nil))) ?cljm_DOT_core_SLASH_assoc(ret__6801, key__6803, entry__6804, nil):ret__6801;
var G__6806 = cljm_DOT_core_SLASH_next(keys__6802);
ret__6801 = G__6805;
keys__6802 = G__6806;
continue;
}

} else {
return ret__6801;

}
break;
}
};

/**
* @constructor
*/
cljm_DOT_core_SLASH_PersistentHashSet = (function (meta, hash_map, __hash){
this.meta = meta;
this.hash_map = hash_map;
this.__hash = __hash;
this.cljm$lang$protocol_mask$partition1$ = 1;
this.cljm$lang$protocol_mask$partition0$ = 15077647;
})
cljm_DOT_core_SLASH_PersistentHashSet.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_PersistentHashSet.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/PersistentHashSet", nil);
};
cljm_DOT_core_SLASH_PersistentHashSet.prototype.cljm$core$IEditableCollection$_as_transient$arity$1 = ^id(id coll) {
var this__6810 = this;
return [cljm_DOT_core_SLASH_TransientHashSet alloc];
};
cljm_DOT_core_SLASH_PersistentHashSet.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__6811 = this;
id h__1314__auto____6812 = this__6811_DOT___hash;
if(cljm_truthy(cljm_DOT_core_SLASH_not((h__1314__auto____6812 == nil)))) {
return h__1314__auto____6812;

} else {
id h__1314__auto____6813 = cljm_DOT_core_SLASH_hash_iset(coll);
this__6811_DOT___hash = h__1314__auto____6813;
return h__1314__auto____6813;

}
};
cljm_DOT_core_SLASH_PersistentHashSet.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id coll, id v) {
var this__6814 = this;
return cljm_DOT_core_SLASH__lookup(coll, v, nil);
};
cljm_DOT_core_SLASH_PersistentHashSet.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id coll, id v, id not_found) {
var this__6815 = this;
if(cljm_truthy(cljm_DOT_core_SLASH__contains_key_QMARK_(this__6815_DOT_hash_map, v))) {
return v;

} else {
return not_found;

}
};
cljm_DOT_core_SLASH_PersistentHashSet.prototype.call = (function() {
var G__6836 = null;
var G__6836__2 = ^id(id this_sym6816, id k) {
var this__6818 = this;
id this_sym6816__6819 = this;
id coll__6820 = this_sym6816__6819;
return cljm_DOT_core_SLASH__lookup(coll__6820, k);
};
var G__6836__3 = ^id(id this_sym6817, id k, id not_found) {
var this__6818 = this;
id this_sym6817__6821 = this;
id coll__6822 = this_sym6817__6821;
return cljm_DOT_core_SLASH__lookup(coll__6822, k, not_found);
};
G__6836 = function(this_sym6817, k, not_found){
switch(arguments.length){
case 2:
return G__6836__2.call(this,this_sym6817, k);
case 3:
return G__6836__3.call(this,this_sym6817, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__6836;
})()
;
cljm_DOT_core_SLASH_PersistentHashSet.prototype.apply = ^id(id this_sym6808, id args6809) {
var this__6823 = this;
return [this_sym6808.call applythis_sym6808, [@[this_sym6808] concatargs6809.slice()], nil];
};
cljm_DOT_core_SLASH_PersistentHashSet.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id o) {
var this__6824 = this;
return [cljm_DOT_core_SLASH_PersistentHashSet alloc];
};
cljm_DOT_core_SLASH_PersistentHashSet.prototype.toString = ^id() {
var this__6825 = this;
id this__6826 = this;
return cljm_DOT_core_SLASH_pr_str(this__6826, nil);
};
cljm_DOT_core_SLASH_PersistentHashSet.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id coll) {
var this__6827 = this;
return cljm_DOT_core_SLASH_keys(this__6827_DOT_hash_map);
};
cljm_DOT_core_SLASH_PersistentHashSet.prototype.cljm$core$ISet$_disjoin$arity$2 = ^id(id coll, id v) {
var this__6828 = this;
return [cljm_DOT_core_SLASH_PersistentHashSet alloc];
};
cljm_DOT_core_SLASH_PersistentHashSet.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__6829 = this;
return cljm_DOT_core_SLASH_count(cljm_DOT_core_SLASH_seq(coll));
};
cljm_DOT_core_SLASH_PersistentHashSet.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__6830 = this;
id and__3822__auto____6831 = cljm_DOT_core_SLASH_set_QMARK_(other);
if(cljm_truthy(and__3822__auto____6831)) {
id and__3822__auto____6832 = ([cljm_DOT_core_SLASH_count(coll) isEqual:cljm_DOT_core_SLASH_count(other)]);
if(cljm_truthy(and__3822__auto____6832)) {
return cljm_DOT_core_SLASH_every_QMARK_(^id(id p1__6807_SHARP_) {
return cljm_DOT_core_SLASH_contains_QMARK_(coll, p1__6807_SHARP_);
}, other);

} else {
return and__3822__auto____6832;

}

} else {
return and__3822__auto____6831;

}
};
cljm_DOT_core_SLASH_PersistentHashSet.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__6833 = this;
return [cljm_DOT_core_SLASH_PersistentHashSet alloc];
};
cljm_DOT_core_SLASH_PersistentHashSet.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__6834 = this;
return this__6834_DOT_meta;
};
cljm_DOT_core_SLASH_PersistentHashSet.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__6835 = this;
return cljm_DOT_core_SLASH_with_meta(cljs_DOT_core_DOT_PersistentHashSet_SLASH_EMPTY, this__6835_DOT_meta);
};
cljm_DOT_core_SLASH_PersistentHashSet;
cljs_DOT_core_DOT_PersistentHashSet_SLASH_EMPTY = [cljm_DOT_core_SLASH_PersistentHashSet alloc];
cljs_DOT_core_DOT_PersistentHashSet_SLASH_fromArray = ^id(id items) {
id len__6837 = cljm_DOT_core_SLASH_count(items);
id i__6838 = @0;
id out__6839 = cljm_DOT_core_SLASH_transient(cljs_DOT_core_DOT_PersistentHashSet_SLASH_EMPTY);
while(YES) {
if(cljm_truthy((i__6838 < len__6837))) {
{
var G__6840 = (i__6838 + @1);
var G__6841 = cljm_DOT_core_SLASH_conj_BANG_(out__6839, (items[i__6838]));
i__6838 = G__6840;
out__6839 = G__6841;
continue;
}

} else {
return cljm_DOT_core_SLASH_persistent_BANG_(out__6839);

}
break;
}
};

/**
* @constructor
*/
cljm_DOT_core_SLASH_TransientHashSet = (function (transient_map){
this.transient_map = transient_map;
this.cljm$lang$protocol_mask$partition0$ = 259;
this.cljm$lang$protocol_mask$partition1$ = 34;
})
cljm_DOT_core_SLASH_TransientHashSet.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_TransientHashSet.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/TransientHashSet", nil);
};
cljm_DOT_core_SLASH_TransientHashSet.prototype.call = (function() {
var G__6859 = null;
var G__6859__2 = ^id(id this_sym6845, id k) {
var this__6847 = this;
id this_sym6845__6848 = this;
id tcoll__6849 = this_sym6845__6848;
if(cljm_truthy(([cljm_DOT_core_SLASH__lookup(this__6847_DOT_transient_map, k, cljm_DOT_core_SLASH_lookup_sentinel) isEqual:cljm_DOT_core_SLASH_lookup_sentinel]))) {
return nil;

} else {
return k;

}
};
var G__6859__3 = ^id(id this_sym6846, id k, id not_found) {
var this__6847 = this;
id this_sym6846__6850 = this;
id tcoll__6851 = this_sym6846__6850;
if(cljm_truthy(([cljm_DOT_core_SLASH__lookup(this__6847_DOT_transient_map, k, cljm_DOT_core_SLASH_lookup_sentinel) isEqual:cljm_DOT_core_SLASH_lookup_sentinel]))) {
return not_found;

} else {
return k;

}
};
G__6859 = function(this_sym6846, k, not_found){
switch(arguments.length){
case 2:
return G__6859__2.call(this,this_sym6846, k);
case 3:
return G__6859__3.call(this,this_sym6846, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__6859;
})()
;
cljm_DOT_core_SLASH_TransientHashSet.prototype.apply = ^id(id this_sym6843, id args6844) {
var this__6852 = this;
return [this_sym6843.call applythis_sym6843, [@[this_sym6843] concatargs6844.slice()], nil];
};
cljm_DOT_core_SLASH_TransientHashSet.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id tcoll, id v) {
var this__6853 = this;
return cljm_DOT_core_SLASH__lookup(tcoll, v, nil);
};
cljm_DOT_core_SLASH_TransientHashSet.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id tcoll, id v, id not_found) {
var this__6854 = this;
if(cljm_truthy(([cljm_DOT_core_SLASH__lookup(this__6854_DOT_transient_map, v, cljm_DOT_core_SLASH_lookup_sentinel) isEqual:cljm_DOT_core_SLASH_lookup_sentinel]))) {
return not_found;

} else {
return v;

}
};
cljm_DOT_core_SLASH_TransientHashSet.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id tcoll) {
var this__6855 = this;
return cljm_DOT_core_SLASH_count(this__6855_DOT_transient_map);
};
cljm_DOT_core_SLASH_TransientHashSet.prototype.cljm$core$ITransientSet$_disjoin_BANG_$arity$2 = ^id(id tcoll, id v) {
var this__6856 = this;
this__6856_DOT_transient_map = cljm_DOT_core_SLASH_dissoc_BANG_(this__6856_DOT_transient_map, v);
return tcoll;
};
cljm_DOT_core_SLASH_TransientHashSet.prototype.cljm$core$ITransientCollection$_conj_BANG_$arity$2 = ^id(id tcoll, id o) {
var this__6857 = this;
this__6857_DOT_transient_map = cljm_DOT_core_SLASH_assoc_BANG_(this__6857_DOT_transient_map, o, nil);
return tcoll;
};
cljm_DOT_core_SLASH_TransientHashSet.prototype.cljm$core$ITransientCollection$_persistent_BANG_$arity$1 = ^id(id tcoll) {
var this__6858 = this;
return [cljm_DOT_core_SLASH_PersistentHashSet alloc];
};
cljm_DOT_core_SLASH_TransientHashSet;

/**
* @constructor
*/
cljm_DOT_core_SLASH_PersistentTreeSet = (function (meta, tree_map, __hash){
this.meta = meta;
this.tree_map = tree_map;
this.__hash = __hash;
this.cljm$lang$protocol_mask$partition1$ = 0;
this.cljm$lang$protocol_mask$partition0$ = 417730831;
})
cljm_DOT_core_SLASH_PersistentTreeSet.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_PersistentTreeSet.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/PersistentTreeSet", nil);
};
cljm_DOT_core_SLASH_PersistentTreeSet.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__6862 = this;
id h__1314__auto____6863 = this__6862_DOT___hash;
if(cljm_truthy(cljm_DOT_core_SLASH_not((h__1314__auto____6863 == nil)))) {
return h__1314__auto____6863;

} else {
id h__1314__auto____6864 = cljm_DOT_core_SLASH_hash_iset(coll);
this__6862_DOT___hash = h__1314__auto____6864;
return h__1314__auto____6864;

}
};
cljm_DOT_core_SLASH_PersistentTreeSet.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id coll, id v) {
var this__6865 = this;
return cljm_DOT_core_SLASH__lookup(coll, v, nil);
};
cljm_DOT_core_SLASH_PersistentTreeSet.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id coll, id v, id not_found) {
var this__6866 = this;
if(cljm_truthy(cljm_DOT_core_SLASH__contains_key_QMARK_(this__6866_DOT_tree_map, v))) {
return v;

} else {
return not_found;

}
};
cljm_DOT_core_SLASH_PersistentTreeSet.prototype.call = (function() {
var G__6892 = null;
var G__6892__2 = ^id(id this_sym6867, id k) {
var this__6869 = this;
id this_sym6867__6870 = this;
id coll__6871 = this_sym6867__6870;
return cljm_DOT_core_SLASH__lookup(coll__6871, k);
};
var G__6892__3 = ^id(id this_sym6868, id k, id not_found) {
var this__6869 = this;
id this_sym6868__6872 = this;
id coll__6873 = this_sym6868__6872;
return cljm_DOT_core_SLASH__lookup(coll__6873, k, not_found);
};
G__6892 = function(this_sym6868, k, not_found){
switch(arguments.length){
case 2:
return G__6892__2.call(this,this_sym6868, k);
case 3:
return G__6892__3.call(this,this_sym6868, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__6892;
})()
;
cljm_DOT_core_SLASH_PersistentTreeSet.prototype.apply = ^id(id this_sym6860, id args6861) {
var this__6874 = this;
return [this_sym6860.call applythis_sym6860, [@[this_sym6860] concatargs6861.slice()], nil];
};
cljm_DOT_core_SLASH_PersistentTreeSet.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id o) {
var this__6875 = this;
return [cljm_DOT_core_SLASH_PersistentTreeSet alloc];
};
cljm_DOT_core_SLASH_PersistentTreeSet.prototype.cljm$core$IReversible$_rseq$arity$1 = ^id(id coll) {
var this__6876 = this;
return cljm_DOT_core_SLASH_map(cljm_DOT_core_SLASH_key, cljm_DOT_core_SLASH_rseq(this__6876_DOT_tree_map), nil);
};
cljm_DOT_core_SLASH_PersistentTreeSet.prototype.toString = ^id() {
var this__6877 = this;
id this__6878 = this;
return cljm_DOT_core_SLASH_pr_str(this__6878, nil);
};
cljm_DOT_core_SLASH_PersistentTreeSet.prototype.cljm$core$ISorted$_sorted_seq$arity$2 = ^id(id coll, id ascending_QMARK_) {
var this__6879 = this;
return cljm_DOT_core_SLASH_map(cljm_DOT_core_SLASH_key, cljm_DOT_core_SLASH__sorted_seq(this__6879_DOT_tree_map, ascending_QMARK_), nil);
};
cljm_DOT_core_SLASH_PersistentTreeSet.prototype.cljm$core$ISorted$_sorted_seq_from$arity$3 = ^id(id coll, id k, id ascending_QMARK_) {
var this__6880 = this;
return cljm_DOT_core_SLASH_map(cljm_DOT_core_SLASH_key, cljm_DOT_core_SLASH__sorted_seq_from(this__6880_DOT_tree_map, k, ascending_QMARK_), nil);
};
cljm_DOT_core_SLASH_PersistentTreeSet.prototype.cljm$core$ISorted$_entry_key$arity$2 = ^id(id coll, id entry) {
var this__6881 = this;
return entry;
};
cljm_DOT_core_SLASH_PersistentTreeSet.prototype.cljm$core$ISorted$_comparator$arity$1 = ^id(id coll) {
var this__6882 = this;
return cljm_DOT_core_SLASH__comparator(this__6882_DOT_tree_map);
};
cljm_DOT_core_SLASH_PersistentTreeSet.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id coll) {
var this__6883 = this;
return cljm_DOT_core_SLASH_keys(this__6883_DOT_tree_map);
};
cljm_DOT_core_SLASH_PersistentTreeSet.prototype.cljm$core$ISet$_disjoin$arity$2 = ^id(id coll, id v) {
var this__6884 = this;
return [cljm_DOT_core_SLASH_PersistentTreeSet alloc];
};
cljm_DOT_core_SLASH_PersistentTreeSet.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__6885 = this;
return cljm_DOT_core_SLASH_count(this__6885_DOT_tree_map);
};
cljm_DOT_core_SLASH_PersistentTreeSet.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__6886 = this;
id and__3822__auto____6887 = cljm_DOT_core_SLASH_set_QMARK_(other);
if(cljm_truthy(and__3822__auto____6887)) {
id and__3822__auto____6888 = ([cljm_DOT_core_SLASH_count(coll) isEqual:cljm_DOT_core_SLASH_count(other)]);
if(cljm_truthy(and__3822__auto____6888)) {
return cljm_DOT_core_SLASH_every_QMARK_(^id(id p1__6842_SHARP_) {
return cljm_DOT_core_SLASH_contains_QMARK_(coll, p1__6842_SHARP_);
}, other);

} else {
return and__3822__auto____6888;

}

} else {
return and__3822__auto____6887;

}
};
cljm_DOT_core_SLASH_PersistentTreeSet.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__6889 = this;
return [cljm_DOT_core_SLASH_PersistentTreeSet alloc];
};
cljm_DOT_core_SLASH_PersistentTreeSet.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__6890 = this;
return this__6890_DOT_meta;
};
cljm_DOT_core_SLASH_PersistentTreeSet.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__6891 = this;
return cljm_DOT_core_SLASH_with_meta(cljs_DOT_core_DOT_PersistentTreeSet_SLASH_EMPTY, this__6891_DOT_meta);
};
cljm_DOT_core_SLASH_PersistentTreeSet;
cljs_DOT_core_DOT_PersistentTreeSet_SLASH_EMPTY = [cljm_DOT_core_SLASH_PersistentTreeSet alloc];
cljm_DOT_core_SLASH_hash_set = (function() {
var hash_set = null;
var hash_set__0 = ^id() {
return cljs_DOT_core_DOT_PersistentHashSet_SLASH_EMPTY;
};
var hash_set__1 = ^id(id cljm__varargs, ...) {
NSMutableArray *keys = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[keys addObject:cljm__currentObject];
}
va_end(cljm__args);
id in__6895 = cljm_DOT_core_SLASH_seq(keys);
id out__6896 = cljm_DOT_core_SLASH_transient(cljs_DOT_core_DOT_PersistentHashSet_SLASH_EMPTY);
while(YES) {
if(cljm_truthy(cljm_DOT_core_SLASH_seq(in__6895))) {
{
var G__6897 = cljm_DOT_core_SLASH_next(in__6895);
var G__6898 = cljm_DOT_core_SLASH_conj_BANG_(out__6896, cljm_DOT_core_SLASH_first(in__6895));
in__6895 = G__6897;
out__6896 = G__6898;
continue;
}

} else {
return cljm_DOT_core_SLASH_persistent_BANG_(out__6896);

}
break;
}
};
hash_set = function(var_args){
var keys = var_args;
switch(arguments.length){
case 0:
return hash_set__0.call(this);
default:
return hash_set__1.cljm$lang$arity$variadic(cljm.core.array_seq(arguments, 0));
}
throw('Invalid arity: ' + arguments.length);
};
hash_set.cljm$lang$maxFixedArity = 0;
hash_set.cljm$lang$applyTo = hash_set__1.cljm$lang$applyTo;
hash_set.cljm$lang$arity$0 = hash_set__0;
hash_set.cljm$lang$arity$variadic = hash_set__1.cljm$lang$arity$variadic;
return hash_set;
})()
;
/**
* Returns a set of the distinct elements of coll.
*/
cljm_DOT_core_SLASH_set = ^id(id coll) {
return cljm_DOT_core_SLASH_apply(cljm_DOT_core_SLASH_hash_set, coll, nil);
};
/**
* Returns a new sorted set with supplied keys.
*/
cljm_DOT_core_SLASH_sorted_set = ^id(id cljm__varargs, ...) {
NSMutableArray *keys = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[keys addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_reduce(cljm_DOT_core_SLASH__conj, cljs_DOT_core_DOT_PersistentTreeSet_SLASH_EMPTY, keys);
};
/**
* Returns a new sorted set with supplied keys, using the supplied comparator.
*/
cljm_DOT_core_SLASH_sorted_set_by = ^id(id cljm__varargs, id comparator, ...) {
NSMutableArray *keys = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[keys addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_reduce(cljm_DOT_core_SLASH__conj, [cljs_SLASH_core_DOT_PersistentTreeSet alloc], keys);
};
/**
* Given a map of replacement pairs and a vector/collection, returns a
* vector/seq with any elements = a key in smap replaced with the
* corresponding val in smap
*/
cljm_DOT_core_SLASH_replace = ^id(id smap, id coll) {
if(cljm_truthy(cljm_DOT_core_SLASH_vector_QMARK_(coll))) {
id n__6905 = cljm_DOT_core_SLASH_count(coll);
return cljm_DOT_core_SLASH_reduce(^id(id v, id i) {
id temp__3971__auto____6906 = cljm_DOT_core_SLASH_find(smap, cljm_DOT_core_SLASH_nth(v, i));
if(cljm_truthy(temp__3971__auto____6906)) {
id e__6907 = temp__3971__auto____6906;
return cljm_DOT_core_SLASH_assoc(v, i, cljm_DOT_core_SLASH_second(e__6907), nil);

} else {
return v;

}
}, coll, cljm_DOT_core_SLASH_take(n__6905, cljm_DOT_core_SLASH_iterate(cljm_DOT_core_SLASH_inc, @0)));

} else {
return cljm_DOT_core_SLASH_map(^id(id p1__6899_SHARP_) {
id temp__3971__auto____6908 = cljm_DOT_core_SLASH_find(smap, p1__6899_SHARP_);
if(cljm_truthy(temp__3971__auto____6908)) {
id e__6909 = temp__3971__auto____6908;
return cljm_DOT_core_SLASH_second(e__6909);

} else {
return p1__6899_SHARP_;

}
}, coll, nil);

}
};
/**
* Returns a lazy sequence of the elements of coll with duplicates removed
*/
cljm_DOT_core_SLASH_distinct = ^id(id coll) {
id step__6939 = ^id(id xs, id seen) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
return step__6939(coll, [NSSet set]);
};
cljm_DOT_core_SLASH_butlast = ^id(id s) {
id ret__6942 = @[];
id s__6943 = s;
while(YES) {
if(cljm_truthy(cljm_DOT_core_SLASH_next(s__6943))) {
{
var G__6944 = cljm_DOT_core_SLASH_conj(ret__6942, cljm_DOT_core_SLASH_first(s__6943), nil);
var G__6945 = cljm_DOT_core_SLASH_next(s__6943);
ret__6942 = G__6944;
s__6943 = G__6945;
continue;
}

} else {
return cljm_DOT_core_SLASH_seq(ret__6942);

}
break;
}
};
/**
* Returns the name String of a string, symbol or keyword.
*/
cljm_DOT_core_SLASH_name = ^id(id x) {
if(cljm_truthy(cljm_DOT_core_SLASH_string_QMARK_(x))) {
return x;

} else {
if(cljm_truthy({id or__3824__auto____6948 = cljm_DOT_core_SLASH_keyword_QMARK_(x);
if(cljm_truthy(or__3824__auto____6948)) {
return or__3824__auto____6948;

} else {
return cljm_DOT_core_SLASH_symbol_QMARK_(x);

}
})) {
id i__6949 = [x lastIndexOf@"/"];
if(cljm_truthy((i__6949 < @0))) {
return cljm_DOT_core_SLASH_subs(x, @2);

} else {
return cljm_DOT_core_SLASH_subs(x, (i__6949 + @1));

}

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
throw [Error alloc];

} else {
return nil;

}

}

}
};
/**
* Returns the namespace String of a symbol or keyword, or nil if not present.
*/
cljm_DOT_core_SLASH_namespace = ^id(id x) {
if(cljm_truthy({id or__3824__auto____6952 = cljm_DOT_core_SLASH_keyword_QMARK_(x);
if(cljm_truthy(or__3824__auto____6952)) {
return or__3824__auto____6952;

} else {
return cljm_DOT_core_SLASH_symbol_QMARK_(x);

}
})) {
id i__6953 = [x lastIndexOf@"/"];
if(cljm_truthy((i__6953 > @-1))) {
return cljm_DOT_core_SLASH_subs(x, @2, i__6953);

} else {
return nil;

}

} else {
throw [Error alloc];

}
};
/**
* Returns a map with the keys mapped to the corresponding vals.
*/
cljm_DOT_core_SLASH_zipmap = ^id(id keys, id vals) {
id map__6960 = @{};
id ks__6961 = cljm_DOT_core_SLASH_seq(keys);
id vs__6962 = cljm_DOT_core_SLASH_seq(vals);
while(YES) {
if(cljm_truthy({id and__3822__auto____6963 = ks__6961;
if(cljm_truthy(and__3822__auto____6963)) {
return vs__6962;

} else {
return and__3822__auto____6963;

}
})) {
{
var G__6964 = cljm_DOT_core_SLASH_assoc(map__6960, cljm_DOT_core_SLASH_first(ks__6961), cljm_DOT_core_SLASH_first(vs__6962), nil);
var G__6965 = cljm_DOT_core_SLASH_next(ks__6961);
var G__6966 = cljm_DOT_core_SLASH_next(vs__6962);
map__6960 = G__6964;
ks__6961 = G__6965;
vs__6962 = G__6966;
continue;
}

} else {
return map__6960;

}
break;
}
};
/**
* Returns the x for which (k x), a number, is greatest.
*/
cljm_DOT_core_SLASH_max_key = (function() {
var max_key = null;
var max_key__2 = ^id(id k, id x) {
return x;
};
var max_key__3 = ^id(id k, id x, id y) {
if(cljm_truthy((k(x) > k(y)))) {
return x;

} else {
return y;

}
};
var max_key__4 = ^id(id cljm__varargs, id k, id x, id y, ...) {
NSMutableArray *more = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[more addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_reduce(^id(id p1__6954_SHARP_, id p2__6955_SHARP_) {
return max_key(k, p1__6954_SHARP_, p2__6955_SHARP_, nil);
}, max_key(k, x, y, nil), more);
};
max_key = function(k, x, y, var_args){
var more = var_args;
switch(arguments.length){
case 2:
return max_key__2.call(this,k, x);
case 3:
return max_key__3.call(this,k, x, y);
default:
return max_key__4.cljm$lang$arity$variadic(k, x, y, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
max_key.cljm$lang$maxFixedArity = 3;
max_key.cljm$lang$applyTo = max_key__4.cljm$lang$applyTo;
max_key.cljm$lang$arity$2 = max_key__2;
max_key.cljm$lang$arity$3 = max_key__3;
max_key.cljm$lang$arity$variadic = max_key__4.cljm$lang$arity$variadic;
return max_key;
})()
;
/**
* Returns the x for which (k x), a number, is least.
*/
cljm_DOT_core_SLASH_min_key = (function() {
var min_key = null;
var min_key__2 = ^id(id k, id x) {
return x;
};
var min_key__3 = ^id(id k, id x, id y) {
if(cljm_truthy((k(x) < k(y)))) {
return x;

} else {
return y;

}
};
var min_key__4 = ^id(id cljm__varargs, id k, id x, id y, ...) {
NSMutableArray *more = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[more addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_reduce(^id(id p1__6967_SHARP_, id p2__6968_SHARP_) {
return min_key(k, p1__6967_SHARP_, p2__6968_SHARP_, nil);
}, min_key(k, x, y, nil), more);
};
min_key = function(k, x, y, var_args){
var more = var_args;
switch(arguments.length){
case 2:
return min_key__2.call(this,k, x);
case 3:
return min_key__3.call(this,k, x, y);
default:
return min_key__4.cljm$lang$arity$variadic(k, x, y, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
min_key.cljm$lang$maxFixedArity = 3;
min_key.cljm$lang$applyTo = min_key__4.cljm$lang$applyTo;
min_key.cljm$lang$arity$2 = min_key__2;
min_key.cljm$lang$arity$3 = min_key__3;
min_key.cljm$lang$arity$variadic = min_key__4.cljm$lang$arity$variadic;
return min_key;
})()
;
/**
* Returns a lazy sequence of lists like partition, but may include
* partitions with fewer than n items at the end.
*/
cljm_DOT_core_SLASH_partition_all = (function() {
var partition_all = null;
var partition_all__2 = ^id(id n, id coll) {
return partition_all(n, n, coll);
};
var partition_all__3 = ^id(id n, id step, id coll) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
partition_all = function(n, step, coll){
switch(arguments.length){
case 2:
return partition_all__2.call(this,n, step);
case 3:
return partition_all__3.call(this,n, step, coll);
}
throw('Invalid arity: ' + arguments.length);
};
partition_all.cljm$lang$arity$2 = partition_all__2;
partition_all.cljm$lang$arity$3 = partition_all__3;
return partition_all;
})()
;
/**
* Returns a lazy sequence of successive items from coll while
* (pred item) returns true. pred must be free of side-effects.
*/
cljm_DOT_core_SLASH_take_while = ^id(id pred, id coll) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
cljm_DOT_core_SLASH_mk_bound_fn = ^id(id sc, id test, id key) {
return ^id(id e) {
id comp__6978 = cljm_DOT_core_SLASH__comparator(sc);
return test(comp__6978(cljm_DOT_core_SLASH__entry_key(sc, e), key), @0);
};
};
/**
* sc must be a sorted collection, test(s) one of <, <=, > or
* >=. Returns a seq of those entries with keys ek for
* which (test (.. sc comparator (compare ek key)) 0) is true
*/
cljm_DOT_core_SLASH_subseq = (function() {
var subseq = null;
var subseq__3 = ^id(id sc, id test, id key) {
id include__6990 = cljm_DOT_core_SLASH_mk_bound_fn(sc, test, key);
if(cljm_truthy((test))) {
id temp__3974__auto____6991 = cljm_DOT_core_SLASH__sorted_seq_from(sc, key, @YES);
if(cljm_truthy(temp__3974__auto____6991)) {
id vec__6992__6993 = temp__3974__auto____6991;
id e__6994 = cljm_DOT_core_SLASH_nth(vec__6992__6993, @0, nil);
id s__6995 = vec__6992__6993;
if(cljm_truthy(include__6990(e__6994))) {
return s__6995;

} else {
return cljm_DOT_core_SLASH_next(s__6995);

}

} else {
return nil;

}

} else {
return cljm_DOT_core_SLASH_take_while(include__6990, cljm_DOT_core_SLASH__sorted_seq(sc, @YES));

}
};
var subseq__5 = ^id(id sc, id start_test, id start_key, id end_test, id end_key) {
id temp__3974__auto____6996 = cljm_DOT_core_SLASH__sorted_seq_from(sc, start_key, @YES);
if(cljm_truthy(temp__3974__auto____6996)) {
id vec__6997__6998 = temp__3974__auto____6996;
id e__6999 = cljm_DOT_core_SLASH_nth(vec__6997__6998, @0, nil);
id s__7000 = vec__6997__6998;
return cljm_DOT_core_SLASH_take_while(cljm_DOT_core_SLASH_mk_bound_fn(sc, end_test, end_key), (cljm_truthy((e__6999))) ?s__7000:cljm_DOT_core_SLASH_next(s__7000));

} else {
return nil;

}
};
subseq = function(sc, start_test, start_key, end_test, end_key){
switch(arguments.length){
case 3:
return subseq__3.call(this,sc, start_test, start_key);
case 5:
return subseq__5.call(this,sc, start_test, start_key, end_test, end_key);
}
throw('Invalid arity: ' + arguments.length);
};
subseq.cljm$lang$arity$3 = subseq__3;
subseq.cljm$lang$arity$5 = subseq__5;
return subseq;
})()
;
/**
* sc must be a sorted collection, test(s) one of <, <=, > or
* >=. Returns a reverse seq of those entries with keys ek for
* which (test (.. sc comparator (compare ek key)) 0) is true
*/
cljm_DOT_core_SLASH_rsubseq = (function() {
var rsubseq = null;
var rsubseq__3 = ^id(id sc, id test, id key) {
id include__7012 = cljm_DOT_core_SLASH_mk_bound_fn(sc, test, key);
if(cljm_truthy((test))) {
id temp__3974__auto____7013 = cljm_DOT_core_SLASH__sorted_seq_from(sc, key, @NO);
if(cljm_truthy(temp__3974__auto____7013)) {
id vec__7014__7015 = temp__3974__auto____7013;
id e__7016 = cljm_DOT_core_SLASH_nth(vec__7014__7015, @0, nil);
id s__7017 = vec__7014__7015;
if(cljm_truthy(include__7012(e__7016))) {
return s__7017;

} else {
return cljm_DOT_core_SLASH_next(s__7017);

}

} else {
return nil;

}

} else {
return cljm_DOT_core_SLASH_take_while(include__7012, cljm_DOT_core_SLASH__sorted_seq(sc, @NO));

}
};
var rsubseq__5 = ^id(id sc, id start_test, id start_key, id end_test, id end_key) {
id temp__3974__auto____7018 = cljm_DOT_core_SLASH__sorted_seq_from(sc, end_key, @NO);
if(cljm_truthy(temp__3974__auto____7018)) {
id vec__7019__7020 = temp__3974__auto____7018;
id e__7021 = cljm_DOT_core_SLASH_nth(vec__7019__7020, @0, nil);
id s__7022 = vec__7019__7020;
return cljm_DOT_core_SLASH_take_while(cljm_DOT_core_SLASH_mk_bound_fn(sc, start_test, start_key), (cljm_truthy((e__7021))) ?s__7022:cljm_DOT_core_SLASH_next(s__7022));

} else {
return nil;

}
};
rsubseq = function(sc, start_test, start_key, end_test, end_key){
switch(arguments.length){
case 3:
return rsubseq__3.call(this,sc, start_test, start_key);
case 5:
return rsubseq__5.call(this,sc, start_test, start_key, end_test, end_key);
}
throw('Invalid arity: ' + arguments.length);
};
rsubseq.cljm$lang$arity$3 = rsubseq__3;
rsubseq.cljm$lang$arity$5 = rsubseq__5;
return rsubseq;
})()
;

/**
* @constructor
*/
cljm_DOT_core_SLASH_Range = (function (meta, start, end, step, __hash){
this.meta = meta;
this.start = start;
this.end = end;
this.step = step;
this.__hash = __hash;
this.cljm$lang$protocol_mask$partition1$ = 0;
this.cljm$lang$protocol_mask$partition0$ = 32375006;
})
cljm_DOT_core_SLASH_Range.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_Range.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/Range", nil);
};
cljm_DOT_core_SLASH_Range.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id rng) {
var this__7023 = this;
id h__1314__auto____7024 = this__7023_DOT___hash;
if(cljm_truthy(cljm_DOT_core_SLASH_not((h__1314__auto____7024 == nil)))) {
return h__1314__auto____7024;

} else {
id h__1314__auto____7025 = cljm_DOT_core_SLASH_hash_coll(rng);
this__7023_DOT___hash = h__1314__auto____7025;
return h__1314__auto____7025;

}
};
cljm_DOT_core_SLASH_Range.prototype.cljm$core$INext$_next$arity$1 = ^id(id rng) {
var this__7026 = this;
if(cljm_truthy((this__7026_DOT_step > @0))) {
if(cljm_truthy(((this__7026_DOT_start + this__7026_DOT_step) < this__7026_DOT_end))) {
return [cljm_DOT_core_SLASH_Range alloc];

} else {
return nil;

}

} else {
if(cljm_truthy(((this__7026_DOT_start + this__7026_DOT_step) > this__7026_DOT_end))) {
return [cljm_DOT_core_SLASH_Range alloc];

} else {
return nil;

}

}
};
cljm_DOT_core_SLASH_Range.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id rng, id o) {
var this__7027 = this;
return cljm_DOT_core_SLASH_cons(o, rng);
};
cljm_DOT_core_SLASH_Range.prototype.toString = ^id() {
var this__7028 = this;
id this__7029 = this;
return cljm_DOT_core_SLASH_pr_str(this__7029, nil);
};
cljm_DOT_core_SLASH_Range.prototype.cljm$core$IReduce$_reduce$arity$2 = ^id(id rng, id f) {
var this__7030 = this;
return cljm_DOT_core_SLASH_ci_reduce(rng, f);
};
cljm_DOT_core_SLASH_Range.prototype.cljm$core$IReduce$_reduce$arity$3 = ^id(id rng, id f, id s) {
var this__7031 = this;
return cljm_DOT_core_SLASH_ci_reduce(rng, f, s);
};
cljm_DOT_core_SLASH_Range.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id rng) {
var this__7032 = this;
if(cljm_truthy((this__7032_DOT_step > @0))) {
if(cljm_truthy((this__7032_DOT_start < this__7032_DOT_end))) {
return rng;

} else {
return nil;

}

} else {
if(cljm_truthy((this__7032_DOT_start > this__7032_DOT_end))) {
return rng;

} else {
return nil;

}

}
};
cljm_DOT_core_SLASH_Range.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id rng) {
var this__7033 = this;
if(cljm_truthy(cljm_DOT_core_SLASH_not(cljm_DOT_core_SLASH__seq(rng)))) {
return @0;

} else {
return js_SLASH_Math_DOT_ceil(((this__7033_DOT_end - this__7033_DOT_start) / this__7033_DOT_step));

}
};
cljm_DOT_core_SLASH_Range.prototype.cljm$core$ISeq$_first$arity$1 = ^id(id rng) {
var this__7034 = this;
return this__7034_DOT_start;
};
cljm_DOT_core_SLASH_Range.prototype.cljm$core$ISeq$_rest$arity$1 = ^id(id rng) {
var this__7035 = this;
if(cljm_truthy(cljm_DOT_core_SLASH_not((cljm_DOT_core_SLASH__seq(rng) == nil)))) {
return [cljm_DOT_core_SLASH_Range alloc];

} else {
return cljm.core.List.EMPTY;

}
};
cljm_DOT_core_SLASH_Range.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id rng, id other) {
var this__7036 = this;
return cljm_DOT_core_SLASH_equiv_sequential(rng, other);
};
cljm_DOT_core_SLASH_Range.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id rng, id meta) {
var this__7037 = this;
return [cljm_DOT_core_SLASH_Range alloc];
};
cljm_DOT_core_SLASH_Range.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id rng) {
var this__7038 = this;
return this__7038_DOT_meta;
};
cljm_DOT_core_SLASH_Range.prototype.cljm$core$IIndexed$_nth$arity$2 = ^id(id rng, id n) {
var this__7039 = this;
if(cljm_truthy((n < cljm_DOT_core_SLASH__count(rng)))) {
return (this__7039_DOT_start + (n * this__7039_DOT_step));

} else {
if(cljm_truthy({id and__3822__auto____7040 = (this__7039_DOT_start > this__7039_DOT_end);
if(cljm_truthy(and__3822__auto____7040)) {
return ([this__7039_DOT_step isEqual:@0]);

} else {
return and__3822__auto____7040;

}
})) {
return this__7039_DOT_start;

} else {
throw [Error alloc];

}

}
};
cljm_DOT_core_SLASH_Range.prototype.cljm$core$IIndexed$_nth$arity$3 = ^id(id rng, id n, id not_found) {
var this__7041 = this;
if(cljm_truthy((n < cljm_DOT_core_SLASH__count(rng)))) {
return (this__7041_DOT_start + (n * this__7041_DOT_step));

} else {
if(cljm_truthy({id and__3822__auto____7042 = (this__7041_DOT_start > this__7041_DOT_end);
if(cljm_truthy(and__3822__auto____7042)) {
return ([this__7041_DOT_step isEqual:@0]);

} else {
return and__3822__auto____7042;

}
})) {
return this__7041_DOT_start;

} else {
return not_found;

}

}
};
cljm_DOT_core_SLASH_Range.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id rng) {
var this__7043 = this;
return cljm_DOT_core_SLASH_with_meta(cljs_DOT_core_DOT_List_SLASH_EMPTY, this__7043_DOT_meta);
};
cljm_DOT_core_SLASH_Range;
/**
* Returns a lazy seq of nums from start (inclusive) to end
* (exclusive), by step, where start defaults to 0, step to 1,
* and end to infinity.
*/
cljm_DOT_core_SLASH_range = (function() {
var range = null;
var range__0 = ^id() {
return range(@0, Number_DOT_MAX_VALUE, @1);
};
var range__1 = ^id(id end) {
return range(@0, end, @1);
};
var range__2 = ^id(id start, id end) {
return range(start, end, @1);
};
var range__3 = ^id(id start, id end, id step) {
return [cljm_DOT_core_SLASH_Range alloc];
};
range = function(start, end, step){
switch(arguments.length){
case 0:
return range__0.call(this);
case 1:
return range__1.call(this,start);
case 2:
return range__2.call(this,start, end);
case 3:
return range__3.call(this,start, end, step);
}
throw('Invalid arity: ' + arguments.length);
};
range.cljm$lang$arity$0 = range__0;
range.cljm$lang$arity$1 = range__1;
range.cljm$lang$arity$2 = range__2;
range.cljm$lang$arity$3 = range__3;
return range;
})()
;
/**
* Returns a lazy seq of every nth item in coll.
*/
cljm_DOT_core_SLASH_take_nth = ^id(id n, id coll) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
/**
* Returns a vector of [(take-while pred coll) (drop-while pred coll)]
*/
cljm_DOT_core_SLASH_split_with = ^id(id pred, id coll) {
return @[ cljm_DOT_core_SLASH_take_while(pred, coll), cljm_DOT_core_SLASH_drop_while(pred, coll) ];
};
/**
* Applies f to each value in coll, splitting it each time f returns
* a new value.  Returns a lazy seq of partitions.
*/
cljm_DOT_core_SLASH_partition_by = ^id(id f, id coll) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
/**
* Returns a map from distinct items in coll to the number of times
* they appear.
*/
cljm_DOT_core_SLASH_frequencies = ^id(id coll) {
return cljm_DOT_core_SLASH_persistent_BANG_(cljm_DOT_core_SLASH_reduce(^id(id counts, id x) {
return cljm_DOT_core_SLASH_assoc_BANG_(counts, x, (cljm_DOT_core_SLASH__lookup(counts, x, @0) + @1));
}, cljm_DOT_core_SLASH_transient(@{}), coll));
};
/**
* Returns a lazy seq of the intermediate values of the reduction (as
* per reduce) of coll by f, starting with init.
*/
cljm_DOT_core_SLASH_reductions = (function() {
var reductions = null;
var reductions__2 = ^id(id f, id coll) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
var reductions__3 = ^id(id f, id init, id coll) {
return cljm_DOT_core_SLASH_cons(init, [cljm_DOT_core_SLASH_LazySeq alloc]);
};
reductions = function(f, init, coll){
switch(arguments.length){
case 2:
return reductions__2.call(this,f, init);
case 3:
return reductions__3.call(this,f, init, coll);
}
throw('Invalid arity: ' + arguments.length);
};
reductions.cljm$lang$arity$2 = reductions__2;
reductions.cljm$lang$arity$3 = reductions__3;
return reductions;
})()
;
/**
* Takes a set of functions and returns a fn that is the juxtaposition
* of those fns.  The returned fn takes a variable number of args, and
* returns a vector containing the result of applying each fn to the
* args (left-to-right).
* ((juxt a b c) x) => [(a x) (b x) (c x)]
*/
cljm_DOT_core_SLASH_juxt = (function() {
var juxt = null;
var juxt__1 = ^id(id f) {
return (function() {
var G__7079 = null;
var G__7079__0 = ^id() {
return cljm_DOT_core_SLASH_vector(f(), nil);
};
var G__7079__1 = ^id(id x) {
return cljm_DOT_core_SLASH_vector(f(x), nil);
};
var G__7079__2 = ^id(id x, id y) {
return cljm_DOT_core_SLASH_vector(f(x, y), nil);
};
var G__7079__3 = ^id(id x, id y, id z) {
return cljm_DOT_core_SLASH_vector(f(x, y, z), nil);
};
var G__7079__4 = ^id(id cljm__varargs, id x, id y, id z, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_vector(cljm_DOT_core_SLASH_apply(f, x, y, z, args, nil), nil);
};
G__7079 = function(x, y, z, var_args){
var args = var_args;
switch(arguments.length){
case 0:
return G__7079__0.call(this);
case 1:
return G__7079__1.call(this,x);
case 2:
return G__7079__2.call(this,x, y);
case 3:
return G__7079__3.call(this,x, y, z);
default:
return G__7079__4.cljm$lang$arity$variadic(x, y, z, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
G__7079.cljm$lang$maxFixedArity = 3;
G__7079.cljm$lang$applyTo = G__7079__4.cljm$lang$applyTo;
return G__7079;
})()
};
var juxt__2 = ^id(id f, id g) {
return (function() {
var G__7080 = null;
var G__7080__0 = ^id() {
return cljm_DOT_core_SLASH_vector(f(), g(), nil);
};
var G__7080__1 = ^id(id x) {
return cljm_DOT_core_SLASH_vector(f(x), g(x), nil);
};
var G__7080__2 = ^id(id x, id y) {
return cljm_DOT_core_SLASH_vector(f(x, y), g(x, y), nil);
};
var G__7080__3 = ^id(id x, id y, id z) {
return cljm_DOT_core_SLASH_vector(f(x, y, z), g(x, y, z), nil);
};
var G__7080__4 = ^id(id cljm__varargs, id x, id y, id z, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_vector(cljm_DOT_core_SLASH_apply(f, x, y, z, args, nil), cljm_DOT_core_SLASH_apply(g, x, y, z, args, nil), nil);
};
G__7080 = function(x, y, z, var_args){
var args = var_args;
switch(arguments.length){
case 0:
return G__7080__0.call(this);
case 1:
return G__7080__1.call(this,x);
case 2:
return G__7080__2.call(this,x, y);
case 3:
return G__7080__3.call(this,x, y, z);
default:
return G__7080__4.cljm$lang$arity$variadic(x, y, z, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
G__7080.cljm$lang$maxFixedArity = 3;
G__7080.cljm$lang$applyTo = G__7080__4.cljm$lang$applyTo;
return G__7080;
})()
};
var juxt__3 = ^id(id f, id g, id h) {
return (function() {
var G__7081 = null;
var G__7081__0 = ^id() {
return cljm_DOT_core_SLASH_vector(f(), g(), h(), nil);
};
var G__7081__1 = ^id(id x) {
return cljm_DOT_core_SLASH_vector(f(x), g(x), h(x), nil);
};
var G__7081__2 = ^id(id x, id y) {
return cljm_DOT_core_SLASH_vector(f(x, y), g(x, y), h(x, y), nil);
};
var G__7081__3 = ^id(id x, id y, id z) {
return cljm_DOT_core_SLASH_vector(f(x, y, z), g(x, y, z), h(x, y, z), nil);
};
var G__7081__4 = ^id(id cljm__varargs, id x, id y, id z, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_vector(cljm_DOT_core_SLASH_apply(f, x, y, z, args, nil), cljm_DOT_core_SLASH_apply(g, x, y, z, args, nil), cljm_DOT_core_SLASH_apply(h, x, y, z, args, nil), nil);
};
G__7081 = function(x, y, z, var_args){
var args = var_args;
switch(arguments.length){
case 0:
return G__7081__0.call(this);
case 1:
return G__7081__1.call(this,x);
case 2:
return G__7081__2.call(this,x, y);
case 3:
return G__7081__3.call(this,x, y, z);
default:
return G__7081__4.cljm$lang$arity$variadic(x, y, z, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
G__7081.cljm$lang$maxFixedArity = 3;
G__7081.cljm$lang$applyTo = G__7081__4.cljm$lang$applyTo;
return G__7081;
})()
};
var juxt__4 = ^id(id cljm__varargs, id f, id g, id h, ...) {
NSMutableArray *fs = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[fs addObject:cljm__currentObject];
}
va_end(cljm__args);
id fs__7078 = cljm_DOT_core_SLASH_list_STAR_(f, g, h, fs, nil);
return (function() {
var G__7082 = null;
var G__7082__0 = ^id() {
return cljm_DOT_core_SLASH_reduce(^id(id p1__7059_SHARP_, id p2__7060_SHARP_) {
return cljm_DOT_core_SLASH_conj(p1__7059_SHARP_, p2__7060_SHARP_(), nil);
}, @[], fs__7078);
};
var G__7082__1 = ^id(id x) {
return cljm_DOT_core_SLASH_reduce(^id(id p1__7061_SHARP_, id p2__7062_SHARP_) {
return cljm_DOT_core_SLASH_conj(p1__7061_SHARP_, p2__7062_SHARP_(x), nil);
}, @[], fs__7078);
};
var G__7082__2 = ^id(id x, id y) {
return cljm_DOT_core_SLASH_reduce(^id(id p1__7063_SHARP_, id p2__7064_SHARP_) {
return cljm_DOT_core_SLASH_conj(p1__7063_SHARP_, p2__7064_SHARP_(x, y), nil);
}, @[], fs__7078);
};
var G__7082__3 = ^id(id x, id y, id z) {
return cljm_DOT_core_SLASH_reduce(^id(id p1__7065_SHARP_, id p2__7066_SHARP_) {
return cljm_DOT_core_SLASH_conj(p1__7065_SHARP_, p2__7066_SHARP_(x, y, z), nil);
}, @[], fs__7078);
};
var G__7082__4 = ^id(id cljm__varargs, id x, id y, id z, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_reduce(^id(id p1__7067_SHARP_, id p2__7068_SHARP_) {
return cljm_DOT_core_SLASH_conj(p1__7067_SHARP_, cljm_DOT_core_SLASH_apply(p2__7068_SHARP_, x, y, z, args, nil), nil);
}, @[], fs__7078);
};
G__7082 = function(x, y, z, var_args){
var args = var_args;
switch(arguments.length){
case 0:
return G__7082__0.call(this);
case 1:
return G__7082__1.call(this,x);
case 2:
return G__7082__2.call(this,x, y);
case 3:
return G__7082__3.call(this,x, y, z);
default:
return G__7082__4.cljm$lang$arity$variadic(x, y, z, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
G__7082.cljm$lang$maxFixedArity = 3;
G__7082.cljm$lang$applyTo = G__7082__4.cljm$lang$applyTo;
return G__7082;
})()
};
juxt = function(f, g, h, var_args){
var fs = var_args;
switch(arguments.length){
case 1:
return juxt__1.call(this,f);
case 2:
return juxt__2.call(this,f, g);
case 3:
return juxt__3.call(this,f, g, h);
default:
return juxt__4.cljm$lang$arity$variadic(f, g, h, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
juxt.cljm$lang$maxFixedArity = 3;
juxt.cljm$lang$applyTo = juxt__4.cljm$lang$applyTo;
juxt.cljm$lang$arity$1 = juxt__1;
juxt.cljm$lang$arity$2 = juxt__2;
juxt.cljm$lang$arity$3 = juxt__3;
juxt.cljm$lang$arity$variadic = juxt__4.cljm$lang$arity$variadic;
return juxt;
})()
;
/**
* When lazy sequences are produced via functions that have side
* effects, any effects other than those needed to produce the first
* element in the seq do not occur until the seq is consumed. dorun can
* be used to force any effects. Walks through the successive nexts of
* the seq, does not retain the head and returns nil.
*/
cljm_DOT_core_SLASH_dorun = (function() {
var dorun = null;
var dorun__1 = ^id(id coll) {
while(YES) {
if(cljm_truthy(cljm_DOT_core_SLASH_seq(coll))) {
{
var G__7085 = cljm_DOT_core_SLASH_next(coll);
coll = G__7085;
continue;
}

} else {
return nil;

}
break;
}
};
var dorun__2 = ^id(id n, id coll) {
while(YES) {
if(cljm_truthy({id and__3822__auto____7084 = cljm_DOT_core_SLASH_seq(coll);
if(cljm_truthy(and__3822__auto____7084)) {
return (n > @0);

} else {
return and__3822__auto____7084;

}
})) {
{
var G__7086 = (n - @1);
var G__7087 = cljm_DOT_core_SLASH_next(coll);
n = G__7086;
coll = G__7087;
continue;
}

} else {
return nil;

}
break;
}
};
dorun = function(n, coll){
switch(arguments.length){
case 1:
return dorun__1.call(this,n);
case 2:
return dorun__2.call(this,n, coll);
}
throw('Invalid arity: ' + arguments.length);
};
dorun.cljm$lang$arity$1 = dorun__1;
dorun.cljm$lang$arity$2 = dorun__2;
return dorun;
})()
;
/**
* When lazy sequences are produced via functions that have side
* effects, any effects other than those needed to produce the first
* element in the seq do not occur until the seq is consumed. doall can
* be used to force any effects. Walks through the successive nexts of
* the seq, retains the head and returns it, thus causing the entire
* seq to reside in memory at one time.
*/
cljm_DOT_core_SLASH_doall = (function() {
var doall = null;
var doall__1 = ^id(id coll) {
cljm_DOT_core_SLASH_dorun(coll);
return coll;
};
var doall__2 = ^id(id n, id coll) {
cljm_DOT_core_SLASH_dorun(n, coll);
return coll;
};
doall = function(n, coll){
switch(arguments.length){
case 1:
return doall__1.call(this,n);
case 2:
return doall__2.call(this,n, coll);
}
throw('Invalid arity: ' + arguments.length);
};
doall.cljm$lang$arity$1 = doall__1;
doall.cljm$lang$arity$2 = doall__2;
return doall;
})()
;
cljm_DOT_core_SLASH_regexp_QMARK_ = ^id(id o) {
return o instanceof RegExp;
};
/**
* Returns the result of (re-find re s) if re fully matches s.
*/
cljm_DOT_core_SLASH_re_matches = ^id(id re, id s) {
id matches__7089 = [re execs];
if(cljm_truthy(cljm_DOT_core_SLASH__EQ_(cljm_DOT_core_SLASH_first(matches__7089), s, nil))) {
if(cljm_truthy(([cljm_DOT_core_SLASH_count(matches__7089) isEqual:@1]))) {
return cljm_DOT_core_SLASH_first(matches__7089);

} else {
return cljm_DOT_core_SLASH_vec(matches__7089);

}

} else {
return nil;

}
};
/**
* Returns the first regex match, if any, of s to re, using
* re.exec(s). Returns a vector, containing first the matching
* substring, then any capturing groups if the regular expression contains
* capturing groups.
*/
cljm_DOT_core_SLASH_re_find = ^id(id re, id s) {
id matches__7091 = [re execs];
if(cljm_truthy((matches__7091 == nil))) {
return nil;

} else {
if(cljm_truthy(([cljm_DOT_core_SLASH_count(matches__7091) isEqual:@1]))) {
return cljm_DOT_core_SLASH_first(matches__7091);

} else {
return cljm_DOT_core_SLASH_vec(matches__7091);

}

}
};
/**
* Returns a lazy sequence of successive matches of re in s.
*/
cljm_DOT_core_SLASH_re_seq = ^id(id re, id s) {
id match_data__7096 = cljm_DOT_core_SLASH_re_find(re, s);
id match_idx__7097 = [s searchre];
id match_str__7098 = (cljm_truthy(cljm_DOT_core_SLASH_coll_QMARK_(match_data__7096))) ?cljm_DOT_core_SLASH_first(match_data__7096):match_data__7096;
id post_match__7099 = cljm_DOT_core_SLASH_subs(s, (match_idx__7097 + cljm_DOT_core_SLASH_count(match_str__7098)));
if(cljm_truthy(match_data__7096)) {
return [cljm_DOT_core_SLASH_LazySeq alloc];

} else {
return nil;

}
};
/**
* Returns an instance of RegExp which has compiled the provided string.
*/
cljm_DOT_core_SLASH_re_pattern = ^id(id s) {
id vec__7106__7107 = cljm_DOT_core_SLASH_re_find(/^(?:\(\?([idmsux]*)\))?(.*)/, s);
id ___7108 = cljm_DOT_core_SLASH_nth(vec__7106__7107, @0, nil);
id flags__7109 = cljm_DOT_core_SLASH_nth(vec__7106__7107, @1, nil);
id pattern__7110 = cljm_DOT_core_SLASH_nth(vec__7106__7107, @2, nil);
return [RegExp alloc];
};
cljm_DOT_core_SLASH_pr_sequential = ^id(id print_one, id begin, id sep, id end, id opts, id coll) {
return cljm_DOT_core_SLASH_concat(@[ begin ], cljm_DOT_core_SLASH_flatten1(cljm_DOT_core_SLASH_interpose(@[ sep ], cljm_DOT_core_SLASH_map(^id(id p1__7100_SHARP_) {
return print_one(p1__7100_SHARP_, opts);
}, coll, nil))), @[ end ], nil);
};
cljm_DOT_core_SLASH_string_print = ^id(id x) {
cljm_DOT_core_SLASH__STAR_print_fn_STAR_(x);
return nil;
};
cljm_DOT_core_SLASH_flush = ^id() {
return nil;
};
cljm_DOT_core_SLASH_pr_seq = ^id(id obj, id opts) {
if(cljm_truthy((obj == nil))) {
return cljm_DOT_core_SLASH_list(@"nil", nil);

} else {
if(cljm_truthy(((void *) 0) === obj))) {
return cljm_DOT_core_SLASH_list(@"#<undefined>", nil);

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return cljm_DOT_core_SLASH_concat((cljm_truthy({id and__3822__auto____7120 = cljm_DOT_core_SLASH__lookup(opts, cljm_keyword(@":meta"), nil);
if(cljm_truthy(and__3822__auto____7120)) {
id and__3822__auto____7124 = {id G__7121__7122 = obj;
if(cljm_truthy(G__7121__7122)) {
if(cljm_truthy({id or__3824__auto____7123 = (G__7121__7122.cljm$lang$protocol_mask$partition0$ & @131072);
if(cljm_truthy(or__3824__auto____7123)) {
return or__3824__auto____7123;

} else {
return G__7121__7122.cljm$core$IMeta$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__7121__7122.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IMeta, G__7121__7122);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IMeta, G__7121__7122);

}
};
if(cljm_truthy(and__3822__auto____7124)) {
return cljm_DOT_core_SLASH_meta(obj);

} else {
return and__3822__auto____7124;

}

} else {
return and__3822__auto____7120;

}
})) ?cljm_DOT_core_SLASH_concat(@[ @"^" ], pr_seq(cljm_DOT_core_SLASH_meta(obj), opts), @[ @" " ], nil):nil, (cljm_truthy({id and__3822__auto____7125 = cljm_DOT_core_SLASH_not((obj == nil));
if(cljm_truthy(and__3822__auto____7125)) {
return obj.cljs$lang$type;

} else {
return and__3822__auto____7125;

}
})) ?[obj cljsobj lang]:(cljm_truthy({id G__7126__7127 = obj;
if(cljm_truthy(G__7126__7127)) {
if(cljm_truthy({id or__3824__auto____7128 = (G__7126__7127.cljm$lang$protocol_mask$partition0$ & @536870912);
if(cljm_truthy(or__3824__auto____7128)) {
return or__3824__auto____7128;

} else {
return G__7126__7127.cljm$core$IPrintable$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__7126__7127.cljm$lang$protocol_mask$partition0$))) {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IPrintable, G__7126__7127);

} else {
return @NO;

}

}

} else {
return cljm_DOT_core_SLASH_type_satisfies_(cljm_DOT_core_SLASH_IPrintable, G__7126__7127);

}
})) ?cljm_DOT_core_SLASH__pr_seq(obj, opts):(cljm_truthy(cljm_DOT_core_SLASH_regexp_QMARK_(obj))) ?cljm_DOT_core_SLASH_list(@"#\"", obj.source, @"\"", nil):(cljm_truthy(cljm_keyword(@":else"))) ?cljm_DOT_core_SLASH_list(@"#<", [@[ obj ] componentsSeperatedByString:@""], @">", nil):nil, nil);

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_pr_sb = ^id(id objs, id opts) {
id sb__7148 = [gstring_SLASH_StringBuffer alloc];
id G__7149__7150 = cljm_DOT_core_SLASH_seq(cljm_DOT_core_SLASH_pr_seq(cljm_DOT_core_SLASH_first(objs), opts));
if(cljm_truthy(G__7149__7150)) {
id string__7151 = cljm_DOT_core_SLASH_first(G__7149__7150);
id G__7149__7152 = G__7149__7150;
while(YES) {
[sb__7148 appendstring__7151];
id temp__3974__auto____7153 = cljm_DOT_core_SLASH_next(G__7149__7152);
if(cljm_truthy(temp__3974__auto____7153)) {
id G__7149__7154 = temp__3974__auto____7153;
{
var G__7167 = cljm_DOT_core_SLASH_first(G__7149__7154);
var G__7168 = G__7149__7154;
string__7151 = G__7167;
G__7149__7152 = G__7168;
continue;
}

} else {

}
break;
}

} else {

}
id G__7155__7156 = cljm_DOT_core_SLASH_seq(cljm_DOT_core_SLASH_next(objs));
if(cljm_truthy(G__7155__7156)) {
id obj__7157 = cljm_DOT_core_SLASH_first(G__7155__7156);
id G__7155__7158 = G__7155__7156;
while(YES) {
[sb__7148 append@" "];
id G__7159__7160 = cljm_DOT_core_SLASH_seq(cljm_DOT_core_SLASH_pr_seq(obj__7157, opts));
if(cljm_truthy(G__7159__7160)) {
id string__7161 = cljm_DOT_core_SLASH_first(G__7159__7160);
id G__7159__7162 = G__7159__7160;
while(YES) {
[sb__7148 appendstring__7161];
id temp__3974__auto____7163 = cljm_DOT_core_SLASH_next(G__7159__7162);
if(cljm_truthy(temp__3974__auto____7163)) {
id G__7159__7164 = temp__3974__auto____7163;
{
var G__7169 = cljm_DOT_core_SLASH_first(G__7159__7164);
var G__7170 = G__7159__7164;
string__7161 = G__7169;
G__7159__7162 = G__7170;
continue;
}

} else {

}
break;
}

} else {

}
id temp__3974__auto____7165 = cljm_DOT_core_SLASH_next(G__7155__7158);
if(cljm_truthy(temp__3974__auto____7165)) {
id G__7155__7166 = temp__3974__auto____7165;
{
var G__7171 = cljm_DOT_core_SLASH_first(G__7155__7166);
var G__7172 = G__7155__7166;
obj__7157 = G__7171;
G__7155__7158 = G__7172;
continue;
}

} else {

}
break;
}

} else {

}
return sb__7148;
};
/**
* Prints a sequence of objects to a string, observing all the
* options given in opts
*/
cljm_DOT_core_SLASH_pr_str_with_opts = ^id(id objs, id opts) {
return [@[ cljm_DOT_core_SLASH_pr_sb(objs, opts) ] componentsSeperatedByString:@""];
};
/**
* Same as pr-str-with-opts followed by (newline)
*/
cljm_DOT_core_SLASH_prn_str_with_opts = ^id(id objs, id opts) {
id sb__7174 = cljm_DOT_core_SLASH_pr_sb(objs, opts);
[sb__7174 append@"\n"];
return [@[ sb__7174 ] componentsSeperatedByString:@""];
};
/**
* Prints a sequence of objects using string-print, observing all
* the options given in opts
*/
cljm_DOT_core_SLASH_pr_with_opts = ^id(id objs, id opts) {
id G__7193__7194 = cljm_DOT_core_SLASH_seq(cljm_DOT_core_SLASH_pr_seq(cljm_DOT_core_SLASH_first(objs), opts));
if(cljm_truthy(G__7193__7194)) {
id string__7195 = cljm_DOT_core_SLASH_first(G__7193__7194);
id G__7193__7196 = G__7193__7194;
while(YES) {
cljm_DOT_core_SLASH_string_print(string__7195);
id temp__3974__auto____7197 = cljm_DOT_core_SLASH_next(G__7193__7196);
if(cljm_truthy(temp__3974__auto____7197)) {
id G__7193__7198 = temp__3974__auto____7197;
{
var G__7211 = cljm_DOT_core_SLASH_first(G__7193__7198);
var G__7212 = G__7193__7198;
string__7195 = G__7211;
G__7193__7196 = G__7212;
continue;
}

} else {

}
break;
}

} else {

}
id G__7199__7200 = cljm_DOT_core_SLASH_seq(cljm_DOT_core_SLASH_next(objs));
if(cljm_truthy(G__7199__7200)) {
id obj__7201 = cljm_DOT_core_SLASH_first(G__7199__7200);
id G__7199__7202 = G__7199__7200;
while(YES) {
cljm_DOT_core_SLASH_string_print(@" ");
id G__7203__7204 = cljm_DOT_core_SLASH_seq(cljm_DOT_core_SLASH_pr_seq(obj__7201, opts));
if(cljm_truthy(G__7203__7204)) {
id string__7205 = cljm_DOT_core_SLASH_first(G__7203__7204);
id G__7203__7206 = G__7203__7204;
while(YES) {
cljm_DOT_core_SLASH_string_print(string__7205);
id temp__3974__auto____7207 = cljm_DOT_core_SLASH_next(G__7203__7206);
if(cljm_truthy(temp__3974__auto____7207)) {
id G__7203__7208 = temp__3974__auto____7207;
{
var G__7213 = cljm_DOT_core_SLASH_first(G__7203__7208);
var G__7214 = G__7203__7208;
string__7205 = G__7213;
G__7203__7206 = G__7214;
continue;
}

} else {

}
break;
}

} else {

}
id temp__3974__auto____7209 = cljm_DOT_core_SLASH_next(G__7199__7202);
if(cljm_truthy(temp__3974__auto____7209)) {
id G__7199__7210 = temp__3974__auto____7209;
{
var G__7215 = cljm_DOT_core_SLASH_first(G__7199__7210);
var G__7216 = G__7199__7210;
obj__7201 = G__7215;
G__7199__7202 = G__7216;
continue;
}

} else {
return nil;

}
break;
}

} else {
return nil;

}
};
cljm_DOT_core_SLASH_newline = ^id(id opts) {
cljm_DOT_core_SLASH_string_print(@"\n");
if(cljm_truthy(cljm_DOT_core_SLASH__lookup(opts, cljm_keyword(@":flush-on-newline"), nil))) {
return cljm_DOT_core_SLASH_flush();

} else {
return nil;

}
};
cljm_DOT_core_SLASH__STAR_flush_on_newline_STAR_ = @YES;
cljm_DOT_core_SLASH__STAR_print_readably_STAR_ = @YES;
cljm_DOT_core_SLASH__STAR_print_meta_STAR_ = @NO;
cljm_DOT_core_SLASH__STAR_print_dup_STAR_ = @NO;
cljm_DOT_core_SLASH_pr_opts = ^id() {
return @{ cljm_keyword(@":flush-on-newline"): cljm_DOT_core_SLASH__STAR_flush_on_newline_STAR_, cljm_keyword(@":readably"): cljm_DOT_core_SLASH__STAR_print_readably_STAR_, cljm_keyword(@":meta"): cljm_DOT_core_SLASH__STAR_print_meta_STAR_, cljm_keyword(@":dup"): cljm_DOT_core_SLASH__STAR_print_dup_STAR_ };
};
/**
* pr to a string, returning it. Fundamental entrypoint to IPrintable.
*/
cljm_DOT_core_SLASH_pr_str = ^id(id cljm__varargs, ...) {
NSMutableArray *objs = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[objs addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_pr_str_with_opts(objs, cljm_DOT_core_SLASH_pr_opts());
};
/**
* Same as pr-str followed by (newline)
*/
cljm_DOT_core_SLASH_prn_str = ^id(id cljm__varargs, ...) {
NSMutableArray *objs = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[objs addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_prn_str_with_opts(objs, cljm_DOT_core_SLASH_pr_opts());
};
/**
* Prints the object(s) using string-print.  Prints the
* object(s), separated by spaces if there is more than one.
* By default, pr and prn print in a way that objects can be
* read by the reader
*/
cljm_DOT_core_SLASH_pr = ^id(id cljm__varargs, ...) {
NSMutableArray *objs = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[objs addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_pr_with_opts(objs, cljm_DOT_core_SLASH_pr_opts());
};
/**
* Prints the object(s) using string-print.
* print and println produce output for human consumption.
*/
cljm_DOT_core_SLASH_print = ^id(id cljm__varargs, ...) {
NSMutableArray *objs = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[objs addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_pr_with_opts(objs, cljm_DOT_core_SLASH_assoc(cljm_DOT_core_SLASH_pr_opts(), cljm_keyword(@":readably"), @NO, nil));
};
/**
* print to a string, returning it
*/
cljm_DOT_core_SLASH_print_str = ^id(id cljm__varargs, ...) {
NSMutableArray *objs = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[objs addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_pr_str_with_opts(objs, cljm_DOT_core_SLASH_assoc(cljm_DOT_core_SLASH_pr_opts(), cljm_keyword(@":readably"), @NO, nil));
};
/**
* Same as print followed by (newline)
*/
cljm_DOT_core_SLASH_println = ^id(id cljm__varargs, ...) {
NSMutableArray *objs = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[objs addObject:cljm__currentObject];
}
va_end(cljm__args);
cljm_DOT_core_SLASH_pr_with_opts(objs, cljm_DOT_core_SLASH_assoc(cljm_DOT_core_SLASH_pr_opts(), cljm_keyword(@":readably"), @NO, nil));
return cljm_DOT_core_SLASH_newline(cljm_DOT_core_SLASH_pr_opts());
};
/**
* println to a string, returning it
*/
cljm_DOT_core_SLASH_println_str = ^id(id cljm__varargs, ...) {
NSMutableArray *objs = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[objs addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_prn_str_with_opts(objs, cljm_DOT_core_SLASH_assoc(cljm_DOT_core_SLASH_pr_opts(), cljm_keyword(@":readably"), @NO, nil));
};
/**
* Same as pr followed by (newline).
*/
cljm_DOT_core_SLASH_prn = ^id(id cljm__varargs, ...) {
NSMutableArray *objs = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[objs addObject:cljm__currentObject];
}
va_end(cljm__args);
cljm_DOT_core_SLASH_pr_with_opts(objs, cljm_DOT_core_SLASH_pr_opts());
return cljm_DOT_core_SLASH_newline(cljm_DOT_core_SLASH_pr_opts());
};
/**
* Prints formatted output, as per format
*/
cljm_DOT_core_SLASH_printf = ^id(id cljm__varargs, id fmt, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_print(cljm_DOT_core_SLASH_apply(cljm_DOT_core_SLASH_format, fmt, args, nil), nil);
};
cljm_DOT_core_SLASH_HashMap.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_HashMap.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
id pr_pair__7217 = ^id(id keyval) {
return cljm_DOT_core_SLASH_pr_sequential(cljm_DOT_core_SLASH_pr_seq, @"", @" ", @"", opts, keyval);
};
return cljm_DOT_core_SLASH_pr_sequential(pr_pair__7217, @"{", @", ", @"}", opts, coll);
};
(cljm_DOT_core_SLASH_IPrintable[@"number"] = @YES);
(cljm_DOT_core_SLASH__pr_seq[@"number"] = ^id(id n, id opts) {
return cljm_DOT_core_SLASH_list([@[ n ] componentsSeperatedByString:@""], nil);
});
cljm_DOT_core_SLASH_IndexedSeq.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_IndexedSeq.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return cljm_DOT_core_SLASH_pr_sequential(cljm_DOT_core_SLASH_pr_seq, @"(", @" ", @")", opts, coll);
};
cljm_DOT_core_SLASH_Subvec.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_Subvec.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return cljm_DOT_core_SLASH_pr_sequential(cljm_DOT_core_SLASH_pr_seq, @"[", @" ", @"]", opts, coll);
};
cljm_DOT_core_SLASH_ChunkedCons.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_ChunkedCons.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return cljm_DOT_core_SLASH_pr_sequential(cljm_DOT_core_SLASH_pr_seq, @"(", @" ", @")", opts, coll);
};
cljm_DOT_core_SLASH_PersistentTreeMap.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_PersistentTreeMap.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
id pr_pair__7218 = ^id(id keyval) {
return cljm_DOT_core_SLASH_pr_sequential(cljm_DOT_core_SLASH_pr_seq, @"", @" ", @"", opts, keyval);
};
return cljm_DOT_core_SLASH_pr_sequential(pr_pair__7218, @"{", @", ", @"}", opts, coll);
};
cljm_DOT_core_SLASH_PersistentArrayMap.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_PersistentArrayMap.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
id pr_pair__7219 = ^id(id keyval) {
return cljm_DOT_core_SLASH_pr_sequential(cljm_DOT_core_SLASH_pr_seq, @"", @" ", @"", opts, keyval);
};
return cljm_DOT_core_SLASH_pr_sequential(pr_pair__7219, @"{", @", ", @"}", opts, coll);
};
cljm_DOT_core_SLASH_PersistentQueue.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_PersistentQueue.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return cljm_DOT_core_SLASH_pr_sequential(cljm_DOT_core_SLASH_pr_seq, @"#queue [", @" ", @"]", opts, cljm_DOT_core_SLASH_seq(coll));
};
cljm_DOT_core_SLASH_LazySeq.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_LazySeq.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return cljm_DOT_core_SLASH_pr_sequential(cljm_DOT_core_SLASH_pr_seq, @"(", @" ", @")", opts, coll);
};
cljm_DOT_core_SLASH_RSeq.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_RSeq.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return cljm_DOT_core_SLASH_pr_sequential(cljm_DOT_core_SLASH_pr_seq, @"(", @" ", @")", opts, coll);
};
cljm_DOT_core_SLASH_PersistentTreeSet.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_PersistentTreeSet.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return cljm_DOT_core_SLASH_pr_sequential(cljm_DOT_core_SLASH_pr_seq, @"#{", @" ", @"}", opts, coll);
};
(cljm_DOT_core_SLASH_IPrintable[@"boolean"] = @YES);
(cljm_DOT_core_SLASH__pr_seq[@"boolean"] = ^id(id bool, id opts) {
return cljm_DOT_core_SLASH_list([@[ bool ] componentsSeperatedByString:@""], nil);
});
(cljm_DOT_core_SLASH_IPrintable[@"string"] = @YES);
(cljm_DOT_core_SLASH__pr_seq[@"string"] = ^id(id obj, id opts) {
if(cljm_truthy(cljm_DOT_core_SLASH_keyword_QMARK_(obj))) {
return cljm_DOT_core_SLASH_list([@[ @":", {id temp__3974__auto____7220 = cljm_DOT_core_SLASH_namespace(obj);
if(cljm_truthy(temp__3974__auto____7220)) {
id nspc__7221 = temp__3974__auto____7220;
return [@[ nspc__7221, @"/" ] componentsSeperatedByString:@""];

} else {
return nil;

}
}, cljm_DOT_core_SLASH_name(obj) ] componentsSeperatedByString:@""], nil);

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_symbol_QMARK_(obj))) {
return cljm_DOT_core_SLASH_list([@[ {id temp__3974__auto____7222 = cljm_DOT_core_SLASH_namespace(obj);
if(cljm_truthy(temp__3974__auto____7222)) {
id nspc__7223 = temp__3974__auto____7222;
return [@[ nspc__7223, @"/" ] componentsSeperatedByString:@""];

} else {
return nil;

}
}, cljm_DOT_core_SLASH_name(obj) ] componentsSeperatedByString:@""], nil);

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return cljm_DOT_core_SLASH_list((cljm_truthy((opts))) ?goog_SLASH_string_DOT_quote(obj):obj, nil);

} else {
return nil;

}

}

}
});
cljm_DOT_core_SLASH_NodeSeq.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_NodeSeq.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return cljm_DOT_core_SLASH_pr_sequential(cljm_DOT_core_SLASH_pr_seq, @"(", @" ", @")", opts, coll);
};
cljm_DOT_core_SLASH_RedNode.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_RedNode.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return cljm_DOT_core_SLASH_pr_sequential(cljm_DOT_core_SLASH_pr_seq, @"[", @" ", @"]", opts, coll);
};
cljm_DOT_core_SLASH_ChunkedSeq.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_ChunkedSeq.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return cljm_DOT_core_SLASH_pr_sequential(cljm_DOT_core_SLASH_pr_seq, @"(", @" ", @")", opts, coll);
};
cljm_DOT_core_SLASH_PersistentHashMap.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_PersistentHashMap.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
id pr_pair__7224 = ^id(id keyval) {
return cljm_DOT_core_SLASH_pr_sequential(cljm_DOT_core_SLASH_pr_seq, @"", @" ", @"", opts, keyval);
};
return cljm_DOT_core_SLASH_pr_sequential(pr_pair__7224, @"{", @", ", @"}", opts, coll);
};
cljm_DOT_core_SLASH_Vector.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_Vector.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return cljm_DOT_core_SLASH_pr_sequential(cljm_DOT_core_SLASH_pr_seq, @"[", @" ", @"]", opts, coll);
};
cljm_DOT_core_SLASH_PersistentHashSet.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_PersistentHashSet.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return cljm_DOT_core_SLASH_pr_sequential(cljm_DOT_core_SLASH_pr_seq, @"#{", @" ", @"}", opts, coll);
};
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return cljm_DOT_core_SLASH_pr_sequential(cljm_DOT_core_SLASH_pr_seq, @"[", @" ", @"]", opts, coll);
};
cljm_DOT_core_SLASH_List.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_List.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return cljm_DOT_core_SLASH_pr_sequential(cljm_DOT_core_SLASH_pr_seq, @"(", @" ", @")", opts, coll);
};
(cljm_DOT_core_SLASH_IPrintable[@"array"] = @YES);
(cljm_DOT_core_SLASH__pr_seq[@"array"] = ^id(id a, id opts) {
return cljm_DOT_core_SLASH_pr_sequential(cljm_DOT_core_SLASH_pr_seq, @"#<Array [", @", ", @"]>", opts, a);
});
(cljm_DOT_core_SLASH_IPrintable[@"function"] = @YES);
(cljm_DOT_core_SLASH__pr_seq[@"function"] = ^id(id this$) {
return cljm_DOT_core_SLASH_list(@"#<", [@[ this$ ] componentsSeperatedByString:@""], @">", nil);
});
cljm_DOT_core_SLASH_EmptyList.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_EmptyList.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return cljm_DOT_core_SLASH_list(@"()", nil);
};
cljm_DOT_core_SLASH_BlackNode.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_BlackNode.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return cljm_DOT_core_SLASH_pr_sequential(cljm_DOT_core_SLASH_pr_seq, @"[", @" ", @"]", opts, coll);
};
Date.prototype.cljm$core$IPrintable$ = @YES;
Date.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id d, id _) {
id normalize__7226 = ^id(id n, id len) {
id ns__7225 = [@[ n ] componentsSeperatedByString:@""];
while(YES) {
if(cljm_truthy((cljm_DOT_core_SLASH_count(ns__7225) < len))) {
{
var G__7228 = [@[ @"0", ns__7225 ] componentsSeperatedByString:@""];
ns__7225 = G__7228;
continue;
}

} else {
return ns__7225;

}
break;
}
};
return cljm_DOT_core_SLASH_list([@[ @"#inst \"", [d getUTCFullYear], @"-", normalize__7226(([d getUTCMonth] + @1), @2), @"-", normalize__7226([d getUTCDate], @2), @"T", normalize__7226([d getUTCHours], @2), @":", normalize__7226([d getUTCMinutes], @2), @":", normalize__7226([d getUTCSeconds], @2), @".", normalize__7226([d getUTCMilliseconds], @3), @"-", @"00:00\"" ] componentsSeperatedByString:@""], nil);
};
cljm_DOT_core_SLASH_Cons.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_Cons.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return cljm_DOT_core_SLASH_pr_sequential(cljm_DOT_core_SLASH_pr_seq, @"(", @" ", @")", opts, coll);
};
cljm_DOT_core_SLASH_Range.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_Range.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return cljm_DOT_core_SLASH_pr_sequential(cljm_DOT_core_SLASH_pr_seq, @"(", @" ", @")", opts, coll);
};
cljm_DOT_core_SLASH_ArrayNodeSeq.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_ArrayNodeSeq.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return cljm_DOT_core_SLASH_pr_sequential(cljm_DOT_core_SLASH_pr_seq, @"(", @" ", @")", opts, coll);
};
cljm_DOT_core_SLASH_ObjMap.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_ObjMap.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
id pr_pair__7227 = ^id(id keyval) {
return cljm_DOT_core_SLASH_pr_sequential(cljm_DOT_core_SLASH_pr_seq, @"", @" ", @"", opts, keyval);
};
return cljm_DOT_core_SLASH_pr_sequential(pr_pair__7227, @"{", @", ", @"}", opts, coll);
};
cljm_DOT_core_SLASH_PersistentTreeMapSeq.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_PersistentTreeMapSeq.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return cljm_DOT_core_SLASH_pr_sequential(cljm_DOT_core_SLASH_pr_seq, @"(", @" ", @")", opts, coll);
};
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$IComparable$ = @YES;
cljm_DOT_core_SLASH_PersistentVector.prototype.cljm$core$IComparable$_compare$arity$2 = ^id(id x, id y) {
return cljm_DOT_core_SLASH_compare_indexed(x, y);
};

/**
* @constructor
*/
cljm_DOT_core_SLASH_Atom = (function (state, meta, validator, watches){
this.state = state;
this.meta = meta;
this.validator = validator;
this.watches = watches;
this.cljm$lang$protocol_mask$partition1$ = 0;
this.cljm$lang$protocol_mask$partition0$ = 2690809856;
})
cljm_DOT_core_SLASH_Atom.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_Atom.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/Atom", nil);
};
cljm_DOT_core_SLASH_Atom.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id this$) {
var this__7229 = this;
return goog_SLASH_getUid(this$);
};
cljm_DOT_core_SLASH_Atom.prototype.cljm$core$IWatchable$_notify_watches$arity$3 = ^id(id this$, id oldval, id newval) {
var this__7230 = this;
id G__7231__7232 = cljm_DOT_core_SLASH_seq(this__7230_DOT_watches);
if(cljm_truthy(G__7231__7232)) {
id G__7234__7236 = cljm_DOT_core_SLASH_first(G__7231__7232);
id vec__7235__7237 = G__7234__7236;
id key__7238 = cljm_DOT_core_SLASH_nth(vec__7235__7237, @0, nil);
id f__7239 = cljm_DOT_core_SLASH_nth(vec__7235__7237, @1, nil);
id G__7231__7240 = G__7231__7232;
id G__7234__7241 = G__7234__7236;
id G__7231__7242 = G__7231__7240;
while(YES) {
id vec__7243__7244 = G__7234__7241;
id key__7245 = cljm_DOT_core_SLASH_nth(vec__7243__7244, @0, nil);
id f__7246 = cljm_DOT_core_SLASH_nth(vec__7243__7244, @1, nil);
id G__7231__7247 = G__7231__7242;
f__7246(key__7245, this$, oldval, newval);
id temp__3974__auto____7248 = cljm_DOT_core_SLASH_next(G__7231__7247);
if(cljm_truthy(temp__3974__auto____7248)) {
id G__7231__7249 = temp__3974__auto____7248;
{
var G__7256 = cljm_DOT_core_SLASH_first(G__7231__7249);
var G__7257 = G__7231__7249;
G__7234__7241 = G__7256;
G__7231__7242 = G__7257;
continue;
}

} else {
return nil;

}
break;
}

} else {
return nil;

}
};
cljm_DOT_core_SLASH_Atom.prototype.cljm$core$IWatchable$_add_watch$arity$3 = ^id(id this$, id key, id f) {
var this__7250 = this;
return this$.watches = cljm_DOT_core_SLASH_assoc(this__7250_DOT_watches, key, f, nil);
};
cljm_DOT_core_SLASH_Atom.prototype.cljm$core$IWatchable$_remove_watch$arity$2 = ^id(id this$, id key) {
var this__7251 = this;
return this$.watches = cljm_DOT_core_SLASH_dissoc(this__7251_DOT_watches, key, nil);
};
cljm_DOT_core_SLASH_Atom.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id a, id opts) {
var this__7252 = this;
return cljm_DOT_core_SLASH_concat(@[ @"#<Atom: " ], cljm_DOT_core_SLASH__pr_seq(this__7252_DOT_state, opts), @">", nil);
};
cljm_DOT_core_SLASH_Atom.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id _) {
var this__7253 = this;
return this__7253_DOT_meta;
};
cljm_DOT_core_SLASH_Atom.prototype.cljm$core$IDeref$_deref$arity$1 = ^id(id _) {
var this__7254 = this;
return this__7254_DOT_state;
};
cljm_DOT_core_SLASH_Atom.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id o, id other) {
var this__7255 = this;
return ([o isEqual:other]);
};
cljm_DOT_core_SLASH_Atom;
/**
* Creates and returns an Atom with an initial value of x and zero or
* more options (in any order):
* 
* :meta metadata-map
* 
* :validator validate-fn
* 
* If metadata-map is supplied, it will be come the metadata on the
* atom. validate-fn must be nil or a side-effect-free fn of one
* argument, which will be passed the intended new state on any state
* change. If the new state is unacceptable, the validate-fn should
* return false or throw an Error.  If either of these error conditions
* occur, then the value of the atom will not change.
*/
cljm_DOT_core_SLASH_atom = (function() {
var atom = null;
var atom__1 = ^id(id x) {
return [cljm_DOT_core_SLASH_Atom alloc];
};
var atom__2 = ^id(id cljm__varargs, id x, ...) {
NSMutableArray *p__7258 = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[p__7258 addObject:cljm__currentObject];
}
va_end(cljm__args);
id map__7264__7265 = p__7258;
id map__7264__7266 = (cljm_truthy(cljm_DOT_core_SLASH_seq_QMARK_(map__7264__7265))) ?cljm_DOT_core_SLASH_apply(cljm_DOT_core_SLASH_hash_map, map__7264__7265, nil):map__7264__7265;
id validator__7267 = cljm_DOT_core_SLASH__lookup(map__7264__7266, cljm_keyword(@":validator"), nil);
id meta__7268 = cljm_DOT_core_SLASH__lookup(map__7264__7266, cljm_keyword(@":meta"), nil);
return [cljm_DOT_core_SLASH_Atom alloc];
};
atom = function(x, var_args){
var p__7258 = var_args;
switch(arguments.length){
case 1:
return atom__1.call(this,x);
default:
return atom__2.cljm$lang$arity$variadic(x, cljm.core.array_seq(arguments, 1));
}
throw('Invalid arity: ' + arguments.length);
};
atom.cljm$lang$maxFixedArity = 1;
atom.cljm$lang$applyTo = atom__2.cljm$lang$applyTo;
atom.cljm$lang$arity$1 = atom__1;
atom.cljm$lang$arity$variadic = atom__2.cljm$lang$arity$variadic;
return atom;
})()
;
/**
* Sets the value of atom to newval without regard for the
* current value. Returns newval.
*/
cljm_DOT_core_SLASH_reset_BANG_ = ^id(id a, id new_value) {
id temp__3974__auto____7272 = a.validator;
if(cljm_truthy(temp__3974__auto____7272)) {
id validate__7273 = temp__3974__auto____7272;
if(cljm_truthy(validate__7273(new_value))) {

} else {
throw [Error alloc];

}

} else {

}
id old_value__7274 = a.state;
a.state = new_value;
cljm_DOT_core_SLASH__notify_watches(a, old_value__7274, new_value);
return new_value;
};
/**
* Atomically swaps the value of atom to be:
* (apply f current-value-of-atom args). Note that f may be called
* multiple times, and thus should be free of side effects.  Returns
* the value that was swapped in.
*/
cljm_DOT_core_SLASH_swap_BANG_ = (function() {
var swap_BANG_ = null;
var swap_BANG___2 = ^id(id a, id f) {
return cljm_DOT_core_SLASH_reset_BANG_(a, f(a.state));
};
var swap_BANG___3 = ^id(id a, id f, id x) {
return cljm_DOT_core_SLASH_reset_BANG_(a, f(a.state, x));
};
var swap_BANG___4 = ^id(id a, id f, id x, id y) {
return cljm_DOT_core_SLASH_reset_BANG_(a, f(a.state, x, y));
};
var swap_BANG___5 = ^id(id a, id f, id x, id y, id z) {
return cljm_DOT_core_SLASH_reset_BANG_(a, f(a.state, x, y, z));
};
var swap_BANG___6 = ^id(id cljm__varargs, id a, id f, id x, id y, id z, ...) {
NSMutableArray *more = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[more addObject:cljm__currentObject];
}
va_end(cljm__args);
return cljm_DOT_core_SLASH_reset_BANG_(a, cljm_DOT_core_SLASH_apply(f, a.state, x, y, z, more, nil));
};
swap_BANG_ = function(a, f, x, y, z, var_args){
var more = var_args;
switch(arguments.length){
case 2:
return swap_BANG___2.call(this,a, f);
case 3:
return swap_BANG___3.call(this,a, f, x);
case 4:
return swap_BANG___4.call(this,a, f, x, y);
case 5:
return swap_BANG___5.call(this,a, f, x, y, z);
default:
return swap_BANG___6.cljm$lang$arity$variadic(a, f, x, y, z, cljm.core.array_seq(arguments, 5));
}
throw('Invalid arity: ' + arguments.length);
};
swap_BANG_.cljm$lang$maxFixedArity = 5;
swap_BANG_.cljm$lang$applyTo = swap_BANG___6.cljm$lang$applyTo;
swap_BANG_.cljm$lang$arity$2 = swap_BANG___2;
swap_BANG_.cljm$lang$arity$3 = swap_BANG___3;
swap_BANG_.cljm$lang$arity$4 = swap_BANG___4;
swap_BANG_.cljm$lang$arity$5 = swap_BANG___5;
swap_BANG_.cljm$lang$arity$variadic = swap_BANG___6.cljm$lang$arity$variadic;
return swap_BANG_;
})()
;
/**
* Atomically sets the value of atom to newval if and only if the
* current value of the atom is identical to oldval. Returns true if
* set happened, else false.
*/
cljm_DOT_core_SLASH_compare_and_set_BANG_ = ^id(id a, id oldval, id newval) {
if(cljm_truthy(cljm_DOT_core_SLASH__EQ_(a.state, oldval, nil))) {
cljm_DOT_core_SLASH_reset_BANG_(a, newval);
return @YES;

} else {
return @NO;

}
};
cljm_DOT_core_SLASH_deref = ^id(id o) {
return cljm_DOT_core_SLASH__deref(o);
};
/**
* Sets the validator-fn for an atom. validator-fn must be nil or a
* side-effect-free fn of one argument, which will be passed the intended
* new state on any state change. If the new state is unacceptable, the
* validator-fn should return false or throw an Error. If the current state
* is not acceptable to the new validator, an Error will be thrown and the
* validator will not be changed.
*/
cljm_DOT_core_SLASH_set_validator_BANG_ = ^id(id iref, id val) {
return iref.validator = val;
};
/**
* Gets the validator-fn for a var/ref/agent/atom.
*/
cljm_DOT_core_SLASH_get_validator = ^id(id iref) {
return iref.validator;
};
/**
* Atomically sets the metadata for a namespace/var/ref/agent/atom to be:
* 
* (apply f its-current-meta args)
* 
* f must be free of side-effects
*/
cljm_DOT_core_SLASH_alter_meta_BANG_ = ^id(id cljm__varargs, id iref, id f, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return iref.meta = cljm_DOT_core_SLASH_apply(f, iref.meta, args, nil);
};
/**
* Atomically resets the metadata for an atom
*/
cljm_DOT_core_SLASH_reset_meta_BANG_ = ^id(id iref, id m) {
return iref.meta = m;
};
/**
* Alpha - subject to change.
* 
* Adds a watch function to an atom reference. The watch fn must be a
* fn of 4 args: a key, the reference, its old-state, its
* new-state. Whenever the reference's state might have been changed,
* any registered watches will have their functions called. The watch
* fn will be called synchronously. Note that an atom's state
* may have changed again prior to the fn call, so use old/new-state
* rather than derefing the reference. Keys must be unique per
* reference, and can be used to remove the watch with remove-watch,
* but are otherwise considered opaque by the watch mechanism.  Bear in
* mind that regardless of the result or action of the watch fns the
* atom's value will change.  Example:
* 
* (def a (atom 0))
* (add-watch a :inc (fn [k r o n] (assert (== 0 n))))
* (swap! a inc)
* ;; Assertion Error
* (deref a)
* ;=> 1
*/
cljm_DOT_core_SLASH_add_watch = ^id(id iref, id key, id f) {
return cljm_DOT_core_SLASH__add_watch(iref, key, f);
};
/**
* Alpha - subject to change.
* 
* Removes a watch (set by add-watch) from a reference
*/
cljm_DOT_core_SLASH_remove_watch = ^id(id iref, id key) {
return cljm_DOT_core_SLASH__remove_watch(iref, key);
};
cljm_DOT_core_SLASH_gensym_counter = nil;
/**
* Returns a new symbol with a unique name. If a prefix string is
* supplied, the name is prefix# where # is some unique number. If
* prefix is not supplied, the prefix is 'G__'.
*/
cljm_DOT_core_SLASH_gensym = (function() {
var gensym = null;
var gensym__0 = ^id() {
return gensym(@"G__");
};
var gensym__1 = ^id(id prefix_string) {
if(cljm_truthy((cljm_DOT_core_SLASH_gensym_counter == nil))) {
cljm_DOT_core_SLASH_gensym_counter = cljm_DOT_core_SLASH_atom(@0, nil);

} else {

}
return cljm_DOT_core_SLASH_symbol([@[ prefix_string, cljm_DOT_core_SLASH_swap_BANG_(cljm_DOT_core_SLASH_gensym_counter, cljm_DOT_core_SLASH_inc, nil) ] componentsSeperatedByString:@""]);
};
gensym = function(prefix_string){
switch(arguments.length){
case 0:
return gensym__0.call(this);
case 1:
return gensym__1.call(this,prefix_string);
}
throw('Invalid arity: ' + arguments.length);
};
gensym.cljm$lang$arity$0 = gensym__0;
gensym.cljm$lang$arity$1 = gensym__1;
return gensym;
})()
;
cljm_DOT_core_SLASH_fixture1 = @1;
cljm_DOT_core_SLASH_fixture2 = @2;

/**
* @constructor
*/
cljm_DOT_core_SLASH_Delay = (function (state, f){
this.state = state;
this.f = f;
this.cljm$lang$protocol_mask$partition1$ = 0;
this.cljm$lang$protocol_mask$partition0$ = 1073774592;
})
cljm_DOT_core_SLASH_Delay.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_Delay.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/Delay", nil);
};
cljm_DOT_core_SLASH_Delay.prototype.cljm$core$IPending$_realized_QMARK_$arity$1 = ^id(id d) {
var this__7275 = this;
return (cljm_DOT_core_SLASH_deref(this__7275_DOT_state));
};
cljm_DOT_core_SLASH_Delay.prototype.cljm$core$IDeref$_deref$arity$1 = ^id(id _) {
var this__7276 = this;
return (cljm_DOT_core_SLASH_swap_BANG_(this__7276_DOT_state, ^id(id p__7277) {
id map__7278__7279 = p__7277;
id map__7278__7280 = (cljm_truthy(cljm_DOT_core_SLASH_seq_QMARK_(map__7278__7279))) ?cljm_DOT_core_SLASH_apply(cljm_DOT_core_SLASH_hash_map, map__7278__7279, nil):map__7278__7279;
id curr_state__7281 = map__7278__7280;
id done__7282 = cljm_DOT_core_SLASH__lookup(map__7278__7280, cljm_keyword(@":done"), nil);
if(cljm_truthy(done__7282)) {
return curr_state__7281;

} else {
return @{ cljm_keyword(@":done"): @YES, cljm_keyword(@":value"): this__7276_DOT_f() };

}
}, nil));
};
cljm_DOT_core_SLASH_Delay;
/**
* returns true if x is a Delay created with delay
*/
cljm_DOT_core_SLASH_delay_QMARK_ = ^id(id x) {
return cljm_DOT_core_SLASH_instance_QMARK_(cljs_SLASH_core_DOT_Delay, x);
};
/**
* If x is a Delay, returns the (possibly cached) value of its expression, else returns x
*/
cljm_DOT_core_SLASH_force = ^id(id x) {
if(cljm_truthy(cljm_DOT_core_SLASH_delay_QMARK_(x))) {
return cljm_DOT_core_SLASH_deref(x);

} else {
return x;

}
};
/**
* Returns true if a value has been produced for a promise, delay, future or lazy sequence.
*/
cljm_DOT_core_SLASH_realized_QMARK_ = ^id(id d) {
return cljm_DOT_core_SLASH__realized_QMARK_(d);
};
/**
* Recursively transforms JavaScript arrays into ClojureScript
* vectors, and JavaScript objects into ClojureScript maps.  With
* option ':keywordize-keys true' will convert object fields from
* strings to keywords.
*/
cljm_DOT_core_SLASH_js__GT_clj = ^id(id cljm__varargs, id x, ...) {
NSMutableArray *options = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[options addObject:cljm__currentObject];
}
va_end(cljm__args);
id map__7303__7304 = options;
id map__7303__7305 = (cljm_truthy(cljm_DOT_core_SLASH_seq_QMARK_(map__7303__7304))) ?cljm_DOT_core_SLASH_apply(cljm_DOT_core_SLASH_hash_map, map__7303__7304, nil):map__7303__7304;
id keywordize_keys__7306 = cljm_DOT_core_SLASH__lookup(map__7303__7305, cljm_keyword(@":keywordize-keys"), nil);
id keyfn__7307 = (cljm_truthy(keywordize_keys__7306)) ?cljm_DOT_core_SLASH_keyword:cljm_DOT_core_SLASH_str;
id f__7322 = ^id(id x) {
if(cljm_truthy(cljm_DOT_core_SLASH_seq_QMARK_(x))) {
return cljm_DOT_core_SLASH_doall(cljm_DOT_core_SLASH_map(thisfn, x, nil));

} else {
if(cljm_truthy(cljm_DOT_core_SLASH_coll_QMARK_(x))) {
return cljm_DOT_core_SLASH_into(cljm_DOT_core_SLASH_empty(x), cljm_DOT_core_SLASH_map(thisfn, x, nil));

} else {
if(cljm_truthy(goog_SLASH_isArray(x))) {
return cljm_DOT_core_SLASH_vec(cljm_DOT_core_SLASH_map(thisfn, x, nil));

} else {
if(cljm_truthy(([cljm_DOT_core_SLASH_type(x) isEqual:Object]))) {
return cljm_DOT_core_SLASH_into(@{}, {id iter__1584__auto____7321 = ^id(id s__7316) {
return [cljm_DOT_core_SLASH_LazySeq alloc];
};
return iter__1584__auto____7321(cljm_DOT_core_SLASH_js_keys(x));
});

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return x;

} else {
return nil;

}

}

}

}

}
};
return f__7322(x);
};
/**
* Returns a memoized version of a referentially transparent function. The
* memoized version of the function keeps a cache of the mapping from arguments
* to results and, when calls with the same arguments are repeated often, has
* higher performance at the expense of higher memory use.
*/
cljm_DOT_core_SLASH_memoize = ^id(id f) {
id mem__7327 = cljm_DOT_core_SLASH_atom(@{}, nil);
return ^id(id cljm__varargs, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
id temp__3971__auto____7328 = cljm_DOT_core_SLASH__lookup(cljm_DOT_core_SLASH_deref(mem__7327), args, nil);
if(cljm_truthy(temp__3971__auto____7328)) {
id v__7329 = temp__3971__auto____7328;
return v__7329;

} else {
id ret__7330 = cljm_DOT_core_SLASH_apply(f, args, nil);
cljm_DOT_core_SLASH_swap_BANG_(mem__7327, cljm_DOT_core_SLASH_assoc, args, ret__7330, nil);
return ret__7330;

}
};
};
/**
* trampoline can be used to convert algorithms requiring mutual
* recursion without stack consumption. Calls f with supplied args, if
* any. If f returns a fn, calls that fn with no arguments, and
* continues to repeat, until the return value is not a fn, then
* returns that non-fn value. Note that if you want to return a fn as a
* final value, you must wrap it in some data structure and unpack it
* after trampoline returns.
*/
cljm_DOT_core_SLASH_trampoline = (function() {
var trampoline = null;
var trampoline__1 = ^id(id f) {
while(YES) {
id ret__7332 = f();
if(cljm_truthy(cljm_DOT_core_SLASH_fn_QMARK_(ret__7332))) {
{
var G__7333 = ret__7332;
f = G__7333;
continue;
}

} else {
return ret__7332;

}
break;
}
};
var trampoline__2 = ^id(id cljm__varargs, id f, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return trampoline(^id() {
return cljm_DOT_core_SLASH_apply(f, args, nil);
}, nil);
};
trampoline = function(f, var_args){
var args = var_args;
switch(arguments.length){
case 1:
return trampoline__1.call(this,f);
default:
return trampoline__2.cljm$lang$arity$variadic(f, cljm.core.array_seq(arguments, 1));
}
throw('Invalid arity: ' + arguments.length);
};
trampoline.cljm$lang$maxFixedArity = 1;
trampoline.cljm$lang$applyTo = trampoline__2.cljm$lang$applyTo;
trampoline.cljm$lang$arity$1 = trampoline__1;
trampoline.cljm$lang$arity$variadic = trampoline__2.cljm$lang$arity$variadic;
return trampoline;
})()
;
/**
* Returns a random floating point number between 0 (inclusive) and
* n (default 1) (exclusive).
*/
cljm_DOT_core_SLASH_rand = (function() {
var rand = null;
var rand__0 = ^id() {
return rand(@1);
};
var rand__1 = ^id(id n) {
return (Math_SLASH_random() * n);
};
rand = function(n){
switch(arguments.length){
case 0:
return rand__0.call(this);
case 1:
return rand__1.call(this,n);
}
throw('Invalid arity: ' + arguments.length);
};
rand.cljm$lang$arity$0 = rand__0;
rand.cljm$lang$arity$1 = rand__1;
return rand;
})()
;
/**
* Returns a random integer between 0 (inclusive) and n (exclusive).
*/
cljm_DOT_core_SLASH_rand_int = ^id(id n) {
return Math_SLASH_floor((Math_SLASH_random() * n));
};
/**
* Return a random element of the (sequential) collection. Will have
* the same performance characteristics as nth for the given
* collection.
*/
cljm_DOT_core_SLASH_rand_nth = ^id(id coll) {
return cljm_DOT_core_SLASH_nth(coll, cljm_DOT_core_SLASH_rand_int(cljm_DOT_core_SLASH_count(coll)));
};
/**
* Returns a map of the elements of coll keyed by the result of
* f on each element. The value at each key will be a vector of the
* corresponding elements, in the order they appeared in coll.
*/
cljm_DOT_core_SLASH_group_by = ^id(id f, id coll) {
return cljm_DOT_core_SLASH_reduce(^id(id ret, id x) {
id k__7335 = f(x);
return cljm_DOT_core_SLASH_assoc(ret, k__7335, cljm_DOT_core_SLASH_conj(cljm_DOT_core_SLASH__lookup(ret, k__7335, @[]), x, nil), nil);
}, @{}, coll);
};
/**
* Creates a hierarchy object for use with derive, isa? etc.
*/
cljm_DOT_core_SLASH_make_hierarchy = ^id() {
return @{ cljm_keyword(@":parents"): @{}, cljm_keyword(@":descendants"): @{}, cljm_keyword(@":ancestors"): @{} };
};
cljm_DOT_core_SLASH_global_hierarchy = cljm_DOT_core_SLASH_atom(cljm_DOT_core_SLASH_make_hierarchy(), nil);
/**
* Returns true if (= child parent), or child is directly or indirectly derived from
* parent, either via a JavaScript type inheritance relationship or a
* relationship established via derive. h must be a hierarchy obtained
* from make-hierarchy, if not supplied defaults to the global
* hierarchy
*/
cljm_DOT_core_SLASH_isa_QMARK_ = (function() {
var isa_QMARK_ = null;
var isa_QMARK___2 = ^id(id child, id parent) {
return isa_QMARK_(cljm_DOT_core_SLASH_deref(cljm_DOT_core_SLASH_global_hierarchy), child, parent);
};
var isa_QMARK___3 = ^id(id h, id child, id parent) {
id or__3824__auto____7344 = cljm_DOT_core_SLASH__EQ_(child, parent, nil);
if(cljm_truthy(or__3824__auto____7344)) {
return or__3824__auto____7344;

} else {
id or__3824__auto____7345 = cljm_DOT_core_SLASH_contains_QMARK_((child), parent);
if(cljm_truthy(or__3824__auto____7345)) {
return or__3824__auto____7345;

} else {
id and__3822__auto____7346 = cljm_DOT_core_SLASH_vector_QMARK_(parent);
if(cljm_truthy(and__3822__auto____7346)) {
id and__3822__auto____7347 = cljm_DOT_core_SLASH_vector_QMARK_(child);
if(cljm_truthy(and__3822__auto____7347)) {
id and__3822__auto____7348 = ([cljm_DOT_core_SLASH_count(parent) isEqual:cljm_DOT_core_SLASH_count(child)]);
if(cljm_truthy(and__3822__auto____7348)) {
id ret__7349 = @YES;
id i__7350 = @0;
while(YES) {
if(cljm_truthy({id or__3824__auto____7351 = cljm_DOT_core_SLASH_not(ret__7349);
if(cljm_truthy(or__3824__auto____7351)) {
return or__3824__auto____7351;

} else {
return ([i__7350 isEqual:cljm_DOT_core_SLASH_count(parent)]);

}
})) {
return ret__7349;

} else {
{
var G__7352 = isa_QMARK_(h, child(i__7350), parent(i__7350));
var G__7353 = (i__7350 + @1);
ret__7349 = G__7352;
i__7350 = G__7353;
continue;
}

}
break;
}

} else {
return and__3822__auto____7348;

}

} else {
return and__3822__auto____7347;

}

} else {
return and__3822__auto____7346;

}

}

}
};
isa_QMARK_ = function(h, child, parent){
switch(arguments.length){
case 2:
return isa_QMARK___2.call(this,h, child);
case 3:
return isa_QMARK___3.call(this,h, child, parent);
}
throw('Invalid arity: ' + arguments.length);
};
isa_QMARK_.cljm$lang$arity$2 = isa_QMARK___2;
isa_QMARK_.cljm$lang$arity$3 = isa_QMARK___3;
return isa_QMARK_;
})()
;
/**
* Returns the immediate parents of tag, either via a JavaScript type
* inheritance relationship or a relationship established via derive. h
* must be a hierarchy obtained from make-hierarchy, if not supplied
* defaults to the global hierarchy
*/
cljm_DOT_core_SLASH_parents = (function() {
var parents = null;
var parents__1 = ^id(id tag) {
return parents(cljm_DOT_core_SLASH_deref(cljm_DOT_core_SLASH_global_hierarchy), tag);
};
var parents__2 = ^id(id h, id tag) {
return cljm_DOT_core_SLASH_not_empty(cljm_DOT_core_SLASH__lookup((h), tag, nil));
};
parents = function(h, tag){
switch(arguments.length){
case 1:
return parents__1.call(this,h);
case 2:
return parents__2.call(this,h, tag);
}
throw('Invalid arity: ' + arguments.length);
};
parents.cljm$lang$arity$1 = parents__1;
parents.cljm$lang$arity$2 = parents__2;
return parents;
})()
;
/**
* Returns the immediate and indirect parents of tag, either via a JavaScript type
* inheritance relationship or a relationship established via derive. h
* must be a hierarchy obtained from make-hierarchy, if not supplied
* defaults to the global hierarchy
*/
cljm_DOT_core_SLASH_ancestors = (function() {
var ancestors = null;
var ancestors__1 = ^id(id tag) {
return ancestors(cljm_DOT_core_SLASH_deref(cljm_DOT_core_SLASH_global_hierarchy), tag);
};
var ancestors__2 = ^id(id h, id tag) {
return cljm_DOT_core_SLASH_not_empty(cljm_DOT_core_SLASH__lookup((h), tag, nil));
};
ancestors = function(h, tag){
switch(arguments.length){
case 1:
return ancestors__1.call(this,h);
case 2:
return ancestors__2.call(this,h, tag);
}
throw('Invalid arity: ' + arguments.length);
};
ancestors.cljm$lang$arity$1 = ancestors__1;
ancestors.cljm$lang$arity$2 = ancestors__2;
return ancestors;
})()
;
/**
* Returns the immediate and indirect children of tag, through a
* relationship established via derive. h must be a hierarchy obtained
* from make-hierarchy, if not supplied defaults to the global
* hierarchy. Note: does not work on JavaScript type inheritance
* relationships.
*/
cljm_DOT_core_SLASH_descendants = (function() {
var descendants = null;
var descendants__1 = ^id(id tag) {
return descendants(cljm_DOT_core_SLASH_deref(cljm_DOT_core_SLASH_global_hierarchy), tag);
};
var descendants__2 = ^id(id h, id tag) {
return cljm_DOT_core_SLASH_not_empty(cljm_DOT_core_SLASH__lookup((h), tag, nil));
};
descendants = function(h, tag){
switch(arguments.length){
case 1:
return descendants__1.call(this,h);
case 2:
return descendants__2.call(this,h, tag);
}
throw('Invalid arity: ' + arguments.length);
};
descendants.cljm$lang$arity$1 = descendants__1;
descendants.cljm$lang$arity$2 = descendants__2;
return descendants;
})()
;
/**
* Establishes a parent/child relationship between parent and
* tag. Parent must be a namespace-qualified symbol or keyword and
* child can be either a namespace-qualified symbol or keyword or a
* class. h must be a hierarchy obtained from make-hierarchy, if not
* supplied defaults to, and modifies, the global hierarchy.
*/
cljm_DOT_core_SLASH_derive = (function() {
var derive = null;
var derive__2 = ^id(id tag, id parent) {
if(cljm_truthy(cljm_DOT_core_SLASH_namespace(parent))) {

} else {
throw [Error alloc];

}
cljm_DOT_core_SLASH_swap_BANG_(cljm_DOT_core_SLASH_global_hierarchy, derive, tag, parent, nil);
return nil;
};
var derive__3 = ^id(id h, id tag, id parent) {
if(cljm_truthy(cljm_DOT_core_SLASH_not_EQ_(tag, parent, nil))) {

} else {
throw [Error alloc];

}
id tp__7362 = (h);
id td__7363 = (h);
id ta__7364 = (h);
id tf__7365 = ^id(id m, id source, id sources, id target, id targets) {
return cljm_DOT_core_SLASH_reduce(^id(id ret, id k) {
return cljm_DOT_core_SLASH_assoc(ret, k, cljm_DOT_core_SLASH_reduce(cljm_DOT_core_SLASH_conj, cljm_DOT_core_SLASH__lookup(targets, k, [NSSet set]), cljm_DOT_core_SLASH_cons(target, targets(target))), nil);
}, m, cljm_DOT_core_SLASH_cons(source, sources(source)));
};
id or__3824__auto____7366 = (cljm_truthy(cljm_DOT_core_SLASH_contains_QMARK_(tp__7362(tag), parent))) ?nil:{if(cljm_truthy(cljm_DOT_core_SLASH_contains_QMARK_(ta__7364(tag), parent))) {
throw [Error alloc];

} else {

}
if(cljm_truthy(cljm_DOT_core_SLASH_contains_QMARK_(ta__7364(parent), tag))) {
throw [Error alloc];

} else {

}
return @{ cljm_keyword(@":parents"): cljm_DOT_core_SLASH_assoc((h), tag, cljm_DOT_core_SLASH_conj(cljm_DOT_core_SLASH__lookup(tp__7362, tag, [NSSet set]), parent, nil), nil), cljm_keyword(@":ancestors"): tf__7365((h), tag, td__7363, parent, ta__7364), cljm_keyword(@":descendants"): tf__7365((h), parent, ta__7364, tag, td__7363) };
};
if(cljm_truthy(or__3824__auto____7366)) {
return or__3824__auto____7366;

} else {
return h;

}
};
derive = function(h, tag, parent){
switch(arguments.length){
case 2:
return derive__2.call(this,h, tag);
case 3:
return derive__3.call(this,h, tag, parent);
}
throw('Invalid arity: ' + arguments.length);
};
derive.cljm$lang$arity$2 = derive__2;
derive.cljm$lang$arity$3 = derive__3;
return derive;
})()
;
/**
* Removes a parent/child relationship between parent and
* tag. h must be a hierarchy obtained from make-hierarchy, if not
* supplied defaults to, and modifies, the global hierarchy.
*/
cljm_DOT_core_SLASH_underive = (function() {
var underive = null;
var underive__2 = ^id(id tag, id parent) {
cljm_DOT_core_SLASH_swap_BANG_(cljm_DOT_core_SLASH_global_hierarchy, underive, tag, parent, nil);
return nil;
};
var underive__3 = ^id(id h, id tag, id parent) {
id parentMap__7371 = (h);
id childsParents__7372 = (cljm_truthy(parentMap__7371(tag))) ?cljm_DOT_core_SLASH_disj(parentMap__7371(tag), parent, nil):[NSSet set];
id newParents__7373 = (cljm_truthy(cljm_DOT_core_SLASH_not_empty(childsParents__7372))) ?cljm_DOT_core_SLASH_assoc(parentMap__7371, tag, childsParents__7372, nil):cljm_DOT_core_SLASH_dissoc(parentMap__7371, tag, nil);
id deriv_seq__7374 = cljm_DOT_core_SLASH_flatten(cljm_DOT_core_SLASH_map(^id(id p1__7354_SHARP_) {
return cljm_DOT_core_SLASH_cons(cljm_DOT_core_SLASH_first(p1__7354_SHARP_), cljm_DOT_core_SLASH_interpose(cljm_DOT_core_SLASH_first(p1__7354_SHARP_), cljm_DOT_core_SLASH_second(p1__7354_SHARP_)));
}, cljm_DOT_core_SLASH_seq(newParents__7373), nil));
if(cljm_truthy(cljm_DOT_core_SLASH_contains_QMARK_(parentMap__7371(tag), parent))) {
return cljm_DOT_core_SLASH_reduce(^id(id p1__7355_SHARP_, id p2__7356_SHARP_) {
return cljm_DOT_core_SLASH_apply(cljm_DOT_core_SLASH_derive, p1__7355_SHARP_, p2__7356_SHARP_, nil);
}, cljm_DOT_core_SLASH_make_hierarchy(), cljm_DOT_core_SLASH_partition(@2, deriv_seq__7374));

} else {
return h;

}
};
underive = function(h, tag, parent){
switch(arguments.length){
case 2:
return underive__2.call(this,h, tag);
case 3:
return underive__3.call(this,h, tag, parent);
}
throw('Invalid arity: ' + arguments.length);
};
underive.cljm$lang$arity$2 = underive__2;
underive.cljm$lang$arity$3 = underive__3;
return underive;
})()
;
cljm_DOT_core_SLASH_reset_cache = ^id(id method_cache, id method_table, id cached_hierarchy, id hierarchy) {
cljm_DOT_core_SLASH_swap_BANG_(method_cache, ^id(id _) {
return cljm_DOT_core_SLASH_deref(method_table);
}, nil);
return cljm_DOT_core_SLASH_swap_BANG_(cached_hierarchy, ^id(id _) {
return cljm_DOT_core_SLASH_deref(hierarchy);
}, nil);
};
cljm_DOT_core_SLASH_prefers_STAR_ = ^id(id x, id y, id prefer_table) {
id xprefs__7382 = (x);
id or__3824__auto____7384 = (cljm_truthy({id and__3822__auto____7383 = xprefs__7382;
if(cljm_truthy(and__3822__auto____7383)) {
return xprefs__7382(y);

} else {
return and__3822__auto____7383;

}
})) ?@YES:nil;
if(cljm_truthy(or__3824__auto____7384)) {
return or__3824__auto____7384;

} else {
id or__3824__auto____7386 = {id ps__7385 = cljm_DOT_core_SLASH_parents(y);
while(YES) {
if(cljm_truthy((cljm_DOT_core_SLASH_count(ps__7385) > @0))) {
if(cljm_truthy(prefers_STAR_(x, cljm_DOT_core_SLASH_first(ps__7385), prefer_table))) {

} else {

}
{
var G__7389 = cljm_DOT_core_SLASH_rest(ps__7385);
ps__7385 = G__7389;
continue;
}

} else {
return nil;

}
break;
}
};
if(cljm_truthy(or__3824__auto____7386)) {
return or__3824__auto____7386;

} else {
id or__3824__auto____7388 = {id ps__7387 = cljm_DOT_core_SLASH_parents(x);
while(YES) {
if(cljm_truthy((cljm_DOT_core_SLASH_count(ps__7387) > @0))) {
if(cljm_truthy(prefers_STAR_(cljm_DOT_core_SLASH_first(ps__7387), y, prefer_table))) {

} else {

}
{
var G__7390 = cljm_DOT_core_SLASH_rest(ps__7387);
ps__7387 = G__7390;
continue;
}

} else {
return nil;

}
break;
}
};
if(cljm_truthy(or__3824__auto____7388)) {
return or__3824__auto____7388;

} else {
return @NO;

}

}

}
};
cljm_DOT_core_SLASH_dominates = ^id(id x, id y, id prefer_table) {
id or__3824__auto____7392 = cljm_DOT_core_SLASH_prefers_STAR_(x, y, prefer_table);
if(cljm_truthy(or__3824__auto____7392)) {
return or__3824__auto____7392;

} else {
return cljm_DOT_core_SLASH_isa_QMARK_(x, y);

}
};
cljm_DOT_core_SLASH_find_and_cache_best_method = ^id(id name, id dispatch_val, id hierarchy, id method_table, id prefer_table, id method_cache, id cached_hierarchy) {
id best_entry__7410 = cljm_DOT_core_SLASH_reduce(^id(id be, id p__7402) {
id vec__7403__7404 = p__7402;
id k__7405 = cljm_DOT_core_SLASH_nth(vec__7403__7404, @0, nil);
id ___7406 = cljm_DOT_core_SLASH_nth(vec__7403__7404, @1, nil);
id e__7407 = vec__7403__7404;
if(cljm_truthy(cljm_DOT_core_SLASH_isa_QMARK_(dispatch_val, k__7405))) {
id be2__7409 = (cljm_truthy({id or__3824__auto____7408 = (be == nil);
if(cljm_truthy(or__3824__auto____7408)) {
return or__3824__auto____7408;

} else {
return cljm_DOT_core_SLASH_dominates(k__7405, cljm_DOT_core_SLASH_first(be), prefer_table);

}
})) ?e__7407:be;
if(cljm_truthy(cljm_DOT_core_SLASH_dominates(cljm_DOT_core_SLASH_first(be2__7409), k__7405, prefer_table))) {

} else {
throw [Error alloc];

}
return be2__7409;

} else {
return be;

}
}, nil, cljm_DOT_core_SLASH_deref(method_table));
if(cljm_truthy(best_entry__7410)) {
if(cljm_truthy(cljm_DOT_core_SLASH__EQ_(cljm_DOT_core_SLASH_deref(cached_hierarchy), cljm_DOT_core_SLASH_deref(hierarchy), nil))) {
cljm_DOT_core_SLASH_swap_BANG_(method_cache, cljm_DOT_core_SLASH_assoc, dispatch_val, cljm_DOT_core_SLASH_second(best_entry__7410), nil);
return cljm_DOT_core_SLASH_second(best_entry__7410);

} else {
cljm_DOT_core_SLASH_reset_cache(method_cache, method_table, cached_hierarchy, hierarchy);
return find_and_cache_best_method(name, dispatch_val, hierarchy, method_table, prefer_table, method_cache, cached_hierarchy);

}

} else {
return nil;

}
};
cljm_DOT_core_SLASH_IMultiFn = {};
cljm_DOT_core_SLASH__reset = ^id(id mf) {
if(cljm_truthy({id and__3822__auto____7415 = mf;
if(cljm_truthy(and__3822__auto____7415)) {
return mf.cljm$core$IMultiFn$_reset$arity$1;

} else {
return and__3822__auto____7415;

}
})) {
return [mf cljmmf core];

} else {
id x__1485__auto____7416 = (cljm_truthy((mf == nil))) ?nil:mf;
return (mf);

}
};
cljm_DOT_core_SLASH__add_method = ^id(id mf, id dispatch_val, id method) {
if(cljm_truthy({id and__3822__auto____7423 = mf;
if(cljm_truthy(and__3822__auto____7423)) {
return mf.cljm$core$IMultiFn$_add_method$arity$3;

} else {
return and__3822__auto____7423;

}
})) {
return [mf cljmmf coredispatch_val IMultiFnmethod add];

} else {
id x__1485__auto____7424 = (cljm_truthy((mf == nil))) ?nil:mf;
return (mf, dispatch_val, method);

}
};
cljm_DOT_core_SLASH__remove_method = ^id(id mf, id dispatch_val) {
if(cljm_truthy({id and__3822__auto____7431 = mf;
if(cljm_truthy(and__3822__auto____7431)) {
return mf.cljm$core$IMultiFn$_remove_method$arity$2;

} else {
return and__3822__auto____7431;

}
})) {
return [mf cljmmf coredispatch_val IMultiFn];

} else {
id x__1485__auto____7432 = (cljm_truthy((mf == nil))) ?nil:mf;
return (mf, dispatch_val);

}
};
cljm_DOT_core_SLASH__prefer_method = ^id(id mf, id dispatch_val, id dispatch_val_y) {
if(cljm_truthy({id and__3822__auto____7439 = mf;
if(cljm_truthy(and__3822__auto____7439)) {
return mf.cljm$core$IMultiFn$_prefer_method$arity$3;

} else {
return and__3822__auto____7439;

}
})) {
return [mf cljmmf coredispatch_val IMultiFndispatch_val_y prefer];

} else {
id x__1485__auto____7440 = (cljm_truthy((mf == nil))) ?nil:mf;
return (mf, dispatch_val, dispatch_val_y);

}
};
cljm_DOT_core_SLASH__get_method = ^id(id mf, id dispatch_val) {
if(cljm_truthy({id and__3822__auto____7447 = mf;
if(cljm_truthy(and__3822__auto____7447)) {
return mf.cljm$core$IMultiFn$_get_method$arity$2;

} else {
return and__3822__auto____7447;

}
})) {
return [mf cljmmf coredispatch_val IMultiFn];

} else {
id x__1485__auto____7448 = (cljm_truthy((mf == nil))) ?nil:mf;
return (mf, dispatch_val);

}
};
cljm_DOT_core_SLASH__methods = ^id(id mf) {
if(cljm_truthy({id and__3822__auto____7455 = mf;
if(cljm_truthy(and__3822__auto____7455)) {
return mf.cljm$core$IMultiFn$_methods$arity$1;

} else {
return and__3822__auto____7455;

}
})) {
return [mf cljmmf core];

} else {
id x__1485__auto____7456 = (cljm_truthy((mf == nil))) ?nil:mf;
return (mf);

}
};
cljm_DOT_core_SLASH__prefers = ^id(id mf) {
if(cljm_truthy({id and__3822__auto____7463 = mf;
if(cljm_truthy(and__3822__auto____7463)) {
return mf.cljm$core$IMultiFn$_prefers$arity$1;

} else {
return and__3822__auto____7463;

}
})) {
return [mf cljmmf core];

} else {
id x__1485__auto____7464 = (cljm_truthy((mf == nil))) ?nil:mf;
return (mf);

}
};
cljm_DOT_core_SLASH__dispatch = ^id(id mf, id args) {
if(cljm_truthy({id and__3822__auto____7471 = mf;
if(cljm_truthy(and__3822__auto____7471)) {
return mf.cljm$core$IMultiFn$_dispatch$arity$2;

} else {
return and__3822__auto____7471;

}
})) {
return [mf cljmmf coreargs IMultiFn];

} else {
id x__1485__auto____7472 = (cljm_truthy((mf == nil))) ?nil:mf;
return (mf, args);

}
};
cljm_DOT_core_SLASH_do_dispatch = ^id(id mf, id dispatch_fn, id args) {
id dispatch_val__7477 = cljm_DOT_core_SLASH_apply(dispatch_fn, args, nil);
id target_fn__7478 = cljm_DOT_core_SLASH__get_method(mf, dispatch_val__7477);
if(cljm_truthy(target_fn__7478)) {

} else {
throw [Error alloc];

}
return cljm_DOT_core_SLASH_apply(target_fn__7478, args, nil);
};

/**
* @constructor
*/
cljm_DOT_core_SLASH_MultiFn = (function (name, dispatch_fn, default_dispatch_val, hierarchy, method_table, prefer_table, method_cache, cached_hierarchy){
this.name = name;
this.dispatch_fn = dispatch_fn;
this.default_dispatch_val = default_dispatch_val;
this.hierarchy = hierarchy;
this.method_table = method_table;
this.prefer_table = prefer_table;
this.method_cache = method_cache;
this.cached_hierarchy = cached_hierarchy;
this.cljm$lang$protocol_mask$partition0$ = 4194304;
this.cljm$lang$protocol_mask$partition1$ = 64;
})
cljm_DOT_core_SLASH_MultiFn.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_MultiFn.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/MultiFn", nil);
};
cljm_DOT_core_SLASH_MultiFn.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id this$) {
var this__7479 = this;
return goog_SLASH_getUid(this$);
};
cljm_DOT_core_SLASH_MultiFn.prototype.cljm$core$IMultiFn$_reset$arity$1 = ^id(id mf) {
var this__7480 = this;
cljm_DOT_core_SLASH_swap_BANG_(this__7480_DOT_method_table, ^id(id mf) {
return @{};
}, nil);
cljm_DOT_core_SLASH_swap_BANG_(this__7480_DOT_method_cache, ^id(id mf) {
return @{};
}, nil);
cljm_DOT_core_SLASH_swap_BANG_(this__7480_DOT_prefer_table, ^id(id mf) {
return @{};
}, nil);
cljm_DOT_core_SLASH_swap_BANG_(this__7480_DOT_cached_hierarchy, ^id(id mf) {
return nil;
}, nil);
return mf;
};
cljm_DOT_core_SLASH_MultiFn.prototype.cljm$core$IMultiFn$_add_method$arity$3 = ^id(id mf, id dispatch_val, id method) {
var this__7481 = this;
cljm_DOT_core_SLASH_swap_BANG_(this__7481_DOT_method_table, cljm_DOT_core_SLASH_assoc, dispatch_val, method, nil);
cljm_DOT_core_SLASH_reset_cache(this__7481_DOT_method_cache, this__7481_DOT_method_table, this__7481_DOT_cached_hierarchy, this__7481_DOT_hierarchy);
return mf;
};
cljm_DOT_core_SLASH_MultiFn.prototype.cljm$core$IMultiFn$_remove_method$arity$2 = ^id(id mf, id dispatch_val) {
var this__7482 = this;
cljm_DOT_core_SLASH_swap_BANG_(this__7482_DOT_method_table, cljm_DOT_core_SLASH_dissoc, dispatch_val, nil);
cljm_DOT_core_SLASH_reset_cache(this__7482_DOT_method_cache, this__7482_DOT_method_table, this__7482_DOT_cached_hierarchy, this__7482_DOT_hierarchy);
return mf;
};
cljm_DOT_core_SLASH_MultiFn.prototype.cljm$core$IMultiFn$_get_method$arity$2 = ^id(id mf, id dispatch_val) {
var this__7483 = this;
if(cljm_truthy(cljm_DOT_core_SLASH__EQ_(cljm_DOT_core_SLASH_deref(this__7483_DOT_cached_hierarchy), cljm_DOT_core_SLASH_deref(this__7483_DOT_hierarchy), nil))) {

} else {
cljm_DOT_core_SLASH_reset_cache(this__7483_DOT_method_cache, this__7483_DOT_method_table, this__7483_DOT_cached_hierarchy, this__7483_DOT_hierarchy);

}
id temp__3971__auto____7484 = (dispatch_val);
if(cljm_truthy(temp__3971__auto____7484)) {
id target_fn__7485 = temp__3971__auto____7484;
return target_fn__7485;

} else {
id temp__3971__auto____7486 = cljm_DOT_core_SLASH_find_and_cache_best_method(this__7483_DOT_name, dispatch_val, this__7483_DOT_hierarchy, this__7483_DOT_method_table, this__7483_DOT_prefer_table, this__7483_DOT_method_cache, this__7483_DOT_cached_hierarchy);
if(cljm_truthy(temp__3971__auto____7486)) {
id target_fn__7487 = temp__3971__auto____7486;
return target_fn__7487;

} else {
return (this__7483_DOT_default_dispatch_val);

}

}
};
cljm_DOT_core_SLASH_MultiFn.prototype.cljm$core$IMultiFn$_prefer_method$arity$3 = ^id(id mf, id dispatch_val_x, id dispatch_val_y) {
var this__7488 = this;
if(cljm_truthy(cljm_DOT_core_SLASH_prefers_STAR_(dispatch_val_x, dispatch_val_y, this__7488_DOT_prefer_table))) {
throw [Error alloc];

} else {

}
cljm_DOT_core_SLASH_swap_BANG_(this__7488_DOT_prefer_table, ^id(id old) {
return cljm_DOT_core_SLASH_assoc(old, dispatch_val_x, cljm_DOT_core_SLASH_conj(cljm_DOT_core_SLASH__lookup(old, dispatch_val_x, [NSSet set]), dispatch_val_y, nil), nil);
}, nil);
return cljm_DOT_core_SLASH_reset_cache(this__7488_DOT_method_cache, this__7488_DOT_method_table, this__7488_DOT_cached_hierarchy, this__7488_DOT_hierarchy);
};
cljm_DOT_core_SLASH_MultiFn.prototype.cljm$core$IMultiFn$_methods$arity$1 = ^id(id mf) {
var this__7489 = this;
return cljm_DOT_core_SLASH_deref(this__7489_DOT_method_table);
};
cljm_DOT_core_SLASH_MultiFn.prototype.cljm$core$IMultiFn$_prefers$arity$1 = ^id(id mf) {
var this__7490 = this;
return cljm_DOT_core_SLASH_deref(this__7490_DOT_prefer_table);
};
cljm_DOT_core_SLASH_MultiFn.prototype.cljm$core$IMultiFn$_dispatch$arity$2 = ^id(id mf, id args) {
var this__7491 = this;
return cljm_DOT_core_SLASH_do_dispatch(mf, this__7491_DOT_dispatch_fn, args);
};
cljm_DOT_core_SLASH_MultiFn;
cljs_SLASH_core_DOT_MultiFn_DOT_prototype_DOT_call = ^id(id cljm__varargs, id _, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
id self__7492 = this;
return cljm_DOT_core_SLASH__dispatch(self__7492, args);
};
cljs_SLASH_core_DOT_MultiFn_DOT_prototype_DOT_apply = ^id(id _, id args) {
id self__7493 = this;
return cljm_DOT_core_SLASH__dispatch(self__7493, args);
};
/**
* Removes all of the methods of multimethod.
*/
cljm_DOT_core_SLASH_remove_all_methods = ^id(id multifn) {
return cljm_DOT_core_SLASH__reset(multifn);
};
/**
* Removes the method of multimethod associated with dispatch-value.
*/
cljm_DOT_core_SLASH_remove_method = ^id(id multifn, id dispatch_val) {
return cljm_DOT_core_SLASH__remove_method(multifn, dispatch_val);
};
/**
* Causes the multimethod to prefer matches of dispatch-val-x over dispatch-val-y
* when there is a conflict
*/
cljm_DOT_core_SLASH_prefer_method = ^id(id multifn, id dispatch_val_x, id dispatch_val_y) {
return cljm_DOT_core_SLASH__prefer_method(multifn, dispatch_val_x, dispatch_val_y);
};
/**
* Given a multimethod, returns a map of dispatch values -> dispatch fns
*/
cljm_DOT_core_SLASH_methods = ^id(id multifn) {
return cljm_DOT_core_SLASH__methods(multifn);
};
/**
* Given a multimethod and a dispatch value, returns the dispatch fn
* that would apply to that value, or nil if none apply and no default
*/
cljm_DOT_core_SLASH_get_method = ^id(id multifn, id dispatch_val) {
return cljm_DOT_core_SLASH__get_method(multifn, dispatch_val);
};
/**
* Given a multimethod, returns a map of preferred value -> set of other values
*/
cljm_DOT_core_SLASH_prefers = ^id(id multifn) {
return cljm_DOT_core_SLASH__prefers(multifn);
};

/**
* @constructor
*/
cljm_DOT_core_SLASH_UUID = (function (uuid){
this.uuid = uuid;
this.cljm$lang$protocol_mask$partition1$ = 0;
this.cljm$lang$protocol_mask$partition0$ = 543162368;
})
cljm_DOT_core_SLASH_UUID.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_UUID.cljm$lang$ctorPrSeq = ^id(id this__1431__auto__) {
return cljm_DOT_core_SLASH_list(@"cljm.core/UUID", nil);
};
cljm_DOT_core_SLASH_UUID.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id this$) {
var this__7494 = this;
return goog_DOT_string_SLASH_hashCode(cljm_DOT_core_SLASH_pr_str(this$, nil));
};
cljm_DOT_core_SLASH_UUID.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id _7496, id _) {
var this__7495 = this;
return cljm_DOT_core_SLASH_list([@[ @"#uuid \"", this__7495_DOT_uuid, @"\"" ] componentsSeperatedByString:@""], nil);
};
cljm_DOT_core_SLASH_UUID.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id _, id other) {
var this__7497 = this;
id and__3822__auto____7498 = cljm_DOT_core_SLASH_instance_QMARK_(cljm_DOT_core_SLASH_UUID, other);
if(cljm_truthy(and__3822__auto____7498)) {
return ([this__7497_DOT_uuid isEqual:other.uuid]);

} else {
return and__3822__auto____7498;

}
};
cljm_DOT_core_SLASH_UUID.prototype.toString = ^id() {
var this__7499 = this;
id this__7500 = this;
return cljm_DOT_core_SLASH_pr_str(this__7500, nil);
};
cljm_DOT_core_SLASH_UUID;
}
}

#import "cljm_DOT_core.h"
__attribute__((constructor))
void cljm_DOT_core_SLASH_cljm_ns_init(void) {
@autoreleasepool {
/**
* Each runtime environment provides a diffenent way to print output.
* Whatever function *print-fn* is bound to will be passed any
* Strings which should be printed.
*/
cljm_DOT_core_SLASH__STAR_print_fn_STAR_ = [[CLJMVar alloc] initWithValue:^id(id s) {
NSLog(@"s");;
return nil;
}];
cljm_DOT_core_SLASH_error = [[CLJMVar alloc] initWithValue:^id(id cause) {
fprintf(stderr, "%s\n", string_get_utf8 (cause));
exit(1);
return nil;
}];
/**
* Internal - do not use!
*/
cljm_DOT_core_SLASH_type_satisfies_ = [[CLJMVar alloc] initWithValue:^id(id p, id x) {
id x__4474 = (cljm_truthy((x == nil))) ?nil:x;
if(cljm_truthy((p[((id (^)(id )) goog_SLASH_typeOf.value)(x__4474)]))) {
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
}];
cljm_DOT_core_SLASH_is_proto_ = [[CLJMVar alloc] initWithValue:^id(id x) {
return ([x.constructor.prototype isEqual:x]);
}];
/**
* When compiled for a command-line target, whatever
* function *main-fn* is set to will be called with the command-line
* argv as arguments
*/
cljm_DOT_core_SLASH__STAR_main_cli_fn_STAR_ = [[CLJMVar alloc] initWithValue:nil];
cljm_DOT_core_SLASH_missing_protocol = [[CLJMVar alloc] initWithValue:^id(id proto, id obj) {
return ((id (^)(id )) cljm_DOT_core_SLASH_error.value)([@[@"No protocol method ",proto,@" defined for type ",((id (^)(id )) goog_SLASH_typeOf.value)(obj),@": ",obj] join@""]);
}];
/**
* Returns a array, cloned from the passed in array
*/
cljm_DOT_core_SLASH_aclone = [[CLJMVar alloc] initWithValue:^id(id array_like) {
return [array_like copy];
}];
/**
* Creates a new array.
*/
cljm_DOT_core_SLASH_array = [[CLJMVar alloc] initWithValue:^id(id var_args) {
return [Array.value.prototype.slice callarguments];
}];
cljm_DOT_core_SLASH_make_array = [[CLJMVar alloc] initWithValue:(function() {
var make_array = null;
var make_array__1 = ^id(id size) {
return [[NSArray alloc] initWithCapacity:size];
};
var make_array__2 = ^id(id type, id size) {
return ((id (^)(id )) make_array.value)(size);
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
];
/**
* Returns the value at the index.
*/
cljm_DOT_core_SLASH_aget = [[CLJMVar alloc] initWithValue:(function() {
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
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(aget.value, ((id (^)(id , id , ...)) aget.value)(array, i, nil), idxs, nil);
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
];
/**
* Sets the value at the index.
*/
cljm_DOT_core_SLASH_aset = [[CLJMVar alloc] initWithValue:^id(id array, id i, id val) {
return (array[i] = val);
}];
/**
* Returns the length of the array. Works on arrays of all types.
*/
cljm_DOT_core_SLASH_alength = [[CLJMVar alloc] initWithValue:^id(id array) {
return [@"count" array];
}];
cljm_DOT_core_SLASH_into_array = [[CLJMVar alloc] initWithValue:(function() {
var into_array = null;
var into_array__1 = ^id(id aseq) {
return ((id (^)(id , id )) into_array.value)(nil, aseq);
};
var into_array__2 = ^id(id type, id aseq) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(^id(id a, id x) {
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
];
/**
* Tests if 2 arguments are the same object
*/
cljm_DOT_core_SLASH_identical_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id x, id y) {
return ([x isEqual:y]);
}];
/**
* Equality. Returns true if x equals y, false if not. Compares
* numbers and collections in a type-independent manner.  Clojure's immutable data
* structures define -equiv (and thus =) as a value, not an identity,
* comparison.
*/
cljm_DOT_core_SLASH__EQ_ = [[CLJMVar alloc] initWithValue:(function() {
var _EQ_ = null;
var _EQ___1 = ^id(id x) {
return @YES;
};
var _EQ___2 = ^id(id x, id y) {
id or__3824__auto____4476 = ([x isEqual:y]);
if(cljm_truthy(or__3824__auto____4476)) {
return or__3824__auto____4476;

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH__equiv.value)(x, y);

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
if(cljm_truthy(((id (^)(id , id , ...)) _EQ_.value)(x, y, nil))) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_next.value)(more))) {
{
id G__4477 = y;
id G__4478 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(more);
id G__4479 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(more);
x = G__4477;
y = G__4478;
more = G__4479;
continue;
}

} else {
return ((id (^)(id , id , ...)) _EQ_.value)(y, ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(more), nil);

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
];
/**
* Returns true if x is nil, false otherwise.
*/
cljm_DOT_core_SLASH_nil_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id x) {
return (x == nil);
}];
cljm_DOT_core_SLASH_type = [[CLJMVar alloc] initWithValue:^id(id x) {
if(cljm_truthy((x == nil))) {
return nil;

} else {
return x.constructor;

}
}];
cljm_DOT_core_SLASH_instance_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id t, id o) {
return [o isKindOfClass:[t class]];
}];
/**
* Returns a number one greater than num.
*/
cljm_DOT_core_SLASH_inc = [[CLJMVar alloc] initWithValue:^id(id x) {
return (x + @1);
}];
/**
* Accepts any collection which satisfies the ICount and IIndexed protocols and
* reduces them without incurring seq initialization
*/
cljm_DOT_core_SLASH_ci_reduce = [[CLJMVar alloc] initWithValue:(function() {
var ci_reduce = null;
var ci_reduce__2 = ^id(id cicoll, id f) {
id cnt__4492 = ((id (^)(id )) cljm_DOT_core_SLASH__count.value)(cicoll);
if(cljm_truthy(([cnt__4492 isEqual:@0]))) {
return ((id (^)()) f.value)();

} else {
id val__4493 = ((id (^)(id , id )) cljm_DOT_core_SLASH__nth.value)(cicoll, @0);
id n__4494 = @1;
while(YES) {
if(cljm_truthy((n__4494 < cnt__4492))) {
id nval__4495 = ((id (^)(id , id )) f.value)(val__4493, ((id (^)(id , id )) cljm_DOT_core_SLASH__nth.value)(cicoll, n__4494));
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_reduced_QMARK_.value)(nval__4495))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(nval__4495);

} else {
{
id G__4504 = nval__4495;
id G__4505 = (n__4494 + @1);
val__4493 = G__4504;
n__4494 = G__4505;
continue;
}

}

} else {
return val__4493;

}
break;
}

}
};
var ci_reduce__3 = ^id(id cicoll, id f, id val) {
id cnt__4496 = ((id (^)(id )) cljm_DOT_core_SLASH__count.value)(cicoll);
id val__4497 = val;
id n__4498 = @0;
while(YES) {
if(cljm_truthy((n__4498 < cnt__4496))) {
id nval__4499 = ((id (^)(id , id )) f.value)(val__4497, ((id (^)(id , id )) cljm_DOT_core_SLASH__nth.value)(cicoll, n__4498));
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_reduced_QMARK_.value)(nval__4499))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(nval__4499);

} else {
{
id G__4506 = nval__4499;
id G__4507 = (n__4498 + @1);
val__4497 = G__4506;
n__4498 = G__4507;
continue;
}

}

} else {
return val__4497;

}
break;
}
};
var ci_reduce__4 = ^id(id cicoll, id f, id val, id idx) {
id cnt__4500 = ((id (^)(id )) cljm_DOT_core_SLASH__count.value)(cicoll);
id val__4501 = val;
id n__4502 = idx;
while(YES) {
if(cljm_truthy((n__4502 < cnt__4500))) {
id nval__4503 = ((id (^)(id , id )) f.value)(val__4501, ((id (^)(id , id )) cljm_DOT_core_SLASH__nth.value)(cicoll, n__4502));
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_reduced_QMARK_.value)(nval__4503))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(nval__4503);

} else {
{
id G__4508 = nval__4503;
id G__4509 = (n__4502 + @1);
val__4501 = G__4508;
n__4502 = G__4509;
continue;
}

}

} else {
return val__4501;

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
];
cljm_DOT_core_SLASH_array_reduce = [[CLJMVar alloc] initWithValue:(function() {
var array_reduce = null;
var array_reduce__2 = ^id(id arr, id f) {
id cnt__4522 = [arr count];
if(cljm_truthy(([[arr count] isEqual:@0]))) {
return ((id (^)()) f.value)();

} else {
id val__4523 = (arr[@0]);
id n__4524 = @1;
while(YES) {
if(cljm_truthy((n__4524 < cnt__4522))) {
id nval__4525 = ((id (^)(id , id )) f.value)(val__4523, (arr[n__4524]));
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_reduced_QMARK_.value)(nval__4525))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(nval__4525);

} else {
{
id G__4534 = nval__4525;
id G__4535 = (n__4524 + @1);
val__4523 = G__4534;
n__4524 = G__4535;
continue;
}

}

} else {
return val__4523;

}
break;
}

}
};
var array_reduce__3 = ^id(id arr, id f, id val) {
id cnt__4526 = [arr count];
id val__4527 = val;
id n__4528 = @0;
while(YES) {
if(cljm_truthy((n__4528 < cnt__4526))) {
id nval__4529 = ((id (^)(id , id )) f.value)(val__4527, (arr[n__4528]));
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_reduced_QMARK_.value)(nval__4529))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(nval__4529);

} else {
{
id G__4536 = nval__4529;
id G__4537 = (n__4528 + @1);
val__4527 = G__4536;
n__4528 = G__4537;
continue;
}

}

} else {
return val__4527;

}
break;
}
};
var array_reduce__4 = ^id(id arr, id f, id val, id idx) {
id cnt__4530 = [arr count];
id val__4531 = val;
id n__4532 = idx;
while(YES) {
if(cljm_truthy((n__4532 < cnt__4530))) {
id nval__4533 = ((id (^)(id , id )) f.value)(val__4531, (arr[n__4532]));
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_reduced_QMARK_.value)(nval__4533))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(nval__4533);

} else {
{
id G__4538 = nval__4533;
id G__4539 = (n__4532 + @1);
val__4531 = G__4538;
n__4532 = G__4539;
continue;
}

}

} else {
return val__4531;

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
];
cljm_DOT_core_SLASH_prim_seq = [[CLJMVar alloc] initWithValue:(function() {
var prim_seq = null;
var prim_seq__1 = ^id(id prim) {
return ((id (^)(id , id )) prim_seq.value)(prim, @0);
};
var prim_seq__2 = ^id(id prim, id i) {
if(cljm_truthy(([prim.length isEqual:@0]))) {
return nil;

} else {
return [cljm_DOT_core_SLASH_IndexedSeq.value alloc];

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
];
cljm_DOT_core_SLASH_array_seq = [[CLJMVar alloc] initWithValue:(function() {
var array_seq = null;
var array_seq__1 = ^id(id array) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_prim_seq.value)(array, @0);
};
var array_seq__2 = ^id(id array, id i) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_prim_seq.value)(array, i);
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
];
/**
* Returns a seq on the collection. If the collection is
* empty, returns nil.  (seq nil) returns nil. seq also works on
* Strings.
*/
cljm_DOT_core_SLASH_seq = [[CLJMVar alloc] initWithValue:^id(id coll) {
if(cljm_truthy((coll == nil))) {
return nil;

} else {
if(cljm_truthy({id G__4543__4544 = coll;
if(cljm_truthy(G__4543__4544)) {
if(cljm_truthy({id or__3824__auto____4545 = (G__4543__4544.cljm$lang$protocol_mask$partition0$ & @32);
if(cljm_truthy(or__3824__auto____4545)) {
return or__3824__auto____4545;

} else {
return G__4543__4544.cljm$core$ASeq$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4543__4544.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_ASeq.value, G__4543__4544);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_ASeq.value, G__4543__4544);

}
})) {
return coll;

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH__seq.value)(coll);

}

}
}];
/**
* Returns the first item in the collection. Calls seq on its
* argument. If coll is nil, returns nil.
*/
cljm_DOT_core_SLASH_first = [[CLJMVar alloc] initWithValue:^id(id coll) {
if(cljm_truthy((coll == nil))) {
return nil;

} else {
if(cljm_truthy({id G__4550__4551 = coll;
if(cljm_truthy(G__4550__4551)) {
if(cljm_truthy({id or__3824__auto____4552 = (G__4550__4551.cljm$lang$protocol_mask$partition0$ & @64);
if(cljm_truthy(or__3824__auto____4552)) {
return or__3824__auto____4552;

} else {
return G__4550__4551.cljm$core$ISeq$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4550__4551.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_ISeq.value, G__4550__4551);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_ISeq.value, G__4550__4551);

}
})) {
return ((id (^)(id )) cljm_DOT_core_SLASH__first.value)(coll);

} else {
id s__4553 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(coll);
if(cljm_truthy((s__4553 == nil))) {
return nil;

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH__first.value)(s__4553);

}

}

}
}];
/**
* Returns a possibly empty seq of the items after the first. Calls seq on its
* argument.
*/
cljm_DOT_core_SLASH_rest = [[CLJMVar alloc] initWithValue:^id(id coll) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((coll == nil)))) {
if(cljm_truthy({id G__4558__4559 = coll;
if(cljm_truthy(G__4558__4559)) {
if(cljm_truthy({id or__3824__auto____4560 = (G__4558__4559.cljm$lang$protocol_mask$partition0$ & @64);
if(cljm_truthy(or__3824__auto____4560)) {
return or__3824__auto____4560;

} else {
return G__4558__4559.cljm$core$ISeq$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4558__4559.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_ISeq.value, G__4558__4559);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_ISeq.value, G__4558__4559);

}
})) {
return ((id (^)(id )) cljm_DOT_core_SLASH__rest.value)(coll);

} else {
id s__4561 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(coll);
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((s__4561 == nil)))) {
return ((id (^)(id )) cljm_DOT_core_SLASH__rest.value)(s__4561);

} else {
return cljm.core.List.EMPTY;

}

}

} else {
return cljm.core.List.EMPTY;

}
}];
/**
* Returns a seq of the items after the first. Calls seq on its
* argument.  If there are no more items, returns nil
*/
cljm_DOT_core_SLASH_next = [[CLJMVar alloc] initWithValue:^id(id coll) {
if(cljm_truthy((coll == nil))) {
return nil;

} else {
if(cljm_truthy({id G__4565__4566 = coll;
if(cljm_truthy(G__4565__4566)) {
if(cljm_truthy({id or__3824__auto____4567 = (G__4565__4566.cljm$lang$protocol_mask$partition0$ & @128);
if(cljm_truthy(or__3824__auto____4567)) {
return or__3824__auto____4567;

} else {
return G__4565__4566.cljm$core$INext$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4565__4566.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_INext.value, G__4565__4566);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_INext.value, G__4565__4566);

}
})) {
return ((id (^)(id )) cljm_DOT_core_SLASH__next.value)(coll);

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(((id (^)(id )) cljm_DOT_core_SLASH_rest.value)(coll));

}

}
}];
/**
* Same as (first (next x))
*/
cljm_DOT_core_SLASH_second = [[CLJMVar alloc] initWithValue:^id(id coll) {
return ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(((id (^)(id )) cljm_DOT_core_SLASH_next.value)(coll));
}];
/**
* Same as (first (first x))
*/
cljm_DOT_core_SLASH_ffirst = [[CLJMVar alloc] initWithValue:^id(id coll) {
return ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(((id (^)(id )) cljm_DOT_core_SLASH_first.value)(coll));
}];
/**
* Same as (next (first x))
*/
cljm_DOT_core_SLASH_nfirst = [[CLJMVar alloc] initWithValue:^id(id coll) {
return ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(((id (^)(id )) cljm_DOT_core_SLASH_first.value)(coll));
}];
/**
* Same as (first (next x))
*/
cljm_DOT_core_SLASH_fnext = [[CLJMVar alloc] initWithValue:^id(id coll) {
return ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(((id (^)(id )) cljm_DOT_core_SLASH_next.value)(coll));
}];
/**
* Same as (next (next x))
*/
cljm_DOT_core_SLASH_nnext = [[CLJMVar alloc] initWithValue:^id(id coll) {
return ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(((id (^)(id )) cljm_DOT_core_SLASH_next.value)(coll));
}];
/**
* Return the last item in coll, in linear time
*/
cljm_DOT_core_SLASH_last = [[CLJMVar alloc] initWithValue:^id(id s) {
while(YES) {
id sn__4569 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(s);
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((sn__4569 == nil)))) {
{
id G__4570 = sn__4569;
s = G__4570;
continue;
}

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(s);

}
break;
}
}];
(cljm_DOT_core_SLASH_IEquiv.value[@"_"] = @YES);
(cljm_DOT_core_SLASH__equiv.value[@"_"] = ^id(id x, id o) {
return ([x isEqual:o]);
});
/**
* Returns true if x is logical false, false otherwise.
*/
cljm_DOT_core_SLASH_not = [[CLJMVar alloc] initWithValue:^id(id x) {
if(cljm_truthy(x)) {
return @NO;

} else {
return @YES;

}
}];
/**
* conj[oin]. Returns a new collection with the xs
* 'added'. (conj nil item) returns (item).  The 'addition' may
* happen at different 'places' depending on the concrete type.
*/
cljm_DOT_core_SLASH_conj = [[CLJMVar alloc] initWithValue:(function() {
var conj = null;
var conj__2 = ^id(id coll, id x) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH__conj.value)(coll, x);
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
id G__4571 = ((id (^)(id , id , ...)) conj.value)(coll, x, nil);
id G__4572 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(xs);
id G__4573 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(xs);
coll = G__4571;
x = G__4572;
xs = G__4573;
continue;
}

} else {
return ((id (^)(id , id , ...)) conj.value)(coll, x, nil);

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
];
/**
* Returns an empty collection of the same category as coll, or nil
*/
cljm_DOT_core_SLASH_empty = [[CLJMVar alloc] initWithValue:^id(id coll) {
return ((id (^)(id )) cljm_DOT_core_SLASH__empty.value)(coll);
}];
cljm_DOT_core_SLASH_accumulating_seq_count = [[CLJMVar alloc] initWithValue:^id(id coll) {
id s__4576 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(coll);
id acc__4577 = @0;
while(YES) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_counted_QMARK_.value)(s__4576))) {
return (acc__4577 + ((id (^)(id )) cljm_DOT_core_SLASH__count.value)(s__4576));

} else {
{
id G__4578 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(s__4576);
id G__4579 = (acc__4577 + @1);
s__4576 = G__4578;
acc__4577 = G__4579;
continue;
}

}
break;
}
}];
/**
* Returns the number of items in the collection. (count nil) returns
* 0.  Also works on strings, arrays, and Maps
*/
cljm_DOT_core_SLASH_count = [[CLJMVar alloc] initWithValue:^id(id coll) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_counted_QMARK_.value)(coll))) {
return ((id (^)(id )) cljm_DOT_core_SLASH__count.value)(coll);

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH_accumulating_seq_count.value)(coll);

}
}];
cljm_DOT_core_SLASH_linear_traversal_nth = [[CLJMVar alloc] initWithValue:(function() {
var linear_traversal_nth = null;
var linear_traversal_nth__2 = ^id(id coll, id n) {
if(cljm_truthy((coll == nil))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_error.value)(@"Index out of bounds");

} else {
if(cljm_truthy(([n isEqual:@0]))) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(coll))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(coll);

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH_error.value)(@"Index out of bounds");

}

} else {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_indexed_QMARK_.value)(coll))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH__nth.value)(coll, n);

} else {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(coll))) {
return ((id (^)(id , id )) linear_traversal_nth.value)(((id (^)(id )) cljm_DOT_core_SLASH_next.value)(coll), (n - @1));

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_error.value)(@"Index out of bounds");

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
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(coll))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(coll);

} else {
return not_found;

}

} else {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_indexed_QMARK_.value)(coll))) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__nth.value)(coll, n, not_found);

} else {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(coll))) {
return ((id (^)(id , id , id )) linear_traversal_nth.value)(((id (^)(id )) cljm_DOT_core_SLASH_next.value)(coll), (n - @1), not_found);

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
];
/**
* Returns the value at the index. get returns nil if index out of
* bounds, nth throws an exception unless not-found is supplied.  nth
* also works for strings, arrays, regex Matchers and Lists, and,
* in O(n) time, for sequences.
*/
cljm_DOT_core_SLASH_nth = [[CLJMVar alloc] initWithValue:(function() {
var nth = null;
var nth__2 = ^id(id coll, id n) {
if(cljm_truthy((coll == nil))) {
return nil;

} else {
if(cljm_truthy({id G__4586__4587 = coll;
if(cljm_truthy(G__4586__4587)) {
if(cljm_truthy({id or__3824__auto____4588 = (G__4586__4587.cljm$lang$protocol_mask$partition0$ & @16);
if(cljm_truthy(or__3824__auto____4588)) {
return or__3824__auto____4588;

} else {
return G__4586__4587.cljm$core$IIndexed$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4586__4587.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IIndexed.value, G__4586__4587);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IIndexed.value, G__4586__4587);

}
})) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH__nth.value)(coll, n);

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_linear_traversal_nth.value)(coll, n);

}

}
};
var nth__3 = ^id(id coll, id n, id not_found) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((coll == nil)))) {
if(cljm_truthy({id G__4589__4590 = coll;
if(cljm_truthy(G__4589__4590)) {
if(cljm_truthy({id or__3824__auto____4591 = (G__4589__4590.cljm$lang$protocol_mask$partition0$ & @16);
if(cljm_truthy(or__3824__auto____4591)) {
return or__3824__auto____4591;

} else {
return G__4589__4590.cljm$core$IIndexed$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4589__4590.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IIndexed.value, G__4589__4590);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IIndexed.value, G__4589__4590);

}
})) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__nth.value)(coll, n, not_found);

} else {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_linear_traversal_nth.value)(coll, n, not_found);

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
];
/**
* Returns the value mapped to key, not-found or nil if key not present.
*/
cljm_DOT_core_SLASH_get = [[CLJMVar alloc] initWithValue:(function() {
var get = null;
var get__2 = ^id(id o, id k) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH__lookup.value)(o, k);
};
var get__3 = ^id(id o, id k, id not_found) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(o, k, not_found);
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
];
/**
* assoc[iate]. When applied to a map, returns a new map of the
* same (hashed/sorted) type, that contains the mapping of key(s) to
* val(s). When applied to a vector, returns a new vector that
* contains val at index.
*/
cljm_DOT_core_SLASH_assoc = [[CLJMVar alloc] initWithValue:(function() {
var assoc = null;
var assoc__3 = ^id(id coll, id k, id v) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__assoc.value)(coll, k, v);
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
id ret__4593 = ((id (^)(id , id , id , ...)) assoc.value)(coll, k, v, nil);
if(cljm_truthy(kvs)) {
{
id G__4594 = ret__4593;
id G__4595 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(kvs);
id G__4596 = ((id (^)(id )) cljm_DOT_core_SLASH_second.value)(kvs);
id G__4597 = ((id (^)(id )) cljm_DOT_core_SLASH_nnext.value)(kvs);
coll = G__4594;
k = G__4595;
v = G__4596;
kvs = G__4597;
continue;
}

} else {
return ret__4593;

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
];
/**
* dissoc[iate]. Returns a new map of the same (hashed/sorted) type,
* that does not contain a mapping for key(s).
*/
cljm_DOT_core_SLASH_dissoc = [[CLJMVar alloc] initWithValue:(function() {
var dissoc = null;
var dissoc__1 = ^id(id coll) {
return coll;
};
var dissoc__2 = ^id(id coll, id k) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH__dissoc.value)(coll, k);
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
id ret__4599 = ((id (^)(id , id , ...)) dissoc.value)(coll, k, nil);
if(cljm_truthy(ks)) {
{
id G__4600 = ret__4599;
id G__4601 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(ks);
id G__4602 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(ks);
coll = G__4600;
k = G__4601;
ks = G__4602;
continue;
}

} else {
return ret__4599;

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
];
/**
* Returns an object of the same type and value as obj, with
* map m as its metadata.
*/
cljm_DOT_core_SLASH_with_meta = [[CLJMVar alloc] initWithValue:^id(id o, id meta) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH__with_meta.value)(o, meta);
}];
/**
* Returns the metadata of obj, returns nil if there is no metadata.
*/
cljm_DOT_core_SLASH_meta = [[CLJMVar alloc] initWithValue:^id(id o) {
if(cljm_truthy({id G__4606__4607 = o;
if(cljm_truthy(G__4606__4607)) {
if(cljm_truthy({id or__3824__auto____4608 = (G__4606__4607.cljm$lang$protocol_mask$partition0$ & @131072);
if(cljm_truthy(or__3824__auto____4608)) {
return or__3824__auto____4608;

} else {
return G__4606__4607.cljm$core$IMeta$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4606__4607.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IMeta.value, G__4606__4607);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IMeta.value, G__4606__4607);

}
})) {
return ((id (^)(id )) cljm_DOT_core_SLASH__meta.value)(o);

} else {
return nil;

}
}];
/**
* For a list or queue, same as first, for a vector, same as, but much
* more efficient than, last. If the collection is empty, returns nil.
*/
cljm_DOT_core_SLASH_peek = [[CLJMVar alloc] initWithValue:^id(id coll) {
return ((id (^)(id )) cljm_DOT_core_SLASH__peek.value)(coll);
}];
/**
* For a list or queue, returns a new list/queue without the first
* item, for a vector, returns a new vector without the last item.
* Note - not the same as next/butlast.
*/
cljm_DOT_core_SLASH_pop = [[CLJMVar alloc] initWithValue:^id(id coll) {
return ((id (^)(id )) cljm_DOT_core_SLASH__pop.value)(coll);
}];
/**
* disj[oin]. Returns a new set of the same (hashed/sorted) type, that
* does not contain key(s).
*/
cljm_DOT_core_SLASH_disj = [[CLJMVar alloc] initWithValue:(function() {
var disj = null;
var disj__1 = ^id(id coll) {
return coll;
};
var disj__2 = ^id(id coll, id k) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH__disjoin.value)(coll, k);
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
id ret__4610 = ((id (^)(id , id , ...)) disj.value)(coll, k, nil);
if(cljm_truthy(ks)) {
{
id G__4611 = ret__4610;
id G__4612 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(ks);
id G__4613 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(ks);
coll = G__4611;
k = G__4612;
ks = G__4613;
continue;
}

} else {
return ret__4610;

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
];
cljm_DOT_core_SLASH_hash = [[CLJMVar alloc] initWithValue:(function() {
var hash = null;
var hash__1 = ^id(id o) {
return ((id (^)(id , id )) hash.value)(o, @YES);
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
];
/**
* Returns true if coll has no items - same as (not (seq coll)).
* Please use the idiom (seq x) rather than (not (empty? x))
*/
cljm_DOT_core_SLASH_empty_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id coll) {
return ((id (^)(id )) cljm_DOT_core_SLASH_not.value)(((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(coll));
}];
/**
* Returns true if x satisfies ICollection
*/
cljm_DOT_core_SLASH_coll_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id x) {
if(cljm_truthy((x == nil))) {
return @NO;

} else {
id G__4617__4618 = x;
if(cljm_truthy(G__4617__4618)) {
if(cljm_truthy({id or__3824__auto____4619 = (G__4617__4618.cljm$lang$protocol_mask$partition0$ & @8);
if(cljm_truthy(or__3824__auto____4619)) {
return or__3824__auto____4619;

} else {
return G__4617__4618.cljm$core$ICollection$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4617__4618.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_ICollection.value, G__4617__4618);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_ICollection.value, G__4617__4618);

}

}
}];
/**
* Returns true if x satisfies ISet
*/
cljm_DOT_core_SLASH_set_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id x) {
if(cljm_truthy((x == nil))) {
return @NO;

} else {
id G__4623__4624 = x;
if(cljm_truthy(G__4623__4624)) {
if(cljm_truthy({id or__3824__auto____4625 = (G__4623__4624.cljm$lang$protocol_mask$partition0$ & @4096);
if(cljm_truthy(or__3824__auto____4625)) {
return or__3824__auto____4625;

} else {
return G__4623__4624.cljm$core$ISet$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4623__4624.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_ISet.value, G__4623__4624);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_ISet.value, G__4623__4624);

}

}
}];
/**
* Returns true if coll implements Associative
*/
cljm_DOT_core_SLASH_associative_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id x) {
id G__4629__4630 = x;
if(cljm_truthy(G__4629__4630)) {
if(cljm_truthy({id or__3824__auto____4631 = (G__4629__4630.cljm$lang$protocol_mask$partition0$ & @512);
if(cljm_truthy(or__3824__auto____4631)) {
return or__3824__auto____4631;

} else {
return G__4629__4630.cljm$core$IAssociative$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4629__4630.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IAssociative.value, G__4629__4630);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IAssociative.value, G__4629__4630);

}
}];
/**
* Returns true if coll satisfies ISequential
*/
cljm_DOT_core_SLASH_sequential_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id x) {
id G__4635__4636 = x;
if(cljm_truthy(G__4635__4636)) {
if(cljm_truthy({id or__3824__auto____4637 = (G__4635__4636.cljm$lang$protocol_mask$partition0$ & @16777216);
if(cljm_truthy(or__3824__auto____4637)) {
return or__3824__auto____4637;

} else {
return G__4635__4636.cljm$core$ISequential$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4635__4636.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_ISequential.value, G__4635__4636);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_ISequential.value, G__4635__4636);

}
}];
/**
* Returns true if coll implements count in constant time
*/
cljm_DOT_core_SLASH_counted_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id x) {
id G__4641__4642 = x;
if(cljm_truthy(G__4641__4642)) {
if(cljm_truthy({id or__3824__auto____4643 = (G__4641__4642.cljm$lang$protocol_mask$partition0$ & @2);
if(cljm_truthy(or__3824__auto____4643)) {
return or__3824__auto____4643;

} else {
return G__4641__4642.cljm$core$ICounted$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4641__4642.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_ICounted.value, G__4641__4642);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_ICounted.value, G__4641__4642);

}
}];
/**
* Returns true if coll implements nth in constant time
*/
cljm_DOT_core_SLASH_indexed_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id x) {
id G__4647__4648 = x;
if(cljm_truthy(G__4647__4648)) {
if(cljm_truthy({id or__3824__auto____4649 = (G__4647__4648.cljm$lang$protocol_mask$partition0$ & @16);
if(cljm_truthy(or__3824__auto____4649)) {
return or__3824__auto____4649;

} else {
return G__4647__4648.cljm$core$IIndexed$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4647__4648.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IIndexed.value, G__4647__4648);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IIndexed.value, G__4647__4648);

}
}];
/**
* Returns true if coll satisfies IReduce
*/
cljm_DOT_core_SLASH_reduceable_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id x) {
id G__4653__4654 = x;
if(cljm_truthy(G__4653__4654)) {
if(cljm_truthy({id or__3824__auto____4655 = (G__4653__4654.cljm$lang$protocol_mask$partition0$ & @524288);
if(cljm_truthy(or__3824__auto____4655)) {
return or__3824__auto____4655;

} else {
return G__4653__4654.cljm$core$IReduce$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4653__4654.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IReduce.value, G__4653__4654);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IReduce.value, G__4653__4654);

}
}];
/**
* Return true if x satisfies IMap
*/
cljm_DOT_core_SLASH_map_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id x) {
if(cljm_truthy((x == nil))) {
return @NO;

} else {
id G__4659__4660 = x;
if(cljm_truthy(G__4659__4660)) {
if(cljm_truthy({id or__3824__auto____4661 = (G__4659__4660.cljm$lang$protocol_mask$partition0$ & @1024);
if(cljm_truthy(or__3824__auto____4661)) {
return or__3824__auto____4661;

} else {
return G__4659__4660.cljm$core$IMap$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4659__4660.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IMap.value, G__4659__4660);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IMap.value, G__4659__4660);

}

}
}];
/**
* Return true if x satisfies IVector
*/
cljm_DOT_core_SLASH_vector_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id x) {
id G__4665__4666 = x;
if(cljm_truthy(G__4665__4666)) {
if(cljm_truthy({id or__3824__auto____4667 = (G__4665__4666.cljm$lang$protocol_mask$partition0$ & @16384);
if(cljm_truthy(or__3824__auto____4667)) {
return or__3824__auto____4667;

} else {
return G__4665__4666.cljm$core$IVector$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4665__4666.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IVector.value, G__4665__4666);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IVector.value, G__4665__4666);

}
}];
cljm_DOT_core_SLASH_chunked_seq_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id x) {
id G__4671__4672 = x;
if(cljm_truthy(G__4671__4672)) {
if(cljm_truthy({id or__3824__auto____4673 = nil;
if(cljm_truthy(or__3824__auto____4673)) {
return or__3824__auto____4673;

} else {
return G__4671__4672.cljm$core$IChunkedSeq$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4671__4672.cljm$lang$protocol_mask$partition$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IChunkedSeq.value, G__4671__4672);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IChunkedSeq.value, G__4671__4672);

}
}];
/**
* Returns true if x is the value false, false otherwise.
*/
cljm_DOT_core_SLASH_false_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id x) {
return x === NO;
}];
/**
* Returns true if x is the value true, false otherwise.
*/
cljm_DOT_core_SLASH_true_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id x) {
return x === YES;
}];
cljm_DOT_core_SLASH_undefined_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id x) {
return ((void *) 0) === x);
}];
/**
* Return true if s satisfies ISeq
*/
cljm_DOT_core_SLASH_seq_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id s) {
if(cljm_truthy((s == nil))) {
return @NO;

} else {
id G__4677__4678 = s;
if(cljm_truthy(G__4677__4678)) {
if(cljm_truthy({id or__3824__auto____4679 = (G__4677__4678.cljm$lang$protocol_mask$partition0$ & @64);
if(cljm_truthy(or__3824__auto____4679)) {
return or__3824__auto____4679;

} else {
return G__4677__4678.cljm$core$ISeq$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4677__4678.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_ISeq.value, G__4677__4678);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_ISeq.value, G__4677__4678);

}

}
}];
/**
* Return true if s satisfies ISeqable
*/
cljm_DOT_core_SLASH_seqable_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id s) {
id G__4683__4684 = s;
if(cljm_truthy(G__4683__4684)) {
if(cljm_truthy({id or__3824__auto____4685 = (G__4683__4684.cljm$lang$protocol_mask$partition0$ & @8388608);
if(cljm_truthy(or__3824__auto____4685)) {
return or__3824__auto____4685;

} else {
return G__4683__4684.cljm$core$ISeqable$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4683__4684.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_ISeqable.value, G__4683__4684);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_ISeqable.value, G__4683__4684);

}
}];
cljm_DOT_core_SLASH_boolean = [[CLJMVar alloc] initWithValue:^id(id x) {
if(cljm_truthy(x)) {
return @YES;

} else {
return @NO;

}
}];
cljm_DOT_core_SLASH_string_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id x) {
id and__3822__auto____4688 = [x isKindOfClass:[NSString class]];
if(cljm_truthy(and__3822__auto____4688)) {
return ((id (^)(id )) cljm_DOT_core_SLASH_not.value)({id or__3824__auto____4689 = ([[@"characterAtIndex:" x@0] isEqual:@"\uFDD0"]);
if(cljm_truthy(or__3824__auto____4689)) {
return or__3824__auto____4689;

} else {
return ([[@"characterAtIndex:" x@0] isEqual:@"\uFDD1"]);

}
});

} else {
return and__3822__auto____4688;

}
}];
cljm_DOT_core_SLASH_keyword_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id x) {
id and__3822__auto____4691 = [x isKindOfClass:[NSString class]];
if(cljm_truthy(and__3822__auto____4691)) {
return ([[@"characterAtIndex:" x@0] isEqual:@"\uFDD0"]);

} else {
return and__3822__auto____4691;

}
}];
cljm_DOT_core_SLASH_symbol_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id x) {
id and__3822__auto____4693 = [x isKindOfClass:[NSString class]];
if(cljm_truthy(and__3822__auto____4693)) {
return ([[@"characterAtIndex:" x@0] isEqual:@"\uFDD1"]);

} else {
return and__3822__auto____4693;

}
}];
cljm_DOT_core_SLASH_number_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id n) {
return [n isKindOfClass:[NSNumber class]];
}];
cljm_DOT_core_SLASH_fn_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id f) {
return [f isKindOfClass:[NSBlock class]];
}];
cljm_DOT_core_SLASH_ifn_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id f) {
id or__3824__auto____4698 = ((id (^)(id )) cljm_DOT_core_SLASH_fn_QMARK_.value)(f);
if(cljm_truthy(or__3824__auto____4698)) {
return or__3824__auto____4698;

} else {
id G__4699__4700 = f;
if(cljm_truthy(G__4699__4700)) {
if(cljm_truthy({id or__3824__auto____4701 = (G__4699__4700.cljm$lang$protocol_mask$partition0$ & @1);
if(cljm_truthy(or__3824__auto____4701)) {
return or__3824__auto____4701;

} else {
return G__4699__4700.cljm$core$IFn$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4699__4700.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IFn.value, G__4699__4700);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IFn.value, G__4699__4700);

}

}
}];
/**
* Returns true if n is an integer.  Warning: returns true on underflow condition.
*/
cljm_DOT_core_SLASH_integer_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id n) {
id and__3822__auto____4703 = ((id (^)(id )) cljm_DOT_core_SLASH_number_QMARK_.value)(n);
if(cljm_truthy(and__3822__auto____4703)) {
return (n == [@"integerValue" n]);

} else {
return and__3822__auto____4703;

}
}];
/**
* Returns true if key is present in the given collection, otherwise
* returns false.  Note that for numerically indexed collections like
* vectors and arrays, this tests if the numeric key is within the
* range of indexes. 'contains?' operates constant or logarithmic time;
* it will not perform a linear search for a value.  See also 'some'.
*/
cljm_DOT_core_SLASH_contains_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id coll, id v) {
if(cljm_truthy(([((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(coll, v, cljm_DOT_core_SLASH_lookup_sentinel.value) isEqual:cljm_DOT_core_SLASH_lookup_sentinel.value]))) {
return @NO;

} else {
return @YES;

}
}];
/**
* Returns the map entry for key, or nil if key not present.
*/
cljm_DOT_core_SLASH_find = [[CLJMVar alloc] initWithValue:^id(id coll, id k) {
if(cljm_truthy({id and__3822__auto____4706 = coll;
if(cljm_truthy(and__3822__auto____4706)) {
id and__3822__auto____4707 = ((id (^)(id )) cljm_DOT_core_SLASH_associative_QMARK_.value)(coll);
if(cljm_truthy(and__3822__auto____4707)) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_contains_QMARK_.value)(coll, k);

} else {
return and__3822__auto____4707;

}

} else {
return and__3822__auto____4706;

}
})) {
return @[ k, ((id (^)(id , id )) cljm_DOT_core_SLASH__lookup.value)(coll, k) ];

} else {
return nil;

}
}];
/**
* Returns true if no two of the arguments are =
*/
cljm_DOT_core_SLASH_distinct_QMARK_ = [[CLJMVar alloc] initWithValue:(function() {
var distinct_QMARK_ = null;
var distinct_QMARK___1 = ^id(id x) {
return @YES;
};
var distinct_QMARK___2 = ^id(id x, id y) {
return ((id (^)(id )) cljm_DOT_core_SLASH_not.value)(((id (^)(id , id , ...)) cljm_DOT_core_SLASH__EQ_.value)(x, y, nil));
};
var distinct_QMARK___3 = ^id(id cljm__varargs, id x, id y, ...) {
NSMutableArray *more = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[more addObject:cljm__currentObject];
}
va_end(cljm__args);
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)(((id (^)(id , id , ...)) cljm_DOT_core_SLASH__EQ_.value)(x, y, nil)))) {
id s__4712 = [NSSet setWithObjects:y, x, nil];
id xs__4713 = more;
while(YES) {
id x__4714 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(xs__4713);
id etc__4715 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(xs__4713);
if(cljm_truthy(xs__4713)) {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_contains_QMARK_.value)(s__4712, x__4714))) {
return @NO;

} else {
{
id G__4716 = ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_conj.value)(s__4712, x__4714, nil);
id G__4717 = etc__4715;
s__4712 = G__4716;
xs__4713 = G__4717;
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
];
/**
* Comparator. Returns a negative number, zero, or a positive number
* when x is logically 'less than', 'equal to', or 'greater than'
* y. Uses IComparable if available and google.array.defaultCompare for objects
* of the same type and special-cases nil to be less than any other object.
*/
cljm_DOT_core_SLASH_compare = [[CLJMVar alloc] initWithValue:^id(id x, id y) {
if(cljm_truthy(([x isEqual:y]))) {
return @0;

} else {
if(cljm_truthy((x == nil))) {
return @-1;

} else {
if(cljm_truthy((y == nil))) {
return @1;

} else {
if(cljm_truthy(([((id (^)(id )) cljm_DOT_core_SLASH_type.value)(x) isEqual:((id (^)(id )) cljm_DOT_core_SLASH_type.value)(y)]))) {
if(cljm_truthy({id G__4721__4722 = x;
if(cljm_truthy(G__4721__4722)) {
if(cljm_truthy({id or__3824__auto____4723 = nil;
if(cljm_truthy(or__3824__auto____4723)) {
return or__3824__auto____4723;

} else {
return G__4721__4722.cljm$core$IComparable$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4721__4722.cljm$lang$protocol_mask$partition$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IComparable.value, G__4721__4722);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IComparable.value, G__4721__4722);

}
})) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH__compare.value)(x, y);

} else {
return ((id (^)(id , id )) garray_SLASH_defaultCompare.value)(x, y);

}

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_error.value)(@"compare on non-nil objects of different types");

} else {
return nil;

}

}

}

}

}
}];
/**
* Compare indexed collection.
*/
cljm_DOT_core_SLASH_compare_indexed = [[CLJMVar alloc] initWithValue:(function() {
var compare_indexed = null;
var compare_indexed__2 = ^id(id xs, id ys) {
id xl__4728 = ((id (^)(id )) cljm_DOT_core_SLASH_count.value)(xs);
id yl__4729 = ((id (^)(id )) cljm_DOT_core_SLASH_count.value)(ys);
if(cljm_truthy((xl__4728 < yl__4729))) {
return @-1;

} else {
if(cljm_truthy((xl__4728 > yl__4729))) {
return @1;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return ((id (^)(id , id , id , id )) compare_indexed.value)(xs, ys, xl__4728, @0);

} else {
return nil;

}

}

}
};
var compare_indexed__4 = ^id(id xs, id ys, id len, id n) {
while(YES) {
id d__4730 = ((id (^)(id , id )) cljm_DOT_core_SLASH_compare.value)(((id (^)(id , id )) cljm_DOT_core_SLASH_nth.value)(xs, n), ((id (^)(id , id )) cljm_DOT_core_SLASH_nth.value)(ys, n));
if(cljm_truthy({id and__3822__auto____4731 = ([d__4730 isEqual:@0]);
if(cljm_truthy(and__3822__auto____4731)) {
return ((n + @1) < len);

} else {
return and__3822__auto____4731;

}
})) {
{
id G__4732 = xs;
id G__4733 = ys;
id G__4734 = len;
id G__4735 = (n + @1);
xs = G__4732;
ys = G__4733;
len = G__4734;
n = G__4735;
continue;
}

} else {
return d__4730;

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
];
/**
* Given a fn that might be boolean valued or a comparator,
* return a fn that is a comparator.
*/
cljm_DOT_core_SLASH_fn__GT_comparator = [[CLJMVar alloc] initWithValue:^id(id f) {
if(cljm_truthy(((id (^)(id , id , ...)) cljm_DOT_core_SLASH__EQ_.value)(f, cljm_DOT_core_SLASH_compare.value, nil))) {
return cljm_DOT_core_SLASH_compare.value;

} else {
return ^id(id x, id y) {
id r__4737 = ((id (^)(id , id )) f.value)(x, y);
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_number_QMARK_.value)(r__4737))) {
return r__4737;

} else {
if(cljm_truthy(r__4737)) {
return @-1;

} else {
if(cljm_truthy(((id (^)(id , id )) f.value)(y, x))) {
return @1;

} else {
return @0;

}

}

}
};

}
}];
/**
* Returns a sorted sequence of the items in coll. Comp can be
* boolean-valued comparison funcion, or a -/0/+ valued comparator.
* Comp defaults to compare.
*/
cljm_DOT_core_SLASH_sort = [[CLJMVar alloc] initWithValue:(function() {
var sort = null;
var sort__1 = ^id(id coll) {
return ((id (^)(id , id )) sort.value)(cljm_DOT_core_SLASH_compare.value, coll);
};
var sort__2 = ^id(id comp, id coll) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(coll))) {
id a__4739 = ((id (^)(id )) cljm_DOT_core_SLASH_to_array.value)(coll);
((id (^)(id , id )) garray_SLASH_stableSort.value)(a__4739, ((id (^)(id )) cljm_DOT_core_SLASH_fn__GT_comparator.value)(comp));
return ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(a__4739);

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
];
/**
* Returns a sorted sequence of the items in coll, where the sort
* order is determined by comparing (keyfn item).  Comp can be
* boolean-valued comparison funcion, or a -/0/+ valued comparator.
* Comp defaults to compare.
*/
cljm_DOT_core_SLASH_sort_by = [[CLJMVar alloc] initWithValue:(function() {
var sort_by = null;
var sort_by__2 = ^id(id keyfn, id coll) {
return ((id (^)(id , id , id )) sort_by.value)(keyfn, cljm_DOT_core_SLASH_compare.value, coll);
};
var sort_by__3 = ^id(id keyfn, id comp, id coll) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_sort.value)(^id(id x, id y) {
return ((id (^)(id , id )) .value)(((id (^)(id )) keyfn.value)(x), ((id (^)(id )) keyfn.value)(y));
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
];
cljm_DOT_core_SLASH_seq_reduce = [[CLJMVar alloc] initWithValue:(function() {
var seq_reduce = null;
var seq_reduce__2 = ^id(id f, id coll) {
id temp__3971__auto____4745 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(coll);
if(cljm_truthy(temp__3971__auto____4745)) {
id s__4746 = temp__3971__auto____4745;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(f, ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(s__4746), ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(s__4746));

} else {
return ((id (^)()) f.value)();

}
};
var seq_reduce__3 = ^id(id f, id val, id coll) {
id val__4747 = val;
id coll__4748 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(coll);
while(YES) {
if(cljm_truthy(coll__4748)) {
id nval__4749 = ((id (^)(id , id )) f.value)(val__4747, ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(coll__4748));
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_reduced_QMARK_.value)(nval__4749))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(nval__4749);

} else {
{
id G__4750 = nval__4749;
id G__4751 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(coll__4748);
val__4747 = G__4750;
coll__4748 = G__4751;
continue;
}

}

} else {
return val__4747;

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
];
/**
* Return a random permutation of coll
*/
cljm_DOT_core_SLASH_shuffle = [[CLJMVar alloc] initWithValue:^id(id coll) {
id a__4753 = ((id (^)(id )) cljm_DOT_core_SLASH_to_array.value)(coll);
((id (^)(id )) garray_SLASH_shuffle.value)(a__4753);
return ((id (^)(id )) cljm_DOT_core_SLASH_vec.value)(a__4753);
}];
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
cljm_DOT_core_SLASH_reduce = [[CLJMVar alloc] initWithValue:(function() {
var reduce = null;
var reduce__2 = ^id(id f, id coll) {
if(cljm_truthy({id G__4760__4761 = coll;
if(cljm_truthy(G__4760__4761)) {
if(cljm_truthy({id or__3824__auto____4762 = (G__4760__4761.cljm$lang$protocol_mask$partition0$ & @524288);
if(cljm_truthy(or__3824__auto____4762)) {
return or__3824__auto____4762;

} else {
return G__4760__4761.cljm$core$IReduce$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4760__4761.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IReduce.value, G__4760__4761);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IReduce.value, G__4760__4761);

}
})) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH__reduce.value)(coll, f);

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_seq_reduce.value)(f, coll);

}
};
var reduce__3 = ^id(id f, id val, id coll) {
if(cljm_truthy({id G__4763__4764 = coll;
if(cljm_truthy(G__4763__4764)) {
if(cljm_truthy({id or__3824__auto____4765 = (G__4763__4764.cljm$lang$protocol_mask$partition0$ & @524288);
if(cljm_truthy(or__3824__auto____4765)) {
return or__3824__auto____4765;

} else {
return G__4763__4764.cljm$core$IReduce$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4763__4764.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IReduce.value, G__4763__4764);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IReduce.value, G__4763__4764);

}
})) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__reduce.value)(coll, f, val);

} else {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_seq_reduce.value)(f, val, coll);

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
];
/**
* Reduces an associative collection. f should be a function of 3
* arguments. Returns the result of applying f to init, the first key
* and the first value in coll, then applying f to that result and the
* 2nd key and value, etc. If coll contains no entries, returns init
* and f is not called. Note that reduce-kv is supported on vectors,
* where the keys will be the ordinals.
*/
cljm_DOT_core_SLASH_reduce_kv = [[CLJMVar alloc] initWithValue:^id(id f, id init, id coll) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__kv_reduce.value)(coll, f, init);
}];

/**
* @constructor
*/
cljm_DOT_core_SLASH_Reduced = (function (val){
this.val = val;
this.cljm$lang$protocol_mask$partition1$ = 0;
this.cljm$lang$protocol_mask$partition0$ = 32768;
})
cljm_DOT_core_SLASH_Reduced.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_Reduced.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/Reduced", nil);
};
cljm_DOT_core_SLASH_Reduced.value.prototype.cljm$core$IDeref$_deref$arity$1 = ^id(id o) {
var this__4766 = this;
return this__4766_DOT_val;
};
cljm_DOT_core_SLASH_Reduced.value;
/**
* Returns true if x is the result of a call to reduced
*/
cljm_DOT_core_SLASH_reduced_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id r) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_Reduced.value, r);
}];
/**
* Wraps x in a way such that a reduce will terminate with the value x
*/
cljm_DOT_core_SLASH_reduced = [[CLJMVar alloc] initWithValue:^id(id x) {
return [cljm_DOT_core_SLASH_Reduced.value alloc];
}];
/**
* Returns the sum of nums. (+) returns 0.
*/
cljm_DOT_core_SLASH__PLUS_ = [[CLJMVar alloc] initWithValue:(function() {
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
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(_PLUS_.value, (x + y), more);
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
];
/**
* If no ys are supplied, returns the negation of x, else subtracts
* the ys from x and returns the result.
*/
cljm_DOT_core_SLASH__ = [[CLJMVar alloc] initWithValue:(function() {
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
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(_.value, (x - y), more);
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
];
/**
* Returns the product of nums. (*) returns 1.
*/
cljm_DOT_core_SLASH__STAR_ = [[CLJMVar alloc] initWithValue:(function() {
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
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(_STAR_.value, (x * y), more);
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
];
/**
* If no denominators are supplied, returns 1/numerator,
* else returns numerator divided by all of the denominators.
*/
cljm_DOT_core_SLASH__SLASH_ = [[CLJMVar alloc] initWithValue:(function() {
var _SLASH_ = null;
var _SLASH___1 = ^id(id x) {
return ((id (^)(id , id , ...)) _SLASH_.value)(@1, x, nil);
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
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(_SLASH_.value, ((id (^)(id , id , ...)) _SLASH_.value)(x, y, nil), more);
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
];
/**
* Returns non-nil if nums are in monotonically increasing order,
* otherwise false.
*/
cljm_DOT_core_SLASH__LT_ = [[CLJMVar alloc] initWithValue:(function() {
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
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_next.value)(more))) {
{
id G__4767 = y;
id G__4768 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(more);
id G__4769 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(more);
x = G__4767;
y = G__4768;
more = G__4769;
continue;
}

} else {
return (y < ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(more));

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
];
/**
* Returns non-nil if nums are in monotonically non-decreasing order,
* otherwise false.
*/
cljm_DOT_core_SLASH__LT__EQ_ = [[CLJMVar alloc] initWithValue:(function() {
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
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_next.value)(more))) {
{
id G__4770 = y;
id G__4771 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(more);
id G__4772 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(more);
x = G__4770;
y = G__4771;
more = G__4772;
continue;
}

} else {
return (y <= ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(more));

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
];
/**
* Returns non-nil if nums are in monotonically decreasing order,
* otherwise false.
*/
cljm_DOT_core_SLASH__GT_ = [[CLJMVar alloc] initWithValue:(function() {
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
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_next.value)(more))) {
{
id G__4773 = y;
id G__4774 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(more);
id G__4775 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(more);
x = G__4773;
y = G__4774;
more = G__4775;
continue;
}

} else {
return (y > ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(more));

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
];
/**
* Returns non-nil if nums are in monotonically non-increasing order,
* otherwise false.
*/
cljm_DOT_core_SLASH__GT__EQ_ = [[CLJMVar alloc] initWithValue:(function() {
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
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_next.value)(more))) {
{
id G__4776 = y;
id G__4777 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(more);
id G__4778 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(more);
x = G__4776;
y = G__4777;
more = G__4778;
continue;
}

} else {
return (y >= ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(more));

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
];
/**
* Returns a number one less than num.
*/
cljm_DOT_core_SLASH_dec = [[CLJMVar alloc] initWithValue:^id(id x) {
return (x - @1);
}];
/**
* Returns the greatest of the nums.
*/
cljm_DOT_core_SLASH_max = [[CLJMVar alloc] initWithValue:(function() {
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
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(max.value, ((x > y) ? x : y), more);
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
];
/**
* Returns the least of the nums.
*/
cljm_DOT_core_SLASH_min = [[CLJMVar alloc] initWithValue:(function() {
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
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(min.value, ((x < y) ? x : y), more);
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
];
cljm_DOT_core_SLASH_fix = [[CLJMVar alloc] initWithValue:^id(id q) {
if(cljm_truthy((q >= @0))) {
return ((id (^)(id )) Math_SLASH_floor.value)(q);

} else {
return ((id (^)(id )) Math_SLASH_ceil.value)(q);

}
}];
/**
* Coerce to int by stripping decimal places.
*/
cljm_DOT_core_SLASH_int = [[CLJMVar alloc] initWithValue:^id(id x) {
return ((id (^)(id )) cljm_DOT_core_SLASH_fix.value)(x);
}];
/**
* Coerce to long by stripping decimal places. Identical to `int'.
*/
cljm_DOT_core_SLASH_long = [[CLJMVar alloc] initWithValue:^id(id x) {
return ((id (^)(id )) cljm_DOT_core_SLASH_fix.value)(x);
}];
/**
* Modulus of num and div. Truncates toward negative infinity.
*/
cljm_DOT_core_SLASH_mod = [[CLJMVar alloc] initWithValue:^id(id n, id d) {
return (n % d);
}];
/**
* quot[ient] of dividing numerator by denominator.
*/
cljm_DOT_core_SLASH_quot = [[CLJMVar alloc] initWithValue:^id(id n, id d) {
id rem__4780 = (n % d);
return ((id (^)(id )) cljm_DOT_core_SLASH_fix.value)(((n - rem__4780) / d));
}];
/**
* remainder of dividing numerator by denominator.
*/
cljm_DOT_core_SLASH_rem = [[CLJMVar alloc] initWithValue:^id(id n, id d) {
id q__4782 = ((id (^)(id , id )) cljm_DOT_core_SLASH_quot.value)(n, d);
return (n - (d * q__4782));
}];
/**
* Returns a random floating point number between 0 (inclusive) and n (default 1) (exclusive).
*/
cljm_DOT_core_SLASH_rand = [[CLJMVar alloc] initWithValue:(function() {
var rand = null;
var rand__0 = ^id() {
return ((id (^)()) Math_SLASH_random.value)();
};
var rand__1 = ^id(id n) {
return (n * ((id (^)()) rand.value)());
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
];
/**
* Returns a random integer between 0 (inclusive) and n (exclusive).
*/
cljm_DOT_core_SLASH_rand_int = [[CLJMVar alloc] initWithValue:^id(id n) {
return ((id (^)(id )) cljm_DOT_core_SLASH_fix.value)(((id (^)(id )) cljm_DOT_core_SLASH_rand.value)(n));
}];
/**
* Bitwise exclusive or
*/
cljm_DOT_core_SLASH_bit_xor = [[CLJMVar alloc] initWithValue:^id(id x, id y) {
return (x ^ y);
}];
/**
* Bitwise and
*/
cljm_DOT_core_SLASH_bit_and = [[CLJMVar alloc] initWithValue:^id(id x, id y) {
return (x & y);
}];
/**
* Bitwise or
*/
cljm_DOT_core_SLASH_bit_or = [[CLJMVar alloc] initWithValue:^id(id x, id y) {
return (x | y);
}];
/**
* Bitwise and
*/
cljm_DOT_core_SLASH_bit_and_not = [[CLJMVar alloc] initWithValue:^id(id x, id y) {
return (x & ~y);
}];
/**
* Clear bit at index n
*/
cljm_DOT_core_SLASH_bit_clear = [[CLJMVar alloc] initWithValue:^id(id x, id n) {
return (x & ~(1 << n));
}];
/**
* Flip bit at index n
*/
cljm_DOT_core_SLASH_bit_flip = [[CLJMVar alloc] initWithValue:^id(id x, id n) {
return (x ^ (1 << n));
}];
/**
* Bitwise complement
*/
cljm_DOT_core_SLASH_bit_not = [[CLJMVar alloc] initWithValue:^id(id x) {
return (~ x);
}];
/**
* Set bit at index n
*/
cljm_DOT_core_SLASH_bit_set = [[CLJMVar alloc] initWithValue:^id(id x, id n) {
return (x | (1 << n));
}];
/**
* Test bit at index n
*/
cljm_DOT_core_SLASH_bit_test = [[CLJMVar alloc] initWithValue:^id(id x, id n) {
return ((x & (1 << n)) != 0);
}];
/**
* Bitwise shift left
*/
cljm_DOT_core_SLASH_bit_shift_left = [[CLJMVar alloc] initWithValue:^id(id x, id n) {
return (x << n);
}];
/**
* Bitwise shift right
*/
cljm_DOT_core_SLASH_bit_shift_right = [[CLJMVar alloc] initWithValue:^id(id x, id n) {
return (x >> n);
}];
/**
* Bitwise shift right with zero fill
*/
cljm_DOT_core_SLASH_bit_shift_right_zero_fill = [[CLJMVar alloc] initWithValue:^id(id x, id n) {
return (x >>> n);
}];
/**
* Counts the number of bits set in n
*/
cljm_DOT_core_SLASH_bit_count = [[CLJMVar alloc] initWithValue:^id(id v) {
id v__4785 = (v - ((v >> @1) & @1431655765));
id v__4786 = ((v__4785 & @858993459) + ((v__4785 >> @2) & @858993459));
return ((((v__4786 + (v__4786 >> @4)) & @252645135) * @16843009) >> @24);
}];
/**
* Returns non-nil if nums all have the equivalent
* value, otherwise false. Behavior on non nums is
* undefined.
*/
cljm_DOT_core_SLASH__EQ__EQ_ = [[CLJMVar alloc] initWithValue:(function() {
var _EQ__EQ_ = null;
var _EQ__EQ___1 = ^id(id x) {
return @YES;
};
var _EQ__EQ___2 = ^id(id x, id y) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH__equiv.value)(x, y);
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
if(cljm_truthy(((id (^)(id , id , ...)) _EQ__EQ_.value)(x, y, nil))) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_next.value)(more))) {
{
id G__4787 = y;
id G__4788 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(more);
id G__4789 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(more);
x = G__4787;
y = G__4788;
more = G__4789;
continue;
}

} else {
return ((id (^)(id , id , ...)) _EQ__EQ_.value)(y, ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(more), nil);

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
];
/**
* Returns true if num is greater than zero, else false
*/
cljm_DOT_core_SLASH_pos_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id n) {
return (n > @0);
}];
cljm_DOT_core_SLASH_zero_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id n) {
return ([n isEqual:@0]);
}];
/**
* Returns true if num is less than zero, else false
*/
cljm_DOT_core_SLASH_neg_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id x) {
return (x < @0);
}];
/**
* Returns the nth next of coll, (seq coll) when n is 0.
*/
cljm_DOT_core_SLASH_nthnext = [[CLJMVar alloc] initWithValue:^id(id coll, id n) {
id n__4793 = n;
id xs__4794 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(coll);
while(YES) {
if(cljm_truthy({id and__3822__auto____4795 = xs__4794;
if(cljm_truthy(and__3822__auto____4795)) {
return (n__4793 > @0);

} else {
return and__3822__auto____4795;

}
})) {
{
id G__4796 = (n__4793 - @1);
id G__4797 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(xs__4794);
n__4793 = G__4796;
xs__4794 = G__4797;
continue;
}

} else {
return xs__4794;

}
break;
}
}];
/**
* Internal - do not use!
*/
cljm_DOT_core_SLASH_str_STAR_ = [[CLJMVar alloc] initWithValue:(function() {
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
return ((id (^)(id , id )) .value)([gstring_SLASH_StringBuffer.value alloc], ys);
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
];
/**
* With no args, returns the empty string. With one arg x, returns
* x.toString().  (str nil) returns the empty string. With more than
* one arg, returns the concatenation of the str values of the args.
*/
cljm_DOT_core_SLASH_str = [[CLJMVar alloc] initWithValue:(function() {
var str = null;
var str__0 = ^id() {
return @"";
};
var str__1 = ^id(id x) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_symbol_QMARK_.value)(x))) {
return [x substring@2, x.length, nil];

} else {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_keyword_QMARK_.value)(x))) {
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_str_STAR_.value)(@":", [x substring@2, x.length, nil], nil);

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
return ((id (^)(id , id )) .value)([gstring_SLASH_StringBuffer.value alloc], ys);
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
];
/**
* Returns the substring of s beginning at start inclusive, and ending
* at end (defaults to length of string), exclusive.
*/
cljm_DOT_core_SLASH_subs = [[CLJMVar alloc] initWithValue:(function() {
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
];
/**
* Formats a string using goog.string.format.
*/
cljm_DOT_core_SLASH_format = [[CLJMVar alloc] initWithValue:^id(id cljm__varargs, id fmt, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(gstring_SLASH_format.value, fmt, args, nil);
}];
/**
* Returns a Symbol with the given namespace and name.
*/
cljm_DOT_core_SLASH_symbol = [[CLJMVar alloc] initWithValue:(function() {
var symbol = null;
var symbol__1 = ^id(id name) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_symbol_QMARK_.value)(name))) {
name;

} else {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_keyword_QMARK_.value)(name))) {
((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_str_STAR_.value)(@"\uFDD1", @"'", ((id (^)(id , id )) cljm_DOT_core_SLASH_subs.value)(name, @2), nil);

} else {

}

}
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_str_STAR_.value)(@"\uFDD1", @"'", name, nil);
};
var symbol__2 = ^id(id ns, id name) {
return ((id (^)(id )) symbol.value)(((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_str_STAR_.value)(ns, @"/", name, nil));
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
];
/**
* Returns a Keyword with the given namespace and name.  Do not use :
* in the keyword strings, it will be added automatically.
*/
cljm_DOT_core_SLASH_keyword = [[CLJMVar alloc] initWithValue:(function() {
var keyword = null;
var keyword__1 = ^id(id name) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_keyword_QMARK_.value)(name))) {
return name;

} else {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_symbol_QMARK_.value)(name))) {
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_str_STAR_.value)(@"\uFDD0", @"'", ((id (^)(id , id )) cljm_DOT_core_SLASH_subs.value)(name, @2), nil);

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_str_STAR_.value)(@"\uFDD0", @"'", name, nil);

} else {
return nil;

}

}

}
};
var keyword__2 = ^id(id ns, id name) {
return ((id (^)(id )) keyword.value)(((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_str_STAR_.value)(ns, @"/", name, nil));
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
];
/**
* Assumes x is sequential. Returns true if x equals y, otherwise
* returns false.
*/
cljm_DOT_core_SLASH_equiv_sequential = [[CLJMVar alloc] initWithValue:^id(id x, id y) {
return ((id (^)(id )) cljm_DOT_core_SLASH_boolean.value)((cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_sequential_QMARK_.value)(y))) ?{id xs__4800 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(x);
id ys__4801 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(y);
while(YES) {
if(cljm_truthy((xs__4800 == nil))) {
return (ys__4801 == nil);

} else {
if(cljm_truthy((ys__4801 == nil))) {
return @NO;

} else {
if(cljm_truthy(((id (^)(id , id , ...)) cljm_DOT_core_SLASH__EQ_.value)(((id (^)(id )) cljm_DOT_core_SLASH_first.value)(xs__4800), ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(ys__4801), nil))) {
{
id G__4802 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(xs__4800);
id G__4803 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(ys__4801);
xs__4800 = G__4802;
ys__4801 = G__4803;
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
}];
cljm_DOT_core_SLASH_hash_combine = [[CLJMVar alloc] initWithValue:^id(id seed, id hash) {
return (seed ^ (((hash + @2654435769) + (seed << @6)) + (seed >> @2)));
}];
cljm_DOT_core_SLASH_hash_coll = [[CLJMVar alloc] initWithValue:^id(id coll) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(^id(id p1__4804_SHARP_, id p2__4805_SHARP_) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_hash_combine.value)(p1__4804_SHARP_, ((id (^)(id , id )) cljm_DOT_core_SLASH_hash.value)(p2__4805_SHARP_, @NO));
}, ((id (^)(id , id )) cljm_DOT_core_SLASH_hash.value)(((id (^)(id )) cljm_DOT_core_SLASH_first.value)(coll), @NO), ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(coll));
}];
cljm_DOT_core_SLASH_hash_imap = [[CLJMVar alloc] initWithValue:^id(id m) {
id h__4809 = @0;
id s__4810 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(m);
while(YES) {
if(cljm_truthy(s__4810)) {
id e__4811 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(s__4810);
{
id G__4812 = ((h__4809 + (((id (^)(id )) cljm_DOT_core_SLASH_hash.value)(((id (^)(id )) cljm_DOT_core_SLASH_key.value)(e__4811)) ^ ((id (^)(id )) cljm_DOT_core_SLASH_hash.value)(((id (^)(id )) cljm_DOT_core_SLASH_val.value)(e__4811)))) % @4503599627370496);
id G__4813 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(s__4810);
h__4809 = G__4812;
s__4810 = G__4813;
continue;
}

} else {
return h__4809;

}
break;
}
}];
cljm_DOT_core_SLASH_hash_iset = [[CLJMVar alloc] initWithValue:^id(id s) {
id h__4817 = @0;
id s__4818 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(s);
while(YES) {
if(cljm_truthy(s__4818)) {
id e__4819 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(s__4818);
{
id G__4820 = ((h__4817 + ((id (^)(id )) cljm_DOT_core_SLASH_hash.value)(e__4819)) % @4503599627370496);
id G__4821 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(s__4818);
h__4817 = G__4820;
s__4818 = G__4821;
continue;
}

} else {
return h__4817;

}
break;
}
}];
/**
* Takes a JavaScript object and a map of names to functions and
* attaches said functions as methods on the object.  Any references to
* JavaScript's implict this (via the this-as macro) will resolve to the
* object that the function is attached.
*/
cljm_DOT_core_SLASH_extend_object_BANG_ = [[CLJMVar alloc] initWithValue:^id(id obj, id fn_map) {
id G__4842__4843 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(fn_map);
if(cljm_truthy(G__4842__4843)) {
id G__4845__4847 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(G__4842__4843);
id vec__4846__4848 = G__4845__4847;
id key_name__4849 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_nth.value)(vec__4846__4848, @0, nil);
id f__4850 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_nth.value)(vec__4846__4848, @1, nil);
id G__4842__4851 = G__4842__4843;
id G__4845__4852 = G__4845__4847;
id G__4842__4853 = G__4842__4851;
while(YES) {
id vec__4854__4855 = G__4845__4852;
id key_name__4856 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_nth.value)(vec__4854__4855, @0, nil);
id f__4857 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_nth.value)(vec__4854__4855, @1, nil);
id G__4842__4858 = G__4842__4853;
id str_name__4859 = ((id (^)(id )) cljm_DOT_core_SLASH_name.value)(key_name__4856);
(obj[str_name__4859] = f__4857);
id temp__3974__auto____4860 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(G__4842__4858);
if(cljm_truthy(temp__3974__auto____4860)) {
id G__4842__4861 = temp__3974__auto____4860;
{
id G__4862 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(G__4842__4861);
id G__4863 = G__4842__4861;
G__4845__4852 = G__4862;
G__4842__4853 = G__4863;
continue;
}

} else {

}
break;
}

} else {

}
return obj;
}];
cljm_DOT_core_DOT_List_SLASH_EMPTY.value = [cljm_DOT_core_SLASH_EmptyList.value alloc];
cljm_DOT_core_SLASH_reversible_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id coll) {
id G__4867__4868 = coll;
if(cljm_truthy(G__4867__4868)) {
if(cljm_truthy({id or__3824__auto____4869 = (G__4867__4868.cljm$lang$protocol_mask$partition0$ & @134217728);
if(cljm_truthy(or__3824__auto____4869)) {
return or__3824__auto____4869;

} else {
return G__4867__4868.cljm$core$IReversible$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4867__4868.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IReversible.value, G__4867__4868);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IReversible.value, G__4867__4868);

}
}];
cljm_DOT_core_SLASH_rseq = [[CLJMVar alloc] initWithValue:^id(id coll) {
return ((id (^)(id )) cljm_DOT_core_SLASH__rseq.value)(coll);
}];
/**
* Returns a seq of the items in coll in reverse order. Not lazy.
*/
cljm_DOT_core_SLASH_reverse = [[CLJMVar alloc] initWithValue:^id(id coll) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_reversible_QMARK_.value)(coll))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_rseq.value)(coll);

} else {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(cljm_DOT_core_SLASH_conj.value, cljm.core.List.EMPTY, coll);

}
}];
cljm_DOT_core_SLASH_list = [[CLJMVar alloc] initWithValue:(function() {
var list = null;
var list__0 = ^id() {
return cljm.core.List.EMPTY;
};
var list__1 = ^id(id x) {
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_conj.value)(cljm.core.List.EMPTY, x, nil);
};
var list__2 = ^id(id x, id y) {
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_conj.value)(((id (^)(id , ...)) list.value)(y, nil), x, nil);
};
var list__3 = ^id(id x, id y, id z) {
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_conj.value)(((id (^)(id , id , ...)) list.value)(y, z, nil), x, nil);
};
var list__4 = ^id(id cljm__varargs, id x, id y, id z, ...) {
NSMutableArray *items = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[items addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_conj.value)(((id (^)(id , id , ...)) cljm_DOT_core_SLASH_conj.value)(((id (^)(id , id , ...)) cljm_DOT_core_SLASH_conj.value)(((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(cljm_DOT_core_SLASH_conj.value, cljm.core.List.EMPTY, ((id (^)(id )) cljm_DOT_core_SLASH_reverse.value)(items)), z, nil), y, nil), x, nil);
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
];
/**
* Returns a new seq where x is the first element and seq is the rest.
*/
cljm_DOT_core_SLASH_cons = [[CLJMVar alloc] initWithValue:^id(id x, id coll) {
if(cljm_truthy({id or__3824__auto____4874 = (coll == nil);
if(cljm_truthy(or__3824__auto____4874)) {
return or__3824__auto____4874;

} else {
id G__4875__4876 = coll;
if(cljm_truthy(G__4875__4876)) {
if(cljm_truthy({id or__3824__auto____4877 = (G__4875__4876.cljm$lang$protocol_mask$partition0$ & @64);
if(cljm_truthy(or__3824__auto____4877)) {
return or__3824__auto____4877;

} else {
return G__4875__4876.cljm$core$ISeq$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4875__4876.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_ISeq.value, G__4875__4876);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_ISeq.value, G__4875__4876);

}

}
})) {
return [cljm_DOT_core_SLASH_Cons.value alloc];

} else {
return [cljm_DOT_core_SLASH_Cons.value alloc];

}
}];
cljm_DOT_core_SLASH_list_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id x) {
id G__4881__4882 = x;
if(cljm_truthy(G__4881__4882)) {
if(cljm_truthy({id or__3824__auto____4883 = (G__4881__4882.cljm$lang$protocol_mask$partition0$ & @33554432);
if(cljm_truthy(or__3824__auto____4883)) {
return or__3824__auto____4883;

} else {
return G__4881__4882.cljm$core$IList$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4881__4882.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IList.value, G__4881__4882);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IList.value, G__4881__4882);

}
}];
cljm_DOT_core_SLASH_chunk_cons = [[CLJMVar alloc] initWithValue:^id(id chunk, id rest) {
if(cljm_truthy(([((id (^)(id )) cljm_DOT_core_SLASH__count.value)(chunk) isEqual:@0]))) {
return rest;

} else {
return [cljm_DOT_core_SLASH_ChunkedCons.value alloc];

}
}];
cljm_DOT_core_SLASH_chunk_append = [[CLJMVar alloc] initWithValue:^id(id b, id x) {
return [b addx];
}];
cljm_DOT_core_SLASH_chunk = [[CLJMVar alloc] initWithValue:^id(id b) {
return [b chunk];
}];
cljm_DOT_core_SLASH_chunk_first = [[CLJMVar alloc] initWithValue:^id(id s) {
return ((id (^)(id )) cljm_DOT_core_SLASH__chunked_first.value)(s);
}];
cljm_DOT_core_SLASH_chunk_rest = [[CLJMVar alloc] initWithValue:^id(id s) {
return ((id (^)(id )) cljm_DOT_core_SLASH__chunked_rest.value)(s);
}];
cljm_DOT_core_SLASH_chunk_next = [[CLJMVar alloc] initWithValue:^id(id s) {
if(cljm_truthy({id G__4887__4888 = s;
if(cljm_truthy(G__4887__4888)) {
if(cljm_truthy({id or__3824__auto____4889 = nil;
if(cljm_truthy(or__3824__auto____4889)) {
return or__3824__auto____4889;

} else {
return G__4887__4888.cljm$core$IChunkedNext$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__4887__4888.cljm$lang$protocol_mask$partition$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IChunkedNext.value, G__4887__4888);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IChunkedNext.value, G__4887__4888);

}
})) {
return ((id (^)(id )) cljm_DOT_core_SLASH__chunked_next.value)(s);

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(((id (^)(id )) cljm_DOT_core_SLASH__chunked_rest.value)(s));

}
}];
/**
* Naive impl of to-array as a start.
*/
cljm_DOT_core_SLASH_to_array = [[CLJMVar alloc] initWithValue:^id(id s) {
id ary__4892 = @[];
id s__4893 = s;
while(YES) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(s__4893))) {
[ary__4892 push((id (^)(id )) cljm_DOT_core_SLASH_first.value)(s__4893)];
{
id G__4894 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(s__4893);
s__4893 = G__4894;
continue;
}

} else {
return ary__4892;

}
break;
}
}];
/**
* Returns a (potentially-ragged) 2-dimensional array
* containing the contents of coll.
*/
cljm_DOT_core_SLASH_to_array_2d = [[CLJMVar alloc] initWithValue:^id(id coll) {
id ret__4898 = ((id (^)(id )) cljm_DOT_core_SLASH_make_array.value)(((id (^)(id )) cljm_DOT_core_SLASH_count.value)(coll));
id i__4899 = @0;
id xs__4900 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(coll);
while(YES) {
if(cljm_truthy(xs__4900)) {
(ret__4898[i__4899] = ((id (^)(id )) cljm_DOT_core_SLASH_to_array.value)(((id (^)(id )) cljm_DOT_core_SLASH_first.value)(xs__4900)));
{
id G__4901 = (i__4899 + @1);
id G__4902 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(xs__4900);
i__4899 = G__4901;
xs__4900 = G__4902;
continue;
}

} else {

}
break;
}
return ret__4898;
}];
cljm_DOT_core_SLASH_long_array = [[CLJMVar alloc] initWithValue:(function() {
var long_array = null;
var long_array__1 = ^id(id size_or_seq) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_number_QMARK_.value)(size_or_seq))) {
return ((id (^)(id , id )) long_array.value)(size_or_seq, nil);

} else {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_seq_QMARK_.value)(size_or_seq))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_into_array.value)(size_or_seq);

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
throw [Error.value alloc];

} else {
return nil;

}

}

}
};
var long_array__2 = ^id(id size, id init_val_or_seq) {
id a__4910 = ((id (^)(id )) cljm_DOT_core_SLASH_make_array.value)(size);
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_seq_QMARK_.value)(init_val_or_seq))) {
id s__4911 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(init_val_or_seq);
id i__4912 = @0;
id s__4913 = s__4911;
while(YES) {
if(cljm_truthy({id and__3822__auto____4914 = s__4913;
if(cljm_truthy(and__3822__auto____4914)) {
return (i__4912 < size);

} else {
return and__3822__auto____4914;

}
})) {
(a__4910[i__4912] = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(s__4913));
{
id G__4917 = (i__4912 + @1);
id G__4918 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(s__4913);
i__4912 = G__4917;
s__4913 = G__4918;
continue;
}

} else {
return a__4910;

}
break;
}

} else {
id n__1637__auto____4915 = size;
id i__4916 = @0;
while(YES) {
if(cljm_truthy((i__4916 < n__1637__auto____4915))) {
(a__4910[i__4916] = init_val_or_seq);
{
id G__4919 = (i__4916 + @1);
i__4916 = G__4919;
continue;
}

} else {

}
break;
}
return a__4910;

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
];
cljm_DOT_core_SLASH_double_array = [[CLJMVar alloc] initWithValue:(function() {
var double_array = null;
var double_array__1 = ^id(id size_or_seq) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_number_QMARK_.value)(size_or_seq))) {
return ((id (^)(id , id )) double_array.value)(size_or_seq, nil);

} else {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_seq_QMARK_.value)(size_or_seq))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_into_array.value)(size_or_seq);

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
throw [Error.value alloc];

} else {
return nil;

}

}

}
};
var double_array__2 = ^id(id size, id init_val_or_seq) {
id a__4927 = ((id (^)(id )) cljm_DOT_core_SLASH_make_array.value)(size);
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_seq_QMARK_.value)(init_val_or_seq))) {
id s__4928 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(init_val_or_seq);
id i__4929 = @0;
id s__4930 = s__4928;
while(YES) {
if(cljm_truthy({id and__3822__auto____4931 = s__4930;
if(cljm_truthy(and__3822__auto____4931)) {
return (i__4929 < size);

} else {
return and__3822__auto____4931;

}
})) {
(a__4927[i__4929] = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(s__4930));
{
id G__4934 = (i__4929 + @1);
id G__4935 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(s__4930);
i__4929 = G__4934;
s__4930 = G__4935;
continue;
}

} else {
return a__4927;

}
break;
}

} else {
id n__1637__auto____4932 = size;
id i__4933 = @0;
while(YES) {
if(cljm_truthy((i__4933 < n__1637__auto____4932))) {
(a__4927[i__4933] = init_val_or_seq);
{
id G__4936 = (i__4933 + @1);
i__4933 = G__4936;
continue;
}

} else {

}
break;
}
return a__4927;

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
];
cljm_DOT_core_SLASH_object_array = [[CLJMVar alloc] initWithValue:(function() {
var object_array = null;
var object_array__1 = ^id(id size_or_seq) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_number_QMARK_.value)(size_or_seq))) {
return ((id (^)(id , id )) object_array.value)(size_or_seq, nil);

} else {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_seq_QMARK_.value)(size_or_seq))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_into_array.value)(size_or_seq);

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
throw [Error.value alloc];

} else {
return nil;

}

}

}
};
var object_array__2 = ^id(id size, id init_val_or_seq) {
id a__4944 = ((id (^)(id )) cljm_DOT_core_SLASH_make_array.value)(size);
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_seq_QMARK_.value)(init_val_or_seq))) {
id s__4945 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(init_val_or_seq);
id i__4946 = @0;
id s__4947 = s__4945;
while(YES) {
if(cljm_truthy({id and__3822__auto____4948 = s__4947;
if(cljm_truthy(and__3822__auto____4948)) {
return (i__4946 < size);

} else {
return and__3822__auto____4948;

}
})) {
(a__4944[i__4946] = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(s__4947));
{
id G__4951 = (i__4946 + @1);
id G__4952 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(s__4947);
i__4946 = G__4951;
s__4947 = G__4952;
continue;
}

} else {
return a__4944;

}
break;
}

} else {
id n__1637__auto____4949 = size;
id i__4950 = @0;
while(YES) {
if(cljm_truthy((i__4950 < n__1637__auto____4949))) {
(a__4944[i__4950] = init_val_or_seq);
{
id G__4953 = (i__4950 + @1);
i__4950 = G__4953;
continue;
}

} else {

}
break;
}
return a__4944;

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
];
cljm_DOT_core_SLASH_bounded_count = [[CLJMVar alloc] initWithValue:^id(id s, id n) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_counted_QMARK_.value)(s))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_count.value)(s);

} else {
id s__4958 = s;
id i__4959 = n;
id sum__4960 = @0;
while(YES) {
if(cljm_truthy({id and__3822__auto____4961 = (i__4959 > @0);
if(cljm_truthy(and__3822__auto____4961)) {
return ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(s__4958);

} else {
return and__3822__auto____4961;

}
})) {
{
id G__4962 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(s__4958);
id G__4963 = (i__4959 - @1);
id G__4964 = (sum__4960 + @1);
s__4958 = G__4962;
i__4959 = G__4963;
sum__4960 = G__4964;
continue;
}

} else {
return sum__4960;

}
break;
}

}
}];
cljm_DOT_core_SLASH_spread = [[CLJMVar alloc] initWithValue:^id(id arglist) {
if(cljm_truthy((arglist == nil))) {
return nil;

} else {
if(cljm_truthy((((id (^)(id )) cljm_DOT_core_SLASH_next.value)(arglist) == nil))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(((id (^)(id )) cljm_DOT_core_SLASH_first.value)(arglist));

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(((id (^)(id )) cljm_DOT_core_SLASH_first.value)(arglist), ((id (^)(id )) spread.value)(((id (^)(id )) cljm_DOT_core_SLASH_next.value)(arglist)));

} else {
return nil;

}

}

}
}];
/**
* Returns a lazy seq representing the concatenation of the elements in the supplied colls.
*/
cljm_DOT_core_SLASH_concat = [[CLJMVar alloc] initWithValue:(function() {
var concat = null;
var concat__0 = ^id() {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
};
var concat__1 = ^id(id x) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
};
var concat__2 = ^id(id x, id y) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
};
var concat__3 = ^id(id cljm__varargs, id x, id y, ...) {
NSMutableArray *zs = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[zs addObject:cljm__currentObject];
}
va_end(cljm__args);
id cat__4972 = ^id(id xys, id zs) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
};
return ((id (^)(id , id )) cat__4972.value)(((id (^)(id , id , ...)) concat.value)(x, y, nil), zs);
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
];
/**
* Creates a new list containing the items prepended to the rest, the
* last of which will be treated as a sequence.
*/
cljm_DOT_core_SLASH_list_STAR_ = [[CLJMVar alloc] initWithValue:(function() {
var list_STAR_ = null;
var list_STAR___1 = ^id(id args) {
return ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(args);
};
var list_STAR___2 = ^id(id a, id args) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(a, args);
};
var list_STAR___3 = ^id(id a, id b, id args) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(a, ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(b, args));
};
var list_STAR___4 = ^id(id a, id b, id c, id args) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(a, ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(b, ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(c, args)));
};
var list_STAR___5 = ^id(id cljm__varargs, id a, id b, id c, id d, ...) {
NSMutableArray *more = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[more addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(a, ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(b, ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(c, ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(d, ((id (^)(id )) cljm_DOT_core_SLASH_spread.value)(more)))));
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
];
cljm_DOT_core_SLASH_transient = [[CLJMVar alloc] initWithValue:^id(id coll) {
return ((id (^)(id )) cljm_DOT_core_SLASH__as_transient.value)(coll);
}];
cljm_DOT_core_SLASH_persistent_BANG_ = [[CLJMVar alloc] initWithValue:^id(id tcoll) {
return ((id (^)(id )) cljm_DOT_core_SLASH__persistent_BANG_.value)(tcoll);
}];
cljm_DOT_core_SLASH_conj_BANG_ = [[CLJMVar alloc] initWithValue:^id(id tcoll, id val) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH__conj_BANG_.value)(tcoll, val);
}];
cljm_DOT_core_SLASH_assoc_BANG_ = [[CLJMVar alloc] initWithValue:^id(id tcoll, id key, id val) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__assoc_BANG_.value)(tcoll, key, val);
}];
cljm_DOT_core_SLASH_dissoc_BANG_ = [[CLJMVar alloc] initWithValue:^id(id tcoll, id key) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH__dissoc_BANG_.value)(tcoll, key);
}];
cljm_DOT_core_SLASH_pop_BANG_ = [[CLJMVar alloc] initWithValue:^id(id tcoll) {
return ((id (^)(id )) cljm_DOT_core_SLASH__pop_BANG_.value)(tcoll);
}];
cljm_DOT_core_SLASH_disj_BANG_ = [[CLJMVar alloc] initWithValue:^id(id tcoll, id val) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH__disjoin_BANG_.value)(tcoll, val);
}];
cljm_DOT_core_SLASH_apply_to = [[CLJMVar alloc] initWithValue:^id(id f, id argc, id args) {
id args__5014 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(args);
if(cljm_truthy(([argc isEqual:@0]))) {
return ((id (^)()) f.value)();

} else {
id a__5015 = ((id (^)(id )) cljm_DOT_core_SLASH__first.value)(args__5014);
id args__5016 = ((id (^)(id )) cljm_DOT_core_SLASH__rest.value)(args__5014);
if(cljm_truthy(([argc isEqual:@1]))) {
if(cljm_truthy(f.cljm$lang$arity$1)) {
return [f cljma__5015 lang];

} else {
return ((id (^)(id )) f.value)(a__5015);

}

} else {
id b__5017 = ((id (^)(id )) cljm_DOT_core_SLASH__first.value)(args__5016);
id args__5018 = ((id (^)(id )) cljm_DOT_core_SLASH__rest.value)(args__5016);
if(cljm_truthy(([argc isEqual:@2]))) {
if(cljm_truthy(f.cljm$lang$arity$2)) {
return [f cljma__5015 langb__5017 arity];

} else {
return ((id (^)(id , id )) f.value)(a__5015, b__5017);

}

} else {
id c__5019 = ((id (^)(id )) cljm_DOT_core_SLASH__first.value)(args__5018);
id args__5020 = ((id (^)(id )) cljm_DOT_core_SLASH__rest.value)(args__5018);
if(cljm_truthy(([argc isEqual:@3]))) {
if(cljm_truthy(f.cljm$lang$arity$3)) {
return [f cljma__5015 langb__5017 arityc__5019 3];

} else {
return ((id (^)(id , id , id )) f.value)(a__5015, b__5017, c__5019);

}

} else {
id d__5021 = ((id (^)(id )) cljm_DOT_core_SLASH__first.value)(args__5020);
id args__5022 = ((id (^)(id )) cljm_DOT_core_SLASH__rest.value)(args__5020);
if(cljm_truthy(([argc isEqual:@4]))) {
if(cljm_truthy(f.cljm$lang$arity$4)) {
return [f cljma__5015 langb__5017 arityc__5019 4d__5021];

} else {
return ((id (^)(id , id , id , id )) f.value)(a__5015, b__5017, c__5019, d__5021);

}

} else {
id e__5023 = ((id (^)(id )) cljm_DOT_core_SLASH__first.value)(args__5022);
id args__5024 = ((id (^)(id )) cljm_DOT_core_SLASH__rest.value)(args__5022);
if(cljm_truthy(([argc isEqual:@5]))) {
if(cljm_truthy(f.cljm$lang$arity$5)) {
return [f cljma__5015 langb__5017 arityc__5019 5d__5021, e__5023, nil];

} else {
return ((id (^)(id , id , id , id , id )) f.value)(a__5015, b__5017, c__5019, d__5021, e__5023);

}

} else {
id f__5025 = ((id (^)(id )) cljm_DOT_core_SLASH__first.value)(args__5024);
id args__5026 = ((id (^)(id )) cljm_DOT_core_SLASH__rest.value)(args__5024);
if(cljm_truthy(([argc isEqual:@6]))) {
if(cljm_truthy(f__5025.cljm$lang$arity$6)) {
return [f__5025 cljma__5015 langb__5017 arityc__5019 6d__5021, e__5023, f__5025, nil];

} else {
return ((id (^)(id , id , id , id , id , id )) f__5025.value)(a__5015, b__5017, c__5019, d__5021, e__5023, f__5025);

}

} else {
id g__5027 = ((id (^)(id )) cljm_DOT_core_SLASH__first.value)(args__5026);
id args__5028 = ((id (^)(id )) cljm_DOT_core_SLASH__rest.value)(args__5026);
if(cljm_truthy(([argc isEqual:@7]))) {
if(cljm_truthy(f__5025.cljm$lang$arity$7)) {
return [f__5025 cljma__5015 langb__5017 arityc__5019 7d__5021, e__5023, f__5025, g__5027, nil];

} else {
return ((id (^)(id , id , id , id , id , id , id )) f__5025.value)(a__5015, b__5017, c__5019, d__5021, e__5023, f__5025, g__5027);

}

} else {
id h__5029 = ((id (^)(id )) cljm_DOT_core_SLASH__first.value)(args__5028);
id args__5030 = ((id (^)(id )) cljm_DOT_core_SLASH__rest.value)(args__5028);
if(cljm_truthy(([argc isEqual:@8]))) {
if(cljm_truthy(f__5025.cljm$lang$arity$8)) {
return [f__5025 cljma__5015 langb__5017 arityc__5019 8d__5021, e__5023, f__5025, g__5027, h__5029, nil];

} else {
return ((id (^)(id , id , id , id , id , id , id , id )) f__5025.value)(a__5015, b__5017, c__5019, d__5021, e__5023, f__5025, g__5027, h__5029);

}

} else {
id i__5031 = ((id (^)(id )) cljm_DOT_core_SLASH__first.value)(args__5030);
id args__5032 = ((id (^)(id )) cljm_DOT_core_SLASH__rest.value)(args__5030);
if(cljm_truthy(([argc isEqual:@9]))) {
if(cljm_truthy(f__5025.cljm$lang$arity$9)) {
return [f__5025 cljma__5015 langb__5017 arityc__5019 9d__5021, e__5023, f__5025, g__5027, h__5029, i__5031, nil];

} else {
return ((id (^)(id , id , id , id , id , id , id , id , id )) f__5025.value)(a__5015, b__5017, c__5019, d__5021, e__5023, f__5025, g__5027, h__5029, i__5031);

}

} else {
id j__5033 = ((id (^)(id )) cljm_DOT_core_SLASH__first.value)(args__5032);
id args__5034 = ((id (^)(id )) cljm_DOT_core_SLASH__rest.value)(args__5032);
if(cljm_truthy(([argc isEqual:@10]))) {
if(cljm_truthy(f__5025.cljm$lang$arity$10)) {
return [f__5025 cljma__5015 langb__5017 arityc__5019 10d__5021, e__5023, f__5025, g__5027, h__5029, i__5031, j__5033, nil];

} else {
return ((id (^)(id , id , id , id , id , id , id , id , id , id )) f__5025.value)(a__5015, b__5017, c__5019, d__5021, e__5023, f__5025, g__5027, h__5029, i__5031, j__5033);

}

} else {
id k__5035 = ((id (^)(id )) cljm_DOT_core_SLASH__first.value)(args__5034);
id args__5036 = ((id (^)(id )) cljm_DOT_core_SLASH__rest.value)(args__5034);
if(cljm_truthy(([argc isEqual:@11]))) {
if(cljm_truthy(f__5025.cljm$lang$arity$11)) {
return [f__5025 cljma__5015 langb__5017 arityc__5019 11d__5021, e__5023, f__5025, g__5027, h__5029, i__5031, j__5033, k__5035, nil];

} else {
return ((id (^)(id , id , id , id , id , id , id , id , id , id , id )) f__5025.value)(a__5015, b__5017, c__5019, d__5021, e__5023, f__5025, g__5027, h__5029, i__5031, j__5033, k__5035);

}

} else {
id l__5037 = ((id (^)(id )) cljm_DOT_core_SLASH__first.value)(args__5036);
id args__5038 = ((id (^)(id )) cljm_DOT_core_SLASH__rest.value)(args__5036);
if(cljm_truthy(([argc isEqual:@12]))) {
if(cljm_truthy(f__5025.cljm$lang$arity$12)) {
return [f__5025 cljma__5015 langb__5017 arityc__5019 12d__5021, e__5023, f__5025, g__5027, h__5029, i__5031, j__5033, k__5035, l__5037, nil];

} else {
return ((id (^)(id , id , id , id , id , id , id , id , id , id , id , id )) f__5025.value)(a__5015, b__5017, c__5019, d__5021, e__5023, f__5025, g__5027, h__5029, i__5031, j__5033, k__5035, l__5037);

}

} else {
id m__5039 = ((id (^)(id )) cljm_DOT_core_SLASH__first.value)(args__5038);
id args__5040 = ((id (^)(id )) cljm_DOT_core_SLASH__rest.value)(args__5038);
if(cljm_truthy(([argc isEqual:@13]))) {
if(cljm_truthy(f__5025.cljm$lang$arity$13)) {
return [f__5025 cljma__5015 langb__5017 arityc__5019 13d__5021, e__5023, f__5025, g__5027, h__5029, i__5031, j__5033, k__5035, l__5037, m__5039, nil];

} else {
return ((id (^)(id , id , id , id , id , id , id , id , id , id , id , id , id )) f__5025.value)(a__5015, b__5017, c__5019, d__5021, e__5023, f__5025, g__5027, h__5029, i__5031, j__5033, k__5035, l__5037, m__5039);

}

} else {
id n__5041 = ((id (^)(id )) cljm_DOT_core_SLASH__first.value)(args__5040);
id args__5042 = ((id (^)(id )) cljm_DOT_core_SLASH__rest.value)(args__5040);
if(cljm_truthy(([argc isEqual:@14]))) {
if(cljm_truthy(f__5025.cljm$lang$arity$14)) {
return [f__5025 cljma__5015 langb__5017 arityc__5019 14d__5021, e__5023, f__5025, g__5027, h__5029, i__5031, j__5033, k__5035, l__5037, m__5039, n__5041, nil];

} else {
return ((id (^)(id , id , id , id , id , id , id , id , id , id , id , id , id , id )) f__5025.value)(a__5015, b__5017, c__5019, d__5021, e__5023, f__5025, g__5027, h__5029, i__5031, j__5033, k__5035, l__5037, m__5039, n__5041);

}

} else {
id o__5043 = ((id (^)(id )) cljm_DOT_core_SLASH__first.value)(args__5042);
id args__5044 = ((id (^)(id )) cljm_DOT_core_SLASH__rest.value)(args__5042);
if(cljm_truthy(([argc isEqual:@15]))) {
if(cljm_truthy(f__5025.cljm$lang$arity$15)) {
return [f__5025 cljma__5015 langb__5017 arityc__5019 15d__5021, e__5023, f__5025, g__5027, h__5029, i__5031, j__5033, k__5035, l__5037, m__5039, n__5041, o__5043, nil];

} else {
return ((id (^)(id , id , id , id , id , id , id , id , id , id , id , id , id , id , id )) f__5025.value)(a__5015, b__5017, c__5019, d__5021, e__5023, f__5025, g__5027, h__5029, i__5031, j__5033, k__5035, l__5037, m__5039, n__5041, o__5043);

}

} else {
id p__5045 = ((id (^)(id )) cljm_DOT_core_SLASH__first.value)(args__5044);
id args__5046 = ((id (^)(id )) cljm_DOT_core_SLASH__rest.value)(args__5044);
if(cljm_truthy(([argc isEqual:@16]))) {
if(cljm_truthy(f__5025.cljm$lang$arity$16)) {
return [f__5025 cljma__5015 langb__5017 arityc__5019 16d__5021, e__5023, f__5025, g__5027, h__5029, i__5031, j__5033, k__5035, l__5037, m__5039, n__5041, o__5043, p__5045, nil];

} else {
return ((id (^)(id , id , id , id , id , id , id , id , id , id , id , id , id , id , id , id )) f__5025.value)(a__5015, b__5017, c__5019, d__5021, e__5023, f__5025, g__5027, h__5029, i__5031, j__5033, k__5035, l__5037, m__5039, n__5041, o__5043, p__5045);

}

} else {
id q__5047 = ((id (^)(id )) cljm_DOT_core_SLASH__first.value)(args__5046);
id args__5048 = ((id (^)(id )) cljm_DOT_core_SLASH__rest.value)(args__5046);
if(cljm_truthy(([argc isEqual:@17]))) {
if(cljm_truthy(f__5025.cljm$lang$arity$17)) {
return [f__5025 cljma__5015 langb__5017 arityc__5019 17d__5021, e__5023, f__5025, g__5027, h__5029, i__5031, j__5033, k__5035, l__5037, m__5039, n__5041, o__5043, p__5045, q__5047, nil];

} else {
return ((id (^)(id , id , id , id , id , id , id , id , id , id , id , id , id , id , id , id , id )) f__5025.value)(a__5015, b__5017, c__5019, d__5021, e__5023, f__5025, g__5027, h__5029, i__5031, j__5033, k__5035, l__5037, m__5039, n__5041, o__5043, p__5045, q__5047);

}

} else {
id r__5049 = ((id (^)(id )) cljm_DOT_core_SLASH__first.value)(args__5048);
id args__5050 = ((id (^)(id )) cljm_DOT_core_SLASH__rest.value)(args__5048);
if(cljm_truthy(([argc isEqual:@18]))) {
if(cljm_truthy(f__5025.cljm$lang$arity$18)) {
return [f__5025 cljma__5015 langb__5017 arityc__5019 18d__5021, e__5023, f__5025, g__5027, h__5029, i__5031, j__5033, k__5035, l__5037, m__5039, n__5041, o__5043, p__5045, q__5047, r__5049, nil];

} else {
return ((id (^)(id , id , id , id , id , id , id , id , id , id , id , id , id , id , id , id , id , id )) f__5025.value)(a__5015, b__5017, c__5019, d__5021, e__5023, f__5025, g__5027, h__5029, i__5031, j__5033, k__5035, l__5037, m__5039, n__5041, o__5043, p__5045, q__5047, r__5049);

}

} else {
id s__5051 = ((id (^)(id )) cljm_DOT_core_SLASH__first.value)(args__5050);
id args__5052 = ((id (^)(id )) cljm_DOT_core_SLASH__rest.value)(args__5050);
if(cljm_truthy(([argc isEqual:@19]))) {
if(cljm_truthy(f__5025.cljm$lang$arity$19)) {
return [f__5025 cljma__5015 langb__5017 arityc__5019 19d__5021, e__5023, f__5025, g__5027, h__5029, i__5031, j__5033, k__5035, l__5037, m__5039, n__5041, o__5043, p__5045, q__5047, r__5049, s__5051, nil];

} else {
return ((id (^)(id , id , id , id , id , id , id , id , id , id , id , id , id , id , id , id , id , id , id )) f__5025.value)(a__5015, b__5017, c__5019, d__5021, e__5023, f__5025, g__5027, h__5029, i__5031, j__5033, k__5035, l__5037, m__5039, n__5041, o__5043, p__5045, q__5047, r__5049, s__5051);

}

} else {
id t__5053 = ((id (^)(id )) cljm_DOT_core_SLASH__first.value)(args__5052);
id args__5054 = ((id (^)(id )) cljm_DOT_core_SLASH__rest.value)(args__5052);
if(cljm_truthy(([argc isEqual:@20]))) {
if(cljm_truthy(f__5025.cljm$lang$arity$20)) {
return [f__5025 cljma__5015 langb__5017 arityc__5019 20d__5021, e__5023, f__5025, g__5027, h__5029, i__5031, j__5033, k__5035, l__5037, m__5039, n__5041, o__5043, p__5045, q__5047, r__5049, s__5051, t__5053, nil];

} else {
return ((id (^)(id , id , id , id , id , id , id , id , id , id , id , id , id , id , id , id , id , id , id , id )) f__5025.value)(a__5015, b__5017, c__5019, d__5021, e__5023, f__5025, g__5027, h__5029, i__5031, j__5033, k__5035, l__5037, m__5039, n__5041, o__5043, p__5045, q__5047, r__5049, s__5051, t__5053);

}

} else {
throw [Error.value alloc];

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
}];
/**
* Applies fn f to the argument list formed by prepending intervening arguments to args.
* First cut.  Not lazy.  Needs to use emitted toApply.
*/
cljm_DOT_core_SLASH_apply = [[CLJMVar alloc] initWithValue:(function() {
var apply = null;
var apply__2 = ^id(id f, id args) {
id fixed_arity__5069 = f.cljs$lang$maxFixedArity;
if(cljm_truthy(f.cljs$lang$applyTo)) {
id bc__5070 = ((id (^)(id , id )) cljm_DOT_core_SLASH_bounded_count.value)(args, (fixed_arity__5069 + @1));
if(cljm_truthy((bc__5070 <= fixed_arity__5069))) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_apply_to.value)(f, bc__5070, args);

} else {
return [f cljsargs lang];

}

} else {
return [f applyf, ((id (^)(id )) cljm_DOT_core_SLASH_to_array.value)(args), nil];

}
};
var apply__3 = ^id(id f, id x, id args) {
id arglist__5071 = ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_list_STAR_.value)(x, args, nil);
id fixed_arity__5072 = f.cljs$lang$maxFixedArity;
if(cljm_truthy(f.cljs$lang$applyTo)) {
id bc__5073 = ((id (^)(id , id )) cljm_DOT_core_SLASH_bounded_count.value)(arglist__5071, (fixed_arity__5072 + @1));
if(cljm_truthy((bc__5073 <= fixed_arity__5072))) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_apply_to.value)(f, bc__5073, arglist__5071);

} else {
return [f cljsarglist__5071 lang];

}

} else {
return [f applyf, ((id (^)(id )) cljm_DOT_core_SLASH_to_array.value)(arglist__5071), nil];

}
};
var apply__4 = ^id(id f, id x, id y, id args) {
id arglist__5074 = ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_list_STAR_.value)(x, y, args, nil);
id fixed_arity__5075 = f.cljs$lang$maxFixedArity;
if(cljm_truthy(f.cljs$lang$applyTo)) {
id bc__5076 = ((id (^)(id , id )) cljm_DOT_core_SLASH_bounded_count.value)(arglist__5074, (fixed_arity__5075 + @1));
if(cljm_truthy((bc__5076 <= fixed_arity__5075))) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_apply_to.value)(f, bc__5076, arglist__5074);

} else {
return [f cljsarglist__5074 lang];

}

} else {
return [f applyf, ((id (^)(id )) cljm_DOT_core_SLASH_to_array.value)(arglist__5074), nil];

}
};
var apply__5 = ^id(id f, id x, id y, id z, id args) {
id arglist__5077 = ((id (^)(id , id , id , id , ...)) cljm_DOT_core_SLASH_list_STAR_.value)(x, y, z, args, nil);
id fixed_arity__5078 = f.cljs$lang$maxFixedArity;
if(cljm_truthy(f.cljs$lang$applyTo)) {
id bc__5079 = ((id (^)(id , id )) cljm_DOT_core_SLASH_bounded_count.value)(arglist__5077, (fixed_arity__5078 + @1));
if(cljm_truthy((bc__5079 <= fixed_arity__5078))) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_apply_to.value)(f, bc__5079, arglist__5077);

} else {
return [f cljsarglist__5077 lang];

}

} else {
return [f applyf, ((id (^)(id )) cljm_DOT_core_SLASH_to_array.value)(arglist__5077), nil];

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
id arglist__5080 = ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(a, ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(b, ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(c, ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(d, ((id (^)(id )) cljm_DOT_core_SLASH_spread.value)(args)))));
id fixed_arity__5081 = f.cljs$lang$maxFixedArity;
if(cljm_truthy(f.cljs$lang$applyTo)) {
id bc__5082 = ((id (^)(id , id )) cljm_DOT_core_SLASH_bounded_count.value)(arglist__5080, (fixed_arity__5081 + @1));
if(cljm_truthy((bc__5082 <= fixed_arity__5081))) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_apply_to.value)(f, bc__5082, arglist__5080);

} else {
return [f cljsarglist__5080 lang];

}

} else {
return [f applyf, ((id (^)(id )) cljm_DOT_core_SLASH_to_array.value)(arglist__5080), nil];

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
];
/**
* Returns an object of the same type and value as obj, with
* (apply f (meta obj) args) as its metadata.
*/
cljm_DOT_core_SLASH_vary_meta = [[CLJMVar alloc] initWithValue:^id(id cljm__varargs, id obj, id f, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id , id )) cljm_DOT_core_SLASH_with_meta.value)(obj, ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(f, ((id (^)(id )) cljm_DOT_core_SLASH_meta.value)(obj), args, nil));
}];
/**
* Same as (not (= obj1 obj2))
*/
cljm_DOT_core_SLASH_not_EQ_ = [[CLJMVar alloc] initWithValue:(function() {
var not_EQ_ = null;
var not_EQ___1 = ^id(id x) {
return @NO;
};
var not_EQ___2 = ^id(id x, id y) {
return ((id (^)(id )) cljm_DOT_core_SLASH_not.value)(((id (^)(id , id , ...)) cljm_DOT_core_SLASH__EQ_.value)(x, y, nil));
};
var not_EQ___3 = ^id(id cljm__varargs, id x, id y, ...) {
NSMutableArray *more = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[more addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id )) cljm_DOT_core_SLASH_not.value)(((id (^)(id , id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(cljm_DOT_core_SLASH__EQ_.value, x, y, more, nil));
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
];
/**
* If coll is empty, returns nil, else coll
*/
cljm_DOT_core_SLASH_not_empty = [[CLJMVar alloc] initWithValue:^id(id coll) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(coll))) {
return coll;

} else {
return nil;

}
}];
/**
* Returns true if (pred x) is logical true for every x in coll, else
* false.
*/
cljm_DOT_core_SLASH_every_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id pred, id coll) {
while(YES) {
if(cljm_truthy((((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(coll) == nil))) {
return @YES;

} else {
if(cljm_truthy(((id (^)(id )) pred.value)(((id (^)(id )) cljm_DOT_core_SLASH_first.value)(coll)))) {
{
id G__5083 = pred;
id G__5084 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(coll);
pred = G__5083;
coll = G__5084;
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
}];
/**
* Returns false if (pred x) is logical true for every x in
* coll, else true.
*/
cljm_DOT_core_SLASH_not_every_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id pred, id coll) {
return ((id (^)(id )) cljm_DOT_core_SLASH_not.value)(((id (^)(id , id )) cljm_DOT_core_SLASH_every_QMARK_.value)(pred, coll));
}];
/**
* Returns the first logical true value of (pred x) for any x in coll,
* else nil.  One common idiom is to use a set as pred, for example
* this will return :fred if :fred is in the sequence, otherwise nil:
* (some #{:fred} coll)
*/
cljm_DOT_core_SLASH_some = [[CLJMVar alloc] initWithValue:^id(id pred, id coll) {
while(YES) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(coll))) {
id or__3824__auto____5086 = ((id (^)(id )) pred.value)(((id (^)(id )) cljm_DOT_core_SLASH_first.value)(coll));
if(cljm_truthy(or__3824__auto____5086)) {
return or__3824__auto____5086;

} else {
{
id G__5087 = pred;
id G__5088 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(coll);
pred = G__5087;
coll = G__5088;
continue;
}

}

} else {
return nil;

}
break;
}
}];
/**
* Returns false if (pred x) is logical true for any x in coll,
* else true.
*/
cljm_DOT_core_SLASH_not_any_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id pred, id coll) {
return ((id (^)(id )) cljm_DOT_core_SLASH_not.value)(((id (^)(id , id )) cljm_DOT_core_SLASH_some.value)(pred, coll));
}];
/**
* Returns true if n is even, throws an exception if n is not an integer
*/
cljm_DOT_core_SLASH_even_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id n) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_integer_QMARK_.value)(n))) {
return ([(n & @1) isEqual:@0]);

} else {
throw [Error.value alloc];

}
}];
/**
* Returns true if n is odd, throws an exception if n is not an integer
*/
cljm_DOT_core_SLASH_odd_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id n) {
return ((id (^)(id )) cljm_DOT_core_SLASH_not.value)(((id (^)(id )) cljm_DOT_core_SLASH_even_QMARK_.value)(n));
}];
cljm_DOT_core_SLASH_identity = [[CLJMVar alloc] initWithValue:^id(id x) {
return x;
}];
/**
* Takes a fn f and returns a fn that takes the same arguments as f,
* has the same effects, if any, and returns the opposite truth value.
*/
cljm_DOT_core_SLASH_complement = [[CLJMVar alloc] initWithValue:^id(id f) {
return (function() {
var G__5089 = null;
var G__5089__0 = ^id() {
return ((id (^)(id )) cljm_DOT_core_SLASH_not.value)(((id (^)()) f.value)());
};
var G__5089__1 = ^id(id x) {
return ((id (^)(id )) cljm_DOT_core_SLASH_not.value)(((id (^)(id )) f.value)(x));
};
var G__5089__2 = ^id(id x, id y) {
return ((id (^)(id )) cljm_DOT_core_SLASH_not.value)(((id (^)(id , id )) f.value)(x, y));
};
var G__5089__3 = ^id(id cljm__varargs, id x, id y, ...) {
NSMutableArray *zs = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[zs addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id )) cljm_DOT_core_SLASH_not.value)(((id (^)(id , id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(f, x, y, zs, nil));
};
G__5089 = function(x, y, var_args){
var zs = var_args;
switch(arguments.length){
case 0:
return G__5089__0.call(this);
case 1:
return G__5089__1.call(this,x);
case 2:
return G__5089__2.call(this,x, y);
default:
return G__5089__3.cljm$lang$arity$variadic(x, y, cljm.core.array_seq(arguments, 2));
}
throw('Invalid arity: ' + arguments.length);
};
G__5089.cljm$lang$maxFixedArity = 2;
G__5089.cljm$lang$applyTo = G__5089__3.cljm$lang$applyTo;
return G__5089;
})()
}];
/**
* Returns a function that takes any number of arguments and returns x.
*/
cljm_DOT_core_SLASH_constantly = [[CLJMVar alloc] initWithValue:^id(id x) {
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
}];
/**
* Takes a set of functions and returns a fn that is the composition
* of those fns.  The returned fn takes a variable number of args,
* applies the rightmost of fns to the args, the next
* fn (right-to-left) to the result, etc.
*/
cljm_DOT_core_SLASH_comp = [[CLJMVar alloc] initWithValue:(function() {
var comp = null;
var comp__0 = ^id() {
return cljm_DOT_core_SLASH_identity.value;
};
var comp__1 = ^id(id f) {
return f;
};
var comp__2 = ^id(id f, id g) {
return (function() {
var G__5096 = null;
var G__5096__0 = ^id() {
return ((id (^)(id )) f.value)(((id (^)()) g.value)());
};
var G__5096__1 = ^id(id x) {
return ((id (^)(id )) f.value)(((id (^)(id )) g.value)(x));
};
var G__5096__2 = ^id(id x, id y) {
return ((id (^)(id )) f.value)(((id (^)(id , id )) g.value)(x, y));
};
var G__5096__3 = ^id(id x, id y, id z) {
return ((id (^)(id )) f.value)(((id (^)(id , id , id )) g.value)(x, y, z));
};
var G__5096__4 = ^id(id cljm__varargs, id x, id y, id z, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id )) f.value)(((id (^)(id , id , id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(g, x, y, z, args, nil));
};
G__5096 = function(x, y, z, var_args){
var args = var_args;
switch(arguments.length){
case 0:
return G__5096__0.call(this);
case 1:
return G__5096__1.call(this,x);
case 2:
return G__5096__2.call(this,x, y);
case 3:
return G__5096__3.call(this,x, y, z);
default:
return G__5096__4.cljm$lang$arity$variadic(x, y, z, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
G__5096.cljm$lang$maxFixedArity = 3;
G__5096.cljm$lang$applyTo = G__5096__4.cljm$lang$applyTo;
return G__5096;
})()
};
var comp__3 = ^id(id f, id g, id h) {
return (function() {
var G__5097 = null;
var G__5097__0 = ^id() {
return ((id (^)(id )) f.value)(((id (^)(id )) g.value)(((id (^)()) h.value)()));
};
var G__5097__1 = ^id(id x) {
return ((id (^)(id )) f.value)(((id (^)(id )) g.value)(((id (^)(id )) h.value)(x)));
};
var G__5097__2 = ^id(id x, id y) {
return ((id (^)(id )) f.value)(((id (^)(id )) g.value)(((id (^)(id , id )) h.value)(x, y)));
};
var G__5097__3 = ^id(id x, id y, id z) {
return ((id (^)(id )) f.value)(((id (^)(id )) g.value)(((id (^)(id , id , id )) h.value)(x, y, z)));
};
var G__5097__4 = ^id(id cljm__varargs, id x, id y, id z, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id )) f.value)(((id (^)(id )) g.value)(((id (^)(id , id , id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(h, x, y, z, args, nil)));
};
G__5097 = function(x, y, z, var_args){
var args = var_args;
switch(arguments.length){
case 0:
return G__5097__0.call(this);
case 1:
return G__5097__1.call(this,x);
case 2:
return G__5097__2.call(this,x, y);
case 3:
return G__5097__3.call(this,x, y, z);
default:
return G__5097__4.cljm$lang$arity$variadic(x, y, z, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
G__5097.cljm$lang$maxFixedArity = 3;
G__5097.cljm$lang$applyTo = G__5097__4.cljm$lang$applyTo;
return G__5097;
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
id fs__5093 = ((id (^)(id )) cljm_DOT_core_SLASH_reverse.value)(((id (^)(id , id , id , id , ...)) cljm_DOT_core_SLASH_list_STAR_.value)(f1, f2, f3, fs, nil));
return ^id(id cljm__varargs, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
id ret__5094 = ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_apply.value)(((id (^)(id )) cljm_DOT_core_SLASH_first.value)(fs__5093), args, nil);
id fs__5095 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(fs__5093);
while(YES) {
if(cljm_truthy(fs__5095)) {
{
id G__5098 = ((id (^)(id )) .value)(ret__5094);
id G__5099 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(fs__5095);
ret__5094 = G__5098;
fs__5095 = G__5099;
continue;
}

} else {
return ret__5094;

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
];
/**
* Takes a function f and fewer than the normal arguments to f, and
* returns a fn that takes a variable number of additional args. When
* called, the returned function calls f with args + additional args.
*/
cljm_DOT_core_SLASH_partial = [[CLJMVar alloc] initWithValue:(function() {
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
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(f, arg1, args, nil);
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
return ((id (^)(id , id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(f, arg1, arg2, args, nil);
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
return ((id (^)(id , id , id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(f, arg1, arg2, arg3, args, nil);
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
return ((id (^)(id , id , id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(f, arg1, arg2, arg3, ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_concat.value)(more, args, nil), nil);
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
];
/**
* Takes a function f, and returns a function that calls f, replacing
* a nil first argument to f with the supplied value x. Higher arity
* versions can replace arguments in the second and third
* positions (y, z). Note that the function f can take any number of
* arguments, not just the one(s) being nil-patched.
*/
cljm_DOT_core_SLASH_fnil = [[CLJMVar alloc] initWithValue:(function() {
var fnil = null;
var fnil__2 = ^id(id f, id x) {
return (function() {
var G__5100 = null;
var G__5100__1 = ^id(id a) {
return ((id (^)(id )) f.value)((cljm_truthy((a == nil))) ?x:a);
};
var G__5100__2 = ^id(id a, id b) {
return ((id (^)(id , id )) f.value)((cljm_truthy((a == nil))) ?x:a, b);
};
var G__5100__3 = ^id(id a, id b, id c) {
return ((id (^)(id , id , id )) f.value)((cljm_truthy((a == nil))) ?x:a, b, c);
};
var G__5100__4 = ^id(id cljm__varargs, id a, id b, id c, ...) {
NSMutableArray *ds = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[ds addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id , id , id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(f, (cljm_truthy((a == nil))) ?x:a, b, c, ds, nil);
};
G__5100 = function(a, b, c, var_args){
var ds = var_args;
switch(arguments.length){
case 1:
return G__5100__1.call(this,a);
case 2:
return G__5100__2.call(this,a, b);
case 3:
return G__5100__3.call(this,a, b, c);
default:
return G__5100__4.cljm$lang$arity$variadic(a, b, c, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
G__5100.cljm$lang$maxFixedArity = 3;
G__5100.cljm$lang$applyTo = G__5100__4.cljm$lang$applyTo;
return G__5100;
})()
};
var fnil__3 = ^id(id f, id x, id y) {
return (function() {
var G__5101 = null;
var G__5101__2 = ^id(id a, id b) {
return ((id (^)(id , id )) f.value)((cljm_truthy((a == nil))) ?x:a, (cljm_truthy((b == nil))) ?y:b);
};
var G__5101__3 = ^id(id a, id b, id c) {
return ((id (^)(id , id , id )) f.value)((cljm_truthy((a == nil))) ?x:a, (cljm_truthy((b == nil))) ?y:b, c);
};
var G__5101__4 = ^id(id cljm__varargs, id a, id b, id c, ...) {
NSMutableArray *ds = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[ds addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id , id , id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(f, (cljm_truthy((a == nil))) ?x:a, (cljm_truthy((b == nil))) ?y:b, c, ds, nil);
};
G__5101 = function(a, b, c, var_args){
var ds = var_args;
switch(arguments.length){
case 2:
return G__5101__2.call(this,a, b);
case 3:
return G__5101__3.call(this,a, b, c);
default:
return G__5101__4.cljm$lang$arity$variadic(a, b, c, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
G__5101.cljm$lang$maxFixedArity = 3;
G__5101.cljm$lang$applyTo = G__5101__4.cljm$lang$applyTo;
return G__5101;
})()
};
var fnil__4 = ^id(id f, id x, id y, id z) {
return (function() {
var G__5102 = null;
var G__5102__2 = ^id(id a, id b) {
return ((id (^)(id , id )) f.value)((cljm_truthy((a == nil))) ?x:a, (cljm_truthy((b == nil))) ?y:b);
};
var G__5102__3 = ^id(id a, id b, id c) {
return ((id (^)(id , id , id )) f.value)((cljm_truthy((a == nil))) ?x:a, (cljm_truthy((b == nil))) ?y:b, (cljm_truthy((c == nil))) ?z:c);
};
var G__5102__4 = ^id(id cljm__varargs, id a, id b, id c, ...) {
NSMutableArray *ds = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[ds addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id , id , id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(f, (cljm_truthy((a == nil))) ?x:a, (cljm_truthy((b == nil))) ?y:b, (cljm_truthy((c == nil))) ?z:c, ds, nil);
};
G__5102 = function(a, b, c, var_args){
var ds = var_args;
switch(arguments.length){
case 2:
return G__5102__2.call(this,a, b);
case 3:
return G__5102__3.call(this,a, b, c);
default:
return G__5102__4.cljm$lang$arity$variadic(a, b, c, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
G__5102.cljm$lang$maxFixedArity = 3;
G__5102.cljm$lang$applyTo = G__5102__4.cljm$lang$applyTo;
return G__5102;
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
];
/**
* Returns a lazy sequence consisting of the result of applying f to 0
* and the first item of coll, followed by applying f to 1 and the second
* item in coll, etc, until coll is exhausted. Thus function f should
* accept 2 arguments, index and item.
*/
cljm_DOT_core_SLASH_map_indexed = [[CLJMVar alloc] initWithValue:^id(id f, id coll) {
id mapi__5118 = ^id(id idx, id coll) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
};
return ((id (^)(id , id )) mapi__5118.value)(@0, coll);
}];
/**
* Returns a lazy sequence of the non-nil results of (f item). Note,
* this means false return values will be included.  f must be free of
* side-effects.
*/
cljm_DOT_core_SLASH_keep = [[CLJMVar alloc] initWithValue:^id(id f, id coll) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
}];
/**
* Returns a lazy sequence of the non-nil results of (f index item). Note,
* this means false return values will be included.  f must be free of
* side-effects.
*/
cljm_DOT_core_SLASH_keep_indexed = [[CLJMVar alloc] initWithValue:^id(id f, id coll) {
id keepi__5176 = ^id(id idx, id coll) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
};
return ((id (^)(id , id )) keepi__5176.value)(@0, coll);
}];
/**
* Takes a set of predicates and returns a function f that returns true if all of its
* composing predicates return a logical true value against all of its arguments, else it returns
* false. Note that f is short-circuiting in that it will stop execution on the first
* argument that triggers a logical false result against the original predicates.
*/
cljm_DOT_core_SLASH_every_pred = [[CLJMVar alloc] initWithValue:(function() {
var every_pred = null;
var every_pred__1 = ^id(id p) {
return (function() {
var ep1 = null;
var ep1__0 = ^id() {
return @YES;
};
var ep1__1 = ^id(id x) {
return ((id (^)(id )) cljm_DOT_core_SLASH_boolean.value)(((id (^)(id )) p.value)(x));
};
var ep1__2 = ^id(id x, id y) {
return ((id (^)(id )) cljm_DOT_core_SLASH_boolean.value)({id and__3822__auto____5280 = ((id (^)(id )) p.value)(x);
if(cljm_truthy(and__3822__auto____5280)) {
return ((id (^)(id )) p.value)(y);

} else {
return and__3822__auto____5280;

}
});
};
var ep1__3 = ^id(id x, id y, id z) {
return ((id (^)(id )) cljm_DOT_core_SLASH_boolean.value)({id and__3822__auto____5281 = ((id (^)(id )) p.value)(x);
if(cljm_truthy(and__3822__auto____5281)) {
id and__3822__auto____5282 = ((id (^)(id )) p.value)(y);
if(cljm_truthy(and__3822__auto____5282)) {
return ((id (^)(id )) p.value)(z);

} else {
return and__3822__auto____5282;

}

} else {
return and__3822__auto____5281;

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
return ((id (^)(id )) cljm_DOT_core_SLASH_boolean.value)({id and__3822__auto____5283 = ((id (^)(id , id , id , ...)) ep1.value)(x, y, z, nil);
if(cljm_truthy(and__3822__auto____5283)) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_every_QMARK_.value)(p, args);

} else {
return and__3822__auto____5283;

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
return ((id (^)(id )) cljm_DOT_core_SLASH_boolean.value)({id and__3822__auto____5295 = ((id (^)(id )) p1.value)(x);
if(cljm_truthy(and__3822__auto____5295)) {
return ((id (^)(id )) p2.value)(x);

} else {
return and__3822__auto____5295;

}
});
};
var ep2__2 = ^id(id x, id y) {
return ((id (^)(id )) cljm_DOT_core_SLASH_boolean.value)({id and__3822__auto____5296 = ((id (^)(id )) p1.value)(x);
if(cljm_truthy(and__3822__auto____5296)) {
id and__3822__auto____5297 = ((id (^)(id )) p1.value)(y);
if(cljm_truthy(and__3822__auto____5297)) {
id and__3822__auto____5298 = ((id (^)(id )) p2.value)(x);
if(cljm_truthy(and__3822__auto____5298)) {
return ((id (^)(id )) p2.value)(y);

} else {
return and__3822__auto____5298;

}

} else {
return and__3822__auto____5297;

}

} else {
return and__3822__auto____5296;

}
});
};
var ep2__3 = ^id(id x, id y, id z) {
return ((id (^)(id )) cljm_DOT_core_SLASH_boolean.value)({id and__3822__auto____5299 = ((id (^)(id )) p1.value)(x);
if(cljm_truthy(and__3822__auto____5299)) {
id and__3822__auto____5300 = ((id (^)(id )) p1.value)(y);
if(cljm_truthy(and__3822__auto____5300)) {
id and__3822__auto____5301 = ((id (^)(id )) p1.value)(z);
if(cljm_truthy(and__3822__auto____5301)) {
id and__3822__auto____5302 = ((id (^)(id )) p2.value)(x);
if(cljm_truthy(and__3822__auto____5302)) {
id and__3822__auto____5303 = ((id (^)(id )) p2.value)(y);
if(cljm_truthy(and__3822__auto____5303)) {
return ((id (^)(id )) p2.value)(z);

} else {
return and__3822__auto____5303;

}

} else {
return and__3822__auto____5302;

}

} else {
return and__3822__auto____5301;

}

} else {
return and__3822__auto____5300;

}

} else {
return and__3822__auto____5299;

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
return ((id (^)(id )) cljm_DOT_core_SLASH_boolean.value)({id and__3822__auto____5304 = ((id (^)(id , id , id , ...)) ep2.value)(x, y, z, nil);
if(cljm_truthy(and__3822__auto____5304)) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_every_QMARK_.value)(^id(id p1__5151_SHARP_) {
id and__3822__auto____5305 = ((id (^)(id )) p1.value)(p1__5151_SHARP_);
if(cljm_truthy(and__3822__auto____5305)) {
return ((id (^)(id )) p2.value)(p1__5151_SHARP_);

} else {
return and__3822__auto____5305;

}
}, args);

} else {
return and__3822__auto____5304;

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
return ((id (^)(id )) cljm_DOT_core_SLASH_boolean.value)({id and__3822__auto____5324 = ((id (^)(id )) p1.value)(x);
if(cljm_truthy(and__3822__auto____5324)) {
id and__3822__auto____5325 = ((id (^)(id )) p2.value)(x);
if(cljm_truthy(and__3822__auto____5325)) {
return ((id (^)(id )) p3.value)(x);

} else {
return and__3822__auto____5325;

}

} else {
return and__3822__auto____5324;

}
});
};
var ep3__2 = ^id(id x, id y) {
return ((id (^)(id )) cljm_DOT_core_SLASH_boolean.value)({id and__3822__auto____5326 = ((id (^)(id )) p1.value)(x);
if(cljm_truthy(and__3822__auto____5326)) {
id and__3822__auto____5327 = ((id (^)(id )) p2.value)(x);
if(cljm_truthy(and__3822__auto____5327)) {
id and__3822__auto____5328 = ((id (^)(id )) p3.value)(x);
if(cljm_truthy(and__3822__auto____5328)) {
id and__3822__auto____5329 = ((id (^)(id )) p1.value)(y);
if(cljm_truthy(and__3822__auto____5329)) {
id and__3822__auto____5330 = ((id (^)(id )) p2.value)(y);
if(cljm_truthy(and__3822__auto____5330)) {
return ((id (^)(id )) p3.value)(y);

} else {
return and__3822__auto____5330;

}

} else {
return and__3822__auto____5329;

}

} else {
return and__3822__auto____5328;

}

} else {
return and__3822__auto____5327;

}

} else {
return and__3822__auto____5326;

}
});
};
var ep3__3 = ^id(id x, id y, id z) {
return ((id (^)(id )) cljm_DOT_core_SLASH_boolean.value)({id and__3822__auto____5331 = ((id (^)(id )) p1.value)(x);
if(cljm_truthy(and__3822__auto____5331)) {
id and__3822__auto____5332 = ((id (^)(id )) p2.value)(x);
if(cljm_truthy(and__3822__auto____5332)) {
id and__3822__auto____5333 = ((id (^)(id )) p3.value)(x);
if(cljm_truthy(and__3822__auto____5333)) {
id and__3822__auto____5334 = ((id (^)(id )) p1.value)(y);
if(cljm_truthy(and__3822__auto____5334)) {
id and__3822__auto____5335 = ((id (^)(id )) p2.value)(y);
if(cljm_truthy(and__3822__auto____5335)) {
id and__3822__auto____5336 = ((id (^)(id )) p3.value)(y);
if(cljm_truthy(and__3822__auto____5336)) {
id and__3822__auto____5337 = ((id (^)(id )) p1.value)(z);
if(cljm_truthy(and__3822__auto____5337)) {
id and__3822__auto____5338 = ((id (^)(id )) p2.value)(z);
if(cljm_truthy(and__3822__auto____5338)) {
return ((id (^)(id )) p3.value)(z);

} else {
return and__3822__auto____5338;

}

} else {
return and__3822__auto____5337;

}

} else {
return and__3822__auto____5336;

}

} else {
return and__3822__auto____5335;

}

} else {
return and__3822__auto____5334;

}

} else {
return and__3822__auto____5333;

}

} else {
return and__3822__auto____5332;

}

} else {
return and__3822__auto____5331;

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
return ((id (^)(id )) cljm_DOT_core_SLASH_boolean.value)({id and__3822__auto____5339 = ((id (^)(id , id , id , ...)) ep3.value)(x, y, z, nil);
if(cljm_truthy(and__3822__auto____5339)) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_every_QMARK_.value)(^id(id p1__5152_SHARP_) {
id and__3822__auto____5340 = ((id (^)(id )) p1.value)(p1__5152_SHARP_);
if(cljm_truthy(and__3822__auto____5340)) {
id and__3822__auto____5341 = ((id (^)(id )) p2.value)(p1__5152_SHARP_);
if(cljm_truthy(and__3822__auto____5341)) {
return ((id (^)(id )) p3.value)(p1__5152_SHARP_);

} else {
return and__3822__auto____5341;

}

} else {
return and__3822__auto____5340;

}
}, args);

} else {
return and__3822__auto____5339;

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
id ps__5342 = ((id (^)(id , id , id , id , ...)) cljm_DOT_core_SLASH_list_STAR_.value)(p1, p2, p3, ps, nil);
return (function() {
var epn = null;
var epn__0 = ^id() {
return @YES;
};
var epn__1 = ^id(id x) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_every_QMARK_.value)(^id(id p1__5153_SHARP_) {
return ((id (^)(id )) p1__5153_SHARP_.value)(x);
}, ps__5342);
};
var epn__2 = ^id(id x, id y) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_every_QMARK_.value)(^id(id p1__5154_SHARP_) {
id and__3822__auto____5347 = ((id (^)(id )) p1__5154_SHARP_.value)(x);
if(cljm_truthy(and__3822__auto____5347)) {
return ((id (^)(id )) p1__5154_SHARP_.value)(y);

} else {
return and__3822__auto____5347;

}
}, ps__5342);
};
var epn__3 = ^id(id x, id y, id z) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_every_QMARK_.value)(^id(id p1__5155_SHARP_) {
id and__3822__auto____5348 = ((id (^)(id )) p1__5155_SHARP_.value)(x);
if(cljm_truthy(and__3822__auto____5348)) {
id and__3822__auto____5349 = ((id (^)(id )) p1__5155_SHARP_.value)(y);
if(cljm_truthy(and__3822__auto____5349)) {
return ((id (^)(id )) p1__5155_SHARP_.value)(z);

} else {
return and__3822__auto____5349;

}

} else {
return and__3822__auto____5348;

}
}, ps__5342);
};
var epn__4 = ^id(id cljm__varargs, id x, id y, id z, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id )) cljm_DOT_core_SLASH_boolean.value)({id and__3822__auto____5350 = ((id (^)(id , id , id , ...)) epn.value)(x, y, z, nil);
if(cljm_truthy(and__3822__auto____5350)) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_every_QMARK_.value)(^id(id p1__5156_SHARP_) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_every_QMARK_.value)(p1__5156_SHARP_, args);
}, ps__5342);

} else {
return and__3822__auto____5350;

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
];
/**
* Takes a set of predicates and returns a function f that returns the first logical true value
* returned by one of its composing predicates against any of its arguments, else it returns
* logical false. Note that f is short-circuiting in that it will stop execution on the first
* argument that triggers a logical true result against the original predicates.
*/
cljm_DOT_core_SLASH_some_fn = [[CLJMVar alloc] initWithValue:(function() {
var some_fn = null;
var some_fn__1 = ^id(id p) {
return (function() {
var sp1 = null;
var sp1__0 = ^id() {
return nil;
};
var sp1__1 = ^id(id x) {
return ((id (^)(id )) p.value)(x);
};
var sp1__2 = ^id(id x, id y) {
id or__3824__auto____5431 = ((id (^)(id )) p.value)(x);
if(cljm_truthy(or__3824__auto____5431)) {
return or__3824__auto____5431;

} else {
return ((id (^)(id )) p.value)(y);

}
};
var sp1__3 = ^id(id x, id y, id z) {
id or__3824__auto____5432 = ((id (^)(id )) p.value)(x);
if(cljm_truthy(or__3824__auto____5432)) {
return or__3824__auto____5432;

} else {
id or__3824__auto____5433 = ((id (^)(id )) p.value)(y);
if(cljm_truthy(or__3824__auto____5433)) {
return or__3824__auto____5433;

} else {
return ((id (^)(id )) p.value)(z);

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
id or__3824__auto____5434 = ((id (^)(id , id , id , ...)) sp1.value)(x, y, z, nil);
if(cljm_truthy(or__3824__auto____5434)) {
return or__3824__auto____5434;

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_some.value)(p, args);

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
id or__3824__auto____5446 = ((id (^)(id )) p1.value)(x);
if(cljm_truthy(or__3824__auto____5446)) {
return or__3824__auto____5446;

} else {
return ((id (^)(id )) p2.value)(x);

}
};
var sp2__2 = ^id(id x, id y) {
id or__3824__auto____5447 = ((id (^)(id )) p1.value)(x);
if(cljm_truthy(or__3824__auto____5447)) {
return or__3824__auto____5447;

} else {
id or__3824__auto____5448 = ((id (^)(id )) p1.value)(y);
if(cljm_truthy(or__3824__auto____5448)) {
return or__3824__auto____5448;

} else {
id or__3824__auto____5449 = ((id (^)(id )) p2.value)(x);
if(cljm_truthy(or__3824__auto____5449)) {
return or__3824__auto____5449;

} else {
return ((id (^)(id )) p2.value)(y);

}

}

}
};
var sp2__3 = ^id(id x, id y, id z) {
id or__3824__auto____5450 = ((id (^)(id )) p1.value)(x);
if(cljm_truthy(or__3824__auto____5450)) {
return or__3824__auto____5450;

} else {
id or__3824__auto____5451 = ((id (^)(id )) p1.value)(y);
if(cljm_truthy(or__3824__auto____5451)) {
return or__3824__auto____5451;

} else {
id or__3824__auto____5452 = ((id (^)(id )) p1.value)(z);
if(cljm_truthy(or__3824__auto____5452)) {
return or__3824__auto____5452;

} else {
id or__3824__auto____5453 = ((id (^)(id )) p2.value)(x);
if(cljm_truthy(or__3824__auto____5453)) {
return or__3824__auto____5453;

} else {
id or__3824__auto____5454 = ((id (^)(id )) p2.value)(y);
if(cljm_truthy(or__3824__auto____5454)) {
return or__3824__auto____5454;

} else {
return ((id (^)(id )) p2.value)(z);

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
id or__3824__auto____5455 = ((id (^)(id , id , id , ...)) sp2.value)(x, y, z, nil);
if(cljm_truthy(or__3824__auto____5455)) {
return or__3824__auto____5455;

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_some.value)(^id(id p1__5195_SHARP_) {
id or__3824__auto____5456 = ((id (^)(id )) p1.value)(p1__5195_SHARP_);
if(cljm_truthy(or__3824__auto____5456)) {
return or__3824__auto____5456;

} else {
return ((id (^)(id )) p2.value)(p1__5195_SHARP_);

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
id or__3824__auto____5475 = ((id (^)(id )) p1.value)(x);
if(cljm_truthy(or__3824__auto____5475)) {
return or__3824__auto____5475;

} else {
id or__3824__auto____5476 = ((id (^)(id )) p2.value)(x);
if(cljm_truthy(or__3824__auto____5476)) {
return or__3824__auto____5476;

} else {
return ((id (^)(id )) p3.value)(x);

}

}
};
var sp3__2 = ^id(id x, id y) {
id or__3824__auto____5477 = ((id (^)(id )) p1.value)(x);
if(cljm_truthy(or__3824__auto____5477)) {
return or__3824__auto____5477;

} else {
id or__3824__auto____5478 = ((id (^)(id )) p2.value)(x);
if(cljm_truthy(or__3824__auto____5478)) {
return or__3824__auto____5478;

} else {
id or__3824__auto____5479 = ((id (^)(id )) p3.value)(x);
if(cljm_truthy(or__3824__auto____5479)) {
return or__3824__auto____5479;

} else {
id or__3824__auto____5480 = ((id (^)(id )) p1.value)(y);
if(cljm_truthy(or__3824__auto____5480)) {
return or__3824__auto____5480;

} else {
id or__3824__auto____5481 = ((id (^)(id )) p2.value)(y);
if(cljm_truthy(or__3824__auto____5481)) {
return or__3824__auto____5481;

} else {
return ((id (^)(id )) p3.value)(y);

}

}

}

}

}
};
var sp3__3 = ^id(id x, id y, id z) {
id or__3824__auto____5482 = ((id (^)(id )) p1.value)(x);
if(cljm_truthy(or__3824__auto____5482)) {
return or__3824__auto____5482;

} else {
id or__3824__auto____5483 = ((id (^)(id )) p2.value)(x);
if(cljm_truthy(or__3824__auto____5483)) {
return or__3824__auto____5483;

} else {
id or__3824__auto____5484 = ((id (^)(id )) p3.value)(x);
if(cljm_truthy(or__3824__auto____5484)) {
return or__3824__auto____5484;

} else {
id or__3824__auto____5485 = ((id (^)(id )) p1.value)(y);
if(cljm_truthy(or__3824__auto____5485)) {
return or__3824__auto____5485;

} else {
id or__3824__auto____5486 = ((id (^)(id )) p2.value)(y);
if(cljm_truthy(or__3824__auto____5486)) {
return or__3824__auto____5486;

} else {
id or__3824__auto____5487 = ((id (^)(id )) p3.value)(y);
if(cljm_truthy(or__3824__auto____5487)) {
return or__3824__auto____5487;

} else {
id or__3824__auto____5488 = ((id (^)(id )) p1.value)(z);
if(cljm_truthy(or__3824__auto____5488)) {
return or__3824__auto____5488;

} else {
id or__3824__auto____5489 = ((id (^)(id )) p2.value)(z);
if(cljm_truthy(or__3824__auto____5489)) {
return or__3824__auto____5489;

} else {
return ((id (^)(id )) p3.value)(z);

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
id or__3824__auto____5490 = ((id (^)(id , id , id , ...)) sp3.value)(x, y, z, nil);
if(cljm_truthy(or__3824__auto____5490)) {
return or__3824__auto____5490;

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_some.value)(^id(id p1__5196_SHARP_) {
id or__3824__auto____5491 = ((id (^)(id )) p1.value)(p1__5196_SHARP_);
if(cljm_truthy(or__3824__auto____5491)) {
return or__3824__auto____5491;

} else {
id or__3824__auto____5492 = ((id (^)(id )) p2.value)(p1__5196_SHARP_);
if(cljm_truthy(or__3824__auto____5492)) {
return or__3824__auto____5492;

} else {
return ((id (^)(id )) p3.value)(p1__5196_SHARP_);

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
id ps__5493 = ((id (^)(id , id , id , id , ...)) cljm_DOT_core_SLASH_list_STAR_.value)(p1, p2, p3, ps, nil);
return (function() {
var spn = null;
var spn__0 = ^id() {
return nil;
};
var spn__1 = ^id(id x) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_some.value)(^id(id p1__5197_SHARP_) {
return ((id (^)(id )) p1__5197_SHARP_.value)(x);
}, ps__5493);
};
var spn__2 = ^id(id x, id y) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_some.value)(^id(id p1__5198_SHARP_) {
id or__3824__auto____5498 = ((id (^)(id )) p1__5198_SHARP_.value)(x);
if(cljm_truthy(or__3824__auto____5498)) {
return or__3824__auto____5498;

} else {
return ((id (^)(id )) p1__5198_SHARP_.value)(y);

}
}, ps__5493);
};
var spn__3 = ^id(id x, id y, id z) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_some.value)(^id(id p1__5199_SHARP_) {
id or__3824__auto____5499 = ((id (^)(id )) p1__5199_SHARP_.value)(x);
if(cljm_truthy(or__3824__auto____5499)) {
return or__3824__auto____5499;

} else {
id or__3824__auto____5500 = ((id (^)(id )) p1__5199_SHARP_.value)(y);
if(cljm_truthy(or__3824__auto____5500)) {
return or__3824__auto____5500;

} else {
return ((id (^)(id )) p1__5199_SHARP_.value)(z);

}

}
}, ps__5493);
};
var spn__4 = ^id(id cljm__varargs, id x, id y, id z, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
id or__3824__auto____5501 = ((id (^)(id , id , id , ...)) spn.value)(x, y, z, nil);
if(cljm_truthy(or__3824__auto____5501)) {
return or__3824__auto____5501;

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_some.value)(^id(id p1__5200_SHARP_) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_some.value)(p1__5200_SHARP_, args);
}, ps__5493);

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
];
/**
* Returns a lazy sequence consisting of the result of applying f to the
* set of first items of each coll, followed by applying f to the set
* of second items in each coll, until any one of the colls is
* exhausted.  Any remaining items in other colls are ignored. Function
* f should accept number-of-colls arguments.
*/
cljm_DOT_core_SLASH_map = [[CLJMVar alloc] initWithValue:(function() {
var map = null;
var map__2 = ^id(id f, id coll) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
};
var map__3 = ^id(id f, id c1, id c2) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
};
var map__4 = ^id(id f, id c1, id c2, id c3) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
};
var map__5 = ^id(id cljm__varargs, id f, id c1, id c2, id c3, ...) {
NSMutableArray *colls = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[colls addObject:cljm__currentObject];
}
va_end(cljm__args);
id step__5537 = ^id(id cs) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
};
return ((id (^)(id , id , ...)) map.value)(^id(id p1__5351_SHARP_) {
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_apply.value)(f, p1__5351_SHARP_, nil);
}, ((id (^)(id )) step__5537.value)(((id (^)(id , id , id , id , ...)) cljm_DOT_core_SLASH_conj.value)(colls, c3, c2, c1, nil)), nil);
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
];
/**
* Returns a lazy sequence of the first n items in coll, or all items if
* there are fewer than n.
*/
cljm_DOT_core_SLASH_take = [[CLJMVar alloc] initWithValue:^id(id n, id coll) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
}];
/**
* Returns a lazy sequence of all but the first n items in coll.
*/
cljm_DOT_core_SLASH_drop = [[CLJMVar alloc] initWithValue:^id(id n, id coll) {
id step__5547 = ^id(id n, id coll) {
while(YES) {
id s__5545 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(coll);
if(cljm_truthy({id and__3822__auto____5546 = (n > @0);
if(cljm_truthy(and__3822__auto____5546)) {
return s__5545;

} else {
return and__3822__auto____5546;

}
})) {
{
id G__5548 = (n - @1);
id G__5549 = ((id (^)(id )) cljm_DOT_core_SLASH_rest.value)(s__5545);
n = G__5548;
coll = G__5549;
continue;
}

} else {
return s__5545;

}
break;
}
};
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
}];
/**
* Return a lazy sequence of all but the last n (default 1) items in coll
*/
cljm_DOT_core_SLASH_drop_last = [[CLJMVar alloc] initWithValue:(function() {
var drop_last = null;
var drop_last__1 = ^id(id s) {
return ((id (^)(id , id )) drop_last.value)(@1, s);
};
var drop_last__2 = ^id(id n, id s) {
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_map.value)(^id(id x, id _) {
return x;
}, s, ((id (^)(id , id )) cljm_DOT_core_SLASH_drop.value)(n, s), nil);
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
];
/**
* Returns a seq of the last n items in coll.  Depending on the type
* of coll may be no better than linear time.  For vectors, see also subvec.
*/
cljm_DOT_core_SLASH_take_last = [[CLJMVar alloc] initWithValue:^id(id n, id coll) {
id s__5552 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(coll);
id lead__5553 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(((id (^)(id , id )) cljm_DOT_core_SLASH_drop.value)(n, coll));
while(YES) {
if(cljm_truthy(lead__5553)) {
{
id G__5554 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(s__5552);
id G__5555 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(lead__5553);
s__5552 = G__5554;
lead__5553 = G__5555;
continue;
}

} else {
return s__5552;

}
break;
}
}];
/**
* Returns a lazy sequence of the items in coll starting from the first
* item for which (pred item) returns nil.
*/
cljm_DOT_core_SLASH_drop_while = [[CLJMVar alloc] initWithValue:^id(id pred, id coll) {
id step__5561 = ^id(id pred, id coll) {
while(YES) {
id s__5559 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(coll);
if(cljm_truthy({id and__3822__auto____5560 = s__5559;
if(cljm_truthy(and__3822__auto____5560)) {
return ((id (^)(id )) pred.value)(((id (^)(id )) cljm_DOT_core_SLASH_first.value)(s__5559));

} else {
return and__3822__auto____5560;

}
})) {
{
id G__5562 = pred;
id G__5563 = ((id (^)(id )) cljm_DOT_core_SLASH_rest.value)(s__5559);
pred = G__5562;
coll = G__5563;
continue;
}

} else {
return s__5559;

}
break;
}
};
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
}];
/**
* Returns a lazy (infinite!) sequence of repetitions of the items in coll.
*/
cljm_DOT_core_SLASH_cycle = [[CLJMVar alloc] initWithValue:^id(id coll) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
}];
/**
* Returns a vector of [(take n coll) (drop n coll)]
*/
cljm_DOT_core_SLASH_split_at = [[CLJMVar alloc] initWithValue:^id(id n, id coll) {
return @[ ((id (^)(id , id )) cljm_DOT_core_SLASH_take.value)(n, coll), ((id (^)(id , id )) cljm_DOT_core_SLASH_drop.value)(n, coll) ];
}];
/**
* Returns a lazy (infinite!, or length n if supplied) sequence of xs.
*/
cljm_DOT_core_SLASH_repeat = [[CLJMVar alloc] initWithValue:(function() {
var repeat = null;
var repeat__1 = ^id(id x) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
};
var repeat__2 = ^id(id n, id x) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_take.value)(n, ((id (^)(id )) repeat.value)(x));
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
];
/**
* Returns a lazy seq of n xs.
*/
cljm_DOT_core_SLASH_replicate = [[CLJMVar alloc] initWithValue:^id(id n, id x) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_take.value)(n, ((id (^)(id )) cljm_DOT_core_SLASH_repeat.value)(x));
}];
/**
* Takes a function of no args, presumably with side effects, and
* returns an infinite (or length n if supplied) lazy sequence of calls
* to it
*/
cljm_DOT_core_SLASH_repeatedly = [[CLJMVar alloc] initWithValue:(function() {
var repeatedly = null;
var repeatedly__1 = ^id(id f) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
};
var repeatedly__2 = ^id(id n, id f) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_take.value)(n, ((id (^)(id )) repeatedly.value)(f));
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
];
/**
* Returns a lazy sequence of x, (f x), (f (f x)) etc. f must be free of side-effects
*/
cljm_DOT_core_SLASH_iterate = [[CLJMVar alloc] initWithValue:^id(id f, id x) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(x, [cljm_DOT_core_SLASH_LazySeq.value alloc]);
}];
/**
* Returns a lazy seq of the first item in each coll, then the second etc.
*/
cljm_DOT_core_SLASH_interleave = [[CLJMVar alloc] initWithValue:(function() {
var interleave = null;
var interleave__2 = ^id(id c1, id c2) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
};
var interleave__3 = ^id(id cljm__varargs, id c1, id c2, ...) {
NSMutableArray *colls = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[colls addObject:cljm__currentObject];
}
va_end(cljm__args);
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
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
];
/**
* Returns a lazy seq of the elements of coll separated by sep
*/
cljm_DOT_core_SLASH_interpose = [[CLJMVar alloc] initWithValue:^id(id sep, id coll) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_drop.value)(@1, ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_interleave.value)(((id (^)(id )) cljm_DOT_core_SLASH_repeat.value)(sep), coll, nil));
}];
/**
* Take a collection of collections, and return a lazy seq
* of items from the inner collection
*/
cljm_DOT_core_SLASH_flatten1 = [[CLJMVar alloc] initWithValue:^id(id colls) {
id cat__5585 = ^id(id coll, id colls) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
};
return ((id (^)(id , id )) cat__5585.value)(nil, colls);
}];
/**
* Returns the result of applying concat to the result of applying map
* to f and colls.  Thus function f should return a collection.
*/
cljm_DOT_core_SLASH_mapcat = [[CLJMVar alloc] initWithValue:(function() {
var mapcat = null;
var mapcat__2 = ^id(id f, id coll) {
return ((id (^)(id )) cljm_DOT_core_SLASH_flatten1.value)(((id (^)(id , id , ...)) cljm_DOT_core_SLASH_map.value)(f, coll, nil));
};
var mapcat__3 = ^id(id cljm__varargs, id f, id coll, ...) {
NSMutableArray *colls = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[colls addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id )) cljm_DOT_core_SLASH_flatten1.value)(((id (^)(id , id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(cljm_DOT_core_SLASH_map.value, f, coll, colls, nil));
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
];
/**
* Returns a lazy sequence of the items in coll for which
* (pred item) returns true. pred must be free of side-effects.
*/
cljm_DOT_core_SLASH_filter = [[CLJMVar alloc] initWithValue:^id(id pred, id coll) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
}];
/**
* Returns a lazy sequence of the items in coll for which
* (pred item) returns false. pred must be free of side-effects.
*/
cljm_DOT_core_SLASH_remove = [[CLJMVar alloc] initWithValue:^id(id pred, id coll) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_filter.value)(((id (^)(id )) cljm_DOT_core_SLASH_complement.value)(pred), coll);
}];
/**
* Returns a lazy sequence of the nodes in a tree, via a depth-first walk.
* branch? must be a fn of one arg that returns true if passed a node
* that can have children (but may not).  children must be a fn of one
* arg that returns a sequence of the children. Will only be called on
* nodes for which branch? returns true. Root is the root node of the
* tree.
*/
cljm_DOT_core_SLASH_tree_seq = [[CLJMVar alloc] initWithValue:^id(id branch_QMARK_, id children, id root) {
id walk__5606 = ^id(id node) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
};
return ((id (^)(id )) walk__5606.value)(root);
}];
/**
* Takes any nested combination of sequential things (lists, vectors,
* etc.) and returns their contents as a single, flat sequence.
* (flatten nil) returns nil.
*/
cljm_DOT_core_SLASH_flatten = [[CLJMVar alloc] initWithValue:^id(id x) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_filter.value)(^id(id p1__5604_SHARP_) {
return ((id (^)(id )) cljm_DOT_core_SLASH_not.value)(((id (^)(id )) cljm_DOT_core_SLASH_sequential_QMARK_.value)(p1__5604_SHARP_));
}, ((id (^)(id )) cljm_DOT_core_SLASH_rest.value)(((id (^)(id , id , id )) cljm_DOT_core_SLASH_tree_seq.value)(cljm_DOT_core_SLASH_sequential_QMARK_.value, cljm_DOT_core_SLASH_seq.value, x)));
}];
/**
* Returns a new coll consisting of to-coll with all of the items of
* from-coll conjoined.
*/
cljm_DOT_core_SLASH_into = [[CLJMVar alloc] initWithValue:^id(id to, id from) {
if(cljm_truthy({id G__5610__5611 = to;
if(cljm_truthy(G__5610__5611)) {
if(cljm_truthy({id or__3824__auto____5612 = (G__5610__5611.cljm$lang$protocol_mask$partition1$ & @1);
if(cljm_truthy(or__3824__auto____5612)) {
return or__3824__auto____5612;

} else {
return G__5610__5611.cljm$core$IEditableCollection$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__5610__5611.cljm$lang$protocol_mask$partition1$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IEditableCollection.value, G__5610__5611);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IEditableCollection.value, G__5610__5611);

}
})) {
return ((id (^)(id )) cljm_DOT_core_SLASH_persistent_BANG_.value)(((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(cljm_DOT_core_SLASH__conj_BANG_.value, ((id (^)(id )) cljm_DOT_core_SLASH_transient.value)(to), from));

} else {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(cljm_DOT_core_SLASH__conj.value, to, from);

}
}];
/**
* Returns a vector consisting of the result of applying f to the
* set of first items of each coll, followed by applying f to the set
* of second items in each coll, until any one of the colls is
* exhausted.  Any remaining items in other colls are ignored. Function
* f should accept number-of-colls arguments.
*/
cljm_DOT_core_SLASH_mapv = [[CLJMVar alloc] initWithValue:(function() {
var mapv = null;
var mapv__2 = ^id(id f, id coll) {
return ((id (^)(id )) cljm_DOT_core_SLASH_persistent_BANG_.value)(((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(^id(id v, id o) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_conj_BANG_.value)(v, ((id (^)(id )) f.value)(o));
}, ((id (^)(id )) cljm_DOT_core_SLASH_transient.value)(@[]), coll));
};
var mapv__3 = ^id(id f, id c1, id c2) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_into.value)(@[], ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_map.value)(f, c1, c2, nil));
};
var mapv__4 = ^id(id f, id c1, id c2, id c3) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_into.value)(@[], ((id (^)(id , id , id , id , ...)) cljm_DOT_core_SLASH_map.value)(f, c1, c2, c3, nil));
};
var mapv__5 = ^id(id cljm__varargs, id f, id c1, id c2, id c3, ...) {
NSMutableArray *colls = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[colls addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id , id )) cljm_DOT_core_SLASH_into.value)(@[], ((id (^)(id , id , id , id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(cljm_DOT_core_SLASH_map.value, f, c1, c2, c3, colls, nil));
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
];
/**
* Returns a vector of the items in coll for which
* (pred item) returns true. pred must be free of side-effects.
*/
cljm_DOT_core_SLASH_filterv = [[CLJMVar alloc] initWithValue:^id(id pred, id coll) {
return ((id (^)(id )) cljm_DOT_core_SLASH_persistent_BANG_.value)(((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(^id(id v, id o) {
if(cljm_truthy(((id (^)(id )) pred.value)(o))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_conj_BANG_.value)(v, o);

} else {
return v;

}
}, ((id (^)(id )) cljm_DOT_core_SLASH_transient.value)(@[]), coll));
}];
/**
* Returns a lazy sequence of lists of n items each, at offsets step
* apart. If step is not supplied, defaults to n, i.e. the partitions
* do not overlap. If a pad collection is supplied, use its elements as
* necessary to complete last partition upto n items. In case there are
* not enough padding elements, return a partition with less than n items.
*/
cljm_DOT_core_SLASH_partition = [[CLJMVar alloc] initWithValue:(function() {
var partition = null;
var partition__2 = ^id(id n, id coll) {
return ((id (^)(id , id , id )) partition.value)(n, n, coll);
};
var partition__3 = ^id(id n, id step, id coll) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
};
var partition__4 = ^id(id n, id step, id pad, id coll) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
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
];
/**
* Returns the value in a nested associative structure,
* where ks is a sequence of keys. Returns nil if the key is not present,
* or the not-found value if supplied.
*/
cljm_DOT_core_SLASH_get_in = [[CLJMVar alloc] initWithValue:(function() {
var get_in = null;
var get_in__2 = ^id(id m, id ks) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(cljm_DOT_core_SLASH_get.value, m, ks);
};
var get_in__3 = ^id(id m, id ks, id not_found) {
id sentinel__5629 = cljm_DOT_core_SLASH_lookup_sentinel.value;
id m__5630 = m;
id ks__5631 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(ks);
while(YES) {
if(cljm_truthy(ks__5631)) {
id m__5632 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(m__5630, ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(ks__5631), sentinel__5629);
if(cljm_truthy(([sentinel__5629 isEqual:m__5632]))) {
return not_found;

} else {
{
id G__5633 = sentinel__5629;
id G__5634 = m__5632;
id G__5635 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(ks__5631);
sentinel__5629 = G__5633;
m__5630 = G__5634;
ks__5631 = G__5635;
continue;
}

}

} else {
return m__5630;

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
];
/**
* Associates a value in a nested associative structure, where ks is a
* sequence of keys and v is the new value and returns a new nested structure.
* If any levels do not exist, hash-maps will be created.
*/
cljm_DOT_core_SLASH_assoc_in = [[CLJMVar alloc] initWithValue:^id(id m, id p__5636, id v) {
id vec__5641__5642 = p__5636;
id k__5643 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_nth.value)(vec__5641__5642, @0, nil);
id ks__5644 = ((id (^)(id , id )) cljm_DOT_core_SLASH_nthnext.value)(vec__5641__5642, @1);
if(cljm_truthy(ks__5644)) {
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_assoc.value)(m, k__5643, ((id (^)(id , id , id )) assoc_in.value)(((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(m, k__5643, nil), ks__5644, v), nil);

} else {
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_assoc.value)(m, k__5643, v, nil);

}
}];
/**
* 'Updates' a value in a nested associative structure, where ks is a
* sequence of keys and f is a function that will take the old value
* and any supplied args and return the new value, and returns a new
* nested structure.  If any levels do not exist, hash-maps will be
* created.
*/
cljm_DOT_core_SLASH_update_in = [[CLJMVar alloc] initWithValue:^id(id cljm__varargs, id m, id p__5645, id f, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
id vec__5650__5651 = p__5645;
id k__5652 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_nth.value)(vec__5650__5651, @0, nil);
id ks__5653 = ((id (^)(id , id )) cljm_DOT_core_SLASH_nthnext.value)(vec__5650__5651, @1);
if(cljm_truthy(ks__5653)) {
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_assoc.value)(m, k__5652, ((id (^)(id , id , id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(update_in.value, ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(m, k__5652, nil), ks__5653, f, args, nil), nil);

} else {
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_assoc.value)(m, k__5652, ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(f, ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(m, k__5652, nil), args, nil), nil);

}
}];

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
cljm_DOT_core_SLASH_Vector.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_Vector.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/Vector", nil);
};
cljm_DOT_core_SLASH_Vector.value.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__5656 = this;
id h__1302__auto____5657 = this__5656_DOT___hash;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((h__1302__auto____5657 == nil)))) {
return h__1302__auto____5657;

} else {
id h__1302__auto____5658 = ((id (^)(id )) cljm_DOT_core_SLASH_hash_coll.value)(coll);
this__5656_DOT___hash = h__1302__auto____5658;
return h__1302__auto____5658;

}
};
cljm_DOT_core_SLASH_Vector.value.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id coll, id k) {
var this__5659 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__nth.value)(coll, k, nil);
};
cljm_DOT_core_SLASH_Vector.value.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id coll, id k, id not_found) {
var this__5660 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__nth.value)(coll, k, not_found);
};
cljm_DOT_core_SLASH_Vector.value.prototype.cljm$core$IAssociative$_assoc$arity$3 = ^id(id coll, id k, id v) {
var this__5661 = this;
id new_array__5662 = this__5661_DOT_array.slice();
(new_array__5662[k] = v);
return [cljm_DOT_core_SLASH_Vector.value alloc];
};
cljm_DOT_core_SLASH_Vector.value.prototype.call = (function() {
var G__5693 = null;
var G__5693__2 = ^id(id this_sym5663, id k) {
var this__5665 = this;
id this_sym5663__5666 = this;
id coll__5667 = this_sym5663__5666;
return ((id (^)(id , id )) cljm_DOT_core_SLASH__lookup.value)(coll__5667, k);
};
var G__5693__3 = ^id(id this_sym5664, id k, id not_found) {
var this__5665 = this;
id this_sym5664__5668 = this;
id coll__5669 = this_sym5664__5668;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(coll__5669, k, not_found);
};
G__5693 = function(this_sym5664, k, not_found){
switch(arguments.length){
case 2:
return G__5693__2.call(this,this_sym5664, k);
case 3:
return G__5693__3.call(this,this_sym5664, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__5693;
})()
;
cljm_DOT_core_SLASH_Vector.value.prototype.apply = ^id(id this_sym5654, id args5655) {
var this__5670 = this;
return [this_sym5654.call applythis_sym5654, [@[this_sym5654] concatargs5655.slice()], nil];
};
cljm_DOT_core_SLASH_Vector.value.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id o) {
var this__5671 = this;
id new_array__5672 = this__5671_DOT_array.slice();
[new_array__5672 pusho];
return [cljm_DOT_core_SLASH_Vector.value alloc];
};
cljm_DOT_core_SLASH_Vector.value.prototype.toString = ^id() {
var this__5673 = this;
id this__5674 = this;
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_pr_str.value)(this__5674, nil);
};
cljm_DOT_core_SLASH_Vector.value.prototype.cljm$core$IReduce$_reduce$arity$2 = ^id(id v, id f) {
var this__5675 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_ci_reduce.value)(this__5675_DOT_array, f);
};
cljm_DOT_core_SLASH_Vector.value.prototype.cljm$core$IReduce$_reduce$arity$3 = ^id(id v, id f, id start) {
var this__5676 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_ci_reduce.value)(this__5676_DOT_array, f, start);
};
cljm_DOT_core_SLASH_Vector.value.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id coll) {
var this__5677 = this;
if(cljm_truthy((this__5677_DOT_array.length > @0))) {
id vector_seq__5678 = ^id(id i) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
};
return ((id (^)(id )) vector_seq__5678.value)(@0);

} else {
return nil;

}
};
cljm_DOT_core_SLASH_Vector.value.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__5679 = this;
return this__5679_DOT_array.length;
};
cljm_DOT_core_SLASH_Vector.value.prototype.cljm$core$IStack$_peek$arity$1 = ^id(id coll) {
var this__5680 = this;
id count__5681 = this__5680_DOT_array.length;
if(cljm_truthy((count__5681 > @0))) {
return (this__5680_DOT_array[(count__5681 - @1)]);

} else {
return nil;

}
};
cljm_DOT_core_SLASH_Vector.value.prototype.cljm$core$IStack$_pop$arity$1 = ^id(id coll) {
var this__5682 = this;
if(cljm_truthy((this__5682_DOT_array.length > @0))) {
id new_array__5683 = this__5682_DOT_array.slice();
[new_array__5683 pop];
return [cljm_DOT_core_SLASH_Vector.value alloc];

} else {
throw [Error.value alloc];

}
};
cljm_DOT_core_SLASH_Vector.value.prototype.cljm$core$IVector$_assoc_n$arity$3 = ^id(id coll, id n, id val) {
var this__5684 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__assoc.value)(coll, n, val);
};
cljm_DOT_core_SLASH_Vector.value.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__5685 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_equiv_sequential.value)(coll, other);
};
cljm_DOT_core_SLASH_Vector.value.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__5686 = this;
return [cljm_DOT_core_SLASH_Vector.value alloc];
};
cljm_DOT_core_SLASH_Vector.value.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__5687 = this;
return this__5687_DOT_meta;
};
cljm_DOT_core_SLASH_Vector.value.prototype.cljm$core$IIndexed$_nth$arity$2 = ^id(id coll, id n) {
var this__5688 = this;
if(cljm_truthy({id and__3822__auto____5689 = (@0 <= n);
if(cljm_truthy(and__3822__auto____5689)) {
return (n < this__5688_DOT_array.length);

} else {
return and__3822__auto____5689;

}
})) {
return (this__5688_DOT_array[n]);

} else {
return nil;

}
};
cljm_DOT_core_SLASH_Vector.value.prototype.cljm$core$IIndexed$_nth$arity$3 = ^id(id coll, id n, id not_found) {
var this__5690 = this;
if(cljm_truthy({id and__3822__auto____5691 = (@0 <= n);
if(cljm_truthy(and__3822__auto____5691)) {
return (n < this__5690_DOT_array.length);

} else {
return and__3822__auto____5691;

}
})) {
return (this__5690_DOT_array[n]);

} else {
return not_found;

}
};
cljm_DOT_core_SLASH_Vector.value.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__5692 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_with_meta.value)(cljs_DOT_core_DOT_Vector_SLASH_EMPTY.value, this__5692_DOT_meta);
};
cljm_DOT_core_SLASH_Vector.value;
cljs_DOT_core_DOT_Vector_SLASH_EMPTY.value = [cljm_DOT_core_SLASH_Vector.value alloc];
cljs_DOT_core_DOT_Vector_SLASH_fromArray.value = ^id(id xs) {
return [cljm_DOT_core_SLASH_Vector.value alloc];
};

/**
* @constructor
*/
cljm_DOT_core_SLASH_VectorNode = (function (edit, arr){
this.edit = edit;
this.arr = arr;
})
cljm_DOT_core_SLASH_VectorNode.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_VectorNode.value.cljm$lang$ctorPrSeq = ^id(id this__1420__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/VectorNode", nil);
};
cljm_DOT_core_SLASH_VectorNode.value;
cljm_DOT_core_SLASH_pv_fresh_node = [[CLJMVar alloc] initWithValue:^id(id edit) {
return [cljm_DOT_core_SLASH_VectorNode.value alloc];
}];
cljm_DOT_core_SLASH_pv_aget = [[CLJMVar alloc] initWithValue:^id(id node, id idx) {
return (node.arr[idx]);
}];
cljm_DOT_core_SLASH_pv_aset = [[CLJMVar alloc] initWithValue:^id(id node, id idx, id val) {
return (node.arr[idx] = val);
}];
cljm_DOT_core_SLASH_pv_clone_node = [[CLJMVar alloc] initWithValue:^id(id node) {
return [cljm_DOT_core_SLASH_VectorNode.value alloc];
}];
cljm_DOT_core_SLASH_tail_off = [[CLJMVar alloc] initWithValue:^id(id pv) {
id cnt__5695 = pv.cnt;
if(cljm_truthy((cnt__5695 < @32))) {
return @0;

} else {
return (((cnt__5695 - @1) >>> @5) << @5);

}
}];
cljm_DOT_core_SLASH_new_path = [[CLJMVar alloc] initWithValue:^id(id edit, id level, id node) {
id ll__5701 = level;
id ret__5702 = node;
while(YES) {
if(cljm_truthy(([ll__5701 isEqual:@0]))) {
return ret__5702;

} else {
id embed__5703 = ret__5702;
id r__5704 = ((id (^)(id )) cljm_DOT_core_SLASH_pv_fresh_node.value)(edit);
id ___5705 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_pv_aset.value)(r__5704, @0, embed__5703);
{
id G__5706 = (ll__5701 - @5);
id G__5707 = r__5704;
ll__5701 = G__5706;
ret__5702 = G__5707;
continue;
}

}
break;
}
}];
cljm_DOT_core_SLASH_push_tail = [[CLJMVar alloc] initWithValue:^id(id pv, id level, id parent, id tailnode) {
id ret__5713 = ((id (^)(id )) cljm_DOT_core_SLASH_pv_clone_node.value)(parent);
id subidx__5714 = (((pv.cnt - @1) >>> level) & @31);
if(cljm_truthy(([@5 isEqual:level]))) {
((id (^)(id , id , id )) cljm_DOT_core_SLASH_pv_aset.value)(ret__5713, subidx__5714, tailnode);
return ret__5713;

} else {
id child__5715 = ((id (^)(id , id )) cljm_DOT_core_SLASH_pv_aget.value)(parent, subidx__5714);
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((child__5715 == nil)))) {
id node_to_insert__5716 = ((id (^)(id , id , id , id )) push_tail.value)(pv, (level - @5), child__5715, tailnode);
((id (^)(id , id , id )) cljm_DOT_core_SLASH_pv_aset.value)(ret__5713, subidx__5714, node_to_insert__5716);
return ret__5713;

} else {
id node_to_insert__5717 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_new_path.value)(nil, (level - @5), tailnode);
((id (^)(id , id , id )) cljm_DOT_core_SLASH_pv_aset.value)(ret__5713, subidx__5714, node_to_insert__5717);
return ret__5713;

}

}
}];
cljm_DOT_core_SLASH_array_for = [[CLJMVar alloc] initWithValue:^id(id pv, id i) {
if(cljm_truthy({id and__3822__auto____5721 = (@0 <= i);
if(cljm_truthy(and__3822__auto____5721)) {
return (i < pv.cnt);

} else {
return and__3822__auto____5721;

}
})) {
if(cljm_truthy((i >= ((id (^)(id )) cljm_DOT_core_SLASH_tail_off.value)(pv)))) {
return pv.tail;

} else {
id node__5722 = pv.root;
id level__5723 = pv.shift;
while(YES) {
if(cljm_truthy((level__5723 > @0))) {
{
id G__5724 = ((id (^)(id , id )) cljm_DOT_core_SLASH_pv_aget.value)(node__5722, ((i >>> level__5723) & @31));
id G__5725 = (level__5723 - @5);
node__5722 = G__5724;
level__5723 = G__5725;
continue;
}

} else {
return node__5722.arr;

}
break;
}

}

} else {
throw [Error.value alloc];

}
}];
cljm_DOT_core_SLASH_do_assoc = [[CLJMVar alloc] initWithValue:^id(id pv, id level, id node, id i, id val) {
id ret__5728 = ((id (^)(id )) cljm_DOT_core_SLASH_pv_clone_node.value)(node);
if(cljm_truthy(([level isEqual:@0]))) {
((id (^)(id , id , id )) cljm_DOT_core_SLASH_pv_aset.value)(ret__5728, (i & @31), val);
return ret__5728;

} else {
id subidx__5729 = ((i >>> level) & @31);
((id (^)(id , id , id )) cljm_DOT_core_SLASH_pv_aset.value)(ret__5728, subidx__5729, ((id (^)(id , id , id , id , id )) do_assoc.value)(pv, (level - @5), ((id (^)(id , id )) cljm_DOT_core_SLASH_pv_aget.value)(node, subidx__5729), i, val));
return ret__5728;

}
}];
cljm_DOT_core_SLASH_pop_tail = [[CLJMVar alloc] initWithValue:^id(id pv, id level, id node) {
id subidx__5735 = (((pv.cnt - @2) >>> level) & @31);
if(cljm_truthy((level > @5))) {
id new_child__5736 = ((id (^)(id , id , id )) pop_tail.value)(pv, (level - @5), ((id (^)(id , id )) cljm_DOT_core_SLASH_pv_aget.value)(node, subidx__5735));
if(cljm_truthy({id and__3822__auto____5737 = (new_child__5736 == nil);
if(cljm_truthy(and__3822__auto____5737)) {
return ([subidx__5735 isEqual:@0]);

} else {
return and__3822__auto____5737;

}
})) {
return nil;

} else {
id ret__5738 = ((id (^)(id )) cljm_DOT_core_SLASH_pv_clone_node.value)(node);
((id (^)(id , id , id )) cljm_DOT_core_SLASH_pv_aset.value)(ret__5738, subidx__5735, new_child__5736);
return ret__5738;

}

} else {
if(cljm_truthy(([subidx__5735 isEqual:@0]))) {
return nil;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
id ret__5739 = ((id (^)(id )) cljm_DOT_core_SLASH_pv_clone_node.value)(node);
((id (^)(id , id , id )) cljm_DOT_core_SLASH_pv_aset.value)(ret__5739, subidx__5735, nil);
return ret__5739;

} else {
return nil;

}

}

}
}];

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
cljm_DOT_core_SLASH_PersistentVector.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_PersistentVector.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/PersistentVector", nil);
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$IEditableCollection$_as_transient$arity$1 = ^id(id coll) {
var this__5742 = this;
return [cljm_DOT_core_SLASH_TransientVector.value alloc];
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__5743 = this;
id h__1302__auto____5744 = this__5743_DOT___hash;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((h__1302__auto____5744 == nil)))) {
return h__1302__auto____5744;

} else {
id h__1302__auto____5745 = ((id (^)(id )) cljm_DOT_core_SLASH_hash_coll.value)(coll);
this__5743_DOT___hash = h__1302__auto____5745;
return h__1302__auto____5745;

}
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id coll, id k) {
var this__5746 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__nth.value)(coll, k, nil);
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id coll, id k, id not_found) {
var this__5747 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__nth.value)(coll, k, not_found);
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$IAssociative$_assoc$arity$3 = ^id(id coll, id k, id v) {
var this__5748 = this;
if(cljm_truthy({id and__3822__auto____5749 = (@0 <= k);
if(cljm_truthy(and__3822__auto____5749)) {
return (k < this__5748_DOT_cnt);

} else {
return and__3822__auto____5749;

}
})) {
if(cljm_truthy((((id (^)(id )) cljm_DOT_core_SLASH_tail_off.value)(coll) <= k))) {
id new_tail__5750 = this__5748_DOT_tail.slice();
(new_tail__5750[(k & @31)] = v);
return [cljm_DOT_core_SLASH_PersistentVector.value alloc];

} else {
return [cljm_DOT_core_SLASH_PersistentVector.value alloc];

}

} else {
if(cljm_truthy(([k isEqual:this__5748_DOT_cnt]))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH__conj.value)(coll, v);

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
throw [Error.value alloc];

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.call = (function() {
var G__5798 = null;
var G__5798__2 = ^id(id this_sym5751, id k) {
var this__5753 = this;
id this_sym5751__5754 = this;
id coll__5755 = this_sym5751__5754;
return ((id (^)(id , id )) cljm_DOT_core_SLASH__lookup.value)(coll__5755, k);
};
var G__5798__3 = ^id(id this_sym5752, id k, id not_found) {
var this__5753 = this;
id this_sym5752__5756 = this;
id coll__5757 = this_sym5752__5756;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(coll__5757, k, not_found);
};
G__5798 = function(this_sym5752, k, not_found){
switch(arguments.length){
case 2:
return G__5798__2.call(this,this_sym5752, k);
case 3:
return G__5798__3.call(this,this_sym5752, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__5798;
})()
;
cljm_DOT_core_SLASH_PersistentVector.value.prototype.apply = ^id(id this_sym5740, id args5741) {
var this__5758 = this;
return [this_sym5740.call applythis_sym5740, [@[this_sym5740] concatargs5741.slice()], nil];
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$IKVReduce$_kv_reduce$arity$3 = ^id(id v, id f, id init) {
var this__5759 = this;
id step_init__5760 = @[@0,init];
id i__5761 = @0;
while(YES) {
if(cljm_truthy((i__5761 < this__5759_DOT_cnt))) {
id arr__5762 = ((id (^)(id , id )) cljm_DOT_core_SLASH_array_for.value)(v, i__5761);
id len__5763 = arr__5762.length;
id init__5767 = {id j__5764 = @0;
id init__5765 = (step_init__5760[@1]);
while(YES) {
if(cljm_truthy((j__5764 < len__5763))) {
id init__5766 = ((id (^)(id , id , id )) f.value)(init__5765, (j__5764 + i__5761), (arr__5762[j__5764]));
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_reduced_QMARK_.value)(init__5766))) {
return init__5766;

} else {
{
id G__5799 = (j__5764 + @1);
id G__5800 = init__5766;
j__5764 = G__5799;
init__5765 = G__5800;
continue;
}

}

} else {
(step_init__5760[@0] = len__5763);
(step_init__5760[@1] = init__5765);
return init__5765;

}
break;
}
};
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_reduced_QMARK_.value)(init__5767))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(init__5767);

} else {
{
id G__5801 = (i__5761 + (step_init__5760[@0]));
i__5761 = G__5801;
continue;
}

}

} else {
return (step_init__5760[@1]);

}
break;
}
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id o) {
var this__5768 = this;
if(cljm_truthy(((this__5768_DOT_cnt - ((id (^)(id )) cljm_DOT_core_SLASH_tail_off.value)(coll)) < @32))) {
id new_tail__5769 = this__5768_DOT_tail.slice();
[new_tail__5769 pusho];
return [cljm_DOT_core_SLASH_PersistentVector.value alloc];

} else {
id root_overflow_QMARK___5770 = ((this__5768_DOT_cnt >>> @5) > (@1 << this__5768_DOT_shift));
id new_shift__5771 = (cljm_truthy(root_overflow_QMARK___5770)) ?(this__5768_DOT_shift + @5):this__5768_DOT_shift;
id new_root__5773 = (cljm_truthy(root_overflow_QMARK___5770)) ?{id n_r__5772 = ((id (^)(id )) cljm_DOT_core_SLASH_pv_fresh_node.value)(nil);
((id (^)(id , id , id )) cljm_DOT_core_SLASH_pv_aset.value)(n_r__5772, @0, this__5768_DOT_root);
((id (^)(id , id , id )) cljm_DOT_core_SLASH_pv_aset.value)(n_r__5772, @1, ((id (^)(id , id , id )) cljm_DOT_core_SLASH_new_path.value)(nil, this__5768_DOT_shift, [cljm_DOT_core_SLASH_VectorNode.value alloc]));
return n_r__5772;
}:((id (^)(id , id , id , id )) cljm_DOT_core_SLASH_push_tail.value)(coll, this__5768_DOT_shift, this__5768_DOT_root, [cljm_DOT_core_SLASH_VectorNode.value alloc]);
return [cljm_DOT_core_SLASH_PersistentVector.value alloc];

}
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$IReversible$_rseq$arity$1 = ^id(id coll) {
var this__5774 = this;
if(cljm_truthy((this__5774_DOT_cnt > @0))) {
return [cljm_DOT_core_SLASH_RSeq.value alloc];

} else {
return cljm.core.List.EMPTY;

}
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$IMapEntry$_key$arity$1 = ^id(id coll) {
var this__5775 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH__nth.value)(coll, @0);
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$IMapEntry$_val$arity$1 = ^id(id coll) {
var this__5776 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH__nth.value)(coll, @1);
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.toString = ^id() {
var this__5777 = this;
id this__5778 = this;
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_pr_str.value)(this__5778, nil);
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$IReduce$_reduce$arity$2 = ^id(id v, id f) {
var this__5779 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_ci_reduce.value)(v, f);
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$IReduce$_reduce$arity$3 = ^id(id v, id f, id start) {
var this__5780 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_ci_reduce.value)(v, f, start);
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id coll) {
var this__5781 = this;
if(cljm_truthy(([this__5781_DOT_cnt isEqual:@0]))) {
return nil;

} else {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_chunked_seq.value)(coll, @0, @0);

}
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__5782 = this;
return this__5782_DOT_cnt;
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$IStack$_peek$arity$1 = ^id(id coll) {
var this__5783 = this;
if(cljm_truthy((this__5783_DOT_cnt > @0))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH__nth.value)(coll, (this__5783_DOT_cnt - @1));

} else {
return nil;

}
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$IStack$_pop$arity$1 = ^id(id coll) {
var this__5784 = this;
if(cljm_truthy(([this__5784_DOT_cnt isEqual:@0]))) {
throw [Error.value alloc];

} else {
if(cljm_truthy(([@1 isEqual:this__5784_DOT_cnt]))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH__with_meta.value)(cljs_DOT_core_DOT_PersistentVector_SLASH_EMPTY.value, this__5784_DOT_meta);

} else {
if(cljm_truthy((@1 < (this__5784_DOT_cnt - ((id (^)(id )) cljm_DOT_core_SLASH_tail_off.value)(coll))))) {
return [cljm_DOT_core_SLASH_PersistentVector.value alloc];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
id new_tail__5785 = ((id (^)(id , id )) cljm_DOT_core_SLASH_array_for.value)(coll, (this__5784_DOT_cnt - @2));
id nr__5786 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_pop_tail.value)(coll, this__5784_DOT_shift, this__5784_DOT_root);
id new_root__5787 = (cljm_truthy((nr__5786 == nil))) ?cljs_DOT_core_DOT_PersistentVector_SLASH_EMPTY_NODE.value:nr__5786;
id cnt_1__5788 = (this__5784_DOT_cnt - @1);
if(cljm_truthy({id and__3822__auto____5789 = (@5 < this__5784_DOT_shift);
if(cljm_truthy(and__3822__auto____5789)) {
return (((id (^)(id , id )) cljm_DOT_core_SLASH_pv_aget.value)(new_root__5787, @1) == nil);

} else {
return and__3822__auto____5789;

}
})) {
return [cljm_DOT_core_SLASH_PersistentVector.value alloc];

} else {
return [cljm_DOT_core_SLASH_PersistentVector.value alloc];

}

} else {
return nil;

}

}

}

}
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$IVector$_assoc_n$arity$3 = ^id(id coll, id n, id val) {
var this__5790 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__assoc.value)(coll, n, val);
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__5791 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_equiv_sequential.value)(coll, other);
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__5792 = this;
return [cljm_DOT_core_SLASH_PersistentVector.value alloc];
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__5793 = this;
return this__5793_DOT_meta;
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$IIndexed$_nth$arity$2 = ^id(id coll, id n) {
var this__5794 = this;
return (((id (^)(id , id )) cljm_DOT_core_SLASH_array_for.value)(coll, n)[(n & @31)]);
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$IIndexed$_nth$arity$3 = ^id(id coll, id n, id not_found) {
var this__5795 = this;
if(cljm_truthy({id and__3822__auto____5796 = (@0 <= n);
if(cljm_truthy(and__3822__auto____5796)) {
return (n < this__5795_DOT_cnt);

} else {
return and__3822__auto____5796;

}
})) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH__nth.value)(coll, n);

} else {
return not_found;

}
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__5797 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_with_meta.value)(cljs_DOT_core_DOT_PersistentVector_SLASH_EMPTY.value, this__5797_DOT_meta);
};
cljm_DOT_core_SLASH_PersistentVector.value;
cljs_DOT_core_DOT_PersistentVector_SLASH_EMPTY_NODE.value = ((id (^)(id )) cljm_DOT_core_SLASH_pv_fresh_node.value)(nil);
cljs_DOT_core_DOT_PersistentVector_SLASH_EMPTY.value = [cljm_DOT_core_SLASH_PersistentVector.value alloc];
cljs_DOT_core_DOT_PersistentVector_SLASH_fromArray.value = ^id(id xs, id no_clone) {
id l__5802 = [xs count];
id xs__5803 = (cljm_truthy(([no_clone isEqual:@YES]))) ?xs:xs.slice();
if(cljm_truthy((l__5802 < @32))) {
return [cljm_DOT_core_SLASH_PersistentVector.value alloc];

} else {
id node__5804 = [xs__5803 slice@0, @32, nil];
id v__5805 = [cljm_DOT_core_SLASH_PersistentVector.value alloc];
id i__5806 = @32;
id out__5807 = ((id (^)(id )) cljm_DOT_core_SLASH__as_transient.value)(v__5805);
while(YES) {
if(cljm_truthy((i__5806 < l__5802))) {
{
id G__5808 = (i__5806 + @1);
id G__5809 = ((id (^)(id , id )) cljm_DOT_core_SLASH_conj_BANG_.value)(out__5807, (xs__5803[i__5806]));
i__5806 = G__5808;
out__5807 = G__5809;
continue;
}

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH_persistent_BANG_.value)(out__5807);

}
break;
}

}
};
cljm_DOT_core_SLASH_vec = [[CLJMVar alloc] initWithValue:^id(id coll) {
return ((id (^)(id )) cljm_DOT_core_SLASH__persistent_BANG_.value)(((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(cljm_DOT_core_SLASH__conj_BANG_.value, ((id (^)(id )) cljm_DOT_core_SLASH__as_transient.value)(cljs_DOT_core_DOT_PersistentVector_SLASH_EMPTY.value), coll));
}];
cljm_DOT_core_SLASH_vector = [[CLJMVar alloc] initWithValue:^id(id cljm__varargs, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id )) cljm_DOT_core_SLASH_vec.value)(args);
}];

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
cljm_DOT_core_SLASH_ChunkedSeq.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_ChunkedSeq.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/ChunkedSeq", nil);
};
cljm_DOT_core_SLASH_ChunkedSeq.value.prototype.cljm$core$INext$_next$arity$1 = ^id(id coll) {
var this__5810 = this;
if(cljm_truthy(((this__5810_DOT_off + @1) < [this__5810_DOT_node count]))) {
id s__5811 = ((id (^)(id , id , id , id )) cljm_DOT_core_SLASH_chunked_seq.value)(this__5810_DOT_vec, this__5810_DOT_node, this__5810_DOT_i, (this__5810_DOT_off + @1));
if(cljm_truthy((s__5811 == nil))) {
return nil;

} else {
return s__5811;

}

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH__chunked_next.value)(coll);

}
};
cljm_DOT_core_SLASH_ChunkedSeq.value.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id o) {
var this__5812 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(o, coll);
};
cljm_DOT_core_SLASH_ChunkedSeq.value.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id coll) {
var this__5813 = this;
return coll;
};
cljm_DOT_core_SLASH_ChunkedSeq.value.prototype.cljm$core$ISeq$_first$arity$1 = ^id(id coll) {
var this__5814 = this;
return (this__5814_DOT_node[this__5814_DOT_off]);
};
cljm_DOT_core_SLASH_ChunkedSeq.value.prototype.cljm$core$ISeq$_rest$arity$1 = ^id(id coll) {
var this__5815 = this;
if(cljm_truthy(((this__5815_DOT_off + @1) < [this__5815_DOT_node count]))) {
id s__5816 = ((id (^)(id , id , id , id )) cljm_DOT_core_SLASH_chunked_seq.value)(this__5815_DOT_vec, this__5815_DOT_node, this__5815_DOT_i, (this__5815_DOT_off + @1));
if(cljm_truthy((s__5816 == nil))) {
return cljm.core.List.EMPTY;

} else {
return s__5816;

}

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH__chunked_rest.value)(coll);

}
};
cljm_DOT_core_SLASH_ChunkedSeq.value.prototype.cljm$core$IChunkedNext$ = @YES;
cljm_DOT_core_SLASH_ChunkedSeq.value.prototype.cljm$core$IChunkedNext$_chunked_next$arity$1 = ^id(id coll) {
var this__5817 = this;
id l__5818 = [this__5817_DOT_node count];
id s__5819 = (cljm_truthy(((this__5817_DOT_i + l__5818) < ((id (^)(id )) cljm_DOT_core_SLASH__count.value)(this__5817_DOT_vec)))) ?((id (^)(id , id , id )) cljm_DOT_core_SLASH_chunked_seq.value)(this__5817_DOT_vec, (this__5817_DOT_i + l__5818), @0):nil;
if(cljm_truthy((s__5819 == nil))) {
return nil;

} else {
return s__5819;

}
};
cljm_DOT_core_SLASH_ChunkedSeq.value.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__5820 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_equiv_sequential.value)(coll, other);
};
cljm_DOT_core_SLASH_ChunkedSeq.value.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id m) {
var this__5821 = this;
return ((id (^)(id , id , id , id , id )) cljm_DOT_core_SLASH_chunked_seq.value)(this__5821_DOT_vec, this__5821_DOT_node, this__5821_DOT_i, this__5821_DOT_off, m);
};
cljm_DOT_core_SLASH_ChunkedSeq.value.prototype.cljm$core$IWithMeta$_meta$arity$1 = ^id(id coll) {
var this__5822 = this;
return this__5822_DOT_meta;
};
cljm_DOT_core_SLASH_ChunkedSeq.value.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__5823 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_with_meta.value)(cljs_DOT_core_DOT_PersistentVector_SLASH_EMPTY.value, this__5823_DOT_meta);
};
cljm_DOT_core_SLASH_ChunkedSeq.value.prototype.cljm$core$IChunkedSeq$ = @YES;
cljm_DOT_core_SLASH_ChunkedSeq.value.prototype.cljm$core$IChunkedSeq$_chunked_first$arity$1 = ^id(id coll) {
var this__5824 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_array_chunk.value)(this__5824_DOT_node, this__5824_DOT_off);
};
cljm_DOT_core_SLASH_ChunkedSeq.value.prototype.cljm$core$IChunkedSeq$_chunked_rest$arity$1 = ^id(id coll) {
var this__5825 = this;
id l__5826 = [this__5825_DOT_node count];
id s__5827 = (cljm_truthy(((this__5825_DOT_i + l__5826) < ((id (^)(id )) cljm_DOT_core_SLASH__count.value)(this__5825_DOT_vec)))) ?((id (^)(id , id , id )) cljm_DOT_core_SLASH_chunked_seq.value)(this__5825_DOT_vec, (this__5825_DOT_i + l__5826), @0):nil;
if(cljm_truthy((s__5827 == nil))) {
return cljm.core.List.EMPTY;

} else {
return s__5827;

}
};
cljm_DOT_core_SLASH_ChunkedSeq.value;
cljm_DOT_core_SLASH_chunked_seq = [[CLJMVar alloc] initWithValue:(function() {
var chunked_seq = null;
var chunked_seq__3 = ^id(id vec, id i, id off) {
return ((id (^)(id , id , id , id , id )) chunked_seq.value)(vec, ((id (^)(id , id )) cljm_DOT_core_SLASH_array_for.value)(vec, i), i, off, nil);
};
var chunked_seq__4 = ^id(id vec, id node, id i, id off) {
return ((id (^)(id , id , id , id , id )) chunked_seq.value)(vec, node, i, off, nil);
};
var chunked_seq__5 = ^id(id vec, id node, id i, id off, id meta) {
return [cljm_DOT_core_SLASH_ChunkedSeq.value alloc];
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
];

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
cljm_DOT_core_SLASH_Subvec.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_Subvec.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/Subvec", nil);
};
cljm_DOT_core_SLASH_Subvec.value.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__5830 = this;
id h__1302__auto____5831 = this__5830_DOT___hash;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((h__1302__auto____5831 == nil)))) {
return h__1302__auto____5831;

} else {
id h__1302__auto____5832 = ((id (^)(id )) cljm_DOT_core_SLASH_hash_coll.value)(coll);
this__5830_DOT___hash = h__1302__auto____5832;
return h__1302__auto____5832;

}
};
cljm_DOT_core_SLASH_Subvec.value.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id coll, id k) {
var this__5833 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__nth.value)(coll, k, nil);
};
cljm_DOT_core_SLASH_Subvec.value.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id coll, id k, id not_found) {
var this__5834 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__nth.value)(coll, k, not_found);
};
cljm_DOT_core_SLASH_Subvec.value.prototype.cljm$core$IAssociative$_assoc$arity$3 = ^id(id coll, id key, id val) {
var this__5835 = this;
id v_pos__5836 = (this__5835_DOT_start + key);
return [cljm_DOT_core_SLASH_Subvec.value alloc];
};
cljm_DOT_core_SLASH_Subvec.value.prototype.call = (function() {
var G__5862 = null;
var G__5862__2 = ^id(id this_sym5837, id k) {
var this__5839 = this;
id this_sym5837__5840 = this;
id coll__5841 = this_sym5837__5840;
return ((id (^)(id , id )) cljm_DOT_core_SLASH__lookup.value)(coll__5841, k);
};
var G__5862__3 = ^id(id this_sym5838, id k, id not_found) {
var this__5839 = this;
id this_sym5838__5842 = this;
id coll__5843 = this_sym5838__5842;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(coll__5843, k, not_found);
};
G__5862 = function(this_sym5838, k, not_found){
switch(arguments.length){
case 2:
return G__5862__2.call(this,this_sym5838, k);
case 3:
return G__5862__3.call(this,this_sym5838, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__5862;
})()
;
cljm_DOT_core_SLASH_Subvec.value.prototype.apply = ^id(id this_sym5828, id args5829) {
var this__5844 = this;
return [this_sym5828.call applythis_sym5828, [@[this_sym5828] concatargs5829.slice()], nil];
};
cljm_DOT_core_SLASH_Subvec.value.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id o) {
var this__5845 = this;
return [cljm_DOT_core_SLASH_Subvec.value alloc];
};
cljm_DOT_core_SLASH_Subvec.value.prototype.toString = ^id() {
var this__5846 = this;
id this__5847 = this;
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_pr_str.value)(this__5847, nil);
};
cljm_DOT_core_SLASH_Subvec.value.prototype.cljm$core$IReduce$_reduce$arity$2 = ^id(id coll, id f) {
var this__5848 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_ci_reduce.value)(coll, f);
};
cljm_DOT_core_SLASH_Subvec.value.prototype.cljm$core$IReduce$_reduce$arity$3 = ^id(id coll, id f, id start) {
var this__5849 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_ci_reduce.value)(coll, f, start);
};
cljm_DOT_core_SLASH_Subvec.value.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id coll) {
var this__5850 = this;
id subvec_seq__5851 = ^id(id i) {
if(cljm_truthy(([i isEqual:this__5850_DOT_end]))) {
return nil;

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(((id (^)(id , id )) cljm_DOT_core_SLASH__nth.value)(this__5850_DOT_v, i), [cljm_DOT_core_SLASH_LazySeq.value alloc]);

}
};
return ((id (^)(id )) subvec_seq__5851.value)(this__5850_DOT_start);
};
cljm_DOT_core_SLASH_Subvec.value.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__5852 = this;
return (this__5852_DOT_end - this__5852_DOT_start);
};
cljm_DOT_core_SLASH_Subvec.value.prototype.cljm$core$IStack$_peek$arity$1 = ^id(id coll) {
var this__5853 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH__nth.value)(this__5853_DOT_v, (this__5853_DOT_end - @1));
};
cljm_DOT_core_SLASH_Subvec.value.prototype.cljm$core$IStack$_pop$arity$1 = ^id(id coll) {
var this__5854 = this;
if(cljm_truthy(([this__5854_DOT_start isEqual:this__5854_DOT_end]))) {
throw [Error.value alloc];

} else {
return [cljm_DOT_core_SLASH_Subvec.value alloc];

}
};
cljm_DOT_core_SLASH_Subvec.value.prototype.cljm$core$IVector$_assoc_n$arity$3 = ^id(id coll, id n, id val) {
var this__5855 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__assoc.value)(coll, n, val);
};
cljm_DOT_core_SLASH_Subvec.value.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__5856 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_equiv_sequential.value)(coll, other);
};
cljm_DOT_core_SLASH_Subvec.value.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__5857 = this;
return [cljm_DOT_core_SLASH_Subvec.value alloc];
};
cljm_DOT_core_SLASH_Subvec.value.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__5858 = this;
return this__5858_DOT_meta;
};
cljm_DOT_core_SLASH_Subvec.value.prototype.cljm$core$IIndexed$_nth$arity$2 = ^id(id coll, id n) {
var this__5859 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH__nth.value)(this__5859_DOT_v, (this__5859_DOT_start + n));
};
cljm_DOT_core_SLASH_Subvec.value.prototype.cljm$core$IIndexed$_nth$arity$3 = ^id(id coll, id n, id not_found) {
var this__5860 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__nth.value)(this__5860_DOT_v, (this__5860_DOT_start + n), not_found);
};
cljm_DOT_core_SLASH_Subvec.value.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__5861 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_with_meta.value)(cljs_DOT_core_DOT_Vector_SLASH_EMPTY.value, this__5861_DOT_meta);
};
cljm_DOT_core_SLASH_Subvec.value;
/**
* Returns a persistent vector of the items in vector from
* start (inclusive) to end (exclusive).  If end is not supplied,
* defaults to (count vector). This operation is O(1) and very fast, as
* the resulting vector shares structure with the original and no
* trimming is done.
*/
cljm_DOT_core_SLASH_subvec = [[CLJMVar alloc] initWithValue:(function() {
var subvec = null;
var subvec__2 = ^id(id v, id start) {
return ((id (^)(id , id , id )) subvec.value)(v, start, ((id (^)(id )) cljm_DOT_core_SLASH_count.value)(v));
};
var subvec__3 = ^id(id v, id start, id end) {
return [cljm_DOT_core_SLASH_Subvec.value alloc];
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
];
cljm_DOT_core_SLASH_tv_ensure_editable = [[CLJMVar alloc] initWithValue:^id(id edit, id node) {
if(cljm_truthy(([edit isEqual:node.edit]))) {
return node;

} else {
return [cljm_DOT_core_SLASH_VectorNode.value alloc];

}
}];
cljm_DOT_core_SLASH_tv_editable_root = [[CLJMVar alloc] initWithValue:^id(id node) {
return [cljm_DOT_core_SLASH_VectorNode.value alloc];
}];
cljm_DOT_core_SLASH_tv_editable_tail = [[CLJMVar alloc] initWithValue:^id(id tl) {
id ret__5864 = ((id (^)(id )) cljm_DOT_core_SLASH_make_array.value)(@32);
((id (^)(id , id , id , id , id )) cljm_DOT_core_SLASH_array_copy.value)(tl, @0, ret__5864, @0, tl.length);
return ret__5864;
}];
cljm_DOT_core_SLASH_tv_push_tail = [[CLJMVar alloc] initWithValue:^id(id tv, id level, id parent, id tail_node) {
id ret__5868 = ((id (^)(id , id )) cljm_DOT_core_SLASH_tv_ensure_editable.value)(tv.root.edit, parent);
id subidx__5869 = (((tv.cnt - @1) >>> level) & @31);
((id (^)(id , id , id )) cljm_DOT_core_SLASH_pv_aset.value)(ret__5868, subidx__5869, (cljm_truthy(([level isEqual:@5]))) ?tail_node:{id child__5870 = ((id (^)(id , id )) cljm_DOT_core_SLASH_pv_aget.value)(ret__5868, subidx__5869);
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((child__5870 == nil)))) {
return ((id (^)(id , id , id , id )) tv_push_tail.value)(tv, (level - @5), child__5870, tail_node);

} else {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_new_path.value)(tv.root.edit, (level - @5), tail_node);

}
});
return ret__5868;
}];
cljm_DOT_core_SLASH_tv_pop_tail = [[CLJMVar alloc] initWithValue:^id(id tv, id level, id node) {
id node__5875 = ((id (^)(id , id )) cljm_DOT_core_SLASH_tv_ensure_editable.value)(tv.root.edit, node);
id subidx__5876 = (((tv.cnt - @2) >>> level) & @31);
if(cljm_truthy((level > @5))) {
id new_child__5877 = ((id (^)(id , id , id )) tv_pop_tail.value)(tv, (level - @5), ((id (^)(id , id )) cljm_DOT_core_SLASH_pv_aget.value)(node__5875, subidx__5876));
if(cljm_truthy({id and__3822__auto____5878 = (new_child__5877 == nil);
if(cljm_truthy(and__3822__auto____5878)) {
return ([subidx__5876 isEqual:@0]);

} else {
return and__3822__auto____5878;

}
})) {
return nil;

} else {
((id (^)(id , id , id )) cljm_DOT_core_SLASH_pv_aset.value)(node__5875, subidx__5876, new_child__5877);
return node__5875;

}

} else {
if(cljm_truthy(([subidx__5876 isEqual:@0]))) {
return nil;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
((id (^)(id , id , id )) cljm_DOT_core_SLASH_pv_aset.value)(node__5875, subidx__5876, nil);
return node__5875;

} else {
return nil;

}

}

}
}];
cljm_DOT_core_SLASH_editable_array_for = [[CLJMVar alloc] initWithValue:^id(id tv, id i) {
if(cljm_truthy({id and__3822__auto____5883 = (@0 <= i);
if(cljm_truthy(and__3822__auto____5883)) {
return (i < tv.cnt);

} else {
return and__3822__auto____5883;

}
})) {
if(cljm_truthy((i >= ((id (^)(id )) cljm_DOT_core_SLASH_tail_off.value)(tv)))) {
return tv.tail;

} else {
id root__5884 = tv.root;
id node__5885 = root__5884;
id level__5886 = tv.shift;
while(YES) {
if(cljm_truthy((level__5886 > @0))) {
{
id G__5887 = ((id (^)(id , id )) cljm_DOT_core_SLASH_tv_ensure_editable.value)(root__5884.edit, ((id (^)(id , id )) cljm_DOT_core_SLASH_pv_aget.value)(node__5885, ((i >>> level__5886) & @31)));
id G__5888 = (level__5886 - @5);
node__5885 = G__5887;
level__5886 = G__5888;
continue;
}

} else {
return node__5885.arr;

}
break;
}

}

} else {
throw [Error.value alloc];

}
}];

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
cljm_DOT_core_SLASH_TransientVector.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_TransientVector.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/TransientVector", nil);
};
cljm_DOT_core_SLASH_TransientVector.value.prototype.call = (function() {
var G__5928 = null;
var G__5928__2 = ^id(id this_sym5891, id k) {
var this__5893 = this;
id this_sym5891__5894 = this;
id coll__5895 = this_sym5891__5894;
return ((id (^)(id , id )) cljm_DOT_core_SLASH__lookup.value)(coll__5895, k);
};
var G__5928__3 = ^id(id this_sym5892, id k, id not_found) {
var this__5893 = this;
id this_sym5892__5896 = this;
id coll__5897 = this_sym5892__5896;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(coll__5897, k, not_found);
};
G__5928 = function(this_sym5892, k, not_found){
switch(arguments.length){
case 2:
return G__5928__2.call(this,this_sym5892, k);
case 3:
return G__5928__3.call(this,this_sym5892, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__5928;
})()
;
cljm_DOT_core_SLASH_TransientVector.value.prototype.apply = ^id(id this_sym5889, id args5890) {
var this__5898 = this;
return [this_sym5889.call applythis_sym5889, [@[this_sym5889] concatargs5890.slice()], nil];
};
cljm_DOT_core_SLASH_TransientVector.value.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id coll, id k) {
var this__5899 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__nth.value)(coll, k, nil);
};
cljm_DOT_core_SLASH_TransientVector.value.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id coll, id k, id not_found) {
var this__5900 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__nth.value)(coll, k, not_found);
};
cljm_DOT_core_SLASH_TransientVector.value.prototype.cljm$core$IIndexed$_nth$arity$2 = ^id(id coll, id n) {
var this__5901 = this;
if(cljm_truthy(this__5901_DOT_root.edit)) {
return (((id (^)(id , id )) cljm_DOT_core_SLASH_array_for.value)(coll, n)[(n & @31)]);

} else {
throw [Error.value alloc];

}
};
cljm_DOT_core_SLASH_TransientVector.value.prototype.cljm$core$IIndexed$_nth$arity$3 = ^id(id coll, id n, id not_found) {
var this__5902 = this;
if(cljm_truthy({id and__3822__auto____5903 = (@0 <= n);
if(cljm_truthy(and__3822__auto____5903)) {
return (n < this__5902_DOT_cnt);

} else {
return and__3822__auto____5903;

}
})) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH__nth.value)(coll, n);

} else {
return not_found;

}
};
cljm_DOT_core_SLASH_TransientVector.value.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__5904 = this;
if(cljm_truthy(this__5904_DOT_root.edit)) {
return this__5904_DOT_cnt;

} else {
throw [Error.value alloc];

}
};
cljm_DOT_core_SLASH_TransientVector.value.prototype.cljm$core$ITransientVector$_assoc_n_BANG_$arity$3 = ^id(id tcoll, id n, id val) {
var this__5905 = this;
if(cljm_truthy(this__5905_DOT_root.edit)) {
if(cljm_truthy({id and__3822__auto____5906 = (@0 <= n);
if(cljm_truthy(and__3822__auto____5906)) {
return (n < this__5905_DOT_cnt);

} else {
return and__3822__auto____5906;

}
})) {
if(cljm_truthy((((id (^)(id )) cljm_DOT_core_SLASH_tail_off.value)(tcoll) <= n))) {
(this__5905_DOT_tail[(n & @31)] = val);
return tcoll;

} else {
id new_root__5911 = ((id (^)(id , id )) .value)(this__5905_DOT_shift, this__5905_DOT_root);
this__5905_DOT_root = new_root__5911;
return tcoll;

}

} else {
if(cljm_truthy(([n isEqual:this__5905_DOT_cnt]))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH__conj_BANG_.value)(tcoll, val);

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
throw [Error.value alloc];

} else {
return nil;

}

}

}

} else {
throw [Error.value alloc];

}
};
cljm_DOT_core_SLASH_TransientVector.value.prototype.cljm$core$ITransientVector$_pop_BANG_$arity$1 = ^id(id tcoll) {
var this__5912 = this;
if(cljm_truthy(this__5912_DOT_root.edit)) {
if(cljm_truthy(([this__5912_DOT_cnt isEqual:@0]))) {
throw [Error.value alloc];

} else {
if(cljm_truthy(([@1 isEqual:this__5912_DOT_cnt]))) {
this__5912_DOT_cnt = @0;
return tcoll;

} else {
if(cljm_truthy((((this__5912_DOT_cnt - @1) & @31) > @0))) {
this__5912_DOT_cnt = (this__5912_DOT_cnt - @1);
return tcoll;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
id new_tail__5913 = ((id (^)(id , id )) cljm_DOT_core_SLASH_editable_array_for.value)(tcoll, (this__5912_DOT_cnt - @2));
id new_root__5915 = {id nr__5914 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_tv_pop_tail.value)(tcoll, this__5912_DOT_shift, this__5912_DOT_root);
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((nr__5914 == nil)))) {
return nr__5914;

} else {
return [cljm_DOT_core_SLASH_VectorNode.value alloc];

}
};
if(cljm_truthy({id and__3822__auto____5916 = (@5 < this__5912_DOT_shift);
if(cljm_truthy(and__3822__auto____5916)) {
return (((id (^)(id , id )) cljm_DOT_core_SLASH_pv_aget.value)(new_root__5915, @1) == nil);

} else {
return and__3822__auto____5916;

}
})) {
id new_root__5917 = ((id (^)(id , id )) cljm_DOT_core_SLASH_tv_ensure_editable.value)(this__5912_DOT_root.edit, ((id (^)(id , id )) cljm_DOT_core_SLASH_pv_aget.value)(new_root__5915, @0));
this__5912_DOT_root = new_root__5917;
this__5912_DOT_shift = (this__5912_DOT_shift - @5);
this__5912_DOT_cnt = (this__5912_DOT_cnt - @1);
this__5912_DOT_tail = new_tail__5913;
return tcoll;

} else {
this__5912_DOT_root = new_root__5915;
this__5912_DOT_cnt = (this__5912_DOT_cnt - @1);
this__5912_DOT_tail = new_tail__5913;
return tcoll;

}

} else {
return nil;

}

}

}

}

} else {
throw [Error.value alloc];

}
};
cljm_DOT_core_SLASH_TransientVector.value.prototype.cljm$core$ITransientAssociative$_assoc_BANG_$arity$3 = ^id(id tcoll, id key, id val) {
var this__5918 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__assoc_n_BANG_.value)(tcoll, key, val);
};
cljm_DOT_core_SLASH_TransientVector.value.prototype.cljm$core$ITransientCollection$_conj_BANG_$arity$2 = ^id(id tcoll, id o) {
var this__5919 = this;
if(cljm_truthy(this__5919_DOT_root.edit)) {
if(cljm_truthy(((this__5919_DOT_cnt - ((id (^)(id )) cljm_DOT_core_SLASH_tail_off.value)(tcoll)) < @32))) {
(this__5919_DOT_tail[(this__5919_DOT_cnt & @31)] = o);
this__5919_DOT_cnt = (this__5919_DOT_cnt + @1);
return tcoll;

} else {
id tail_node__5920 = [cljm_DOT_core_SLASH_VectorNode.value alloc];
id new_tail__5921 = ((id (^)(id )) cljm_DOT_core_SLASH_make_array.value)(@32);
(new_tail__5921[@0] = o);
this__5919_DOT_tail = new_tail__5921;
if(cljm_truthy(((this__5919_DOT_cnt >>> @5) > (@1 << this__5919_DOT_shift)))) {
id new_root_array__5922 = ((id (^)(id )) cljm_DOT_core_SLASH_make_array.value)(@32);
id new_shift__5923 = (this__5919_DOT_shift + @5);
(new_root_array__5922[@0] = this__5919_DOT_root);
(new_root_array__5922[@1] = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_new_path.value)(this__5919_DOT_root.edit, this__5919_DOT_shift, tail_node__5920));
this__5919_DOT_root = [cljm_DOT_core_SLASH_VectorNode.value alloc];
this__5919_DOT_shift = new_shift__5923;
this__5919_DOT_cnt = (this__5919_DOT_cnt + @1);
return tcoll;

} else {
id new_root__5924 = ((id (^)(id , id , id , id )) cljm_DOT_core_SLASH_tv_push_tail.value)(tcoll, this__5919_DOT_shift, this__5919_DOT_root, tail_node__5920);
this__5919_DOT_root = new_root__5924;
this__5919_DOT_cnt = (this__5919_DOT_cnt + @1);
return tcoll;

}

}

} else {
throw [Error.value alloc];

}
};
cljm_DOT_core_SLASH_TransientVector.value.prototype.cljm$core$ITransientCollection$_persistent_BANG_$arity$1 = ^id(id tcoll) {
var this__5925 = this;
if(cljm_truthy(this__5925_DOT_root.edit)) {
this__5925_DOT_root.edit = nil;
id len__5926 = (this__5925_DOT_cnt - ((id (^)(id )) cljm_DOT_core_SLASH_tail_off.value)(tcoll));
id trimmed_tail__5927 = ((id (^)(id )) cljm_DOT_core_SLASH_make_array.value)(len__5926);
((id (^)(id , id , id , id , id )) cljm_DOT_core_SLASH_array_copy.value)(this__5925_DOT_tail, @0, trimmed_tail__5927, @0, len__5926);
return [cljm_DOT_core_SLASH_PersistentVector.value alloc];

} else {
throw [Error.value alloc];

}
};
cljm_DOT_core_SLASH_TransientVector.value;

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
cljm_DOT_core_SLASH_PersistentQueueSeq.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_PersistentQueueSeq.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/PersistentQueueSeq", nil);
};
cljm_DOT_core_SLASH_PersistentQueueSeq.value.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__5929 = this;
id h__1302__auto____5930 = this__5929_DOT___hash;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((h__1302__auto____5930 == nil)))) {
return h__1302__auto____5930;

} else {
id h__1302__auto____5931 = ((id (^)(id )) cljm_DOT_core_SLASH_hash_coll.value)(coll);
this__5929_DOT___hash = h__1302__auto____5931;
return h__1302__auto____5931;

}
};
cljm_DOT_core_SLASH_PersistentQueueSeq.value.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id o) {
var this__5932 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(o, coll);
};
cljm_DOT_core_SLASH_PersistentQueueSeq.value.prototype.toString = ^id() {
var this__5933 = this;
id this__5934 = this;
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_pr_str.value)(this__5934, nil);
};
cljm_DOT_core_SLASH_PersistentQueueSeq.value.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id coll) {
var this__5935 = this;
return coll;
};
cljm_DOT_core_SLASH_PersistentQueueSeq.value.prototype.cljm$core$ISeq$_first$arity$1 = ^id(id coll) {
var this__5936 = this;
return ((id (^)(id )) cljm_DOT_core_SLASH__first.value)(this__5936_DOT_front);
};
cljm_DOT_core_SLASH_PersistentQueueSeq.value.prototype.cljm$core$ISeq$_rest$arity$1 = ^id(id coll) {
var this__5937 = this;
id temp__3971__auto____5938 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(this__5937_DOT_front);
if(cljm_truthy(temp__3971__auto____5938)) {
id f1__5939 = temp__3971__auto____5938;
return [cljm_DOT_core_SLASH_PersistentQueueSeq.value alloc];

} else {
if(cljm_truthy((this__5937_DOT_rear == nil))) {
return ((id (^)(id )) cljm_DOT_core_SLASH__empty.value)(coll);

} else {
return [cljm_DOT_core_SLASH_PersistentQueueSeq.value alloc];

}

}
};
cljm_DOT_core_SLASH_PersistentQueueSeq.value.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__5940 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_equiv_sequential.value)(coll, other);
};
cljm_DOT_core_SLASH_PersistentQueueSeq.value.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__5941 = this;
return [cljm_DOT_core_SLASH_PersistentQueueSeq.value alloc];
};
cljm_DOT_core_SLASH_PersistentQueueSeq.value.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__5942 = this;
return this__5942_DOT_meta;
};
cljm_DOT_core_SLASH_PersistentQueueSeq.value.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__5943 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_with_meta.value)(cljs_DOT_core_DOT_List_SLASH_EMPTY.value, this__5943_DOT_meta);
};
cljm_DOT_core_SLASH_PersistentQueueSeq.value;

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
cljm_DOT_core_SLASH_PersistentQueue.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_PersistentQueue.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/PersistentQueue", nil);
};
cljm_DOT_core_SLASH_PersistentQueue.value.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__5944 = this;
id h__1302__auto____5945 = this__5944_DOT___hash;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((h__1302__auto____5945 == nil)))) {
return h__1302__auto____5945;

} else {
id h__1302__auto____5946 = ((id (^)(id )) cljm_DOT_core_SLASH_hash_coll.value)(coll);
this__5944_DOT___hash = h__1302__auto____5946;
return h__1302__auto____5946;

}
};
cljm_DOT_core_SLASH_PersistentQueue.value.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id o) {
var this__5947 = this;
if(cljm_truthy(this__5947_DOT_front)) {
return [cljm_DOT_core_SLASH_PersistentQueue.value alloc];

} else {
return [cljm_DOT_core_SLASH_PersistentQueue.value alloc];

}
};
cljm_DOT_core_SLASH_PersistentQueue.value.prototype.toString = ^id() {
var this__5949 = this;
id this__5950 = this;
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_pr_str.value)(this__5950, nil);
};
cljm_DOT_core_SLASH_PersistentQueue.value.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id coll) {
var this__5951 = this;
id rear__5952 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(this__5951_DOT_rear);
if(cljm_truthy({id or__3824__auto____5953 = this__5951_DOT_front;
if(cljm_truthy(or__3824__auto____5953)) {
return or__3824__auto____5953;

} else {
return rear__5952;

}
})) {
return [cljm_DOT_core_SLASH_PersistentQueueSeq.value alloc];

} else {
return nil;

}
};
cljm_DOT_core_SLASH_PersistentQueue.value.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__5954 = this;
return this__5954_DOT_count;
};
cljm_DOT_core_SLASH_PersistentQueue.value.prototype.cljm$core$IStack$_peek$arity$1 = ^id(id coll) {
var this__5955 = this;
return ((id (^)(id )) cljm_DOT_core_SLASH__first.value)(this__5955_DOT_front);
};
cljm_DOT_core_SLASH_PersistentQueue.value.prototype.cljm$core$IStack$_pop$arity$1 = ^id(id coll) {
var this__5956 = this;
if(cljm_truthy(this__5956_DOT_front)) {
id temp__3971__auto____5957 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(this__5956_DOT_front);
if(cljm_truthy(temp__3971__auto____5957)) {
id f1__5958 = temp__3971__auto____5957;
return [cljm_DOT_core_SLASH_PersistentQueue.value alloc];

} else {
return [cljm_DOT_core_SLASH_PersistentQueue.value alloc];

}

} else {
return coll;

}
};
cljm_DOT_core_SLASH_PersistentQueue.value.prototype.cljm$core$ISeq$_first$arity$1 = ^id(id coll) {
var this__5959 = this;
return ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(this__5959_DOT_front);
};
cljm_DOT_core_SLASH_PersistentQueue.value.prototype.cljm$core$ISeq$_rest$arity$1 = ^id(id coll) {
var this__5960 = this;
return ((id (^)(id )) cljm_DOT_core_SLASH_rest.value)(((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(coll));
};
cljm_DOT_core_SLASH_PersistentQueue.value.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__5961 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_equiv_sequential.value)(coll, other);
};
cljm_DOT_core_SLASH_PersistentQueue.value.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__5962 = this;
return [cljm_DOT_core_SLASH_PersistentQueue.value alloc];
};
cljm_DOT_core_SLASH_PersistentQueue.value.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__5963 = this;
return this__5963_DOT_meta;
};
cljm_DOT_core_SLASH_PersistentQueue.value.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__5964 = this;
return cljs_DOT_core_DOT_PersistentQueue_SLASH_EMPTY.value;
};
cljm_DOT_core_SLASH_PersistentQueue.value;
cljs_DOT_core_DOT_PersistentQueue_SLASH_EMPTY.value = [cljm_DOT_core_SLASH_PersistentQueue.value alloc];

/**
* @constructor
*/
cljm_DOT_core_SLASH_NeverEquiv = (function (){
this.cljm$lang$protocol_mask$partition1$ = 0;
this.cljm$lang$protocol_mask$partition0$ = 2097152;
})
cljm_DOT_core_SLASH_NeverEquiv.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_NeverEquiv.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/NeverEquiv", nil);
};
cljm_DOT_core_SLASH_NeverEquiv.value.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id o, id other) {
var this__5965 = this;
return @NO;
};
cljm_DOT_core_SLASH_NeverEquiv.value;
cljm_DOT_core_SLASH_never_equiv = [[CLJMVar alloc] initWithValue:[cljm_DOT_core_SLASH_NeverEquiv.value alloc]];
/**
* Assumes y is a map. Returns true if x equals y, otherwise returns
* false.
*/
cljm_DOT_core_SLASH_equiv_map = [[CLJMVar alloc] initWithValue:^id(id x, id y) {
return ((id (^)(id )) cljm_DOT_core_SLASH_boolean.value)((cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_map_QMARK_.value)(y))) ?(cljm_truthy(([((id (^)(id )) cljm_DOT_core_SLASH_count.value)(x) isEqual:((id (^)(id )) cljm_DOT_core_SLASH_count.value)(y)]))) ?((id (^)(id , id )) cljm_DOT_core_SLASH_every_QMARK_.value)(cljm_DOT_core_SLASH_identity.value, ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_map.value)(^id(id xkv) {
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH__EQ_.value)(((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(y, ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(xkv), cljm_DOT_core_SLASH_never_equiv.value), ((id (^)(id )) cljm_DOT_core_SLASH_second.value)(xkv), nil);
}, x, nil)):nil:nil);
}];
cljm_DOT_core_SLASH_scan_array = [[CLJMVar alloc] initWithValue:^id(id incr, id k, id array) {
id len__5968 = [array count];
id i__5969 = @0;
while(YES) {
if(cljm_truthy((i__5969 < len__5968))) {
if(cljm_truthy(([k isEqual:(array[i__5969])]))) {
return i__5969;

} else {
{
id G__5970 = (i__5969 + incr);
i__5969 = G__5970;
continue;
}

}

} else {
return nil;

}
break;
}
}];
cljm_DOT_core_SLASH_obj_map_compare_keys = [[CLJMVar alloc] initWithValue:^id(id a, id b) {
id a__5973 = ((id (^)(id )) cljm_DOT_core_SLASH_hash.value)(a);
id b__5974 = ((id (^)(id )) cljm_DOT_core_SLASH_hash.value)(b);
if(cljm_truthy((a__5973 < b__5974))) {
return @-1;

} else {
if(cljm_truthy((a__5973 > b__5974))) {
return @1;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return @0;

} else {
return nil;

}

}

}
}];
cljm_DOT_core_SLASH_obj_map__GT_hash_map = [[CLJMVar alloc] initWithValue:^id(id m, id k, id v) {
id ks__5982 = m.keys;
id len__5983 = ks__5982.length;
id so__5984 = m.strobj;
id out__5985 = ((id (^)(id , id )) cljm_DOT_core_SLASH_with_meta.value)(cljs_DOT_core_DOT_PersistentHashMap_SLASH_EMPTY.value, ((id (^)(id )) cljm_DOT_core_SLASH_meta.value)(m));
id i__5986 = @0;
id out__5987 = ((id (^)(id )) cljm_DOT_core_SLASH_transient.value)(out__5985);
while(YES) {
if(cljm_truthy((i__5986 < len__5983))) {
id k__5988 = (ks__5982[i__5986]);
{
id G__5989 = (i__5986 + @1);
id G__5990 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_assoc_BANG_.value)(out__5987, k__5988, (so__5984[k__5988]));
i__5986 = G__5989;
out__5987 = G__5990;
continue;
}

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH_persistent_BANG_.value)(((id (^)(id , id , id )) cljm_DOT_core_SLASH_assoc_BANG_.value)(out__5987, k, v));

}
break;
}
}];
cljm_DOT_core_SLASH_obj_clone = [[CLJMVar alloc] initWithValue:^id(id obj, id ks) {
id new_obj__5996 = @{};
id l__5997 = [ks count];
id i__5998 = @0;
while(YES) {
if(cljm_truthy((i__5998 < l__5997))) {
id k__5999 = (ks[i__5998]);
(new_obj__5996[k__5999] = (obj[k__5999]));
{
id G__6000 = (i__5998 + @1);
i__5998 = G__6000;
continue;
}

} else {

}
break;
}
return new_obj__5996;
}];

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
cljm_DOT_core_SLASH_ObjMap.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_ObjMap.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/ObjMap", nil);
};
cljm_DOT_core_SLASH_ObjMap.value.prototype.cljm$core$IEditableCollection$_as_transient$arity$1 = ^id(id coll) {
var this__6003 = this;
return ((id (^)(id )) cljm_DOT_core_SLASH_transient.value)(((id (^)(id , id )) cljm_DOT_core_SLASH_into.value)(((id (^)(, ...)) cljm_DOT_core_SLASH_hash_map.value)(, nil), coll));
};
cljm_DOT_core_SLASH_ObjMap.value.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__6004 = this;
id h__1302__auto____6005 = this__6004_DOT___hash;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((h__1302__auto____6005 == nil)))) {
return h__1302__auto____6005;

} else {
id h__1302__auto____6006 = ((id (^)(id )) cljm_DOT_core_SLASH_hash_imap.value)(coll);
this__6004_DOT___hash = h__1302__auto____6006;
return h__1302__auto____6006;

}
};
cljm_DOT_core_SLASH_ObjMap.value.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id coll, id k) {
var this__6007 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(coll, k, nil);
};
cljm_DOT_core_SLASH_ObjMap.value.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id coll, id k, id not_found) {
var this__6008 = this;
if(cljm_truthy({id and__3822__auto____6009 = ((id (^)(id )) goog_SLASH_isString.value)(k);
if(cljm_truthy(and__3822__auto____6009)) {
return ((id (^)(id )) cljm_DOT_core_SLASH_not.value)((((id (^)(id , id , id )) cljm_DOT_core_SLASH_scan_array.value)(@1, k, this__6008_DOT_keys) == nil));

} else {
return and__3822__auto____6009;

}
})) {
return (this__6008_DOT_strobj[k]);

} else {
return not_found;

}
};
cljm_DOT_core_SLASH_ObjMap.value.prototype.cljm$core$IAssociative$_assoc$arity$3 = ^id(id coll, id k, id v) {
var this__6010 = this;
if(cljm_truthy(((id (^)(id )) goog_SLASH_isString.value)(k))) {
if(cljm_truthy({id or__3824__auto____6011 = (this__6010_DOT_update_count > cljs_DOT_core_DOT_ObjMap_SLASH_HASHMAP_THRESHOLD.value);
if(cljm_truthy(or__3824__auto____6011)) {
return or__3824__auto____6011;

} else {
return ([this__6010_DOT_keys count] >= cljs_DOT_core_DOT_ObjMap_SLASH_HASHMAP_THRESHOLD.value);

}
})) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_obj_map__GT_hash_map.value)(coll, k, v);

} else {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((((id (^)(id , id , id )) cljm_DOT_core_SLASH_scan_array.value)(@1, k, this__6010_DOT_keys) == nil)))) {
id new_strobj__6012 = ((id (^)(id , id )) cljm_DOT_core_SLASH_obj_clone.value)(this__6010_DOT_strobj, this__6010_DOT_keys);
(new_strobj__6012[k] = v);
return [cljm_DOT_core_SLASH_ObjMap.value alloc];

} else {
id new_strobj__6013 = ((id (^)(id , id )) cljm_DOT_core_SLASH_obj_clone.value)(this__6010_DOT_strobj, this__6010_DOT_keys);
id new_keys__6014 = this__6010_DOT_keys.slice();
(new_strobj__6013[k] = v);
[new_keys__6014 pushk];
return [cljm_DOT_core_SLASH_ObjMap.value alloc];

}

}

} else {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_obj_map__GT_hash_map.value)(coll, k, v);

}
};
cljm_DOT_core_SLASH_ObjMap.value.prototype.cljm$core$IAssociative$_contains_key_QMARK_$arity$2 = ^id(id coll, id k) {
var this__6015 = this;
if(cljm_truthy({id and__3822__auto____6016 = ((id (^)(id )) goog_SLASH_isString.value)(k);
if(cljm_truthy(and__3822__auto____6016)) {
return ((id (^)(id )) cljm_DOT_core_SLASH_not.value)((((id (^)(id , id , id )) cljm_DOT_core_SLASH_scan_array.value)(@1, k, this__6015_DOT_keys) == nil));

} else {
return and__3822__auto____6016;

}
})) {
return @YES;

} else {
return @NO;

}
};
cljm_DOT_core_SLASH_ObjMap.value.prototype.call = (function() {
var G__6038 = null;
var G__6038__2 = ^id(id this_sym6017, id k) {
var this__6019 = this;
id this_sym6017__6020 = this;
id coll__6021 = this_sym6017__6020;
return ((id (^)(id , id )) cljm_DOT_core_SLASH__lookup.value)(coll__6021, k);
};
var G__6038__3 = ^id(id this_sym6018, id k, id not_found) {
var this__6019 = this;
id this_sym6018__6022 = this;
id coll__6023 = this_sym6018__6022;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(coll__6023, k, not_found);
};
G__6038 = function(this_sym6018, k, not_found){
switch(arguments.length){
case 2:
return G__6038__2.call(this,this_sym6018, k);
case 3:
return G__6038__3.call(this,this_sym6018, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__6038;
})()
;
cljm_DOT_core_SLASH_ObjMap.value.prototype.apply = ^id(id this_sym6001, id args6002) {
var this__6024 = this;
return [this_sym6001.call applythis_sym6001, [@[this_sym6001] concatargs6002.slice()], nil];
};
cljm_DOT_core_SLASH_ObjMap.value.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id entry) {
var this__6025 = this;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_vector_QMARK_.value)(entry))) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__assoc.value)(coll, ((id (^)(id , id )) cljm_DOT_core_SLASH__nth.value)(entry, @0), ((id (^)(id , id )) cljm_DOT_core_SLASH__nth.value)(entry, @1));

} else {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(cljm_DOT_core_SLASH__conj.value, coll, entry);

}
};
cljm_DOT_core_SLASH_ObjMap.value.prototype.toString = ^id() {
var this__6026 = this;
id this__6027 = this;
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_pr_str.value)(this__6027, nil);
};
cljm_DOT_core_SLASH_ObjMap.value.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id coll) {
var this__6028 = this;
if(cljm_truthy((this__6028_DOT_keys.length > @0))) {
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_map.value)(^id(id p1__5991_SHARP_) {
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_vector.value)(p1__5991_SHARP_, (this__6028_DOT_strobj[p1__5991_SHARP_]), nil);
}, [this__6028_DOT_keys sortcljm_DOT_core_SLASH_obj_map_compare_keys.value], nil);

} else {
return nil;

}
};
cljm_DOT_core_SLASH_ObjMap.value.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__6029 = this;
return this__6029_DOT_keys.length;
};
cljm_DOT_core_SLASH_ObjMap.value.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__6030 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_equiv_map.value)(coll, other);
};
cljm_DOT_core_SLASH_ObjMap.value.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__6031 = this;
return [cljm_DOT_core_SLASH_ObjMap.value alloc];
};
cljm_DOT_core_SLASH_ObjMap.value.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__6032 = this;
return this__6032_DOT_meta;
};
cljm_DOT_core_SLASH_ObjMap.value.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__6033 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_with_meta.value)(cljs_DOT_core_DOT_ObjMap_SLASH_EMPTY.value, this__6033_DOT_meta);
};
cljm_DOT_core_SLASH_ObjMap.value.prototype.cljm$core$IMap$_dissoc$arity$2 = ^id(id coll, id k) {
var this__6034 = this;
if(cljm_truthy({id and__3822__auto____6035 = ((id (^)(id )) goog_SLASH_isString.value)(k);
if(cljm_truthy(and__3822__auto____6035)) {
return ((id (^)(id )) cljm_DOT_core_SLASH_not.value)((((id (^)(id , id , id )) cljm_DOT_core_SLASH_scan_array.value)(@1, k, this__6034_DOT_keys) == nil));

} else {
return and__3822__auto____6035;

}
})) {
id new_keys__6036 = this__6034_DOT_keys.slice();
id new_strobj__6037 = ((id (^)(id , id )) cljm_DOT_core_SLASH_obj_clone.value)(this__6034_DOT_strobj, this__6034_DOT_keys);
[new_keys__6036 splice((id (^)(id , id , id )) cljm_DOT_core_SLASH_scan_array.value)(@1, k, new_keys__6036), @1, nil];
((id (^)(id , id )) cljm_DOT_core_SLASH_js_delete.value)(new_strobj__6037, k);
return [cljm_DOT_core_SLASH_ObjMap.value alloc];

} else {
return coll;

}
};
cljm_DOT_core_SLASH_ObjMap.value;
cljs_DOT_core_DOT_ObjMap_SLASH_EMPTY.value = [cljm_DOT_core_SLASH_ObjMap.value alloc];
cljs_DOT_core_DOT_ObjMap_SLASH_HASHMAP_THRESHOLD.value = @32;
cljs_DOT_core_DOT_ObjMap_SLASH_fromObject.value = ^id(id ks, id obj) {
return [cljm_DOT_core_SLASH_ObjMap.value alloc];
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
cljm_DOT_core_SLASH_HashMap.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_HashMap.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/HashMap", nil);
};
cljm_DOT_core_SLASH_HashMap.value.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__6042 = this;
id h__1302__auto____6043 = this__6042_DOT___hash;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((h__1302__auto____6043 == nil)))) {
return h__1302__auto____6043;

} else {
id h__1302__auto____6044 = ((id (^)(id )) cljm_DOT_core_SLASH_hash_imap.value)(coll);
this__6042_DOT___hash = h__1302__auto____6044;
return h__1302__auto____6044;

}
};
cljm_DOT_core_SLASH_HashMap.value.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id coll, id k) {
var this__6045 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(coll, k, nil);
};
cljm_DOT_core_SLASH_HashMap.value.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id coll, id k, id not_found) {
var this__6046 = this;
id bucket__6047 = (this__6046_DOT_hashobj[((id (^)(id )) cljm_DOT_core_SLASH_hash.value)(k)]);
id i__6048 = (cljm_truthy(bucket__6047)) ?((id (^)(id , id , id )) cljm_DOT_core_SLASH_scan_array.value)(@2, k, bucket__6047):nil;
if(cljm_truthy(i__6048)) {
return (bucket__6047[(i__6048 + @1)]);

} else {
return not_found;

}
};
cljm_DOT_core_SLASH_HashMap.value.prototype.cljm$core$IAssociative$_assoc$arity$3 = ^id(id coll, id k, id v) {
var this__6049 = this;
id h__6050 = ((id (^)(id )) cljm_DOT_core_SLASH_hash.value)(k);
id bucket__6051 = (this__6049_DOT_hashobj[h__6050]);
if(cljm_truthy(bucket__6051)) {
id new_bucket__6052 = bucket__6051.slice();
id new_hashobj__6053 = ((id (^)(id )) goog_DOT_object_SLASH_clone.value)(this__6049_DOT_hashobj);
(new_hashobj__6053[h__6050] = new_bucket__6052);
id temp__3971__auto____6054 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_scan_array.value)(@2, k, new_bucket__6052);
if(cljm_truthy(temp__3971__auto____6054)) {
id i__6055 = temp__3971__auto____6054;
(new_bucket__6052[(i__6055 + @1)] = v);
return [cljm_DOT_core_SLASH_HashMap.value alloc];

} else {
[new_bucket__6052 pushk, v, nil];
return [cljm_DOT_core_SLASH_HashMap.value alloc];

}

} else {
id new_hashobj__6056 = ((id (^)(id )) goog_DOT_object_SLASH_clone.value)(this__6049_DOT_hashobj);
(new_hashobj__6056[h__6050] = @[k,v]);
return [cljm_DOT_core_SLASH_HashMap.value alloc];

}
};
cljm_DOT_core_SLASH_HashMap.value.prototype.cljm$core$IAssociative$_contains_key_QMARK_$arity$2 = ^id(id coll, id k) {
var this__6057 = this;
id bucket__6058 = (this__6057_DOT_hashobj[((id (^)(id )) cljm_DOT_core_SLASH_hash.value)(k)]);
id i__6059 = (cljm_truthy(bucket__6058)) ?((id (^)(id , id , id )) cljm_DOT_core_SLASH_scan_array.value)(@2, k, bucket__6058):nil;
if(cljm_truthy(i__6059)) {
return @YES;

} else {
return @NO;

}
};
cljm_DOT_core_SLASH_HashMap.value.prototype.call = (function() {
var G__6084 = null;
var G__6084__2 = ^id(id this_sym6060, id k) {
var this__6062 = this;
id this_sym6060__6063 = this;
id coll__6064 = this_sym6060__6063;
return ((id (^)(id , id )) cljm_DOT_core_SLASH__lookup.value)(coll__6064, k);
};
var G__6084__3 = ^id(id this_sym6061, id k, id not_found) {
var this__6062 = this;
id this_sym6061__6065 = this;
id coll__6066 = this_sym6061__6065;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(coll__6066, k, not_found);
};
G__6084 = function(this_sym6061, k, not_found){
switch(arguments.length){
case 2:
return G__6084__2.call(this,this_sym6061, k);
case 3:
return G__6084__3.call(this,this_sym6061, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__6084;
})()
;
cljm_DOT_core_SLASH_HashMap.value.prototype.apply = ^id(id this_sym6040, id args6041) {
var this__6067 = this;
return [this_sym6040.call applythis_sym6040, [@[this_sym6040] concatargs6041.slice()], nil];
};
cljm_DOT_core_SLASH_HashMap.value.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id entry) {
var this__6068 = this;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_vector_QMARK_.value)(entry))) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__assoc.value)(coll, ((id (^)(id , id )) cljm_DOT_core_SLASH__nth.value)(entry, @0), ((id (^)(id , id )) cljm_DOT_core_SLASH__nth.value)(entry, @1));

} else {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(cljm_DOT_core_SLASH__conj.value, coll, entry);

}
};
cljm_DOT_core_SLASH_HashMap.value.prototype.toString = ^id() {
var this__6069 = this;
id this__6070 = this;
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_pr_str.value)(this__6070, nil);
};
cljm_DOT_core_SLASH_HashMap.value.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id coll) {
var this__6071 = this;
if(cljm_truthy((this__6071_DOT_count > @0))) {
id hashes__6072 = [((id (^)(id )) cljm_DOT_core_SLASH_js_keys.value)(this__6071_DOT_hashobj) sort];
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_mapcat.value)(^id(id p1__6039_SHARP_) {
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_map.value)(cljm_DOT_core_SLASH_vec.value, ((id (^)(id , id )) cljm_DOT_core_SLASH_partition.value)(@2, (this__6071_DOT_hashobj[p1__6039_SHARP_])), nil);
}, hashes__6072, nil);

} else {
return nil;

}
};
cljm_DOT_core_SLASH_HashMap.value.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__6073 = this;
return this__6073_DOT_count;
};
cljm_DOT_core_SLASH_HashMap.value.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__6074 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_equiv_map.value)(coll, other);
};
cljm_DOT_core_SLASH_HashMap.value.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__6075 = this;
return [cljm_DOT_core_SLASH_HashMap.value alloc];
};
cljm_DOT_core_SLASH_HashMap.value.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__6076 = this;
return this__6076_DOT_meta;
};
cljm_DOT_core_SLASH_HashMap.value.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__6077 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_with_meta.value)(cljs_DOT_core_DOT_HashMap_SLASH_EMPTY.value, this__6077_DOT_meta);
};
cljm_DOT_core_SLASH_HashMap.value.prototype.cljm$core$IMap$_dissoc$arity$2 = ^id(id coll, id k) {
var this__6078 = this;
id h__6079 = ((id (^)(id )) cljm_DOT_core_SLASH_hash.value)(k);
id bucket__6080 = (this__6078_DOT_hashobj[h__6079]);
id i__6081 = (cljm_truthy(bucket__6080)) ?((id (^)(id , id , id )) cljm_DOT_core_SLASH_scan_array.value)(@2, k, bucket__6080):nil;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)(i__6081))) {
return coll;

} else {
id new_hashobj__6082 = ((id (^)(id )) goog_DOT_object_SLASH_clone.value)(this__6078_DOT_hashobj);
if(cljm_truthy((@3 > bucket__6080.length))) {
((id (^)(id , id )) cljm_DOT_core_SLASH_js_delete.value)(new_hashobj__6082, h__6079);

} else {
id new_bucket__6083 = bucket__6080.slice();
[new_bucket__6083 splicei__6081, @2, nil];
(new_hashobj__6082[h__6079] = new_bucket__6083);

}
return [cljm_DOT_core_SLASH_HashMap.value alloc];

}
};
cljm_DOT_core_SLASH_HashMap.value;
cljs_DOT_core_DOT_HashMap_SLASH_EMPTY.value = [cljm_DOT_core_SLASH_HashMap.value alloc];
cljs_DOT_core_DOT_HashMap_SLASH_fromArrays.value = ^id(id ks, id vs) {
id len__6085 = ks.length;
id i__6086 = @0;
id out__6087 = cljs_DOT_core_DOT_HashMap_SLASH_EMPTY.value;
while(YES) {
if(cljm_truthy((i__6086 < len__6085))) {
{
id G__6088 = (i__6086 + @1);
id G__6089 = ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_assoc.value)(out__6087, (ks[i__6086]), (vs[i__6086]), nil);
i__6086 = G__6088;
out__6087 = G__6089;
continue;
}

} else {
return out__6087;

}
break;
}
};
cljm_DOT_core_SLASH_array_map_index_of = [[CLJMVar alloc] initWithValue:^id(id m, id k) {
id arr__6093 = m.arr;
id len__6094 = arr__6093.length;
id i__6095 = @0;
while(YES) {
if(cljm_truthy((len__6094 <= i__6095))) {
return @-1;

} else {
if(cljm_truthy(((id (^)(id , id , ...)) cljm_DOT_core_SLASH__EQ_.value)((arr__6093[i__6095]), k, nil))) {
return i__6095;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
{
id G__6096 = (i__6095 + @2);
i__6095 = G__6096;
continue;
}

} else {
return nil;

}

}

}
break;
}
}];

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
cljm_DOT_core_SLASH_PersistentArrayMap.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_PersistentArrayMap.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/PersistentArrayMap", nil);
};
cljm_DOT_core_SLASH_PersistentArrayMap.value.prototype.cljm$core$IEditableCollection$_as_transient$arity$1 = ^id(id coll) {
var this__6099 = this;
return [cljm_DOT_core_SLASH_TransientArrayMap.value alloc];
};
cljm_DOT_core_SLASH_PersistentArrayMap.value.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__6100 = this;
id h__1302__auto____6101 = this__6100_DOT___hash;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((h__1302__auto____6101 == nil)))) {
return h__1302__auto____6101;

} else {
id h__1302__auto____6102 = ((id (^)(id )) cljm_DOT_core_SLASH_hash_imap.value)(coll);
this__6100_DOT___hash = h__1302__auto____6102;
return h__1302__auto____6102;

}
};
cljm_DOT_core_SLASH_PersistentArrayMap.value.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id coll, id k) {
var this__6103 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(coll, k, nil);
};
cljm_DOT_core_SLASH_PersistentArrayMap.value.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id coll, id k, id not_found) {
var this__6104 = this;
id idx__6105 = ((id (^)(id , id )) cljm_DOT_core_SLASH_array_map_index_of.value)(coll, k);
if(cljm_truthy(([idx__6105 isEqual:@-1]))) {
return not_found;

} else {
return (this__6104_DOT_arr[(idx__6105 + @1)]);

}
};
cljm_DOT_core_SLASH_PersistentArrayMap.value.prototype.cljm$core$IAssociative$_assoc$arity$3 = ^id(id coll, id k, id v) {
var this__6106 = this;
id idx__6107 = ((id (^)(id , id )) cljm_DOT_core_SLASH_array_map_index_of.value)(coll, k);
if(cljm_truthy(([idx__6107 isEqual:@-1]))) {
if(cljm_truthy((this__6106_DOT_cnt < cljs_DOT_core_DOT_PersistentArrayMap_SLASH_HASHMAP_THRESHOLD.value))) {
return [cljm_DOT_core_SLASH_PersistentArrayMap.value alloc];

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH_persistent_BANG_.value)(((id (^)(id , id , id )) cljm_DOT_core_SLASH_assoc_BANG_.value)(((id (^)(id )) cljm_DOT_core_SLASH_transient.value)(((id (^)(id , id )) cljm_DOT_core_SLASH_into.value)(cljs_DOT_core_DOT_PersistentHashMap_SLASH_EMPTY.value, coll)), k, v));

}

} else {
if(cljm_truthy(([v isEqual:(this__6106_DOT_arr[(idx__6107 + @1)])]))) {
return coll;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return [cljm_DOT_core_SLASH_PersistentArrayMap.value alloc];

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_PersistentArrayMap.value.prototype.cljm$core$IAssociative$_contains_key_QMARK_$arity$2 = ^id(id coll, id k) {
var this__6112 = this;
return ((id (^)(id )) cljm_DOT_core_SLASH_not.value)(([((id (^)(id , id )) cljm_DOT_core_SLASH_array_map_index_of.value)(coll, k) isEqual:@-1]));
};
cljm_DOT_core_SLASH_PersistentArrayMap.value.prototype.call = (function() {
var G__6144 = null;
var G__6144__2 = ^id(id this_sym6113, id k) {
var this__6115 = this;
id this_sym6113__6116 = this;
id coll__6117 = this_sym6113__6116;
return ((id (^)(id , id )) cljm_DOT_core_SLASH__lookup.value)(coll__6117, k);
};
var G__6144__3 = ^id(id this_sym6114, id k, id not_found) {
var this__6115 = this;
id this_sym6114__6118 = this;
id coll__6119 = this_sym6114__6118;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(coll__6119, k, not_found);
};
G__6144 = function(this_sym6114, k, not_found){
switch(arguments.length){
case 2:
return G__6144__2.call(this,this_sym6114, k);
case 3:
return G__6144__3.call(this,this_sym6114, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__6144;
})()
;
cljm_DOT_core_SLASH_PersistentArrayMap.value.prototype.apply = ^id(id this_sym6097, id args6098) {
var this__6120 = this;
return [this_sym6097.call applythis_sym6097, [@[this_sym6097] concatargs6098.slice()], nil];
};
cljm_DOT_core_SLASH_PersistentArrayMap.value.prototype.cljm$core$IKVReduce$_kv_reduce$arity$3 = ^id(id coll, id f, id init) {
var this__6121 = this;
id len__6122 = this__6121_DOT_arr.length;
id i__6123 = @0;
id init__6124 = init;
while(YES) {
if(cljm_truthy((i__6123 < len__6122))) {
id init__6125 = ((id (^)(id , id , id )) f.value)(init__6124, (this__6121_DOT_arr[i__6123]), (this__6121_DOT_arr[(i__6123 + @1)]));
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_reduced_QMARK_.value)(init__6125))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(init__6125);

} else {
{
id G__6145 = (i__6123 + @2);
id G__6146 = init__6125;
i__6123 = G__6145;
init__6124 = G__6146;
continue;
}

}

} else {
return nil;

}
break;
}
};
cljm_DOT_core_SLASH_PersistentArrayMap.value.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id entry) {
var this__6126 = this;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_vector_QMARK_.value)(entry))) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__assoc.value)(coll, ((id (^)(id , id )) cljm_DOT_core_SLASH__nth.value)(entry, @0), ((id (^)(id , id )) cljm_DOT_core_SLASH__nth.value)(entry, @1));

} else {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(cljm_DOT_core_SLASH__conj.value, coll, entry);

}
};
cljm_DOT_core_SLASH_PersistentArrayMap.value.prototype.toString = ^id() {
var this__6127 = this;
id this__6128 = this;
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_pr_str.value)(this__6128, nil);
};
cljm_DOT_core_SLASH_PersistentArrayMap.value.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id coll) {
var this__6129 = this;
if(cljm_truthy((this__6129_DOT_cnt > @0))) {
id len__6130 = this__6129_DOT_arr.length;
id array_map_seq__6131 = ^id(id i) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
};
return ((id (^)(id )) array_map_seq__6131.value)(@0);

} else {
return nil;

}
};
cljm_DOT_core_SLASH_PersistentArrayMap.value.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__6132 = this;
return this__6132_DOT_cnt;
};
cljm_DOT_core_SLASH_PersistentArrayMap.value.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__6133 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_equiv_map.value)(coll, other);
};
cljm_DOT_core_SLASH_PersistentArrayMap.value.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__6134 = this;
return [cljm_DOT_core_SLASH_PersistentArrayMap.value alloc];
};
cljm_DOT_core_SLASH_PersistentArrayMap.value.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__6135 = this;
return this__6135_DOT_meta;
};
cljm_DOT_core_SLASH_PersistentArrayMap.value.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__6136 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH__with_meta.value)(cljs_DOT_core_DOT_PersistentArrayMap_SLASH_EMPTY.value, this__6136_DOT_meta);
};
cljm_DOT_core_SLASH_PersistentArrayMap.value.prototype.cljm$core$IMap$_dissoc$arity$2 = ^id(id coll, id k) {
var this__6137 = this;
id idx__6138 = ((id (^)(id , id )) cljm_DOT_core_SLASH_array_map_index_of.value)(coll, k);
if(cljm_truthy((idx__6138 >= @0))) {
id len__6139 = this__6137_DOT_arr.length;
id new_len__6140 = (len__6139 - @2);
if(cljm_truthy(([new_len__6140 isEqual:@0]))) {
return ((id (^)(id )) cljm_DOT_core_SLASH__empty.value)(coll);

} else {
id new_arr__6141 = ((id (^)(id )) cljm_DOT_core_SLASH_make_array.value)(new_len__6140);
id s__6142 = @0;
id d__6143 = @0;
while(YES) {
if(cljm_truthy((s__6142 >= len__6139))) {
return [cljm_DOT_core_SLASH_PersistentArrayMap.value alloc];

} else {
if(cljm_truthy(((id (^)(id , id , ...)) cljm_DOT_core_SLASH__EQ_.value)(k, (this__6137_DOT_arr[s__6142]), nil))) {
{
id G__6147 = (s__6142 + @2);
id G__6148 = d__6143;
s__6142 = G__6147;
d__6143 = G__6148;
continue;
}

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
(new_arr__6141[d__6143] = (this__6137_DOT_arr[s__6142]));
(new_arr__6141[(d__6143 + @1)] = (this__6137_DOT_arr[(s__6142 + @1)]));
{
id G__6149 = (s__6142 + @2);
id G__6150 = (d__6143 + @2);
s__6142 = G__6149;
d__6143 = G__6150;
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
cljm_DOT_core_SLASH_PersistentArrayMap.value;
cljs_DOT_core_DOT_PersistentArrayMap_SLASH_EMPTY.value = [cljm_DOT_core_SLASH_PersistentArrayMap.value alloc];
cljs_DOT_core_DOT_PersistentArrayMap_SLASH_HASHMAP_THRESHOLD.value = @16;
cljs_DOT_core_DOT_PersistentArrayMap_SLASH_fromArrays.value = ^id(id ks, id vs) {
id len__6151 = ((id (^)(id )) cljm_DOT_core_SLASH_count.value)(ks);
id i__6152 = @0;
id out__6153 = ((id (^)(id )) cljm_DOT_core_SLASH_transient.value)(cljs_DOT_core_DOT_PersistentArrayMap_SLASH_EMPTY.value);
while(YES) {
if(cljm_truthy((i__6152 < len__6151))) {
{
id G__6154 = (i__6152 + @1);
id G__6155 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_assoc_BANG_.value)(out__6153, (ks[i__6152]), (vs[i__6152]));
i__6152 = G__6154;
out__6153 = G__6155;
continue;
}

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH_persistent_BANG_.value)(out__6153);

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
cljm_DOT_core_SLASH_TransientArrayMap.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_TransientArrayMap.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/TransientArrayMap", nil);
};
cljm_DOT_core_SLASH_TransientArrayMap.value.prototype.cljm$core$ITransientMap$_dissoc_BANG_$arity$2 = ^id(id tcoll, id key) {
var this__6156 = this;
if(cljm_truthy(this__6156_DOT_editable_QMARK_)) {
id idx__6157 = ((id (^)(id , id )) cljm_DOT_core_SLASH_array_map_index_of.value)(tcoll, key);
if(cljm_truthy((idx__6157 >= @0))) {
(this__6156_DOT_arr[idx__6157] = (this__6156_DOT_arr[(this__6156_DOT_len - @2)]));
(this__6156_DOT_arr[(idx__6157 + @1)] = (this__6156_DOT_arr[(this__6156_DOT_len - @1)]));
id G__6158__6159 = this__6156_DOT_arr;
[G__6158__6159 pop];
[G__6158__6159 pop];
G__6158__6159;
this__6156_DOT_len = (this__6156_DOT_len - @2);

} else {

}
return tcoll;

} else {
throw [Error.value alloc];

}
};
cljm_DOT_core_SLASH_TransientArrayMap.value.prototype.cljm$core$ITransientAssociative$_assoc_BANG_$arity$3 = ^id(id tcoll, id key, id val) {
var this__6160 = this;
if(cljm_truthy(this__6160_DOT_editable_QMARK_)) {
id idx__6161 = ((id (^)(id , id )) cljm_DOT_core_SLASH_array_map_index_of.value)(tcoll, key);
if(cljm_truthy(([idx__6161 isEqual:@-1]))) {
if(cljm_truthy(((this__6160_DOT_len + @2) <= (@2 * cljs_DOT_core_DOT_PersistentArrayMap_SLASH_HASHMAP_THRESHOLD.value)))) {
this__6160_DOT_len = (this__6160_DOT_len + @2);
[this__6160_DOT_arr pushkey];
[this__6160_DOT_arr pushval];
return tcoll;

} else {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_assoc_BANG_.value)(((id (^)(id , id )) cljm_DOT_core_SLASH_array__GT_transient_hash_map.value)(this__6160_DOT_len, this__6160_DOT_arr), key, val);

}

} else {
if(cljm_truthy(([val isEqual:(this__6160_DOT_arr[(idx__6161 + @1)])]))) {
return tcoll;

} else {
(this__6160_DOT_arr[(idx__6161 + @1)] = val);
return tcoll;

}

}

} else {
throw [Error.value alloc];

}
};
cljm_DOT_core_SLASH_TransientArrayMap.value.prototype.cljm$core$ITransientCollection$_conj_BANG_$arity$2 = ^id(id tcoll, id o) {
var this__6162 = this;
if(cljm_truthy(this__6162_DOT_editable_QMARK_)) {
if(cljm_truthy({id G__6163__6164 = o;
if(cljm_truthy(G__6163__6164)) {
if(cljm_truthy({id or__3824__auto____6165 = (G__6163__6164.cljm$lang$protocol_mask$partition0$ & @2048);
if(cljm_truthy(or__3824__auto____6165)) {
return or__3824__auto____6165;

} else {
return G__6163__6164.cljm$core$IMapEntry$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__6163__6164.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IMapEntry.value, G__6163__6164);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IMapEntry.value, G__6163__6164);

}
})) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__assoc_BANG_.value)(tcoll, ((id (^)(id )) cljm_DOT_core_SLASH_key.value)(o), ((id (^)(id )) cljm_DOT_core_SLASH_val.value)(o));

} else {
id es__6166 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(o);
id tcoll__6167 = tcoll;
while(YES) {
id temp__3971__auto____6168 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(es__6166);
if(cljm_truthy(temp__3971__auto____6168)) {
id e__6169 = temp__3971__auto____6168;
{
id G__6175 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(es__6166);
id G__6176 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH__assoc_BANG_.value)(tcoll__6167, ((id (^)(id )) cljm_DOT_core_SLASH_key.value)(e__6169), ((id (^)(id )) cljm_DOT_core_SLASH_val.value)(e__6169));
es__6166 = G__6175;
tcoll__6167 = G__6176;
continue;
}

} else {
return tcoll__6167;

}
break;
}

}

} else {
throw [Error.value alloc];

}
};
cljm_DOT_core_SLASH_TransientArrayMap.value.prototype.cljm$core$ITransientCollection$_persistent_BANG_$arity$1 = ^id(id tcoll) {
var this__6170 = this;
if(cljm_truthy(this__6170_DOT_editable_QMARK_)) {
this__6170_DOT_editable_QMARK_ = @NO;
return [cljm_DOT_core_SLASH_PersistentArrayMap.value alloc];

} else {
throw [Error.value alloc];

}
};
cljm_DOT_core_SLASH_TransientArrayMap.value.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id tcoll, id k) {
var this__6171 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(tcoll, k, nil);
};
cljm_DOT_core_SLASH_TransientArrayMap.value.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id tcoll, id k, id not_found) {
var this__6172 = this;
if(cljm_truthy(this__6172_DOT_editable_QMARK_)) {
id idx__6173 = ((id (^)(id , id )) cljm_DOT_core_SLASH_array_map_index_of.value)(tcoll, k);
if(cljm_truthy(([idx__6173 isEqual:@-1]))) {
return not_found;

} else {
return (this__6172_DOT_arr[(idx__6173 + @1)]);

}

} else {
throw [Error.value alloc];

}
};
cljm_DOT_core_SLASH_TransientArrayMap.value.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id tcoll) {
var this__6174 = this;
if(cljm_truthy(this__6174_DOT_editable_QMARK_)) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_quot.value)(this__6174_DOT_len, @2);

} else {
throw [Error.value alloc];

}
};
cljm_DOT_core_SLASH_TransientArrayMap.value;
cljm_DOT_core_SLASH_array__GT_transient_hash_map = [[CLJMVar alloc] initWithValue:^id(id len, id arr) {
id out__6179 = ((id (^)(id )) cljm_DOT_core_SLASH_transient.value)(@{});
id i__6180 = @0;
while(YES) {
if(cljm_truthy((i__6180 < len))) {
{
id G__6181 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_assoc_BANG_.value)(out__6179, (arr[i__6180]), (arr[(i__6180 + @1)]));
id G__6182 = (i__6180 + @2);
out__6179 = G__6181;
i__6180 = G__6182;
continue;
}

} else {
return out__6179;

}
break;
}
}];

/**
* @constructor
*/
cljm_DOT_core_SLASH_Box = (function (val){
this.val = val;
})
cljm_DOT_core_SLASH_Box.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_Box.value.cljm$lang$ctorPrSeq = ^id(id this__1420__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/Box", nil);
};
cljm_DOT_core_SLASH_Box.value;
cljm_DOT_core_SLASH_key_test = [[CLJMVar alloc] initWithValue:^id(id key, id other) {
if(cljm_truthy(((id (^)(id )) goog_SLASH_isString.value)(key))) {
return ([key isEqual:other]);

} else {
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH__EQ_.value)(key, other, nil);

}
}];
cljm_DOT_core_SLASH_mask = [[CLJMVar alloc] initWithValue:^id(id hash, id shift) {
return ((hash >>> shift) & @31);
}];
cljm_DOT_core_SLASH_clone_and_set = [[CLJMVar alloc] initWithValue:(function() {
var clone_and_set = null;
var clone_and_set__3 = ^id(id arr, id i, id a) {
id G__6187__6188 = arr.slice();
(G__6187__6188[i] = a);
return G__6187__6188;
};
var clone_and_set__5 = ^id(id arr, id i, id a, id j, id b) {
id G__6189__6190 = arr.slice();
(G__6189__6190[i] = a);
(G__6189__6190[j] = b);
return G__6189__6190;
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
];
cljm_DOT_core_SLASH_remove_pair = [[CLJMVar alloc] initWithValue:^id(id arr, id i) {
id new_arr__6192 = ((id (^)(id )) cljm_DOT_core_SLASH_make_array.value)((arr.length - @2));
((id (^)(id , id , id , id , id )) cljm_DOT_core_SLASH_array_copy.value)(arr, @0, new_arr__6192, @0, (@2 * i));
((id (^)(id , id , id , id , id )) cljm_DOT_core_SLASH_array_copy.value)(arr, (@2 * (i + @1)), new_arr__6192, (@2 * i), (new_arr__6192.length - (@2 * i)));
return new_arr__6192;
}];
cljm_DOT_core_SLASH_bitmap_indexed_node_index = [[CLJMVar alloc] initWithValue:^id(id bitmap, id bit) {
return ((id (^)(id )) cljm_DOT_core_SLASH_bit_count.value)((bitmap & (bit - @1)));
}];
cljm_DOT_core_SLASH_bitpos = [[CLJMVar alloc] initWithValue:^id(id hash, id shift) {
return (@1 << ((hash >>> shift) & 0x01f));
}];
cljm_DOT_core_SLASH_edit_and_set = [[CLJMVar alloc] initWithValue:(function() {
var edit_and_set = null;
var edit_and_set__4 = ^id(id inode, id edit, id i, id a) {
id editable__6195 = [inode ensureedit editable];
(editable__6195.arr[i] = a);
return editable__6195;
};
var edit_and_set__6 = ^id(id inode, id edit, id i, id a, id j, id b) {
id editable__6196 = [inode ensureedit editable];
(editable__6196.arr[i] = a);
(editable__6196.arr[j] = b);
return editable__6196;
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
];
cljm_DOT_core_SLASH_inode_kv_reduce = [[CLJMVar alloc] initWithValue:^id(id arr, id f, id init) {
id len__6203 = arr.length;
id i__6204 = @0;
id init__6205 = init;
while(YES) {
if(cljm_truthy((i__6204 < len__6203))) {
id init__6208 = {id k__6206 = (arr[i__6204]);
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((k__6206 == nil)))) {
return ((id (^)(id , id , id )) f.value)(init__6205, k__6206, (arr[(i__6204 + @1)]));

} else {
id node__6207 = (arr[(i__6204 + @1)]);
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((node__6207 == nil)))) {
return [node__6207 kvf reduceinit__6205];

} else {
return init__6205;

}

}
};
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_reduced_QMARK_.value)(init__6208))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(init__6208);

} else {
{
id G__6209 = (i__6204 + @2);
id G__6210 = init__6208;
i__6204 = G__6209;
init__6205 = G__6210;
continue;
}

}

} else {
return init__6205;

}
break;
}
}];

/**
* @constructor
*/
cljm_DOT_core_SLASH_BitmapIndexedNode = (function (edit, bitmap, arr){
this.edit = edit;
this.bitmap = bitmap;
this.arr = arr;
})
cljm_DOT_core_SLASH_BitmapIndexedNode.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_BitmapIndexedNode.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/BitmapIndexedNode", nil);
};
cljm_DOT_core_SLASH_BitmapIndexedNode.value.prototype.edit_and_remove_pair = ^id(id e, id bit, id i) {
var this__6211 = this;
id inode__6212 = this;
if(cljm_truthy(([this__6211_DOT_bitmap isEqual:bit]))) {
return nil;

} else {
id editable__6213 = [inode__6212 ensuree editable];
id earr__6214 = editable__6213.arr;
id len__6215 = earr__6214.length;
editable__6213.bitmap = (bit ^ editable__6213.bitmap);
((id (^)(id , id , id , id , id )) cljm_DOT_core_SLASH_array_copy.value)(earr__6214, (@2 * (i + @1)), earr__6214, (@2 * i), (len__6215 - (@2 * (i + @1))));
(earr__6214[(len__6215 - @2)] = nil);
(earr__6214[(len__6215 - @1)] = nil);
return editable__6213;

}
};
cljm_DOT_core_SLASH_BitmapIndexedNode.value.prototype.inode_assoc_BANG_ = ^id(id edit, id shift, id hash, id key, id val, id added_leaf_QMARK_) {
var this__6216 = this;
id inode__6217 = this;
id bit__6218 = (1 << ((hash >>> shift) & 0x01f));
id idx__6219 = ((id (^)(id , id )) cljm_DOT_core_SLASH_bitmap_indexed_node_index.value)(this__6216_DOT_bitmap, bit__6218);
if(cljm_truthy(([(this__6216_DOT_bitmap & bit__6218) isEqual:@0]))) {
id n__6220 = ((id (^)(id )) cljm_DOT_core_SLASH_bit_count.value)(this__6216_DOT_bitmap);
if(cljm_truthy(((@2 * n__6220) < this__6216_DOT_arr.length))) {
id editable__6221 = [inode__6217 ensureedit editable];
id earr__6222 = editable__6221.arr;
added_leaf_QMARK_.val = @YES;
((id (^)(id , id , id , id , id )) cljm_DOT_core_SLASH_array_copy_downward.value)(earr__6222, (@2 * idx__6219), earr__6222, (@2 * (idx__6219 + @1)), (@2 * (n__6220 - idx__6219)));
(earr__6222[(@2 * idx__6219)] = key);
(earr__6222[((@2 * idx__6219) + @1)] = val);
editable__6221.bitmap = (editable__6221.bitmap | bit__6218);
return editable__6221;

} else {
if(cljm_truthy((n__6220 >= @16))) {
id nodes__6223 = ((id (^)(id )) cljm_DOT_core_SLASH_make_array.value)(@32);
id jdx__6224 = ((hash >>> shift) & 0x01f);
(nodes__6223[jdx__6224] = [cljs_DOT_core_DOT_BitmapIndexedNode_SLASH_EMPTY.value inodeedit assoc(shift + @5), hash, key, val, added_leaf_QMARK_, nil]);
id i__6225 = @0;
id j__6226 = @0;
while(YES) {
if(cljm_truthy((i__6225 < @32))) {
if(cljm_truthy(([((this__6216_DOT_bitmap >>> i__6225) & @1) isEqual:@0]))) {
{
id G__6279 = (i__6225 + @1);
id G__6280 = j__6226;
i__6225 = G__6279;
j__6226 = G__6280;
continue;
}

} else {
(nodes__6223[i__6225] = (cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)(((this__6216_DOT_arr[j__6226]) == nil)))) ?[cljs_DOT_core_DOT_BitmapIndexedNode_SLASH_EMPTY.value inodeedit assoc(shift + @5), ((id (^)(id )) cljs_DOT_core_SLASH_hash.value)((this__6216_DOT_arr[j__6226])), (this__6216_DOT_arr[j__6226]), (this__6216_DOT_arr[(j__6226 + @1)]), added_leaf_QMARK_, nil]:(this__6216_DOT_arr[(j__6226 + @1)]));
{
id G__6281 = (i__6225 + @1);
id G__6282 = (j__6226 + @2);
i__6225 = G__6281;
j__6226 = G__6282;
continue;
}

}

} else {

}
break;
}
return [cljm_DOT_core_SLASH_ArrayNode.value alloc];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
id new_arr__6227 = ((id (^)(id )) cljm_DOT_core_SLASH_make_array.value)((@2 * (n__6220 + @4)));
((id (^)(id , id , id , id , id )) cljm_DOT_core_SLASH_array_copy.value)(this__6216_DOT_arr, @0, new_arr__6227, @0, (@2 * idx__6219));
(new_arr__6227[(@2 * idx__6219)] = key);
(new_arr__6227[((@2 * idx__6219) + @1)] = val);
((id (^)(id , id , id , id , id )) cljm_DOT_core_SLASH_array_copy.value)(this__6216_DOT_arr, (@2 * idx__6219), new_arr__6227, (@2 * (idx__6219 + @1)), (@2 * (n__6220 - idx__6219)));
added_leaf_QMARK_.val = @YES;
id editable__6228 = [inode__6217 ensureedit editable];
editable__6228.arr = new_arr__6227;
editable__6228.bitmap = (editable__6228.bitmap | bit__6218);
return editable__6228;

} else {
return nil;

}

}

}

} else {
id key_or_nil__6229 = (this__6216_DOT_arr[(@2 * idx__6219)]);
id val_or_node__6230 = (this__6216_DOT_arr[((@2 * idx__6219) + @1)]);
if(cljm_truthy((key_or_nil__6229 == nil))) {
id n__6231 = [val_or_node__6230 inodeedit assoc(shift + @5), hash, key, val, added_leaf_QMARK_, nil];
if(cljm_truthy(([n__6231 isEqual:val_or_node__6230]))) {
return inode__6217;

} else {
return ((id (^)(id , id , id , id )) cljm_DOT_core_SLASH_edit_and_set.value)(inode__6217, edit, ((@2 * idx__6219) + @1), n__6231);

}

} else {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_key_test.value)(key, key_or_nil__6229))) {
if(cljm_truthy(([val isEqual:val_or_node__6230]))) {
return inode__6217;

} else {
return ((id (^)(id , id , id , id )) cljm_DOT_core_SLASH_edit_and_set.value)(inode__6217, edit, ((@2 * idx__6219) + @1), val);

}

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
added_leaf_QMARK_.val = @YES;
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_edit_and_set.value)(inode__6217, edit, (@2 * idx__6219), nil, ((@2 * idx__6219) + @1), ((id (^)(id , id , id , id , id , id , id )) cljm_DOT_core_SLASH_create_node.value)(edit, (shift + @5), key_or_nil__6229, val_or_node__6230, hash, key, val));

} else {
return nil;

}

}

}

}
};
cljm_DOT_core_SLASH_BitmapIndexedNode.value.prototype.inode_seq = ^id() {
var this__6232 = this;
id inode__6233 = this;
return ((id (^)(id )) cljm_DOT_core_SLASH_create_inode_seq.value)(this__6232_DOT_arr);
};
cljm_DOT_core_SLASH_BitmapIndexedNode.value.prototype.inode_without_BANG_ = ^id(id edit, id shift, id hash, id key, id removed_leaf_QMARK_) {
var this__6234 = this;
id inode__6235 = this;
id bit__6236 = (1 << ((hash >>> shift) & 0x01f));
if(cljm_truthy(([(this__6234_DOT_bitmap & bit__6236) isEqual:@0]))) {
return inode__6235;

} else {
id idx__6237 = ((id (^)(id , id )) cljm_DOT_core_SLASH_bitmap_indexed_node_index.value)(this__6234_DOT_bitmap, bit__6236);
id key_or_nil__6238 = (this__6234_DOT_arr[(@2 * idx__6237)]);
id val_or_node__6239 = (this__6234_DOT_arr[((@2 * idx__6237) + @1)]);
if(cljm_truthy((key_or_nil__6238 == nil))) {
id n__6240 = [val_or_node__6239 inodeedit without(shift + @5), hash, key, removed_leaf_QMARK_, nil];
if(cljm_truthy(([n__6240 isEqual:val_or_node__6239]))) {
return inode__6235;

} else {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((n__6240 == nil)))) {
return ((id (^)(id , id , id , id )) cljm_DOT_core_SLASH_edit_and_set.value)(inode__6235, edit, ((@2 * idx__6237) + @1), n__6240);

} else {
if(cljm_truthy(([this__6234_DOT_bitmap isEqual:bit__6236]))) {
return nil;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return [inode__6235 editedit andbit__6236 removeidx__6237 pair];

} else {
return nil;

}

}

}

}

} else {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_key_test.value)(key, key_or_nil__6238))) {
(removed_leaf_QMARK_[@0] = @YES);
return [inode__6235 editedit andbit__6236 removeidx__6237 pair];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return inode__6235;

} else {
return nil;

}

}

}

}
};
cljm_DOT_core_SLASH_BitmapIndexedNode.value.prototype.ensure_editable = ^id(id e) {
var this__6241 = this;
id inode__6242 = this;
if(cljm_truthy(([e isEqual:this__6241_DOT_edit]))) {
return inode__6242;

} else {
id n__6243 = ((id (^)(id )) cljm_DOT_core_SLASH_bit_count.value)(this__6241_DOT_bitmap);
id new_arr__6244 = ((id (^)(id )) cljm_DOT_core_SLASH_make_array.value)((cljm_truthy((n__6243 < @0))) ?@4:(@2 * (n__6243 + @1)));
((id (^)(id , id , id , id , id )) cljm_DOT_core_SLASH_array_copy.value)(this__6241_DOT_arr, @0, new_arr__6244, @0, (@2 * n__6243));
return [cljm_DOT_core_SLASH_BitmapIndexedNode.value alloc];

}
};
cljm_DOT_core_SLASH_BitmapIndexedNode.value.prototype.kv_reduce = ^id(id f, id init) {
var this__6245 = this;
id inode__6246 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_inode_kv_reduce.value)(this__6245_DOT_arr, f, init);
};
cljm_DOT_core_SLASH_BitmapIndexedNode.value.prototype.inode_find = ^id(id shift, id hash, id key, id not_found) {
var this__6247 = this;
id inode__6248 = this;
id bit__6249 = (1 << ((hash >>> shift) & 0x01f));
if(cljm_truthy(([(this__6247_DOT_bitmap & bit__6249) isEqual:@0]))) {
return not_found;

} else {
id idx__6250 = ((id (^)(id , id )) cljm_DOT_core_SLASH_bitmap_indexed_node_index.value)(this__6247_DOT_bitmap, bit__6249);
id key_or_nil__6251 = (this__6247_DOT_arr[(@2 * idx__6250)]);
id val_or_node__6252 = (this__6247_DOT_arr[((@2 * idx__6250) + @1)]);
if(cljm_truthy((key_or_nil__6251 == nil))) {
return [val_or_node__6252 inode(shift + @5) findhash, key, not_found, nil];

} else {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_key_test.value)(key, key_or_nil__6251))) {
return @[ key_or_nil__6251, val_or_node__6252 ];

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
cljm_DOT_core_SLASH_BitmapIndexedNode.value.prototype.inode_without = ^id(id shift, id hash, id key) {
var this__6253 = this;
id inode__6254 = this;
id bit__6255 = (1 << ((hash >>> shift) & 0x01f));
if(cljm_truthy(([(this__6253_DOT_bitmap & bit__6255) isEqual:@0]))) {
return inode__6254;

} else {
id idx__6256 = ((id (^)(id , id )) cljm_DOT_core_SLASH_bitmap_indexed_node_index.value)(this__6253_DOT_bitmap, bit__6255);
id key_or_nil__6257 = (this__6253_DOT_arr[(@2 * idx__6256)]);
id val_or_node__6258 = (this__6253_DOT_arr[((@2 * idx__6256) + @1)]);
if(cljm_truthy((key_or_nil__6257 == nil))) {
id n__6259 = [val_or_node__6258 inode(shift + @5) withouthash, key, nil];
if(cljm_truthy(([n__6259 isEqual:val_or_node__6258]))) {
return inode__6254;

} else {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((n__6259 == nil)))) {
return [cljm_DOT_core_SLASH_BitmapIndexedNode.value alloc];

} else {
if(cljm_truthy(([this__6253_DOT_bitmap isEqual:bit__6255]))) {
return nil;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return [cljm_DOT_core_SLASH_BitmapIndexedNode.value alloc];

} else {
return nil;

}

}

}

}

} else {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_key_test.value)(key, key_or_nil__6257))) {
return [cljm_DOT_core_SLASH_BitmapIndexedNode.value alloc];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return inode__6254;

} else {
return nil;

}

}

}

}
};
cljm_DOT_core_SLASH_BitmapIndexedNode.value.prototype.inode_assoc = ^id(id shift, id hash, id key, id val, id added_leaf_QMARK_) {
var this__6260 = this;
id inode__6261 = this;
id bit__6262 = (1 << ((hash >>> shift) & 0x01f));
id idx__6263 = ((id (^)(id , id )) cljm_DOT_core_SLASH_bitmap_indexed_node_index.value)(this__6260_DOT_bitmap, bit__6262);
if(cljm_truthy(([(this__6260_DOT_bitmap & bit__6262) isEqual:@0]))) {
id n__6264 = ((id (^)(id )) cljm_DOT_core_SLASH_bit_count.value)(this__6260_DOT_bitmap);
if(cljm_truthy((n__6264 >= @16))) {
id nodes__6265 = ((id (^)(id )) cljm_DOT_core_SLASH_make_array.value)(@32);
id jdx__6266 = ((hash >>> shift) & 0x01f);
(nodes__6265[jdx__6266] = [cljs_DOT_core_DOT_BitmapIndexedNode_SLASH_EMPTY.value inode(shift + @5) assochash, key, val, added_leaf_QMARK_, nil]);
id i__6267 = @0;
id j__6268 = @0;
while(YES) {
if(cljm_truthy((i__6267 < @32))) {
if(cljm_truthy(([((this__6260_DOT_bitmap >>> i__6267) & @1) isEqual:@0]))) {
{
id G__6283 = (i__6267 + @1);
id G__6284 = j__6268;
i__6267 = G__6283;
j__6268 = G__6284;
continue;
}

} else {
(nodes__6265[i__6267] = (cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)(((this__6260_DOT_arr[j__6268]) == nil)))) ?[cljs_DOT_core_DOT_BitmapIndexedNode_SLASH_EMPTY.value inode(shift + @5) assoc((id (^)(id )) cljs_DOT_core_SLASH_hash.value)((this__6260_DOT_arr[j__6268])), (this__6260_DOT_arr[j__6268]), (this__6260_DOT_arr[(j__6268 + @1)]), added_leaf_QMARK_, nil]:(this__6260_DOT_arr[(j__6268 + @1)]));
{
id G__6285 = (i__6267 + @1);
id G__6286 = (j__6268 + @2);
i__6267 = G__6285;
j__6268 = G__6286;
continue;
}

}

} else {

}
break;
}
return [cljm_DOT_core_SLASH_ArrayNode.value alloc];

} else {
id new_arr__6269 = ((id (^)(id )) cljm_DOT_core_SLASH_make_array.value)((@2 * (n__6264 + @1)));
((id (^)(id , id , id , id , id )) cljm_DOT_core_SLASH_array_copy.value)(this__6260_DOT_arr, @0, new_arr__6269, @0, (@2 * idx__6263));
(new_arr__6269[(@2 * idx__6263)] = key);
(new_arr__6269[((@2 * idx__6263) + @1)] = val);
((id (^)(id , id , id , id , id )) cljm_DOT_core_SLASH_array_copy.value)(this__6260_DOT_arr, (@2 * idx__6263), new_arr__6269, (@2 * (idx__6263 + @1)), (@2 * (n__6264 - idx__6263)));
added_leaf_QMARK_.val = @YES;
return [cljm_DOT_core_SLASH_BitmapIndexedNode.value alloc];

}

} else {
id key_or_nil__6270 = (this__6260_DOT_arr[(@2 * idx__6263)]);
id val_or_node__6271 = (this__6260_DOT_arr[((@2 * idx__6263) + @1)]);
if(cljm_truthy((key_or_nil__6270 == nil))) {
id n__6272 = [val_or_node__6271 inode(shift + @5) assochash, key, val, added_leaf_QMARK_, nil];
if(cljm_truthy(([n__6272 isEqual:val_or_node__6271]))) {
return inode__6261;

} else {
return [cljm_DOT_core_SLASH_BitmapIndexedNode.value alloc];

}

} else {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_key_test.value)(key, key_or_nil__6270))) {
if(cljm_truthy(([val isEqual:val_or_node__6271]))) {
return inode__6261;

} else {
return [cljm_DOT_core_SLASH_BitmapIndexedNode.value alloc];

}

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
added_leaf_QMARK_.val = @YES;
return [cljm_DOT_core_SLASH_BitmapIndexedNode.value alloc];

} else {
return nil;

}

}

}

}
};
cljm_DOT_core_SLASH_BitmapIndexedNode.value.prototype.inode_lookup = ^id(id shift, id hash, id key, id not_found) {
var this__6273 = this;
id inode__6274 = this;
id bit__6275 = (1 << ((hash >>> shift) & 0x01f));
if(cljm_truthy(([(this__6273_DOT_bitmap & bit__6275) isEqual:@0]))) {
return not_found;

} else {
id idx__6276 = ((id (^)(id , id )) cljm_DOT_core_SLASH_bitmap_indexed_node_index.value)(this__6273_DOT_bitmap, bit__6275);
id key_or_nil__6277 = (this__6273_DOT_arr[(@2 * idx__6276)]);
id val_or_node__6278 = (this__6273_DOT_arr[((@2 * idx__6276) + @1)]);
if(cljm_truthy((key_or_nil__6277 == nil))) {
return [val_or_node__6278 inode(shift + @5) lookuphash, key, not_found, nil];

} else {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_key_test.value)(key, key_or_nil__6277))) {
return val_or_node__6278;

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
cljm_DOT_core_SLASH_BitmapIndexedNode.value;
cljs_DOT_core_DOT_BitmapIndexedNode_SLASH_EMPTY.value = [cljm_DOT_core_SLASH_BitmapIndexedNode.value alloc];
cljm_DOT_core_SLASH_pack_array_node = [[CLJMVar alloc] initWithValue:^id(id array_node, id edit, id idx) {
id arr__6294 = array_node.arr;
id len__6295 = (@2 * (array_node.cnt - @1));
id new_arr__6296 = ((id (^)(id )) cljm_DOT_core_SLASH_make_array.value)(len__6295);
id i__6297 = @0;
id j__6298 = @1;
id bitmap__6299 = @0;
while(YES) {
if(cljm_truthy((i__6297 < len__6295))) {
if(cljm_truthy({id and__3822__auto____6300 = ((id (^)(id )) cljm_DOT_core_SLASH_not.value)(([i__6297 isEqual:idx]));
if(cljm_truthy(and__3822__auto____6300)) {
return ((id (^)(id )) cljm_DOT_core_SLASH_not.value)(((arr__6294[i__6297]) == nil));

} else {
return and__3822__auto____6300;

}
})) {
(new_arr__6296[j__6298] = (arr__6294[i__6297]));
{
id G__6301 = (i__6297 + @1);
id G__6302 = (j__6298 + @2);
id G__6303 = (bitmap__6299 | (@1 << i__6297));
i__6297 = G__6301;
j__6298 = G__6302;
bitmap__6299 = G__6303;
continue;
}

} else {
{
id G__6304 = (i__6297 + @1);
id G__6305 = j__6298;
id G__6306 = bitmap__6299;
i__6297 = G__6304;
j__6298 = G__6305;
bitmap__6299 = G__6306;
continue;
}

}

} else {
return [cljm_DOT_core_SLASH_BitmapIndexedNode.value alloc];

}
break;
}
}];

/**
* @constructor
*/
cljm_DOT_core_SLASH_ArrayNode = (function (edit, cnt, arr){
this.edit = edit;
this.cnt = cnt;
this.arr = arr;
})
cljm_DOT_core_SLASH_ArrayNode.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_ArrayNode.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/ArrayNode", nil);
};
cljm_DOT_core_SLASH_ArrayNode.value.prototype.inode_assoc_BANG_ = ^id(id edit, id shift, id hash, id key, id val, id added_leaf_QMARK_) {
var this__6307 = this;
id inode__6308 = this;
id idx__6309 = ((hash >>> shift) & 0x01f);
id node__6310 = (this__6307_DOT_arr[idx__6309]);
if(cljm_truthy((node__6310 == nil))) {
id editable__6311 = ((id (^)(id , id , id , id )) cljm_DOT_core_SLASH_edit_and_set.value)(inode__6308, edit, idx__6309, [cljs_DOT_core_DOT_BitmapIndexedNode_SLASH_EMPTY.value inodeedit assoc(shift + @5), hash, key, val, added_leaf_QMARK_, nil]);
editable__6311.cnt = (editable__6311.cnt + @1);
return editable__6311;

} else {
id n__6312 = [node__6310 inodeedit assoc(shift + @5), hash, key, val, added_leaf_QMARK_, nil];
if(cljm_truthy(([n__6312 isEqual:node__6310]))) {
return inode__6308;

} else {
return ((id (^)(id , id , id , id )) cljm_DOT_core_SLASH_edit_and_set.value)(inode__6308, edit, idx__6309, n__6312);

}

}
};
cljm_DOT_core_SLASH_ArrayNode.value.prototype.inode_seq = ^id() {
var this__6313 = this;
id inode__6314 = this;
return ((id (^)(id )) cljm_DOT_core_SLASH_create_array_node_seq.value)(this__6313_DOT_arr);
};
cljm_DOT_core_SLASH_ArrayNode.value.prototype.inode_without_BANG_ = ^id(id edit, id shift, id hash, id key, id removed_leaf_QMARK_) {
var this__6315 = this;
id inode__6316 = this;
id idx__6317 = ((hash >>> shift) & 0x01f);
id node__6318 = (this__6315_DOT_arr[idx__6317]);
if(cljm_truthy((node__6318 == nil))) {
return inode__6316;

} else {
id n__6319 = [node__6318 inodeedit without(shift + @5), hash, key, removed_leaf_QMARK_, nil];
if(cljm_truthy(([n__6319 isEqual:node__6318]))) {
return inode__6316;

} else {
if(cljm_truthy((n__6319 == nil))) {
if(cljm_truthy((this__6315_DOT_cnt <= @8))) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_pack_array_node.value)(inode__6316, edit, idx__6317);

} else {
id editable__6320 = ((id (^)(id , id , id , id )) cljm_DOT_core_SLASH_edit_and_set.value)(inode__6316, edit, idx__6317, n__6319);
editable__6320.cnt = (editable__6320.cnt - @1);
return editable__6320;

}

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return ((id (^)(id , id , id , id )) cljm_DOT_core_SLASH_edit_and_set.value)(inode__6316, edit, idx__6317, n__6319);

} else {
return nil;

}

}

}

}
};
cljm_DOT_core_SLASH_ArrayNode.value.prototype.ensure_editable = ^id(id e) {
var this__6321 = this;
id inode__6322 = this;
if(cljm_truthy(([e isEqual:this__6321_DOT_edit]))) {
return inode__6322;

} else {
return [cljm_DOT_core_SLASH_ArrayNode.value alloc];

}
};
cljm_DOT_core_SLASH_ArrayNode.value.prototype.kv_reduce = ^id(id f, id init) {
var this__6323 = this;
id inode__6324 = this;
id len__6325 = this__6323_DOT_arr.length;
id i__6326 = @0;
id init__6327 = init;
while(YES) {
if(cljm_truthy((i__6326 < len__6325))) {
id node__6328 = (this__6323_DOT_arr[i__6326]);
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((node__6328 == nil)))) {
id init__6329 = [node__6328 kvf reduceinit__6327];
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_reduced_QMARK_.value)(init__6329))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(init__6329);

} else {
{
id G__6348 = (i__6326 + @1);
id G__6349 = init__6329;
i__6326 = G__6348;
init__6327 = G__6349;
continue;
}

}

} else {
return nil;

}

} else {
return init__6327;

}
break;
}
};
cljm_DOT_core_SLASH_ArrayNode.value.prototype.inode_find = ^id(id shift, id hash, id key, id not_found) {
var this__6330 = this;
id inode__6331 = this;
id idx__6332 = ((hash >>> shift) & 0x01f);
id node__6333 = (this__6330_DOT_arr[idx__6332]);
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((node__6333 == nil)))) {
return [node__6333 inode(shift + @5) findhash, key, not_found, nil];

} else {
return not_found;

}
};
cljm_DOT_core_SLASH_ArrayNode.value.prototype.inode_without = ^id(id shift, id hash, id key) {
var this__6334 = this;
id inode__6335 = this;
id idx__6336 = ((hash >>> shift) & 0x01f);
id node__6337 = (this__6334_DOT_arr[idx__6336]);
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((node__6337 == nil)))) {
id n__6338 = [node__6337 inode(shift + @5) withouthash, key, nil];
if(cljm_truthy(([n__6338 isEqual:node__6337]))) {
return inode__6335;

} else {
if(cljm_truthy((n__6338 == nil))) {
if(cljm_truthy((this__6334_DOT_cnt <= @8))) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_pack_array_node.value)(inode__6335, nil, idx__6336);

} else {
return [cljm_DOT_core_SLASH_ArrayNode.value alloc];

}

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return [cljm_DOT_core_SLASH_ArrayNode.value alloc];

} else {
return nil;

}

}

}

} else {
return inode__6335;

}
};
cljm_DOT_core_SLASH_ArrayNode.value.prototype.inode_assoc = ^id(id shift, id hash, id key, id val, id added_leaf_QMARK_) {
var this__6339 = this;
id inode__6340 = this;
id idx__6341 = ((hash >>> shift) & 0x01f);
id node__6342 = (this__6339_DOT_arr[idx__6341]);
if(cljm_truthy((node__6342 == nil))) {
return [cljm_DOT_core_SLASH_ArrayNode.value alloc];

} else {
id n__6343 = [node__6342 inode(shift + @5) assochash, key, val, added_leaf_QMARK_, nil];
if(cljm_truthy(([n__6343 isEqual:node__6342]))) {
return inode__6340;

} else {
return [cljm_DOT_core_SLASH_ArrayNode.value alloc];

}

}
};
cljm_DOT_core_SLASH_ArrayNode.value.prototype.inode_lookup = ^id(id shift, id hash, id key, id not_found) {
var this__6344 = this;
id inode__6345 = this;
id idx__6346 = ((hash >>> shift) & 0x01f);
id node__6347 = (this__6344_DOT_arr[idx__6346]);
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((node__6347 == nil)))) {
return [node__6347 inode(shift + @5) lookuphash, key, not_found, nil];

} else {
return not_found;

}
};
cljm_DOT_core_SLASH_ArrayNode.value;
cljm_DOT_core_SLASH_hash_collision_node_find_index = [[CLJMVar alloc] initWithValue:^id(id arr, id cnt, id key) {
id lim__6352 = (@2 * cnt);
id i__6353 = @0;
while(YES) {
if(cljm_truthy((i__6353 < lim__6352))) {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_key_test.value)(key, (arr[i__6353])))) {
return i__6353;

} else {
{
id G__6354 = (i__6353 + @2);
i__6353 = G__6354;
continue;
}

}

} else {
return @-1;

}
break;
}
}];

/**
* @constructor
*/
cljm_DOT_core_SLASH_HashCollisionNode = (function (edit, collision_hash, cnt, arr){
this.edit = edit;
this.collision_hash = collision_hash;
this.cnt = cnt;
this.arr = arr;
})
cljm_DOT_core_SLASH_HashCollisionNode.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_HashCollisionNode.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/HashCollisionNode", nil);
};
cljm_DOT_core_SLASH_HashCollisionNode.value.prototype.inode_assoc_BANG_ = ^id(id edit, id shift, id hash, id key, id val, id added_leaf_QMARK_) {
var this__6355 = this;
id inode__6356 = this;
if(cljm_truthy(([hash isEqual:this__6355_DOT_collision_hash]))) {
id idx__6357 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_hash_collision_node_find_index.value)(this__6355_DOT_arr, this__6355_DOT_cnt, key);
if(cljm_truthy(([idx__6357 isEqual:@-1]))) {
if(cljm_truthy((this__6355_DOT_arr.length > (@2 * this__6355_DOT_cnt)))) {
id editable__6358 = ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_edit_and_set.value)(inode__6356, edit, (@2 * this__6355_DOT_cnt), key, ((@2 * this__6355_DOT_cnt) + @1), val);
added_leaf_QMARK_.val = @YES;
editable__6358.cnt = (editable__6358.cnt + @1);
return editable__6358;

} else {
id len__6359 = this__6355_DOT_arr.length;
id new_arr__6360 = ((id (^)(id )) cljm_DOT_core_SLASH_make_array.value)((len__6359 + @2));
((id (^)(id , id , id , id , id )) cljm_DOT_core_SLASH_array_copy.value)(this__6355_DOT_arr, @0, new_arr__6360, @0, len__6359);
(new_arr__6360[len__6359] = key);
(new_arr__6360[(len__6359 + @1)] = val);
added_leaf_QMARK_.val = @YES;
return [inode__6356 ensureedit editable(this__6355_DOT_cnt + @1) arraynew_arr__6360];

}

} else {
if(cljm_truthy(([(this__6355_DOT_arr[(idx__6357 + @1)]) isEqual:val]))) {
return inode__6356;

} else {
return ((id (^)(id , id , id , id )) cljm_DOT_core_SLASH_edit_and_set.value)(inode__6356, edit, (idx__6357 + @1), val);

}

}

} else {
return [[cljm_DOT_core_SLASH_BitmapIndexedNode.value alloc] inodeedit assocshift, hash, key, val, added_leaf_QMARK_, nil];

}
};
cljm_DOT_core_SLASH_HashCollisionNode.value.prototype.inode_seq = ^id() {
var this__6361 = this;
id inode__6362 = this;
return ((id (^)(id )) cljm_DOT_core_SLASH_create_inode_seq.value)(this__6361_DOT_arr);
};
cljm_DOT_core_SLASH_HashCollisionNode.value.prototype.inode_without_BANG_ = ^id(id edit, id shift, id hash, id key, id removed_leaf_QMARK_) {
var this__6363 = this;
id inode__6364 = this;
id idx__6365 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_hash_collision_node_find_index.value)(this__6363_DOT_arr, this__6363_DOT_cnt, key);
if(cljm_truthy(([idx__6365 isEqual:@-1]))) {
return inode__6364;

} else {
(removed_leaf_QMARK_[@0] = @YES);
if(cljm_truthy(([this__6363_DOT_cnt isEqual:@1]))) {
return nil;

} else {
id editable__6366 = [inode__6364 ensureedit editable];
id earr__6367 = editable__6366.arr;
(earr__6367[idx__6365] = (earr__6367[((@2 * this__6363_DOT_cnt) - @2)]));
(earr__6367[(idx__6365 + @1)] = (earr__6367[((@2 * this__6363_DOT_cnt) - @1)]));
(earr__6367[((@2 * this__6363_DOT_cnt) - @1)] = nil);
(earr__6367[((@2 * this__6363_DOT_cnt) - @2)] = nil);
editable__6366.cnt = (editable__6366.cnt - @1);
return editable__6366;

}

}
};
cljm_DOT_core_SLASH_HashCollisionNode.value.prototype.ensure_editable = ^id(id e) {
var this__6368 = this;
id inode__6369 = this;
if(cljm_truthy(([e isEqual:this__6368_DOT_edit]))) {
return inode__6369;

} else {
id new_arr__6370 = ((id (^)(id )) cljm_DOT_core_SLASH_make_array.value)((@2 * (this__6368_DOT_cnt + @1)));
((id (^)(id , id , id , id , id )) cljm_DOT_core_SLASH_array_copy.value)(this__6368_DOT_arr, @0, new_arr__6370, @0, (@2 * this__6368_DOT_cnt));
return [cljm_DOT_core_SLASH_HashCollisionNode.value alloc];

}
};
cljm_DOT_core_SLASH_HashCollisionNode.value.prototype.kv_reduce = ^id(id f, id init) {
var this__6371 = this;
id inode__6372 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_inode_kv_reduce.value)(this__6371_DOT_arr, f, init);
};
cljm_DOT_core_SLASH_HashCollisionNode.value.prototype.inode_find = ^id(id shift, id hash, id key, id not_found) {
var this__6373 = this;
id inode__6374 = this;
id idx__6375 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_hash_collision_node_find_index.value)(this__6373_DOT_arr, this__6373_DOT_cnt, key);
if(cljm_truthy((idx__6375 < @0))) {
return not_found;

} else {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_key_test.value)(key, (this__6373_DOT_arr[idx__6375])))) {
return @[ (this__6373_DOT_arr[idx__6375]), (this__6373_DOT_arr[(idx__6375 + @1)]) ];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return not_found;

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_HashCollisionNode.value.prototype.inode_without = ^id(id shift, id hash, id key) {
var this__6376 = this;
id inode__6377 = this;
id idx__6378 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_hash_collision_node_find_index.value)(this__6376_DOT_arr, this__6376_DOT_cnt, key);
if(cljm_truthy(([idx__6378 isEqual:@-1]))) {
return inode__6377;

} else {
if(cljm_truthy(([this__6376_DOT_cnt isEqual:@1]))) {
return nil;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return [cljm_DOT_core_SLASH_HashCollisionNode.value alloc];

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_HashCollisionNode.value.prototype.inode_assoc = ^id(id shift, id hash, id key, id val, id added_leaf_QMARK_) {
var this__6379 = this;
id inode__6380 = this;
if(cljm_truthy(([hash isEqual:this__6379_DOT_collision_hash]))) {
id idx__6381 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_hash_collision_node_find_index.value)(this__6379_DOT_arr, this__6379_DOT_cnt, key);
if(cljm_truthy(([idx__6381 isEqual:@-1]))) {
id len__6382 = this__6379_DOT_arr.length;
id new_arr__6383 = ((id (^)(id )) cljm_DOT_core_SLASH_make_array.value)((len__6382 + @2));
((id (^)(id , id , id , id , id )) cljm_DOT_core_SLASH_array_copy.value)(this__6379_DOT_arr, @0, new_arr__6383, @0, len__6382);
(new_arr__6383[len__6382] = key);
(new_arr__6383[(len__6382 + @1)] = val);
added_leaf_QMARK_.val = @YES;
return [cljm_DOT_core_SLASH_HashCollisionNode.value alloc];

} else {
if(cljm_truthy(((id (^)(id , id , ...)) cljm_DOT_core_SLASH__EQ_.value)((this__6379_DOT_arr[idx__6381]), val, nil))) {
return inode__6380;

} else {
return [cljm_DOT_core_SLASH_HashCollisionNode.value alloc];

}

}

} else {
return [[cljm_DOT_core_SLASH_BitmapIndexedNode.value alloc] inodeshift assochash, key, val, added_leaf_QMARK_, nil];

}
};
cljm_DOT_core_SLASH_HashCollisionNode.value.prototype.inode_lookup = ^id(id shift, id hash, id key, id not_found) {
var this__6384 = this;
id inode__6385 = this;
id idx__6386 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_hash_collision_node_find_index.value)(this__6384_DOT_arr, this__6384_DOT_cnt, key);
if(cljm_truthy((idx__6386 < @0))) {
return not_found;

} else {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_key_test.value)(key, (this__6384_DOT_arr[idx__6386])))) {
return (this__6384_DOT_arr[(idx__6386 + @1)]);

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return not_found;

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_HashCollisionNode.value.prototype.ensure_editable_array = ^id(id e, id count, id array) {
var this__6387 = this;
id inode__6388 = this;
if(cljm_truthy(([e isEqual:this__6387_DOT_edit]))) {
this__6387_DOT_arr = array;
this__6387_DOT_cnt = count;
return inode__6388;

} else {
return [cljm_DOT_core_SLASH_HashCollisionNode.value alloc];

}
};
cljm_DOT_core_SLASH_HashCollisionNode.value;
cljm_DOT_core_SLASH_create_node = [[CLJMVar alloc] initWithValue:(function() {
var create_node = null;
var create_node__6 = ^id(id shift, id key1, id val1, id key2hash, id key2, id val2) {
id key1hash__6393 = ((id (^)(id )) cljm_DOT_core_SLASH_hash.value)(key1);
if(cljm_truthy(([key1hash__6393 isEqual:key2hash]))) {
return [cljm_DOT_core_SLASH_HashCollisionNode.value alloc];

} else {
id added_leaf_QMARK___6394 = [cljm_DOT_core_SLASH_Box.value alloc];
return [[cljs_DOT_core_DOT_BitmapIndexedNode_SLASH_EMPTY.value inodeshift assockey1hash__6393, key1, val1, added_leaf_QMARK___6394, nil] inodeshift assockey2hash, key2, val2, added_leaf_QMARK___6394, nil];

}
};
var create_node__7 = ^id(id edit, id shift, id key1, id val1, id key2hash, id key2, id val2) {
id key1hash__6395 = ((id (^)(id )) cljm_DOT_core_SLASH_hash.value)(key1);
if(cljm_truthy(([key1hash__6395 isEqual:key2hash]))) {
return [cljm_DOT_core_SLASH_HashCollisionNode.value alloc];

} else {
id added_leaf_QMARK___6396 = [cljm_DOT_core_SLASH_Box.value alloc];
return [[cljs_DOT_core_DOT_BitmapIndexedNode_SLASH_EMPTY.value inodeedit assocshift, key1hash__6395, key1, val1, added_leaf_QMARK___6396, nil] inodeedit assocshift, key2hash, key2, val2, added_leaf_QMARK___6396, nil];

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
];

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
cljm_DOT_core_SLASH_NodeSeq.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_NodeSeq.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/NodeSeq", nil);
};
cljm_DOT_core_SLASH_NodeSeq.value.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__6397 = this;
id h__1302__auto____6398 = this__6397_DOT___hash;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((h__1302__auto____6398 == nil)))) {
return h__1302__auto____6398;

} else {
id h__1302__auto____6399 = ((id (^)(id )) cljm_DOT_core_SLASH_hash_coll.value)(coll);
this__6397_DOT___hash = h__1302__auto____6399;
return h__1302__auto____6399;

}
};
cljm_DOT_core_SLASH_NodeSeq.value.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id o) {
var this__6400 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(o, coll);
};
cljm_DOT_core_SLASH_NodeSeq.value.prototype.toString = ^id() {
var this__6401 = this;
id this__6402 = this;
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_pr_str.value)(this__6402, nil);
};
cljm_DOT_core_SLASH_NodeSeq.value.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id this$) {
var this__6403 = this;
return this$;
};
cljm_DOT_core_SLASH_NodeSeq.value.prototype.cljm$core$ISeq$_first$arity$1 = ^id(id coll) {
var this__6404 = this;
if(cljm_truthy((this__6404_DOT_s == nil))) {
return @[ (this__6404_DOT_nodes[this__6404_DOT_i]), (this__6404_DOT_nodes[(this__6404_DOT_i + @1)]) ];

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(this__6404_DOT_s);

}
};
cljm_DOT_core_SLASH_NodeSeq.value.prototype.cljm$core$ISeq$_rest$arity$1 = ^id(id coll) {
var this__6405 = this;
if(cljm_truthy((this__6405_DOT_s == nil))) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_create_inode_seq.value)(this__6405_DOT_nodes, (this__6405_DOT_i + @2), nil);

} else {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_create_inode_seq.value)(this__6405_DOT_nodes, this__6405_DOT_i, ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(this__6405_DOT_s));

}
};
cljm_DOT_core_SLASH_NodeSeq.value.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__6406 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_equiv_sequential.value)(coll, other);
};
cljm_DOT_core_SLASH_NodeSeq.value.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__6407 = this;
return [cljm_DOT_core_SLASH_NodeSeq.value alloc];
};
cljm_DOT_core_SLASH_NodeSeq.value.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__6408 = this;
return this__6408_DOT_meta;
};
cljm_DOT_core_SLASH_NodeSeq.value.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__6409 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_with_meta.value)(cljs_DOT_core_DOT_List_SLASH_EMPTY.value, this__6409_DOT_meta);
};
cljm_DOT_core_SLASH_NodeSeq.value;
cljm_DOT_core_SLASH_create_inode_seq = [[CLJMVar alloc] initWithValue:(function() {
var create_inode_seq = null;
var create_inode_seq__1 = ^id(id nodes) {
return ((id (^)(id , id , id )) create_inode_seq.value)(nodes, @0, nil);
};
var create_inode_seq__3 = ^id(id nodes, id i, id s) {
if(cljm_truthy((s == nil))) {
id len__6416 = nodes.length;
id j__6417 = i;
while(YES) {
if(cljm_truthy((j__6417 < len__6416))) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)(((nodes[j__6417]) == nil)))) {
return [cljm_DOT_core_SLASH_NodeSeq.value alloc];

} else {
id temp__3971__auto____6418 = (nodes[(j__6417 + @1)]);
if(cljm_truthy(temp__3971__auto____6418)) {
id node__6419 = temp__3971__auto____6418;
id temp__3971__auto____6420 = [node__6419 inode];
if(cljm_truthy(temp__3971__auto____6420)) {
id node_seq__6421 = temp__3971__auto____6420;
return [cljm_DOT_core_SLASH_NodeSeq.value alloc];

} else {
{
id G__6422 = (j__6417 + @2);
j__6417 = G__6422;
continue;
}

}

} else {
{
id G__6423 = (j__6417 + @2);
j__6417 = G__6423;
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
return [cljm_DOT_core_SLASH_NodeSeq.value alloc];

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
];

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
cljm_DOT_core_SLASH_ArrayNodeSeq.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_ArrayNodeSeq.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/ArrayNodeSeq", nil);
};
cljm_DOT_core_SLASH_ArrayNodeSeq.value.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__6424 = this;
id h__1302__auto____6425 = this__6424_DOT___hash;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((h__1302__auto____6425 == nil)))) {
return h__1302__auto____6425;

} else {
id h__1302__auto____6426 = ((id (^)(id )) cljm_DOT_core_SLASH_hash_coll.value)(coll);
this__6424_DOT___hash = h__1302__auto____6426;
return h__1302__auto____6426;

}
};
cljm_DOT_core_SLASH_ArrayNodeSeq.value.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id o) {
var this__6427 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(o, coll);
};
cljm_DOT_core_SLASH_ArrayNodeSeq.value.prototype.toString = ^id() {
var this__6428 = this;
id this__6429 = this;
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_pr_str.value)(this__6429, nil);
};
cljm_DOT_core_SLASH_ArrayNodeSeq.value.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id this$) {
var this__6430 = this;
return this$;
};
cljm_DOT_core_SLASH_ArrayNodeSeq.value.prototype.cljm$core$ISeq$_first$arity$1 = ^id(id coll) {
var this__6431 = this;
return ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(this__6431_DOT_s);
};
cljm_DOT_core_SLASH_ArrayNodeSeq.value.prototype.cljm$core$ISeq$_rest$arity$1 = ^id(id coll) {
var this__6432 = this;
return ((id (^)(id , id , id , id )) cljm_DOT_core_SLASH_create_array_node_seq.value)(nil, this__6432_DOT_nodes, this__6432_DOT_i, ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(this__6432_DOT_s));
};
cljm_DOT_core_SLASH_ArrayNodeSeq.value.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__6433 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_equiv_sequential.value)(coll, other);
};
cljm_DOT_core_SLASH_ArrayNodeSeq.value.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__6434 = this;
return [cljm_DOT_core_SLASH_ArrayNodeSeq.value alloc];
};
cljm_DOT_core_SLASH_ArrayNodeSeq.value.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__6435 = this;
return this__6435_DOT_meta;
};
cljm_DOT_core_SLASH_ArrayNodeSeq.value.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__6436 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_with_meta.value)(cljs_DOT_core_DOT_List_SLASH_EMPTY.value, this__6436_DOT_meta);
};
cljm_DOT_core_SLASH_ArrayNodeSeq.value;
cljm_DOT_core_SLASH_create_array_node_seq = [[CLJMVar alloc] initWithValue:(function() {
var create_array_node_seq = null;
var create_array_node_seq__1 = ^id(id nodes) {
return ((id (^)(id , id , id , id )) create_array_node_seq.value)(nil, nodes, @0, nil);
};
var create_array_node_seq__4 = ^id(id meta, id nodes, id i, id s) {
if(cljm_truthy((s == nil))) {
id len__6443 = nodes.length;
id j__6444 = i;
while(YES) {
if(cljm_truthy((j__6444 < len__6443))) {
id temp__3971__auto____6445 = (nodes[j__6444]);
if(cljm_truthy(temp__3971__auto____6445)) {
id nj__6446 = temp__3971__auto____6445;
id temp__3971__auto____6447 = [nj__6446 inode];
if(cljm_truthy(temp__3971__auto____6447)) {
id ns__6448 = temp__3971__auto____6447;
return [cljm_DOT_core_SLASH_ArrayNodeSeq.value alloc];

} else {
{
id G__6449 = (j__6444 + @1);
j__6444 = G__6449;
continue;
}

}

} else {
{
id G__6450 = (j__6444 + @1);
j__6444 = G__6450;
continue;
}

}

} else {
return nil;

}
break;
}

} else {
return [cljm_DOT_core_SLASH_ArrayNodeSeq.value alloc];

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
];

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
cljm_DOT_core_SLASH_PersistentHashMap.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_PersistentHashMap.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/PersistentHashMap", nil);
};
cljm_DOT_core_SLASH_PersistentHashMap.value.prototype.cljm$core$IEditableCollection$_as_transient$arity$1 = ^id(id coll) {
var this__6453 = this;
return [cljm_DOT_core_SLASH_TransientHashMap.value alloc];
};
cljm_DOT_core_SLASH_PersistentHashMap.value.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__6454 = this;
id h__1302__auto____6455 = this__6454_DOT___hash;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((h__1302__auto____6455 == nil)))) {
return h__1302__auto____6455;

} else {
id h__1302__auto____6456 = ((id (^)(id )) cljm_DOT_core_SLASH_hash_imap.value)(coll);
this__6454_DOT___hash = h__1302__auto____6456;
return h__1302__auto____6456;

}
};
cljm_DOT_core_SLASH_PersistentHashMap.value.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id coll, id k) {
var this__6457 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(coll, k, nil);
};
cljm_DOT_core_SLASH_PersistentHashMap.value.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id coll, id k, id not_found) {
var this__6458 = this;
if(cljm_truthy((k == nil))) {
if(cljm_truthy(this__6458_DOT_has_nil_QMARK_)) {
return this__6458_DOT_nil_val;

} else {
return not_found;

}

} else {
if(cljm_truthy((this__6458_DOT_root == nil))) {
return not_found;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return [this__6458_DOT_root inode@0 lookup((id (^)(id )) cljm_DOT_core_SLASH_hash.value)(k), k, not_found, nil];

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_PersistentHashMap.value.prototype.cljm$core$IAssociative$_assoc$arity$3 = ^id(id coll, id k, id v) {
var this__6459 = this;
if(cljm_truthy((k == nil))) {
if(cljm_truthy({id and__3822__auto____6460 = this__6459_DOT_has_nil_QMARK_;
if(cljm_truthy(and__3822__auto____6460)) {
return ([v isEqual:this__6459_DOT_nil_val]);

} else {
return and__3822__auto____6460;

}
})) {
return coll;

} else {
return [cljm_DOT_core_SLASH_PersistentHashMap.value alloc];

}

} else {
id added_leaf_QMARK___6461 = [cljm_DOT_core_SLASH_Box.value alloc];
id new_root__6462 = [(cljm_truthy((this__6459_DOT_root == nil))) ?cljs_DOT_core_DOT_BitmapIndexedNode_SLASH_EMPTY.value:this__6459_DOT_root inode@0 assoc((id (^)(id )) cljm_DOT_core_SLASH_hash.value)(k), k, v, added_leaf_QMARK___6461, nil];
if(cljm_truthy(([new_root__6462 isEqual:this__6459_DOT_root]))) {
return coll;

} else {
return [cljm_DOT_core_SLASH_PersistentHashMap.value alloc];

}

}
};
cljm_DOT_core_SLASH_PersistentHashMap.value.prototype.cljm$core$IAssociative$_contains_key_QMARK_$arity$2 = ^id(id coll, id k) {
var this__6463 = this;
if(cljm_truthy((k == nil))) {
return this__6463_DOT_has_nil_QMARK_;

} else {
if(cljm_truthy((this__6463_DOT_root == nil))) {
return @NO;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_not.value)(([[this__6463_DOT_root inode@0 lookup((id (^)(id )) cljm_DOT_core_SLASH_hash.value)(k), k, cljm_DOT_core_SLASH_lookup_sentinel.value, nil] isEqual:cljm_DOT_core_SLASH_lookup_sentinel.value]));

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_PersistentHashMap.value.prototype.call = (function() {
var G__6486 = null;
var G__6486__2 = ^id(id this_sym6464, id k) {
var this__6466 = this;
id this_sym6464__6467 = this;
id coll__6468 = this_sym6464__6467;
return ((id (^)(id , id )) cljm_DOT_core_SLASH__lookup.value)(coll__6468, k);
};
var G__6486__3 = ^id(id this_sym6465, id k, id not_found) {
var this__6466 = this;
id this_sym6465__6469 = this;
id coll__6470 = this_sym6465__6469;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(coll__6470, k, not_found);
};
G__6486 = function(this_sym6465, k, not_found){
switch(arguments.length){
case 2:
return G__6486__2.call(this,this_sym6465, k);
case 3:
return G__6486__3.call(this,this_sym6465, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__6486;
})()
;
cljm_DOT_core_SLASH_PersistentHashMap.value.prototype.apply = ^id(id this_sym6451, id args6452) {
var this__6471 = this;
return [this_sym6451.call applythis_sym6451, [@[this_sym6451] concatargs6452.slice()], nil];
};
cljm_DOT_core_SLASH_PersistentHashMap.value.prototype.cljm$core$IKVReduce$_kv_reduce$arity$3 = ^id(id coll, id f, id init) {
var this__6472 = this;
id init__6473 = (cljm_truthy(this__6472_DOT_has_nil_QMARK_)) ?((id (^)(id , id , id )) f.value)(init, nil, this__6472_DOT_nil_val):init;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_reduced_QMARK_.value)(init__6473))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(init__6473);

} else {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((this__6472_DOT_root == nil)))) {
return [this__6472_DOT_root kvf reduceinit__6473];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return init__6473;

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_PersistentHashMap.value.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id entry) {
var this__6474 = this;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_vector_QMARK_.value)(entry))) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__assoc.value)(coll, ((id (^)(id , id )) cljm_DOT_core_SLASH__nth.value)(entry, @0), ((id (^)(id , id )) cljm_DOT_core_SLASH__nth.value)(entry, @1));

} else {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(cljm_DOT_core_SLASH__conj.value, coll, entry);

}
};
cljm_DOT_core_SLASH_PersistentHashMap.value.prototype.toString = ^id() {
var this__6475 = this;
id this__6476 = this;
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_pr_str.value)(this__6476, nil);
};
cljm_DOT_core_SLASH_PersistentHashMap.value.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id coll) {
var this__6477 = this;
if(cljm_truthy((this__6477_DOT_cnt > @0))) {
id s__6478 = (cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((this__6477_DOT_root == nil)))) ?[this__6477_DOT_root inode]:nil;
if(cljm_truthy(this__6477_DOT_has_nil_QMARK_)) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(@[ nil, this__6477_DOT_nil_val ], s__6478);

} else {
return s__6478;

}

} else {
return nil;

}
};
cljm_DOT_core_SLASH_PersistentHashMap.value.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__6479 = this;
return this__6479_DOT_cnt;
};
cljm_DOT_core_SLASH_PersistentHashMap.value.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__6480 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_equiv_map.value)(coll, other);
};
cljm_DOT_core_SLASH_PersistentHashMap.value.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__6481 = this;
return [cljm_DOT_core_SLASH_PersistentHashMap.value alloc];
};
cljm_DOT_core_SLASH_PersistentHashMap.value.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__6482 = this;
return this__6482_DOT_meta;
};
cljm_DOT_core_SLASH_PersistentHashMap.value.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__6483 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH__with_meta.value)(cljs_DOT_core_DOT_PersistentHashMap_SLASH_EMPTY.value, this__6483_DOT_meta);
};
cljm_DOT_core_SLASH_PersistentHashMap.value.prototype.cljm$core$IMap$_dissoc$arity$2 = ^id(id coll, id k) {
var this__6484 = this;
if(cljm_truthy((k == nil))) {
if(cljm_truthy(this__6484_DOT_has_nil_QMARK_)) {
return [cljm_DOT_core_SLASH_PersistentHashMap.value alloc];

} else {
return coll;

}

} else {
if(cljm_truthy((this__6484_DOT_root == nil))) {
return coll;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
id new_root__6485 = [this__6484_DOT_root inode@0 without((id (^)(id )) cljm_DOT_core_SLASH_hash.value)(k), k, nil];
if(cljm_truthy(([new_root__6485 isEqual:this__6484_DOT_root]))) {
return coll;

} else {
return [cljm_DOT_core_SLASH_PersistentHashMap.value alloc];

}

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_PersistentHashMap.value;
cljs_DOT_core_DOT_PersistentHashMap_SLASH_EMPTY.value = [cljm_DOT_core_SLASH_PersistentHashMap.value alloc];
cljs_DOT_core_DOT_PersistentHashMap_SLASH_fromArrays.value = ^id(id ks, id vs) {
id len__6487 = ks.length;
id i__6488 = @0;
id out__6489 = ((id (^)(id )) cljm_DOT_core_SLASH_transient.value)(cljs_DOT_core_DOT_PersistentHashMap_SLASH_EMPTY.value);
while(YES) {
if(cljm_truthy((i__6488 < len__6487))) {
{
id G__6490 = (i__6488 + @1);
id G__6491 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_assoc_BANG_.value)(out__6489, (ks[i__6488]), (vs[i__6488]));
i__6488 = G__6490;
out__6489 = G__6491;
continue;
}

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH_persistent_BANG_.value)(out__6489);

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
cljm_DOT_core_SLASH_TransientHashMap.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_TransientHashMap.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/TransientHashMap", nil);
};
cljm_DOT_core_SLASH_TransientHashMap.value.prototype.cljm$core$ITransientMap$_dissoc_BANG_$arity$2 = ^id(id tcoll, id key) {
var this__6492 = this;
return [tcoll withoutkey];
};
cljm_DOT_core_SLASH_TransientHashMap.value.prototype.cljm$core$ITransientAssociative$_assoc_BANG_$arity$3 = ^id(id tcoll, id key, id val) {
var this__6493 = this;
return [tcoll assockey, val, nil];
};
cljm_DOT_core_SLASH_TransientHashMap.value.prototype.cljm$core$ITransientCollection$_conj_BANG_$arity$2 = ^id(id tcoll, id val) {
var this__6494 = this;
return [tcoll conjval];
};
cljm_DOT_core_SLASH_TransientHashMap.value.prototype.cljm$core$ITransientCollection$_persistent_BANG_$arity$1 = ^id(id tcoll) {
var this__6495 = this;
return [tcoll persistent];
};
cljm_DOT_core_SLASH_TransientHashMap.value.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id tcoll, id k) {
var this__6496 = this;
if(cljm_truthy((k == nil))) {
if(cljm_truthy(this__6496_DOT_has_nil_QMARK_)) {
return this__6496_DOT_nil_val;

} else {
return nil;

}

} else {
if(cljm_truthy((this__6496_DOT_root == nil))) {
return nil;

} else {
return [this__6496_DOT_root inode@0 lookup((id (^)(id )) cljm_DOT_core_SLASH_hash.value)(k), k, nil];

}

}
};
cljm_DOT_core_SLASH_TransientHashMap.value.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id tcoll, id k, id not_found) {
var this__6497 = this;
if(cljm_truthy((k == nil))) {
if(cljm_truthy(this__6497_DOT_has_nil_QMARK_)) {
return this__6497_DOT_nil_val;

} else {
return not_found;

}

} else {
if(cljm_truthy((this__6497_DOT_root == nil))) {
return not_found;

} else {
return [this__6497_DOT_root inode@0 lookup((id (^)(id )) cljm_DOT_core_SLASH_hash.value)(k), k, not_found, nil];

}

}
};
cljm_DOT_core_SLASH_TransientHashMap.value.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__6498 = this;
if(cljm_truthy(this__6498_DOT_edit)) {
return this__6498_DOT_count;

} else {
throw [Error.value alloc];

}
};
cljm_DOT_core_SLASH_TransientHashMap.value.prototype.conj_BANG_ = ^id(id o) {
var this__6499 = this;
id tcoll__6500 = this;
if(cljm_truthy(this__6499_DOT_edit)) {
if(cljm_truthy({id G__6501__6502 = o;
if(cljm_truthy(G__6501__6502)) {
if(cljm_truthy({id or__3824__auto____6503 = (G__6501__6502.cljm$lang$protocol_mask$partition0$ & @2048);
if(cljm_truthy(or__3824__auto____6503)) {
return or__3824__auto____6503;

} else {
return G__6501__6502.cljm$core$IMapEntry$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__6501__6502.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IMapEntry.value, G__6501__6502);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IMapEntry.value, G__6501__6502);

}
})) {
return [tcoll__6500 assoc((id (^)(id )) cljm_DOT_core_SLASH_key.value)(o), ((id (^)(id )) cljm_DOT_core_SLASH_val.value)(o), nil];

} else {
id es__6504 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(o);
id tcoll__6505 = tcoll__6500;
while(YES) {
id temp__3971__auto____6506 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(es__6504);
if(cljm_truthy(temp__3971__auto____6506)) {
id e__6507 = temp__3971__auto____6506;
{
id G__6518 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(es__6504);
id G__6519 = [tcoll__6505 assoc((id (^)(id )) cljm_DOT_core_SLASH_key.value)(e__6507), ((id (^)(id )) cljm_DOT_core_SLASH_val.value)(e__6507), nil];
es__6504 = G__6518;
tcoll__6505 = G__6519;
continue;
}

} else {
return tcoll__6505;

}
break;
}

}

} else {
throw [Error.value alloc];

}
};
cljm_DOT_core_SLASH_TransientHashMap.value.prototype.assoc_BANG_ = ^id(id k, id v) {
var this__6508 = this;
id tcoll__6509 = this;
if(cljm_truthy(this__6508_DOT_edit)) {
if(cljm_truthy((k == nil))) {
if(cljm_truthy(([this__6508_DOT_nil_val isEqual:v]))) {

} else {
this__6508_DOT_nil_val = v;

}
if(cljm_truthy(this__6508_DOT_has_nil_QMARK_)) {

} else {
this__6508_DOT_count = (this__6508_DOT_count + @1);
this__6508_DOT_has_nil_QMARK_ = @YES;

}
return tcoll__6509;

} else {
id added_leaf_QMARK___6510 = [cljm_DOT_core_SLASH_Box.value alloc];
id node__6511 = [(cljm_truthy((this__6508_DOT_root == nil))) ?cljs_DOT_core_DOT_BitmapIndexedNode_SLASH_EMPTY.value:this__6508_DOT_root inodethis__6508_DOT_edit assoc@0, ((id (^)(id )) cljm_DOT_core_SLASH_hash.value)(k), k, v, added_leaf_QMARK___6510, nil];
if(cljm_truthy(([node__6511 isEqual:this__6508_DOT_root]))) {

} else {
this__6508_DOT_root = node__6511;

}
if(cljm_truthy(added_leaf_QMARK___6510.val)) {
this__6508_DOT_count = (this__6508_DOT_count + @1);

} else {

}
return tcoll__6509;

}

} else {
throw [Error.value alloc];

}
};
cljm_DOT_core_SLASH_TransientHashMap.value.prototype.without_BANG_ = ^id(id k) {
var this__6512 = this;
id tcoll__6513 = this;
if(cljm_truthy(this__6512_DOT_edit)) {
if(cljm_truthy((k == nil))) {
if(cljm_truthy(this__6512_DOT_has_nil_QMARK_)) {
this__6512_DOT_has_nil_QMARK_ = @NO;
this__6512_DOT_nil_val = nil;
this__6512_DOT_count = (this__6512_DOT_count - @1);
return tcoll__6513;

} else {
return tcoll__6513;

}

} else {
if(cljm_truthy((this__6512_DOT_root == nil))) {
return tcoll__6513;

} else {
id removed_leaf_QMARK___6514 = [cljm_DOT_core_SLASH_Box.value alloc];
id node__6515 = [this__6512_DOT_root inodethis__6512_DOT_edit without@0, ((id (^)(id )) cljm_DOT_core_SLASH_hash.value)(k), k, removed_leaf_QMARK___6514, nil];
if(cljm_truthy(([node__6515 isEqual:this__6512_DOT_root]))) {

} else {
this__6512_DOT_root = node__6515;

}
if(cljm_truthy((removed_leaf_QMARK___6514[@0]))) {
this__6512_DOT_count = (this__6512_DOT_count - @1);

} else {

}
return tcoll__6513;

}

}

} else {
throw [Error.value alloc];

}
};
cljm_DOT_core_SLASH_TransientHashMap.value.prototype.persistent_BANG_ = ^id() {
var this__6516 = this;
id tcoll__6517 = this;
if(cljm_truthy(this__6516_DOT_edit)) {
this__6516_DOT_edit = nil;
return [cljm_DOT_core_SLASH_PersistentHashMap.value alloc];

} else {
throw [Error.value alloc];

}
};
cljm_DOT_core_SLASH_TransientHashMap.value;
cljm_DOT_core_SLASH_tree_map_seq_push = [[CLJMVar alloc] initWithValue:^id(id node, id stack, id ascending_QMARK_) {
id t__6522 = node;
id stack__6523 = stack;
while(YES) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((t__6522 == nil)))) {
{
id G__6524 = (cljm_truthy(ascending_QMARK_)) ?t__6522.left:t__6522.right;
id G__6525 = ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_conj.value)(stack__6523, t__6522, nil);
t__6522 = G__6524;
stack__6523 = G__6525;
continue;
}

} else {
return stack__6523;

}
break;
}
}];

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
cljm_DOT_core_SLASH_PersistentTreeMapSeq.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_PersistentTreeMapSeq.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/PersistentTreeMapSeq", nil);
};
cljm_DOT_core_SLASH_PersistentTreeMapSeq.value.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__6526 = this;
id h__1302__auto____6527 = this__6526_DOT___hash;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((h__1302__auto____6527 == nil)))) {
return h__1302__auto____6527;

} else {
id h__1302__auto____6528 = ((id (^)(id )) cljm_DOT_core_SLASH_hash_coll.value)(coll);
this__6526_DOT___hash = h__1302__auto____6528;
return h__1302__auto____6528;

}
};
cljm_DOT_core_SLASH_PersistentTreeMapSeq.value.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id o) {
var this__6529 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(o, coll);
};
cljm_DOT_core_SLASH_PersistentTreeMapSeq.value.prototype.toString = ^id() {
var this__6530 = this;
id this__6531 = this;
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_pr_str.value)(this__6531, nil);
};
cljm_DOT_core_SLASH_PersistentTreeMapSeq.value.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id this$) {
var this__6532 = this;
return this$;
};
cljm_DOT_core_SLASH_PersistentTreeMapSeq.value.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__6533 = this;
if(cljm_truthy((this__6533_DOT_cnt < @0))) {
return (((id (^)(id )) cljm_DOT_core_SLASH_count.value)(((id (^)(id )) cljm_DOT_core_SLASH_next.value)(coll)) + @1);

} else {
return this__6533_DOT_cnt;

}
};
cljm_DOT_core_SLASH_PersistentTreeMapSeq.value.prototype.cljm$core$ISeq$_first$arity$1 = ^id(id this$) {
var this__6534 = this;
return ((id (^)(id )) cljm_DOT_core_SLASH_peek.value)(this__6534_DOT_stack);
};
cljm_DOT_core_SLASH_PersistentTreeMapSeq.value.prototype.cljm$core$ISeq$_rest$arity$1 = ^id(id this$) {
var this__6535 = this;
id t__6536 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(this__6535_DOT_stack);
id next_stack__6537 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_tree_map_seq_push.value)((cljm_truthy(this__6535_DOT_ascending_QMARK_)) ?t__6536.right:t__6536.left, ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(this__6535_DOT_stack), this__6535_DOT_ascending_QMARK_);
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((next_stack__6537 == nil)))) {
return [cljm_DOT_core_SLASH_PersistentTreeMapSeq.value alloc];

} else {
return cljm.core.List.EMPTY;

}
};
cljm_DOT_core_SLASH_PersistentTreeMapSeq.value.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__6538 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_equiv_sequential.value)(coll, other);
};
cljm_DOT_core_SLASH_PersistentTreeMapSeq.value.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__6539 = this;
return [cljm_DOT_core_SLASH_PersistentTreeMapSeq.value alloc];
};
cljm_DOT_core_SLASH_PersistentTreeMapSeq.value.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__6540 = this;
return this__6540_DOT_meta;
};
cljm_DOT_core_SLASH_PersistentTreeMapSeq.value;
cljm_DOT_core_SLASH_create_tree_map_seq = [[CLJMVar alloc] initWithValue:^id(id tree, id ascending_QMARK_, id cnt) {
return [cljm_DOT_core_SLASH_PersistentTreeMapSeq.value alloc];
}];
cljm_DOT_core_SLASH_balance_left = [[CLJMVar alloc] initWithValue:^id(id key, id val, id ins, id right) {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_RedNode.value, ins))) {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_RedNode.value, ins.left))) {
return [cljm_DOT_core_SLASH_RedNode.value alloc];

} else {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_RedNode.value, ins.right))) {
return [cljm_DOT_core_SLASH_RedNode.value alloc];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return [cljm_DOT_core_SLASH_BlackNode.value alloc];

} else {
return nil;

}

}

}

} else {
return [cljm_DOT_core_SLASH_BlackNode.value alloc];

}
}];
cljm_DOT_core_SLASH_balance_right = [[CLJMVar alloc] initWithValue:^id(id key, id val, id left, id ins) {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_RedNode.value, ins))) {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_RedNode.value, ins.right))) {
return [cljm_DOT_core_SLASH_RedNode.value alloc];

} else {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_RedNode.value, ins.left))) {
return [cljm_DOT_core_SLASH_RedNode.value alloc];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return [cljm_DOT_core_SLASH_BlackNode.value alloc];

} else {
return nil;

}

}

}

} else {
return [cljm_DOT_core_SLASH_BlackNode.value alloc];

}
}];
cljm_DOT_core_SLASH_balance_left_del = [[CLJMVar alloc] initWithValue:^id(id key, id val, id del, id right) {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_RedNode.value, del))) {
return [cljm_DOT_core_SLASH_RedNode.value alloc];

} else {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_BlackNode.value, right))) {
return ((id (^)(id , id , id , id )) cljm_DOT_core_SLASH_balance_right.value)(key, val, del, [right redden]);

} else {
if(cljm_truthy({id and__3822__auto____6542 = ((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_RedNode.value, right);
if(cljm_truthy(and__3822__auto____6542)) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_BlackNode.value, right.left);

} else {
return and__3822__auto____6542;

}
})) {
return [cljm_DOT_core_SLASH_RedNode.value alloc];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
throw [Error.value alloc];

} else {
return nil;

}

}

}

}
}];
cljm_DOT_core_SLASH_balance_right_del = [[CLJMVar alloc] initWithValue:^id(id key, id val, id left, id del) {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_RedNode.value, del))) {
return [cljm_DOT_core_SLASH_RedNode.value alloc];

} else {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_BlackNode.value, left))) {
return ((id (^)(id , id , id , id )) cljm_DOT_core_SLASH_balance_left.value)(key, val, [left redden], del);

} else {
if(cljm_truthy({id and__3822__auto____6544 = ((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_RedNode.value, left);
if(cljm_truthy(and__3822__auto____6544)) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_BlackNode.value, left.right);

} else {
return and__3822__auto____6544;

}
})) {
return [cljm_DOT_core_SLASH_RedNode.value alloc];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
throw [Error.value alloc];

} else {
return nil;

}

}

}

}
}];
cljm_DOT_core_SLASH_tree_map_kv_reduce = [[CLJMVar alloc] initWithValue:^id(id node, id f, id init) {
id init__6548 = ((id (^)(id , id , id )) f.value)(init, node.key, node.val);
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_reduced_QMARK_.value)(init__6548))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(init__6548);

} else {
id init__6549 = (cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((node.left == nil)))) ?((id (^)(id , id , id )) tree_map_kv_reduce.value)(node.left, f, init__6548):init__6548;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_reduced_QMARK_.value)(init__6549))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(init__6549);

} else {
id init__6550 = (cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((node.right == nil)))) ?((id (^)(id , id , id )) tree_map_kv_reduce.value)(node.right, f, init__6549):init__6549;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_reduced_QMARK_.value)(init__6550))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(init__6550);

} else {
return init__6550;

}

}

}
}];

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
cljm_DOT_core_SLASH_BlackNode.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_BlackNode.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/BlackNode", nil);
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__6553 = this;
id h__1302__auto____6554 = this__6553_DOT___hash;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((h__1302__auto____6554 == nil)))) {
return h__1302__auto____6554;

} else {
id h__1302__auto____6555 = ((id (^)(id )) cljm_DOT_core_SLASH_hash_coll.value)(coll);
this__6553_DOT___hash = h__1302__auto____6555;
return h__1302__auto____6555;

}
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id node, id k) {
var this__6556 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__nth.value)(node, k, nil);
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id node, id k, id not_found) {
var this__6557 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__nth.value)(node, k, not_found);
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.cljm$core$IAssociative$_assoc$arity$3 = ^id(id node, id k, id v) {
var this__6558 = this;
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_assoc.value)(@[ this__6558_DOT_key, this__6558_DOT_val ], k, v, nil);
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.call = (function() {
var G__6606 = null;
var G__6606__2 = ^id(id this_sym6559, id k) {
var this__6561 = this;
id this_sym6559__6562 = this;
id node__6563 = this_sym6559__6562;
return ((id (^)(id , id )) cljm_DOT_core_SLASH__lookup.value)(node__6563, k);
};
var G__6606__3 = ^id(id this_sym6560, id k, id not_found) {
var this__6561 = this;
id this_sym6560__6564 = this;
id node__6565 = this_sym6560__6564;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(node__6565, k, not_found);
};
G__6606 = function(this_sym6560, k, not_found){
switch(arguments.length){
case 2:
return G__6606__2.call(this,this_sym6560, k);
case 3:
return G__6606__3.call(this,this_sym6560, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__6606;
})()
;
cljm_DOT_core_SLASH_BlackNode.value.prototype.apply = ^id(id this_sym6551, id args6552) {
var this__6566 = this;
return [this_sym6551.call applythis_sym6551, [@[this_sym6551] concatargs6552.slice()], nil];
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id node, id o) {
var this__6567 = this;
return @[ this__6567_DOT_key, this__6567_DOT_val, o ];
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.cljm$core$IMapEntry$_key$arity$1 = ^id(id node) {
var this__6568 = this;
return this__6568_DOT_key;
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.cljm$core$IMapEntry$_val$arity$1 = ^id(id node) {
var this__6569 = this;
return this__6569_DOT_val;
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.add_right = ^id(id ins) {
var this__6570 = this;
id node__6571 = this;
return [ins balancenode__6571 right];
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.redden = ^id() {
var this__6572 = this;
id node__6573 = this;
return [cljm_DOT_core_SLASH_RedNode.value alloc];
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.remove_right = ^id(id del) {
var this__6574 = this;
id node__6575 = this;
return ((id (^)(id , id , id , id )) cljm_DOT_core_SLASH_balance_right_del.value)(this__6574_DOT_key, this__6574_DOT_val, this__6574_DOT_left, del);
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.replace = ^id(id key, id val, id left, id right) {
var this__6576 = this;
id node__6577 = this;
return [cljm_DOT_core_SLASH_BlackNode.value alloc];
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.kv_reduce = ^id(id f, id init) {
var this__6578 = this;
id node__6579 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_tree_map_kv_reduce.value)(node__6579, f, init);
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.remove_left = ^id(id del) {
var this__6580 = this;
id node__6581 = this;
return ((id (^)(id , id , id , id )) cljm_DOT_core_SLASH_balance_left_del.value)(this__6580_DOT_key, this__6580_DOT_val, del, this__6580_DOT_right);
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.add_left = ^id(id ins) {
var this__6582 = this;
id node__6583 = this;
return [ins balancenode__6583 left];
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.balance_left = ^id(id parent) {
var this__6584 = this;
id node__6585 = this;
return [cljm_DOT_core_SLASH_BlackNode.value alloc];
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.toString = (function() {
var G__6607 = null;
var G__6607__0 = ^id() {
var this__6586 = this;
id this__6588 = this;
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_pr_str.value)(this__6588, nil);
};
G__6607 = function(){
switch(arguments.length){
case 0:
return G__6607__0.call(this);
}
throw('Invalid arity: ' + arguments.length);
};
return G__6607;
})()
;
cljm_DOT_core_SLASH_BlackNode.value.prototype.balance_right = ^id(id parent) {
var this__6589 = this;
id node__6590 = this;
return [cljm_DOT_core_SLASH_BlackNode.value alloc];
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.blacken = ^id() {
var this__6591 = this;
id node__6592 = this;
return node__6592;
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.cljm$core$IReduce$_reduce$arity$2 = ^id(id node, id f) {
var this__6593 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_ci_reduce.value)(node, f);
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.cljm$core$IReduce$_reduce$arity$3 = ^id(id node, id f, id start) {
var this__6594 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_ci_reduce.value)(node, f, start);
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id node) {
var this__6595 = this;
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_list.value)(this__6595_DOT_key, this__6595_DOT_val, nil);
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id node) {
var this__6596 = this;
return @2;
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.cljm$core$IStack$_peek$arity$1 = ^id(id node) {
var this__6597 = this;
return this__6597_DOT_val;
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.cljm$core$IStack$_pop$arity$1 = ^id(id node) {
var this__6598 = this;
return @[ this__6598_DOT_key ];
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.cljm$core$IVector$_assoc_n$arity$3 = ^id(id node, id n, id v) {
var this__6599 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__assoc_n.value)(@[ this__6599_DOT_key, this__6599_DOT_val ], n, v);
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__6600 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_equiv_sequential.value)(coll, other);
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id node, id meta) {
var this__6601 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_with_meta.value)(@[ this__6601_DOT_key, this__6601_DOT_val ], meta);
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id node) {
var this__6602 = this;
return nil;
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.cljm$core$IIndexed$_nth$arity$2 = ^id(id node, id n) {
var this__6603 = this;
if(cljm_truthy(([n isEqual:@0]))) {
return this__6603_DOT_key;

} else {
if(cljm_truthy(([n isEqual:@1]))) {
return this__6603_DOT_val;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return nil;

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.cljm$core$IIndexed$_nth$arity$3 = ^id(id node, id n, id not_found) {
var this__6604 = this;
if(cljm_truthy(([n isEqual:@0]))) {
return this__6604_DOT_key;

} else {
if(cljm_truthy(([n isEqual:@1]))) {
return this__6604_DOT_val;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return not_found;

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id node) {
var this__6605 = this;
return @[];
};
cljm_DOT_core_SLASH_BlackNode.value;

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
cljm_DOT_core_SLASH_RedNode.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_RedNode.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/RedNode", nil);
};
cljm_DOT_core_SLASH_RedNode.value.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__6610 = this;
id h__1302__auto____6611 = this__6610_DOT___hash;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((h__1302__auto____6611 == nil)))) {
return h__1302__auto____6611;

} else {
id h__1302__auto____6612 = ((id (^)(id )) cljm_DOT_core_SLASH_hash_coll.value)(coll);
this__6610_DOT___hash = h__1302__auto____6612;
return h__1302__auto____6612;

}
};
cljm_DOT_core_SLASH_RedNode.value.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id node, id k) {
var this__6613 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__nth.value)(node, k, nil);
};
cljm_DOT_core_SLASH_RedNode.value.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id node, id k, id not_found) {
var this__6614 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__nth.value)(node, k, not_found);
};
cljm_DOT_core_SLASH_RedNode.value.prototype.cljm$core$IAssociative$_assoc$arity$3 = ^id(id node, id k, id v) {
var this__6615 = this;
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_assoc.value)(@[ this__6615_DOT_key, this__6615_DOT_val ], k, v, nil);
};
cljm_DOT_core_SLASH_RedNode.value.prototype.call = (function() {
var G__6663 = null;
var G__6663__2 = ^id(id this_sym6616, id k) {
var this__6618 = this;
id this_sym6616__6619 = this;
id node__6620 = this_sym6616__6619;
return ((id (^)(id , id )) cljm_DOT_core_SLASH__lookup.value)(node__6620, k);
};
var G__6663__3 = ^id(id this_sym6617, id k, id not_found) {
var this__6618 = this;
id this_sym6617__6621 = this;
id node__6622 = this_sym6617__6621;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(node__6622, k, not_found);
};
G__6663 = function(this_sym6617, k, not_found){
switch(arguments.length){
case 2:
return G__6663__2.call(this,this_sym6617, k);
case 3:
return G__6663__3.call(this,this_sym6617, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__6663;
})()
;
cljm_DOT_core_SLASH_RedNode.value.prototype.apply = ^id(id this_sym6608, id args6609) {
var this__6623 = this;
return [this_sym6608.call applythis_sym6608, [@[this_sym6608] concatargs6609.slice()], nil];
};
cljm_DOT_core_SLASH_RedNode.value.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id node, id o) {
var this__6624 = this;
return @[ this__6624_DOT_key, this__6624_DOT_val, o ];
};
cljm_DOT_core_SLASH_RedNode.value.prototype.cljm$core$IMapEntry$_key$arity$1 = ^id(id node) {
var this__6625 = this;
return this__6625_DOT_key;
};
cljm_DOT_core_SLASH_RedNode.value.prototype.cljm$core$IMapEntry$_val$arity$1 = ^id(id node) {
var this__6626 = this;
return this__6626_DOT_val;
};
cljm_DOT_core_SLASH_RedNode.value.prototype.add_right = ^id(id ins) {
var this__6627 = this;
id node__6628 = this;
return [cljm_DOT_core_SLASH_RedNode.value alloc];
};
cljm_DOT_core_SLASH_RedNode.value.prototype.redden = ^id() {
var this__6629 = this;
id node__6630 = this;
throw [Error.value alloc];
};
cljm_DOT_core_SLASH_RedNode.value.prototype.remove_right = ^id(id del) {
var this__6631 = this;
id node__6632 = this;
return [cljm_DOT_core_SLASH_RedNode.value alloc];
};
cljm_DOT_core_SLASH_RedNode.value.prototype.replace = ^id(id key, id val, id left, id right) {
var this__6633 = this;
id node__6634 = this;
return [cljm_DOT_core_SLASH_RedNode.value alloc];
};
cljm_DOT_core_SLASH_RedNode.value.prototype.kv_reduce = ^id(id f, id init) {
var this__6635 = this;
id node__6636 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_tree_map_kv_reduce.value)(node__6636, f, init);
};
cljm_DOT_core_SLASH_RedNode.value.prototype.remove_left = ^id(id del) {
var this__6637 = this;
id node__6638 = this;
return [cljm_DOT_core_SLASH_RedNode.value alloc];
};
cljm_DOT_core_SLASH_RedNode.value.prototype.add_left = ^id(id ins) {
var this__6639 = this;
id node__6640 = this;
return [cljm_DOT_core_SLASH_RedNode.value alloc];
};
cljm_DOT_core_SLASH_RedNode.value.prototype.balance_left = ^id(id parent) {
var this__6641 = this;
id node__6642 = this;
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_RedNode.value, this__6641_DOT_left))) {
return [cljm_DOT_core_SLASH_RedNode.value alloc];

} else {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_RedNode.value, this__6641_DOT_right))) {
return [cljm_DOT_core_SLASH_RedNode.value alloc];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return [cljm_DOT_core_SLASH_BlackNode.value alloc];

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_RedNode.value.prototype.toString = (function() {
var G__6664 = null;
var G__6664__0 = ^id() {
var this__6643 = this;
id this__6645 = this;
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_pr_str.value)(this__6645, nil);
};
G__6664 = function(){
switch(arguments.length){
case 0:
return G__6664__0.call(this);
}
throw('Invalid arity: ' + arguments.length);
};
return G__6664;
})()
;
cljm_DOT_core_SLASH_RedNode.value.prototype.balance_right = ^id(id parent) {
var this__6646 = this;
id node__6647 = this;
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_RedNode.value, this__6646_DOT_right))) {
return [cljm_DOT_core_SLASH_RedNode.value alloc];

} else {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_RedNode.value, this__6646_DOT_left))) {
return [cljm_DOT_core_SLASH_RedNode.value alloc];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return [cljm_DOT_core_SLASH_BlackNode.value alloc];

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_RedNode.value.prototype.blacken = ^id() {
var this__6648 = this;
id node__6649 = this;
return [cljm_DOT_core_SLASH_BlackNode.value alloc];
};
cljm_DOT_core_SLASH_RedNode.value.prototype.cljm$core$IReduce$_reduce$arity$2 = ^id(id node, id f) {
var this__6650 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_ci_reduce.value)(node, f);
};
cljm_DOT_core_SLASH_RedNode.value.prototype.cljm$core$IReduce$_reduce$arity$3 = ^id(id node, id f, id start) {
var this__6651 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_ci_reduce.value)(node, f, start);
};
cljm_DOT_core_SLASH_RedNode.value.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id node) {
var this__6652 = this;
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_list.value)(this__6652_DOT_key, this__6652_DOT_val, nil);
};
cljm_DOT_core_SLASH_RedNode.value.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id node) {
var this__6653 = this;
return @2;
};
cljm_DOT_core_SLASH_RedNode.value.prototype.cljm$core$IStack$_peek$arity$1 = ^id(id node) {
var this__6654 = this;
return this__6654_DOT_val;
};
cljm_DOT_core_SLASH_RedNode.value.prototype.cljm$core$IStack$_pop$arity$1 = ^id(id node) {
var this__6655 = this;
return @[ this__6655_DOT_key ];
};
cljm_DOT_core_SLASH_RedNode.value.prototype.cljm$core$IVector$_assoc_n$arity$3 = ^id(id node, id n, id v) {
var this__6656 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__assoc_n.value)(@[ this__6656_DOT_key, this__6656_DOT_val ], n, v);
};
cljm_DOT_core_SLASH_RedNode.value.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__6657 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_equiv_sequential.value)(coll, other);
};
cljm_DOT_core_SLASH_RedNode.value.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id node, id meta) {
var this__6658 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_with_meta.value)(@[ this__6658_DOT_key, this__6658_DOT_val ], meta);
};
cljm_DOT_core_SLASH_RedNode.value.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id node) {
var this__6659 = this;
return nil;
};
cljm_DOT_core_SLASH_RedNode.value.prototype.cljm$core$IIndexed$_nth$arity$2 = ^id(id node, id n) {
var this__6660 = this;
if(cljm_truthy(([n isEqual:@0]))) {
return this__6660_DOT_key;

} else {
if(cljm_truthy(([n isEqual:@1]))) {
return this__6660_DOT_val;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return nil;

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_RedNode.value.prototype.cljm$core$IIndexed$_nth$arity$3 = ^id(id node, id n, id not_found) {
var this__6661 = this;
if(cljm_truthy(([n isEqual:@0]))) {
return this__6661_DOT_key;

} else {
if(cljm_truthy(([n isEqual:@1]))) {
return this__6661_DOT_val;

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return not_found;

} else {
return nil;

}

}

}
};
cljm_DOT_core_SLASH_RedNode.value.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id node) {
var this__6662 = this;
return @[];
};
cljm_DOT_core_SLASH_RedNode.value;
cljm_DOT_core_SLASH_tree_map_add = [[CLJMVar alloc] initWithValue:^id(id comp, id tree, id k, id v, id found) {
if(cljm_truthy((tree == nil))) {
return [cljm_DOT_core_SLASH_RedNode.value alloc];

} else {
id c__6668 = ((id (^)(id , id )) comp.value)(k, tree.key);
if(cljm_truthy(([c__6668 isEqual:@0]))) {
(found[@0] = tree);
return nil;

} else {
if(cljm_truthy((c__6668 < @0))) {
id ins__6669 = ((id (^)(id , id , id , id , id )) tree_map_add.value)(comp, tree.left, k, v, found);
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((ins__6669 == nil)))) {
return [tree addins__6669 left];

} else {
return nil;

}

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
id ins__6670 = ((id (^)(id , id , id , id , id )) tree_map_add.value)(comp, tree.right, k, v, found);
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((ins__6670 == nil)))) {
return [tree addins__6670 right];

} else {
return nil;

}

} else {
return nil;

}

}

}

}
}];
cljm_DOT_core_SLASH_tree_map_append = [[CLJMVar alloc] initWithValue:^id(id left, id right) {
if(cljm_truthy((left == nil))) {
return right;

} else {
if(cljm_truthy((right == nil))) {
return left;

} else {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_RedNode.value, left))) {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_RedNode.value, right))) {
id app__6673 = ((id (^)(id , id )) tree_map_append.value)(left.right, right.left);
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_RedNode.value, app__6673))) {
return [cljm_DOT_core_SLASH_RedNode.value alloc];

} else {
return [cljm_DOT_core_SLASH_RedNode.value alloc];

}

} else {
return [cljm_DOT_core_SLASH_RedNode.value alloc];

}

} else {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_RedNode.value, right))) {
return [cljm_DOT_core_SLASH_RedNode.value alloc];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
id app__6674 = ((id (^)(id , id )) tree_map_append.value)(left.right, right.left);
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_RedNode.value, app__6674))) {
return [cljm_DOT_core_SLASH_RedNode.value alloc];

} else {
return ((id (^)(id , id , id , id )) cljm_DOT_core_SLASH_balance_left_del.value)(left.key, left.val, left.left, [cljm_DOT_core_SLASH_BlackNode.value alloc]);

}

} else {
return nil;

}

}

}

}

}
}];
cljm_DOT_core_SLASH_tree_map_remove = [[CLJMVar alloc] initWithValue:^id(id comp, id tree, id k, id found) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((tree == nil)))) {
id c__6680 = ((id (^)(id , id )) comp.value)(k, tree.key);
if(cljm_truthy(([c__6680 isEqual:@0]))) {
(found[@0] = tree);
return ((id (^)(id , id )) cljm_DOT_core_SLASH_tree_map_append.value)(tree.left, tree.right);

} else {
if(cljm_truthy((c__6680 < @0))) {
id del__6681 = ((id (^)(id , id , id , id )) tree_map_remove.value)(comp, tree.left, k, found);
if(cljm_truthy({id or__3824__auto____6682 = ((id (^)(id )) cljm_DOT_core_SLASH_not.value)((del__6681 == nil));
if(cljm_truthy(or__3824__auto____6682)) {
return or__3824__auto____6682;

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH_not.value)(((found[@0]) == nil));

}
})) {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_BlackNode.value, tree.left))) {
return ((id (^)(id , id , id , id )) cljm_DOT_core_SLASH_balance_left_del.value)(tree.key, tree.val, del__6681, tree.right);

} else {
return [cljm_DOT_core_SLASH_RedNode.value alloc];

}

} else {
return nil;

}

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
id del__6683 = ((id (^)(id , id , id , id )) tree_map_remove.value)(comp, tree.right, k, found);
if(cljm_truthy({id or__3824__auto____6684 = ((id (^)(id )) cljm_DOT_core_SLASH_not.value)((del__6683 == nil));
if(cljm_truthy(or__3824__auto____6684)) {
return or__3824__auto____6684;

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH_not.value)(((found[@0]) == nil));

}
})) {
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_BlackNode.value, tree.right))) {
return ((id (^)(id , id , id , id )) cljm_DOT_core_SLASH_balance_right_del.value)(tree.key, tree.val, tree.left, del__6683);

} else {
return [cljm_DOT_core_SLASH_RedNode.value alloc];

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
}];
cljm_DOT_core_SLASH_tree_map_replace = [[CLJMVar alloc] initWithValue:^id(id comp, id tree, id k, id v) {
id tk__6687 = tree.key;
id c__6688 = ((id (^)(id , id )) comp.value)(k, tk__6687);
if(cljm_truthy(([c__6688 isEqual:@0]))) {
return [tree replacetk__6687, v, tree.left, tree.right, nil];

} else {
if(cljm_truthy((c__6688 < @0))) {
return [tree replacetk__6687, tree.val, ((id (^)(id , id , id , id )) tree_map_replace.value)(comp, tree.left, k, v), tree.right, nil];

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return [tree replacetk__6687, tree.val, tree.left, ((id (^)(id , id , id , id )) tree_map_replace.value)(comp, tree.right, k, v), nil];

} else {
return nil;

}

}

}
}];

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
cljm_DOT_core_SLASH_PersistentTreeMap.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_PersistentTreeMap.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/PersistentTreeMap", nil);
};
cljm_DOT_core_SLASH_PersistentTreeMap.value.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__6691 = this;
id h__1302__auto____6692 = this__6691_DOT___hash;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((h__1302__auto____6692 == nil)))) {
return h__1302__auto____6692;

} else {
id h__1302__auto____6693 = ((id (^)(id )) cljm_DOT_core_SLASH_hash_imap.value)(coll);
this__6691_DOT___hash = h__1302__auto____6693;
return h__1302__auto____6693;

}
};
cljm_DOT_core_SLASH_PersistentTreeMap.value.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id coll, id k) {
var this__6694 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(coll, k, nil);
};
cljm_DOT_core_SLASH_PersistentTreeMap.value.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id coll, id k, id not_found) {
var this__6695 = this;
id n__6696 = [coll entryk at];
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((n__6696 == nil)))) {
return n__6696.val;

} else {
return not_found;

}
};
cljm_DOT_core_SLASH_PersistentTreeMap.value.prototype.cljm$core$IAssociative$_assoc$arity$3 = ^id(id coll, id k, id v) {
var this__6697 = this;
id found__6698 = @[nil];
id t__6699 = ((id (^)(id , id , id , id , id )) cljm_DOT_core_SLASH_tree_map_add.value)(this__6697_DOT_comp, this__6697_DOT_tree, k, v, found__6698);
if(cljm_truthy((t__6699 == nil))) {
id found_node__6700 = ((id (^)(id , id )) cljm_DOT_core_SLASH_nth.value)(found__6698, @0);
if(cljm_truthy(((id (^)(id , id , ...)) cljm_DOT_core_SLASH__EQ_.value)(v, found_node__6700.val, nil))) {
return coll;

} else {
return [cljm_DOT_core_SLASH_PersistentTreeMap.value alloc];

}

} else {
return [cljm_DOT_core_SLASH_PersistentTreeMap.value alloc];

}
};
cljm_DOT_core_SLASH_PersistentTreeMap.value.prototype.cljm$core$IAssociative$_contains_key_QMARK_$arity$2 = ^id(id coll, id k) {
var this__6701 = this;
return ((id (^)(id )) cljm_DOT_core_SLASH_not.value)(([coll entryk at] == nil));
};
cljm_DOT_core_SLASH_PersistentTreeMap.value.prototype.call = (function() {
var G__6735 = null;
var G__6735__2 = ^id(id this_sym6702, id k) {
var this__6704 = this;
id this_sym6702__6705 = this;
id coll__6706 = this_sym6702__6705;
return ((id (^)(id , id )) cljm_DOT_core_SLASH__lookup.value)(coll__6706, k);
};
var G__6735__3 = ^id(id this_sym6703, id k, id not_found) {
var this__6704 = this;
id this_sym6703__6707 = this;
id coll__6708 = this_sym6703__6707;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(coll__6708, k, not_found);
};
G__6735 = function(this_sym6703, k, not_found){
switch(arguments.length){
case 2:
return G__6735__2.call(this,this_sym6703, k);
case 3:
return G__6735__3.call(this,this_sym6703, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__6735;
})()
;
cljm_DOT_core_SLASH_PersistentTreeMap.value.prototype.apply = ^id(id this_sym6689, id args6690) {
var this__6709 = this;
return [this_sym6689.call applythis_sym6689, [@[this_sym6689] concatargs6690.slice()], nil];
};
cljm_DOT_core_SLASH_PersistentTreeMap.value.prototype.cljm$core$IKVReduce$_kv_reduce$arity$3 = ^id(id coll, id f, id init) {
var this__6710 = this;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((this__6710_DOT_tree == nil)))) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_tree_map_kv_reduce.value)(this__6710_DOT_tree, f, init);

} else {
return init;

}
};
cljm_DOT_core_SLASH_PersistentTreeMap.value.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id entry) {
var this__6711 = this;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_vector_QMARK_.value)(entry))) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__assoc.value)(coll, ((id (^)(id , id )) cljm_DOT_core_SLASH__nth.value)(entry, @0), ((id (^)(id , id )) cljm_DOT_core_SLASH__nth.value)(entry, @1));

} else {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(cljm_DOT_core_SLASH__conj.value, coll, entry);

}
};
cljm_DOT_core_SLASH_PersistentTreeMap.value.prototype.cljm$core$IReversible$_rseq$arity$1 = ^id(id coll) {
var this__6712 = this;
if(cljm_truthy((this__6712_DOT_cnt > @0))) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_create_tree_map_seq.value)(this__6712_DOT_tree, @NO, this__6712_DOT_cnt);

} else {
return nil;

}
};
cljm_DOT_core_SLASH_PersistentTreeMap.value.prototype.toString = ^id() {
var this__6713 = this;
id this__6714 = this;
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_pr_str.value)(this__6714, nil);
};
cljm_DOT_core_SLASH_PersistentTreeMap.value.prototype.entry_at = ^id(id k) {
var this__6715 = this;
id coll__6716 = this;
id t__6717 = this__6715_DOT_tree;
while(YES) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((t__6717 == nil)))) {
id c__6718 = ((id (^)(id , id )) this__6715_DOT_comp.value)(k, t__6717.key);
if(cljm_truthy(([c__6718 isEqual:@0]))) {
return t__6717;

} else {
if(cljm_truthy((c__6718 < @0))) {
{
id G__6736 = t__6717.left;
t__6717 = G__6736;
continue;
}

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
{
id G__6737 = t__6717.right;
t__6717 = G__6737;
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
cljm_DOT_core_SLASH_PersistentTreeMap.value.prototype.cljm$core$ISorted$_sorted_seq$arity$2 = ^id(id coll, id ascending_QMARK_) {
var this__6719 = this;
if(cljm_truthy((this__6719_DOT_cnt > @0))) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_create_tree_map_seq.value)(this__6719_DOT_tree, ascending_QMARK_, this__6719_DOT_cnt);

} else {
return nil;

}
};
cljm_DOT_core_SLASH_PersistentTreeMap.value.prototype.cljm$core$ISorted$_sorted_seq_from$arity$3 = ^id(id coll, id k, id ascending_QMARK_) {
var this__6720 = this;
if(cljm_truthy((this__6720_DOT_cnt > @0))) {
id stack__6721 = nil;
id t__6722 = this__6720_DOT_tree;
while(YES) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((t__6722 == nil)))) {
id c__6723 = ((id (^)(id , id )) this__6720_DOT_comp.value)(k, t__6722.key);
if(cljm_truthy(([c__6723 isEqual:@0]))) {
return [cljm_DOT_core_SLASH_PersistentTreeMapSeq.value alloc];

} else {
if(cljm_truthy(ascending_QMARK_)) {
if(cljm_truthy((c__6723 < @0))) {
{
id G__6738 = ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_conj.value)(stack__6721, t__6722, nil);
id G__6739 = t__6722.left;
stack__6721 = G__6738;
t__6722 = G__6739;
continue;
}

} else {
{
id G__6740 = stack__6721;
id G__6741 = t__6722.right;
stack__6721 = G__6740;
t__6722 = G__6741;
continue;
}

}

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
if(cljm_truthy((c__6723 > @0))) {
{
id G__6742 = ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_conj.value)(stack__6721, t__6722, nil);
id G__6743 = t__6722.right;
stack__6721 = G__6742;
t__6722 = G__6743;
continue;
}

} else {
{
id G__6744 = stack__6721;
id G__6745 = t__6722.left;
stack__6721 = G__6744;
t__6722 = G__6745;
continue;
}

}

} else {
return nil;

}

}

}

} else {
if(cljm_truthy((stack__6721 == nil))) {
return [cljm_DOT_core_SLASH_PersistentTreeMapSeq.value alloc];

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
cljm_DOT_core_SLASH_PersistentTreeMap.value.prototype.cljm$core$ISorted$_entry_key$arity$2 = ^id(id coll, id entry) {
var this__6724 = this;
return ((id (^)(id )) cljm_DOT_core_SLASH_key.value)(entry);
};
cljm_DOT_core_SLASH_PersistentTreeMap.value.prototype.cljm$core$ISorted$_comparator$arity$1 = ^id(id coll) {
var this__6725 = this;
return this__6725_DOT_comp;
};
cljm_DOT_core_SLASH_PersistentTreeMap.value.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id coll) {
var this__6726 = this;
if(cljm_truthy((this__6726_DOT_cnt > @0))) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_create_tree_map_seq.value)(this__6726_DOT_tree, @YES, this__6726_DOT_cnt);

} else {
return nil;

}
};
cljm_DOT_core_SLASH_PersistentTreeMap.value.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__6727 = this;
return this__6727_DOT_cnt;
};
cljm_DOT_core_SLASH_PersistentTreeMap.value.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__6728 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_equiv_map.value)(coll, other);
};
cljm_DOT_core_SLASH_PersistentTreeMap.value.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__6729 = this;
return [cljm_DOT_core_SLASH_PersistentTreeMap.value alloc];
};
cljm_DOT_core_SLASH_PersistentTreeMap.value.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__6730 = this;
return this__6730_DOT_meta;
};
cljm_DOT_core_SLASH_PersistentTreeMap.value.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__6731 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_with_meta.value)(cljs_DOT_core_DOT_PersistentTreeMap_SLASH_EMPTY.value, this__6731_DOT_meta);
};
cljm_DOT_core_SLASH_PersistentTreeMap.value.prototype.cljm$core$IMap$_dissoc$arity$2 = ^id(id coll, id k) {
var this__6732 = this;
id found__6733 = @[nil];
id t__6734 = ((id (^)(id , id , id , id )) cljm_DOT_core_SLASH_tree_map_remove.value)(this__6732_DOT_comp, this__6732_DOT_tree, k, found__6733);
if(cljm_truthy((t__6734 == nil))) {
if(cljm_truthy((((id (^)(id , id )) cljm_DOT_core_SLASH_nth.value)(found__6733, @0) == nil))) {
return coll;

} else {
return [cljm_DOT_core_SLASH_PersistentTreeMap.value alloc];

}

} else {
return [cljm_DOT_core_SLASH_PersistentTreeMap.value alloc];

}
};
cljm_DOT_core_SLASH_PersistentTreeMap.value;
cljs_DOT_core_DOT_PersistentTreeMap_SLASH_EMPTY.value = [cljm_DOT_core_SLASH_PersistentTreeMap.value alloc];
/**
* keyval => key val
* Returns a new hash map with supplied mappings.
*/
cljm_DOT_core_SLASH_hash_map = [[CLJMVar alloc] initWithValue:^id(id cljm__varargs, ...) {
NSMutableArray *keyvals = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[keyvals addObject:cljm__currentObject];
}
va_end(cljm__args);
id in__6748 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(keyvals);
id out__6749 = ((id (^)(id )) cljm_DOT_core_SLASH_transient.value)(cljs_DOT_core_DOT_PersistentHashMap_SLASH_EMPTY.value);
while(YES) {
if(cljm_truthy(in__6748)) {
{
id G__6750 = ((id (^)(id )) cljm_DOT_core_SLASH_nnext.value)(in__6748);
id G__6751 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_assoc_BANG_.value)(out__6749, ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(in__6748), ((id (^)(id )) cljm_DOT_core_SLASH_second.value)(in__6748));
in__6748 = G__6750;
out__6749 = G__6751;
continue;
}

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH_persistent_BANG_.value)(out__6749);

}
break;
}
}];
/**
* keyval => key val
* Returns a new array map with supplied mappings.
*/
cljm_DOT_core_SLASH_array_map = [[CLJMVar alloc] initWithValue:^id(id cljm__varargs, ...) {
NSMutableArray *keyvals = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[keyvals addObject:cljm__currentObject];
}
va_end(cljm__args);
return [cljm_DOT_core_SLASH_PersistentArrayMap.value alloc];
}];
/**
* keyval => key val
* Returns a new object map with supplied mappings.
*/
cljm_DOT_core_SLASH_obj_map = [[CLJMVar alloc] initWithValue:^id(id cljm__varargs, ...) {
NSMutableArray *keyvals = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[keyvals addObject:cljm__currentObject];
}
va_end(cljm__args);
id ks__6755 = @[];
id obj__6756 = @{};
id kvs__6757 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(keyvals);
while(YES) {
if(cljm_truthy(kvs__6757)) {
[ks__6755 push((id (^)(id )) cljm_DOT_core_SLASH_first.value)(kvs__6757)];
(obj__6756[((id (^)(id )) cljm_DOT_core_SLASH_first.value)(kvs__6757)] = ((id (^)(id )) cljm_DOT_core_SLASH_second.value)(kvs__6757));
{
id G__6758 = ((id (^)(id )) cljm_DOT_core_SLASH_nnext.value)(kvs__6757);
kvs__6757 = G__6758;
continue;
}

} else {
return ((id (^)(id , id )) cljs_DOT_core_DOT_ObjMap_SLASH_fromObject.value)(ks__6755, obj__6756);

}
break;
}
}];
/**
* keyval => key val
* Returns a new sorted map with supplied mappings.
*/
cljm_DOT_core_SLASH_sorted_map = [[CLJMVar alloc] initWithValue:^id(id cljm__varargs, ...) {
NSMutableArray *keyvals = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[keyvals addObject:cljm__currentObject];
}
va_end(cljm__args);
id in__6761 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(keyvals);
id out__6762 = cljs_DOT_core_DOT_PersistentTreeMap_SLASH_EMPTY.value;
while(YES) {
if(cljm_truthy(in__6761)) {
{
id G__6763 = ((id (^)(id )) cljm_DOT_core_SLASH_nnext.value)(in__6761);
id G__6764 = ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_assoc.value)(out__6762, ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(in__6761), ((id (^)(id )) cljm_DOT_core_SLASH_second.value)(in__6761), nil);
in__6761 = G__6763;
out__6762 = G__6764;
continue;
}

} else {
return out__6762;

}
break;
}
}];
/**
* keyval => key val
* Returns a new sorted map with supplied mappings, using the supplied comparator.
*/
cljm_DOT_core_SLASH_sorted_map_by = [[CLJMVar alloc] initWithValue:^id(id cljm__varargs, id comparator, ...) {
NSMutableArray *keyvals = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[keyvals addObject:cljm__currentObject];
}
va_end(cljm__args);
id in__6767 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(keyvals);
id out__6768 = [cljs_SLASH_core_DOT_PersistentTreeMap.value alloc];
while(YES) {
if(cljm_truthy(in__6767)) {
{
id G__6769 = ((id (^)(id )) cljm_DOT_core_SLASH_nnext.value)(in__6767);
id G__6770 = ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_assoc.value)(out__6768, ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(in__6767), ((id (^)(id )) cljm_DOT_core_SLASH_second.value)(in__6767), nil);
in__6767 = G__6769;
out__6768 = G__6770;
continue;
}

} else {
return out__6768;

}
break;
}
}];
/**
* Returns a sequence of the map's keys.
*/
cljm_DOT_core_SLASH_keys = [[CLJMVar alloc] initWithValue:^id(id hash_map) {
return ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(((id (^)(id , id , ...)) cljm_DOT_core_SLASH_map.value)(cljm_DOT_core_SLASH_first.value, hash_map, nil));
}];
/**
* Returns the key of the map entry.
*/
cljm_DOT_core_SLASH_key = [[CLJMVar alloc] initWithValue:^id(id map_entry) {
return ((id (^)(id )) cljm_DOT_core_SLASH__key.value)(map_entry);
}];
/**
* Returns a sequence of the map's values.
*/
cljm_DOT_core_SLASH_vals = [[CLJMVar alloc] initWithValue:^id(id hash_map) {
return ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(((id (^)(id , id , ...)) cljm_DOT_core_SLASH_map.value)(cljm_DOT_core_SLASH_second.value, hash_map, nil));
}];
/**
* Returns the value in the map entry.
*/
cljm_DOT_core_SLASH_val = [[CLJMVar alloc] initWithValue:^id(id map_entry) {
return ((id (^)(id )) cljm_DOT_core_SLASH__val.value)(map_entry);
}];
/**
* Returns a map that consists of the rest of the maps conj-ed onto
* the first.  If a key occurs in more than one map, the mapping from
* the latter (left-to-right) will be the mapping in the result.
*/
cljm_DOT_core_SLASH_merge = [[CLJMVar alloc] initWithValue:^id(id cljm__varargs, ...) {
NSMutableArray *maps = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[maps addObject:cljm__currentObject];
}
va_end(cljm__args);
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_some.value)(cljm_DOT_core_SLASH_identity.value, maps))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_reduce.value)(^id(id p1__6771_SHARP_, id p2__6772_SHARP_) {
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_conj.value)({id or__3824__auto____6774 = p1__6771_SHARP_;
if(cljm_truthy(or__3824__auto____6774)) {
return or__3824__auto____6774;

} else {
return @{};

}
}, p2__6772_SHARP_, nil);
}, maps);

} else {
return nil;

}
}];
/**
* Returns a map that consists of the rest of the maps conj-ed onto
* the first.  If a key occurs in more than one map, the mapping(s)
* from the latter (left-to-right) will be combined with the mapping in
* the result by calling (f val-in-result val-in-latter).
*/
cljm_DOT_core_SLASH_merge_with = [[CLJMVar alloc] initWithValue:^id(id cljm__varargs, id f, ...) {
NSMutableArray *maps = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[maps addObject:cljm__currentObject];
}
va_end(cljm__args);
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_some.value)(cljm_DOT_core_SLASH_identity.value, maps))) {
id merge_entry__6782 = ^id(id m, id e) {
id k__6780 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(e);
id v__6781 = ((id (^)(id )) cljm_DOT_core_SLASH_second.value)(e);
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_contains_QMARK_.value)(m, k__6780))) {
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_assoc.value)(m, k__6780, ((id (^)(id , id )) f.value)(((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(m, k__6780, nil), v__6781), nil);

} else {
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_assoc.value)(m, k__6780, v__6781, nil);

}
};
id merge2__6784 = ^id(id m1, id m2) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(merge_entry__6782, {id or__3824__auto____6783 = m1;
if(cljm_truthy(or__3824__auto____6783)) {
return or__3824__auto____6783;

} else {
return @{};

}
}, ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(m2));
};
return ((id (^)(id , id )) cljm_DOT_core_SLASH_reduce.value)(merge2__6784, maps);

} else {
return nil;

}
}];
/**
* Returns a map containing only those entries in map whose key is in keys
*/
cljm_DOT_core_SLASH_select_keys = [[CLJMVar alloc] initWithValue:^id(id map, id keyseq) {
id ret__6789 = @{};
id keys__6790 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(keyseq);
while(YES) {
if(cljm_truthy(keys__6790)) {
id key__6791 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(keys__6790);
id entry__6792 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(map, key__6791, cljm_keyword(@":cljm.core/not-found"));
{
id G__6793 = (cljm_truthy(((id (^)(id , id , ...)) cljm_DOT_core_SLASH_not_EQ_.value)(entry__6792, cljm_keyword(@":cljm.core/not-found"), nil))) ?((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_assoc.value)(ret__6789, key__6791, entry__6792, nil):ret__6789;
id G__6794 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(keys__6790);
ret__6789 = G__6793;
keys__6790 = G__6794;
continue;
}

} else {
return ret__6789;

}
break;
}
}];

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
cljm_DOT_core_SLASH_PersistentHashSet.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_PersistentHashSet.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/PersistentHashSet", nil);
};
cljm_DOT_core_SLASH_PersistentHashSet.value.prototype.cljm$core$IEditableCollection$_as_transient$arity$1 = ^id(id coll) {
var this__6798 = this;
return [cljm_DOT_core_SLASH_TransientHashSet.value alloc];
};
cljm_DOT_core_SLASH_PersistentHashSet.value.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__6799 = this;
id h__1302__auto____6800 = this__6799_DOT___hash;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((h__1302__auto____6800 == nil)))) {
return h__1302__auto____6800;

} else {
id h__1302__auto____6801 = ((id (^)(id )) cljm_DOT_core_SLASH_hash_iset.value)(coll);
this__6799_DOT___hash = h__1302__auto____6801;
return h__1302__auto____6801;

}
};
cljm_DOT_core_SLASH_PersistentHashSet.value.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id coll, id v) {
var this__6802 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(coll, v, nil);
};
cljm_DOT_core_SLASH_PersistentHashSet.value.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id coll, id v, id not_found) {
var this__6803 = this;
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH__contains_key_QMARK_.value)(this__6803_DOT_hash_map, v))) {
return v;

} else {
return not_found;

}
};
cljm_DOT_core_SLASH_PersistentHashSet.value.prototype.call = (function() {
var G__6824 = null;
var G__6824__2 = ^id(id this_sym6804, id k) {
var this__6806 = this;
id this_sym6804__6807 = this;
id coll__6808 = this_sym6804__6807;
return ((id (^)(id , id )) cljm_DOT_core_SLASH__lookup.value)(coll__6808, k);
};
var G__6824__3 = ^id(id this_sym6805, id k, id not_found) {
var this__6806 = this;
id this_sym6805__6809 = this;
id coll__6810 = this_sym6805__6809;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(coll__6810, k, not_found);
};
G__6824 = function(this_sym6805, k, not_found){
switch(arguments.length){
case 2:
return G__6824__2.call(this,this_sym6805, k);
case 3:
return G__6824__3.call(this,this_sym6805, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__6824;
})()
;
cljm_DOT_core_SLASH_PersistentHashSet.value.prototype.apply = ^id(id this_sym6796, id args6797) {
var this__6811 = this;
return [this_sym6796.call applythis_sym6796, [@[this_sym6796] concatargs6797.slice()], nil];
};
cljm_DOT_core_SLASH_PersistentHashSet.value.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id o) {
var this__6812 = this;
return [cljm_DOT_core_SLASH_PersistentHashSet.value alloc];
};
cljm_DOT_core_SLASH_PersistentHashSet.value.prototype.toString = ^id() {
var this__6813 = this;
id this__6814 = this;
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_pr_str.value)(this__6814, nil);
};
cljm_DOT_core_SLASH_PersistentHashSet.value.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id coll) {
var this__6815 = this;
return ((id (^)(id )) cljm_DOT_core_SLASH_keys.value)(this__6815_DOT_hash_map);
};
cljm_DOT_core_SLASH_PersistentHashSet.value.prototype.cljm$core$ISet$_disjoin$arity$2 = ^id(id coll, id v) {
var this__6816 = this;
return [cljm_DOT_core_SLASH_PersistentHashSet.value alloc];
};
cljm_DOT_core_SLASH_PersistentHashSet.value.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__6817 = this;
return ((id (^)(id )) cljm_DOT_core_SLASH_count.value)(((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(coll));
};
cljm_DOT_core_SLASH_PersistentHashSet.value.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__6818 = this;
id and__3822__auto____6819 = ((id (^)(id )) cljm_DOT_core_SLASH_set_QMARK_.value)(other);
if(cljm_truthy(and__3822__auto____6819)) {
id and__3822__auto____6820 = ([((id (^)(id )) cljm_DOT_core_SLASH_count.value)(coll) isEqual:((id (^)(id )) cljm_DOT_core_SLASH_count.value)(other)]);
if(cljm_truthy(and__3822__auto____6820)) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_every_QMARK_.value)(^id(id p1__6795_SHARP_) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_contains_QMARK_.value)(coll, p1__6795_SHARP_);
}, other);

} else {
return and__3822__auto____6820;

}

} else {
return and__3822__auto____6819;

}
};
cljm_DOT_core_SLASH_PersistentHashSet.value.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__6821 = this;
return [cljm_DOT_core_SLASH_PersistentHashSet.value alloc];
};
cljm_DOT_core_SLASH_PersistentHashSet.value.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__6822 = this;
return this__6822_DOT_meta;
};
cljm_DOT_core_SLASH_PersistentHashSet.value.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__6823 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_with_meta.value)(cljs_DOT_core_DOT_PersistentHashSet_SLASH_EMPTY.value, this__6823_DOT_meta);
};
cljm_DOT_core_SLASH_PersistentHashSet.value;
cljs_DOT_core_DOT_PersistentHashSet_SLASH_EMPTY.value = [cljm_DOT_core_SLASH_PersistentHashSet.value alloc];
cljs_DOT_core_DOT_PersistentHashSet_SLASH_fromArray.value = ^id(id items) {
id len__6825 = ((id (^)(id )) cljm_DOT_core_SLASH_count.value)(items);
id i__6826 = @0;
id out__6827 = ((id (^)(id )) cljm_DOT_core_SLASH_transient.value)(cljs_DOT_core_DOT_PersistentHashSet_SLASH_EMPTY.value);
while(YES) {
if(cljm_truthy((i__6826 < len__6825))) {
{
id G__6828 = (i__6826 + @1);
id G__6829 = ((id (^)(id , id )) cljm_DOT_core_SLASH_conj_BANG_.value)(out__6827, (items[i__6826]));
i__6826 = G__6828;
out__6827 = G__6829;
continue;
}

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH_persistent_BANG_.value)(out__6827);

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
cljm_DOT_core_SLASH_TransientHashSet.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_TransientHashSet.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/TransientHashSet", nil);
};
cljm_DOT_core_SLASH_TransientHashSet.value.prototype.call = (function() {
var G__6847 = null;
var G__6847__2 = ^id(id this_sym6833, id k) {
var this__6835 = this;
id this_sym6833__6836 = this;
id tcoll__6837 = this_sym6833__6836;
if(cljm_truthy(([((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(this__6835_DOT_transient_map, k, cljm_DOT_core_SLASH_lookup_sentinel.value) isEqual:cljm_DOT_core_SLASH_lookup_sentinel.value]))) {
return nil;

} else {
return k;

}
};
var G__6847__3 = ^id(id this_sym6834, id k, id not_found) {
var this__6835 = this;
id this_sym6834__6838 = this;
id tcoll__6839 = this_sym6834__6838;
if(cljm_truthy(([((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(this__6835_DOT_transient_map, k, cljm_DOT_core_SLASH_lookup_sentinel.value) isEqual:cljm_DOT_core_SLASH_lookup_sentinel.value]))) {
return not_found;

} else {
return k;

}
};
G__6847 = function(this_sym6834, k, not_found){
switch(arguments.length){
case 2:
return G__6847__2.call(this,this_sym6834, k);
case 3:
return G__6847__3.call(this,this_sym6834, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__6847;
})()
;
cljm_DOT_core_SLASH_TransientHashSet.value.prototype.apply = ^id(id this_sym6831, id args6832) {
var this__6840 = this;
return [this_sym6831.call applythis_sym6831, [@[this_sym6831] concatargs6832.slice()], nil];
};
cljm_DOT_core_SLASH_TransientHashSet.value.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id tcoll, id v) {
var this__6841 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(tcoll, v, nil);
};
cljm_DOT_core_SLASH_TransientHashSet.value.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id tcoll, id v, id not_found) {
var this__6842 = this;
if(cljm_truthy(([((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(this__6842_DOT_transient_map, v, cljm_DOT_core_SLASH_lookup_sentinel.value) isEqual:cljm_DOT_core_SLASH_lookup_sentinel.value]))) {
return not_found;

} else {
return v;

}
};
cljm_DOT_core_SLASH_TransientHashSet.value.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id tcoll) {
var this__6843 = this;
return ((id (^)(id )) cljm_DOT_core_SLASH_count.value)(this__6843_DOT_transient_map);
};
cljm_DOT_core_SLASH_TransientHashSet.value.prototype.cljm$core$ITransientSet$_disjoin_BANG_$arity$2 = ^id(id tcoll, id v) {
var this__6844 = this;
this__6844_DOT_transient_map = ((id (^)(id , id )) cljm_DOT_core_SLASH_dissoc_BANG_.value)(this__6844_DOT_transient_map, v);
return tcoll;
};
cljm_DOT_core_SLASH_TransientHashSet.value.prototype.cljm$core$ITransientCollection$_conj_BANG_$arity$2 = ^id(id tcoll, id o) {
var this__6845 = this;
this__6845_DOT_transient_map = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_assoc_BANG_.value)(this__6845_DOT_transient_map, o, nil);
return tcoll;
};
cljm_DOT_core_SLASH_TransientHashSet.value.prototype.cljm$core$ITransientCollection$_persistent_BANG_$arity$1 = ^id(id tcoll) {
var this__6846 = this;
return [cljm_DOT_core_SLASH_PersistentHashSet.value alloc];
};
cljm_DOT_core_SLASH_TransientHashSet.value;

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
cljm_DOT_core_SLASH_PersistentTreeSet.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_PersistentTreeSet.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/PersistentTreeSet", nil);
};
cljm_DOT_core_SLASH_PersistentTreeSet.value.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id coll) {
var this__6850 = this;
id h__1302__auto____6851 = this__6850_DOT___hash;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((h__1302__auto____6851 == nil)))) {
return h__1302__auto____6851;

} else {
id h__1302__auto____6852 = ((id (^)(id )) cljm_DOT_core_SLASH_hash_iset.value)(coll);
this__6850_DOT___hash = h__1302__auto____6852;
return h__1302__auto____6852;

}
};
cljm_DOT_core_SLASH_PersistentTreeSet.value.prototype.cljm$core$ILookup$_lookup$arity$2 = ^id(id coll, id v) {
var this__6853 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(coll, v, nil);
};
cljm_DOT_core_SLASH_PersistentTreeSet.value.prototype.cljm$core$ILookup$_lookup$arity$3 = ^id(id coll, id v, id not_found) {
var this__6854 = this;
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH__contains_key_QMARK_.value)(this__6854_DOT_tree_map, v))) {
return v;

} else {
return not_found;

}
};
cljm_DOT_core_SLASH_PersistentTreeSet.value.prototype.call = (function() {
var G__6880 = null;
var G__6880__2 = ^id(id this_sym6855, id k) {
var this__6857 = this;
id this_sym6855__6858 = this;
id coll__6859 = this_sym6855__6858;
return ((id (^)(id , id )) cljm_DOT_core_SLASH__lookup.value)(coll__6859, k);
};
var G__6880__3 = ^id(id this_sym6856, id k, id not_found) {
var this__6857 = this;
id this_sym6856__6860 = this;
id coll__6861 = this_sym6856__6860;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(coll__6861, k, not_found);
};
G__6880 = function(this_sym6856, k, not_found){
switch(arguments.length){
case 2:
return G__6880__2.call(this,this_sym6856, k);
case 3:
return G__6880__3.call(this,this_sym6856, k, not_found);
}
throw('Invalid arity: ' + arguments.length);
};
return G__6880;
})()
;
cljm_DOT_core_SLASH_PersistentTreeSet.value.prototype.apply = ^id(id this_sym6848, id args6849) {
var this__6862 = this;
return [this_sym6848.call applythis_sym6848, [@[this_sym6848] concatargs6849.slice()], nil];
};
cljm_DOT_core_SLASH_PersistentTreeSet.value.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id coll, id o) {
var this__6863 = this;
return [cljm_DOT_core_SLASH_PersistentTreeSet.value alloc];
};
cljm_DOT_core_SLASH_PersistentTreeSet.value.prototype.cljm$core$IReversible$_rseq$arity$1 = ^id(id coll) {
var this__6864 = this;
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_map.value)(cljm_DOT_core_SLASH_key.value, ((id (^)(id )) cljm_DOT_core_SLASH_rseq.value)(this__6864_DOT_tree_map), nil);
};
cljm_DOT_core_SLASH_PersistentTreeSet.value.prototype.toString = ^id() {
var this__6865 = this;
id this__6866 = this;
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_pr_str.value)(this__6866, nil);
};
cljm_DOT_core_SLASH_PersistentTreeSet.value.prototype.cljm$core$ISorted$_sorted_seq$arity$2 = ^id(id coll, id ascending_QMARK_) {
var this__6867 = this;
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_map.value)(cljm_DOT_core_SLASH_key.value, ((id (^)(id , id )) cljm_DOT_core_SLASH__sorted_seq.value)(this__6867_DOT_tree_map, ascending_QMARK_), nil);
};
cljm_DOT_core_SLASH_PersistentTreeSet.value.prototype.cljm$core$ISorted$_sorted_seq_from$arity$3 = ^id(id coll, id k, id ascending_QMARK_) {
var this__6868 = this;
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_map.value)(cljm_DOT_core_SLASH_key.value, ((id (^)(id , id , id )) cljm_DOT_core_SLASH__sorted_seq_from.value)(this__6868_DOT_tree_map, k, ascending_QMARK_), nil);
};
cljm_DOT_core_SLASH_PersistentTreeSet.value.prototype.cljm$core$ISorted$_entry_key$arity$2 = ^id(id coll, id entry) {
var this__6869 = this;
return entry;
};
cljm_DOT_core_SLASH_PersistentTreeSet.value.prototype.cljm$core$ISorted$_comparator$arity$1 = ^id(id coll) {
var this__6870 = this;
return ((id (^)(id )) cljm_DOT_core_SLASH__comparator.value)(this__6870_DOT_tree_map);
};
cljm_DOT_core_SLASH_PersistentTreeSet.value.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id coll) {
var this__6871 = this;
return ((id (^)(id )) cljm_DOT_core_SLASH_keys.value)(this__6871_DOT_tree_map);
};
cljm_DOT_core_SLASH_PersistentTreeSet.value.prototype.cljm$core$ISet$_disjoin$arity$2 = ^id(id coll, id v) {
var this__6872 = this;
return [cljm_DOT_core_SLASH_PersistentTreeSet.value alloc];
};
cljm_DOT_core_SLASH_PersistentTreeSet.value.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id coll) {
var this__6873 = this;
return ((id (^)(id )) cljm_DOT_core_SLASH_count.value)(this__6873_DOT_tree_map);
};
cljm_DOT_core_SLASH_PersistentTreeSet.value.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id coll, id other) {
var this__6874 = this;
id and__3822__auto____6875 = ((id (^)(id )) cljm_DOT_core_SLASH_set_QMARK_.value)(other);
if(cljm_truthy(and__3822__auto____6875)) {
id and__3822__auto____6876 = ([((id (^)(id )) cljm_DOT_core_SLASH_count.value)(coll) isEqual:((id (^)(id )) cljm_DOT_core_SLASH_count.value)(other)]);
if(cljm_truthy(and__3822__auto____6876)) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_every_QMARK_.value)(^id(id p1__6830_SHARP_) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_contains_QMARK_.value)(coll, p1__6830_SHARP_);
}, other);

} else {
return and__3822__auto____6876;

}

} else {
return and__3822__auto____6875;

}
};
cljm_DOT_core_SLASH_PersistentTreeSet.value.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id coll, id meta) {
var this__6877 = this;
return [cljm_DOT_core_SLASH_PersistentTreeSet.value alloc];
};
cljm_DOT_core_SLASH_PersistentTreeSet.value.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id coll) {
var this__6878 = this;
return this__6878_DOT_meta;
};
cljm_DOT_core_SLASH_PersistentTreeSet.value.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id coll) {
var this__6879 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_with_meta.value)(cljs_DOT_core_DOT_PersistentTreeSet_SLASH_EMPTY.value, this__6879_DOT_meta);
};
cljm_DOT_core_SLASH_PersistentTreeSet.value;
cljs_DOT_core_DOT_PersistentTreeSet_SLASH_EMPTY.value = [cljm_DOT_core_SLASH_PersistentTreeSet.value alloc];
cljm_DOT_core_SLASH_hash_set = [[CLJMVar alloc] initWithValue:(function() {
var hash_set = null;
var hash_set__0 = ^id() {
return cljs_DOT_core_DOT_PersistentHashSet_SLASH_EMPTY.value;
};
var hash_set__1 = ^id(id cljm__varargs, ...) {
NSMutableArray *keys = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[keys addObject:cljm__currentObject];
}
va_end(cljm__args);
id in__6883 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(keys);
id out__6884 = ((id (^)(id )) cljm_DOT_core_SLASH_transient.value)(cljs_DOT_core_DOT_PersistentHashSet_SLASH_EMPTY.value);
while(YES) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(in__6883))) {
{
id G__6885 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(in__6883);
id G__6886 = ((id (^)(id , id )) cljm_DOT_core_SLASH_conj_BANG_.value)(out__6884, ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(in__6883));
in__6883 = G__6885;
out__6884 = G__6886;
continue;
}

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH_persistent_BANG_.value)(out__6884);

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
];
/**
* Returns a set of the distinct elements of coll.
*/
cljm_DOT_core_SLASH_set = [[CLJMVar alloc] initWithValue:^id(id coll) {
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_apply.value)(cljm_DOT_core_SLASH_hash_set.value, coll, nil);
}];
/**
* Returns a new sorted set with supplied keys.
*/
cljm_DOT_core_SLASH_sorted_set = [[CLJMVar alloc] initWithValue:^id(id cljm__varargs, ...) {
NSMutableArray *keys = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[keys addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(cljm_DOT_core_SLASH__conj.value, cljs_DOT_core_DOT_PersistentTreeSet_SLASH_EMPTY.value, keys);
}];
/**
* Returns a new sorted set with supplied keys, using the supplied comparator.
*/
cljm_DOT_core_SLASH_sorted_set_by = [[CLJMVar alloc] initWithValue:^id(id cljm__varargs, id comparator, ...) {
NSMutableArray *keys = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[keys addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(cljm_DOT_core_SLASH__conj.value, [cljs_SLASH_core_DOT_PersistentTreeSet.value alloc], keys);
}];
/**
* Given a map of replacement pairs and a vector/collection, returns a
* vector/seq with any elements = a key in smap replaced with the
* corresponding val in smap
*/
cljm_DOT_core_SLASH_replace = [[CLJMVar alloc] initWithValue:^id(id smap, id coll) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_vector_QMARK_.value)(coll))) {
id n__6893 = ((id (^)(id )) cljm_DOT_core_SLASH_count.value)(coll);
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(^id(id v, id i) {
id temp__3971__auto____6894 = ((id (^)(id , id )) cljm_DOT_core_SLASH_find.value)(smap, ((id (^)(id , id )) cljm_DOT_core_SLASH_nth.value)(v, i));
if(cljm_truthy(temp__3971__auto____6894)) {
id e__6895 = temp__3971__auto____6894;
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_assoc.value)(v, i, ((id (^)(id )) cljm_DOT_core_SLASH_second.value)(e__6895), nil);

} else {
return v;

}
}, coll, ((id (^)(id , id )) cljm_DOT_core_SLASH_take.value)(n__6893, ((id (^)(id , id )) cljm_DOT_core_SLASH_iterate.value)(cljm_DOT_core_SLASH_inc.value, @0)));

} else {
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_map.value)(^id(id p1__6887_SHARP_) {
id temp__3971__auto____6896 = ((id (^)(id , id )) cljm_DOT_core_SLASH_find.value)(smap, p1__6887_SHARP_);
if(cljm_truthy(temp__3971__auto____6896)) {
id e__6897 = temp__3971__auto____6896;
return ((id (^)(id )) cljm_DOT_core_SLASH_second.value)(e__6897);

} else {
return p1__6887_SHARP_;

}
}, coll, nil);

}
}];
/**
* Returns a lazy sequence of the elements of coll with duplicates removed
*/
cljm_DOT_core_SLASH_distinct = [[CLJMVar alloc] initWithValue:^id(id coll) {
id step__6927 = ^id(id xs, id seen) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
};
return ((id (^)(id , id )) step__6927.value)(coll, [NSSet set]);
}];
cljm_DOT_core_SLASH_butlast = [[CLJMVar alloc] initWithValue:^id(id s) {
id ret__6930 = @[];
id s__6931 = s;
while(YES) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_next.value)(s__6931))) {
{
id G__6932 = ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_conj.value)(ret__6930, ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(s__6931), nil);
id G__6933 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(s__6931);
ret__6930 = G__6932;
s__6931 = G__6933;
continue;
}

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(ret__6930);

}
break;
}
}];
/**
* Returns the name String of a string, symbol or keyword.
*/
cljm_DOT_core_SLASH_name = [[CLJMVar alloc] initWithValue:^id(id x) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_string_QMARK_.value)(x))) {
return x;

} else {
if(cljm_truthy({id or__3824__auto____6936 = ((id (^)(id )) cljm_DOT_core_SLASH_keyword_QMARK_.value)(x);
if(cljm_truthy(or__3824__auto____6936)) {
return or__3824__auto____6936;

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH_symbol_QMARK_.value)(x);

}
})) {
id i__6937 = [x lastIndexOf@"/"];
if(cljm_truthy((i__6937 < @0))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_subs.value)(x, @2);

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_subs.value)(x, (i__6937 + @1));

}

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
throw [Error.value alloc];

} else {
return nil;

}

}

}
}];
/**
* Returns the namespace String of a symbol or keyword, or nil if not present.
*/
cljm_DOT_core_SLASH_namespace = [[CLJMVar alloc] initWithValue:^id(id x) {
if(cljm_truthy({id or__3824__auto____6940 = ((id (^)(id )) cljm_DOT_core_SLASH_keyword_QMARK_.value)(x);
if(cljm_truthy(or__3824__auto____6940)) {
return or__3824__auto____6940;

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH_symbol_QMARK_.value)(x);

}
})) {
id i__6941 = [x lastIndexOf@"/"];
if(cljm_truthy((i__6941 > @-1))) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_subs.value)(x, @2, i__6941);

} else {
return nil;

}

} else {
throw [Error.value alloc];

}
}];
/**
* Returns a map with the keys mapped to the corresponding vals.
*/
cljm_DOT_core_SLASH_zipmap = [[CLJMVar alloc] initWithValue:^id(id keys, id vals) {
id map__6948 = @{};
id ks__6949 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(keys);
id vs__6950 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(vals);
while(YES) {
if(cljm_truthy({id and__3822__auto____6951 = ks__6949;
if(cljm_truthy(and__3822__auto____6951)) {
return vs__6950;

} else {
return and__3822__auto____6951;

}
})) {
{
id G__6952 = ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_assoc.value)(map__6948, ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(ks__6949), ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(vs__6950), nil);
id G__6953 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(ks__6949);
id G__6954 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(vs__6950);
map__6948 = G__6952;
ks__6949 = G__6953;
vs__6950 = G__6954;
continue;
}

} else {
return map__6948;

}
break;
}
}];
/**
* Returns the x for which (k x), a number, is greatest.
*/
cljm_DOT_core_SLASH_max_key = [[CLJMVar alloc] initWithValue:(function() {
var max_key = null;
var max_key__2 = ^id(id k, id x) {
return x;
};
var max_key__3 = ^id(id k, id x, id y) {
if(cljm_truthy((((id (^)(id )) k.value)(x) > ((id (^)(id )) k.value)(y)))) {
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
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(^id(id p1__6942_SHARP_, id p2__6943_SHARP_) {
return ((id (^)(id , id , id , ...)) max_key.value)(k, p1__6942_SHARP_, p2__6943_SHARP_, nil);
}, ((id (^)(id , id , id , ...)) max_key.value)(k, x, y, nil), more);
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
];
/**
* Returns the x for which (k x), a number, is least.
*/
cljm_DOT_core_SLASH_min_key = [[CLJMVar alloc] initWithValue:(function() {
var min_key = null;
var min_key__2 = ^id(id k, id x) {
return x;
};
var min_key__3 = ^id(id k, id x, id y) {
if(cljm_truthy((((id (^)(id )) k.value)(x) < ((id (^)(id )) k.value)(y)))) {
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
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(^id(id p1__6955_SHARP_, id p2__6956_SHARP_) {
return ((id (^)(id , id , id , ...)) min_key.value)(k, p1__6955_SHARP_, p2__6956_SHARP_, nil);
}, ((id (^)(id , id , id , ...)) min_key.value)(k, x, y, nil), more);
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
];
/**
* Returns a lazy sequence of lists like partition, but may include
* partitions with fewer than n items at the end.
*/
cljm_DOT_core_SLASH_partition_all = [[CLJMVar alloc] initWithValue:(function() {
var partition_all = null;
var partition_all__2 = ^id(id n, id coll) {
return ((id (^)(id , id , id )) partition_all.value)(n, n, coll);
};
var partition_all__3 = ^id(id n, id step, id coll) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
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
];
/**
* Returns a lazy sequence of successive items from coll while
* (pred item) returns true. pred must be free of side-effects.
*/
cljm_DOT_core_SLASH_take_while = [[CLJMVar alloc] initWithValue:^id(id pred, id coll) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
}];
cljm_DOT_core_SLASH_mk_bound_fn = [[CLJMVar alloc] initWithValue:^id(id sc, id test, id key) {
return ^id(id e) {
id comp__6966 = ((id (^)(id )) cljm_DOT_core_SLASH__comparator.value)(sc);
return ((id (^)(id , id )) test.value)(((id (^)(id , id )) comp__6966.value)(((id (^)(id , id )) cljm_DOT_core_SLASH__entry_key.value)(sc, e), key), @0);
};
}];
/**
* sc must be a sorted collection, test(s) one of <, <=, > or
* >=. Returns a seq of those entries with keys ek for
* which (test (.. sc comparator (compare ek key)) 0) is true
*/
cljm_DOT_core_SLASH_subseq = [[CLJMVar alloc] initWithValue:(function() {
var subseq = null;
var subseq__3 = ^id(id sc, id test, id key) {
id include__6978 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_mk_bound_fn.value)(sc, test, key);
if(cljm_truthy(((id (^)(id )) .value)(test))) {
id temp__3974__auto____6979 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH__sorted_seq_from.value)(sc, key, @YES);
if(cljm_truthy(temp__3974__auto____6979)) {
id vec__6980__6981 = temp__3974__auto____6979;
id e__6982 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_nth.value)(vec__6980__6981, @0, nil);
id s__6983 = vec__6980__6981;
if(cljm_truthy(((id (^)(id )) include__6978.value)(e__6982))) {
return s__6983;

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(s__6983);

}

} else {
return nil;

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_take_while.value)(include__6978, ((id (^)(id , id )) cljm_DOT_core_SLASH__sorted_seq.value)(sc, @YES));

}
};
var subseq__5 = ^id(id sc, id start_test, id start_key, id end_test, id end_key) {
id temp__3974__auto____6984 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH__sorted_seq_from.value)(sc, start_key, @YES);
if(cljm_truthy(temp__3974__auto____6984)) {
id vec__6985__6986 = temp__3974__auto____6984;
id e__6987 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_nth.value)(vec__6985__6986, @0, nil);
id s__6988 = vec__6985__6986;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_take_while.value)(((id (^)(id , id , id )) cljm_DOT_core_SLASH_mk_bound_fn.value)(sc, end_test, end_key), (cljm_truthy(((id (^)(id )) .value)(e__6987))) ?s__6988:((id (^)(id )) cljm_DOT_core_SLASH_next.value)(s__6988));

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
];
/**
* sc must be a sorted collection, test(s) one of <, <=, > or
* >=. Returns a reverse seq of those entries with keys ek for
* which (test (.. sc comparator (compare ek key)) 0) is true
*/
cljm_DOT_core_SLASH_rsubseq = [[CLJMVar alloc] initWithValue:(function() {
var rsubseq = null;
var rsubseq__3 = ^id(id sc, id test, id key) {
id include__7000 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_mk_bound_fn.value)(sc, test, key);
if(cljm_truthy(((id (^)(id )) .value)(test))) {
id temp__3974__auto____7001 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH__sorted_seq_from.value)(sc, key, @NO);
if(cljm_truthy(temp__3974__auto____7001)) {
id vec__7002__7003 = temp__3974__auto____7001;
id e__7004 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_nth.value)(vec__7002__7003, @0, nil);
id s__7005 = vec__7002__7003;
if(cljm_truthy(((id (^)(id )) include__7000.value)(e__7004))) {
return s__7005;

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(s__7005);

}

} else {
return nil;

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_take_while.value)(include__7000, ((id (^)(id , id )) cljm_DOT_core_SLASH__sorted_seq.value)(sc, @NO));

}
};
var rsubseq__5 = ^id(id sc, id start_test, id start_key, id end_test, id end_key) {
id temp__3974__auto____7006 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH__sorted_seq_from.value)(sc, end_key, @NO);
if(cljm_truthy(temp__3974__auto____7006)) {
id vec__7007__7008 = temp__3974__auto____7006;
id e__7009 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_nth.value)(vec__7007__7008, @0, nil);
id s__7010 = vec__7007__7008;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_take_while.value)(((id (^)(id , id , id )) cljm_DOT_core_SLASH_mk_bound_fn.value)(sc, start_test, start_key), (cljm_truthy(((id (^)(id )) .value)(e__7009))) ?s__7010:((id (^)(id )) cljm_DOT_core_SLASH_next.value)(s__7010));

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
];

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
cljm_DOT_core_SLASH_Range.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_Range.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/Range", nil);
};
cljm_DOT_core_SLASH_Range.value.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id rng) {
var this__7011 = this;
id h__1302__auto____7012 = this__7011_DOT___hash;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((h__1302__auto____7012 == nil)))) {
return h__1302__auto____7012;

} else {
id h__1302__auto____7013 = ((id (^)(id )) cljm_DOT_core_SLASH_hash_coll.value)(rng);
this__7011_DOT___hash = h__1302__auto____7013;
return h__1302__auto____7013;

}
};
cljm_DOT_core_SLASH_Range.value.prototype.cljm$core$INext$_next$arity$1 = ^id(id rng) {
var this__7014 = this;
if(cljm_truthy((this__7014_DOT_step > @0))) {
if(cljm_truthy(((this__7014_DOT_start + this__7014_DOT_step) < this__7014_DOT_end))) {
return [cljm_DOT_core_SLASH_Range.value alloc];

} else {
return nil;

}

} else {
if(cljm_truthy(((this__7014_DOT_start + this__7014_DOT_step) > this__7014_DOT_end))) {
return [cljm_DOT_core_SLASH_Range.value alloc];

} else {
return nil;

}

}
};
cljm_DOT_core_SLASH_Range.value.prototype.cljm$core$ICollection$_conj$arity$2 = ^id(id rng, id o) {
var this__7015 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(o, rng);
};
cljm_DOT_core_SLASH_Range.value.prototype.toString = ^id() {
var this__7016 = this;
id this__7017 = this;
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_pr_str.value)(this__7017, nil);
};
cljm_DOT_core_SLASH_Range.value.prototype.cljm$core$IReduce$_reduce$arity$2 = ^id(id rng, id f) {
var this__7018 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_ci_reduce.value)(rng, f);
};
cljm_DOT_core_SLASH_Range.value.prototype.cljm$core$IReduce$_reduce$arity$3 = ^id(id rng, id f, id s) {
var this__7019 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_ci_reduce.value)(rng, f, s);
};
cljm_DOT_core_SLASH_Range.value.prototype.cljm$core$ISeqable$_seq$arity$1 = ^id(id rng) {
var this__7020 = this;
if(cljm_truthy((this__7020_DOT_step > @0))) {
if(cljm_truthy((this__7020_DOT_start < this__7020_DOT_end))) {
return rng;

} else {
return nil;

}

} else {
if(cljm_truthy((this__7020_DOT_start > this__7020_DOT_end))) {
return rng;

} else {
return nil;

}

}
};
cljm_DOT_core_SLASH_Range.value.prototype.cljm$core$ICounted$_count$arity$1 = ^id(id rng) {
var this__7021 = this;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)(((id (^)(id )) cljm_DOT_core_SLASH__seq.value)(rng)))) {
return @0;

} else {
return ((id (^)(id )) js_SLASH_Math_DOT_ceil.value)(((this__7021_DOT_end - this__7021_DOT_start) / this__7021_DOT_step));

}
};
cljm_DOT_core_SLASH_Range.value.prototype.cljm$core$ISeq$_first$arity$1 = ^id(id rng) {
var this__7022 = this;
return this__7022_DOT_start;
};
cljm_DOT_core_SLASH_Range.value.prototype.cljm$core$ISeq$_rest$arity$1 = ^id(id rng) {
var this__7023 = this;
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not.value)((((id (^)(id )) cljm_DOT_core_SLASH__seq.value)(rng) == nil)))) {
return [cljm_DOT_core_SLASH_Range.value alloc];

} else {
return cljm.core.List.EMPTY;

}
};
cljm_DOT_core_SLASH_Range.value.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id rng, id other) {
var this__7024 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_equiv_sequential.value)(rng, other);
};
cljm_DOT_core_SLASH_Range.value.prototype.cljm$core$IWithMeta$_with_meta$arity$2 = ^id(id rng, id meta) {
var this__7025 = this;
return [cljm_DOT_core_SLASH_Range.value alloc];
};
cljm_DOT_core_SLASH_Range.value.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id rng) {
var this__7026 = this;
return this__7026_DOT_meta;
};
cljm_DOT_core_SLASH_Range.value.prototype.cljm$core$IIndexed$_nth$arity$2 = ^id(id rng, id n) {
var this__7027 = this;
if(cljm_truthy((n < ((id (^)(id )) cljm_DOT_core_SLASH__count.value)(rng)))) {
return (this__7027_DOT_start + (n * this__7027_DOT_step));

} else {
if(cljm_truthy({id and__3822__auto____7028 = (this__7027_DOT_start > this__7027_DOT_end);
if(cljm_truthy(and__3822__auto____7028)) {
return ([this__7027_DOT_step isEqual:@0]);

} else {
return and__3822__auto____7028;

}
})) {
return this__7027_DOT_start;

} else {
throw [Error.value alloc];

}

}
};
cljm_DOT_core_SLASH_Range.value.prototype.cljm$core$IIndexed$_nth$arity$3 = ^id(id rng, id n, id not_found) {
var this__7029 = this;
if(cljm_truthy((n < ((id (^)(id )) cljm_DOT_core_SLASH__count.value)(rng)))) {
return (this__7029_DOT_start + (n * this__7029_DOT_step));

} else {
if(cljm_truthy({id and__3822__auto____7030 = (this__7029_DOT_start > this__7029_DOT_end);
if(cljm_truthy(and__3822__auto____7030)) {
return ([this__7029_DOT_step isEqual:@0]);

} else {
return and__3822__auto____7030;

}
})) {
return this__7029_DOT_start;

} else {
return not_found;

}

}
};
cljm_DOT_core_SLASH_Range.value.prototype.cljm$core$IEmptyableCollection$_empty$arity$1 = ^id(id rng) {
var this__7031 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH_with_meta.value)(cljs_DOT_core_DOT_List_SLASH_EMPTY.value, this__7031_DOT_meta);
};
cljm_DOT_core_SLASH_Range.value;
/**
* Returns a lazy seq of nums from start (inclusive) to end
* (exclusive), by step, where start defaults to 0, step to 1,
* and end to infinity.
*/
cljm_DOT_core_SLASH_range = [[CLJMVar alloc] initWithValue:(function() {
var range = null;
var range__0 = ^id() {
return ((id (^)(id , id , id )) range.value)(@0, Number_DOT_MAX_VALUE.value, @1);
};
var range__1 = ^id(id end) {
return ((id (^)(id , id , id )) range.value)(@0, end, @1);
};
var range__2 = ^id(id start, id end) {
return ((id (^)(id , id , id )) range.value)(start, end, @1);
};
var range__3 = ^id(id start, id end, id step) {
return [cljm_DOT_core_SLASH_Range.value alloc];
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
];
/**
* Returns a lazy seq of every nth item in coll.
*/
cljm_DOT_core_SLASH_take_nth = [[CLJMVar alloc] initWithValue:^id(id n, id coll) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
}];
/**
* Returns a vector of [(take-while pred coll) (drop-while pred coll)]
*/
cljm_DOT_core_SLASH_split_with = [[CLJMVar alloc] initWithValue:^id(id pred, id coll) {
return @[ ((id (^)(id , id )) cljm_DOT_core_SLASH_take_while.value)(pred, coll), ((id (^)(id , id )) cljm_DOT_core_SLASH_drop_while.value)(pred, coll) ];
}];
/**
* Applies f to each value in coll, splitting it each time f returns
* a new value.  Returns a lazy seq of partitions.
*/
cljm_DOT_core_SLASH_partition_by = [[CLJMVar alloc] initWithValue:^id(id f, id coll) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
}];
/**
* Returns a map from distinct items in coll to the number of times
* they appear.
*/
cljm_DOT_core_SLASH_frequencies = [[CLJMVar alloc] initWithValue:^id(id coll) {
return ((id (^)(id )) cljm_DOT_core_SLASH_persistent_BANG_.value)(((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(^id(id counts, id x) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_assoc_BANG_.value)(counts, x, (((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(counts, x, @0) + @1));
}, ((id (^)(id )) cljm_DOT_core_SLASH_transient.value)(@{}), coll));
}];
/**
* Returns a lazy seq of the intermediate values of the reduction (as
* per reduce) of coll by f, starting with init.
*/
cljm_DOT_core_SLASH_reductions = [[CLJMVar alloc] initWithValue:(function() {
var reductions = null;
var reductions__2 = ^id(id f, id coll) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
};
var reductions__3 = ^id(id f, id init, id coll) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(init, [cljm_DOT_core_SLASH_LazySeq.value alloc]);
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
];
/**
* Takes a set of functions and returns a fn that is the juxtaposition
* of those fns.  The returned fn takes a variable number of args, and
* returns a vector containing the result of applying each fn to the
* args (left-to-right).
* ((juxt a b c) x) => [(a x) (b x) (c x)]
*/
cljm_DOT_core_SLASH_juxt = [[CLJMVar alloc] initWithValue:(function() {
var juxt = null;
var juxt__1 = ^id(id f) {
return (function() {
var G__7067 = null;
var G__7067__0 = ^id() {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_vector.value)(((id (^)()) f.value)(), nil);
};
var G__7067__1 = ^id(id x) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_vector.value)(((id (^)(id )) f.value)(x), nil);
};
var G__7067__2 = ^id(id x, id y) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_vector.value)(((id (^)(id , id )) f.value)(x, y), nil);
};
var G__7067__3 = ^id(id x, id y, id z) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_vector.value)(((id (^)(id , id , id )) f.value)(x, y, z), nil);
};
var G__7067__4 = ^id(id cljm__varargs, id x, id y, id z, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_vector.value)(((id (^)(id , id , id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(f, x, y, z, args, nil), nil);
};
G__7067 = function(x, y, z, var_args){
var args = var_args;
switch(arguments.length){
case 0:
return G__7067__0.call(this);
case 1:
return G__7067__1.call(this,x);
case 2:
return G__7067__2.call(this,x, y);
case 3:
return G__7067__3.call(this,x, y, z);
default:
return G__7067__4.cljm$lang$arity$variadic(x, y, z, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
G__7067.cljm$lang$maxFixedArity = 3;
G__7067.cljm$lang$applyTo = G__7067__4.cljm$lang$applyTo;
return G__7067;
})()
};
var juxt__2 = ^id(id f, id g) {
return (function() {
var G__7068 = null;
var G__7068__0 = ^id() {
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_vector.value)(((id (^)()) f.value)(), ((id (^)()) g.value)(), nil);
};
var G__7068__1 = ^id(id x) {
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_vector.value)(((id (^)(id )) f.value)(x), ((id (^)(id )) g.value)(x), nil);
};
var G__7068__2 = ^id(id x, id y) {
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_vector.value)(((id (^)(id , id )) f.value)(x, y), ((id (^)(id , id )) g.value)(x, y), nil);
};
var G__7068__3 = ^id(id x, id y, id z) {
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_vector.value)(((id (^)(id , id , id )) f.value)(x, y, z), ((id (^)(id , id , id )) g.value)(x, y, z), nil);
};
var G__7068__4 = ^id(id cljm__varargs, id x, id y, id z, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_vector.value)(((id (^)(id , id , id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(f, x, y, z, args, nil), ((id (^)(id , id , id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(g, x, y, z, args, nil), nil);
};
G__7068 = function(x, y, z, var_args){
var args = var_args;
switch(arguments.length){
case 0:
return G__7068__0.call(this);
case 1:
return G__7068__1.call(this,x);
case 2:
return G__7068__2.call(this,x, y);
case 3:
return G__7068__3.call(this,x, y, z);
default:
return G__7068__4.cljm$lang$arity$variadic(x, y, z, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
G__7068.cljm$lang$maxFixedArity = 3;
G__7068.cljm$lang$applyTo = G__7068__4.cljm$lang$applyTo;
return G__7068;
})()
};
var juxt__3 = ^id(id f, id g, id h) {
return (function() {
var G__7069 = null;
var G__7069__0 = ^id() {
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_vector.value)(((id (^)()) f.value)(), ((id (^)()) g.value)(), ((id (^)()) h.value)(), nil);
};
var G__7069__1 = ^id(id x) {
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_vector.value)(((id (^)(id )) f.value)(x), ((id (^)(id )) g.value)(x), ((id (^)(id )) h.value)(x), nil);
};
var G__7069__2 = ^id(id x, id y) {
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_vector.value)(((id (^)(id , id )) f.value)(x, y), ((id (^)(id , id )) g.value)(x, y), ((id (^)(id , id )) h.value)(x, y), nil);
};
var G__7069__3 = ^id(id x, id y, id z) {
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_vector.value)(((id (^)(id , id , id )) f.value)(x, y, z), ((id (^)(id , id , id )) g.value)(x, y, z), ((id (^)(id , id , id )) h.value)(x, y, z), nil);
};
var G__7069__4 = ^id(id cljm__varargs, id x, id y, id z, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_vector.value)(((id (^)(id , id , id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(f, x, y, z, args, nil), ((id (^)(id , id , id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(g, x, y, z, args, nil), ((id (^)(id , id , id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(h, x, y, z, args, nil), nil);
};
G__7069 = function(x, y, z, var_args){
var args = var_args;
switch(arguments.length){
case 0:
return G__7069__0.call(this);
case 1:
return G__7069__1.call(this,x);
case 2:
return G__7069__2.call(this,x, y);
case 3:
return G__7069__3.call(this,x, y, z);
default:
return G__7069__4.cljm$lang$arity$variadic(x, y, z, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
G__7069.cljm$lang$maxFixedArity = 3;
G__7069.cljm$lang$applyTo = G__7069__4.cljm$lang$applyTo;
return G__7069;
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
id fs__7066 = ((id (^)(id , id , id , id , ...)) cljm_DOT_core_SLASH_list_STAR_.value)(f, g, h, fs, nil);
return (function() {
var G__7070 = null;
var G__7070__0 = ^id() {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(^id(id p1__7047_SHARP_, id p2__7048_SHARP_) {
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_conj.value)(p1__7047_SHARP_, ((id (^)()) p2__7048_SHARP_.value)(), nil);
}, @[], fs__7066);
};
var G__7070__1 = ^id(id x) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(^id(id p1__7049_SHARP_, id p2__7050_SHARP_) {
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_conj.value)(p1__7049_SHARP_, ((id (^)(id )) p2__7050_SHARP_.value)(x), nil);
}, @[], fs__7066);
};
var G__7070__2 = ^id(id x, id y) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(^id(id p1__7051_SHARP_, id p2__7052_SHARP_) {
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_conj.value)(p1__7051_SHARP_, ((id (^)(id , id )) p2__7052_SHARP_.value)(x, y), nil);
}, @[], fs__7066);
};
var G__7070__3 = ^id(id x, id y, id z) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(^id(id p1__7053_SHARP_, id p2__7054_SHARP_) {
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_conj.value)(p1__7053_SHARP_, ((id (^)(id , id , id )) p2__7054_SHARP_.value)(x, y, z), nil);
}, @[], fs__7066);
};
var G__7070__4 = ^id(id cljm__varargs, id x, id y, id z, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(^id(id p1__7055_SHARP_, id p2__7056_SHARP_) {
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_conj.value)(p1__7055_SHARP_, ((id (^)(id , id , id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(p2__7056_SHARP_, x, y, z, args, nil), nil);
}, @[], fs__7066);
};
G__7070 = function(x, y, z, var_args){
var args = var_args;
switch(arguments.length){
case 0:
return G__7070__0.call(this);
case 1:
return G__7070__1.call(this,x);
case 2:
return G__7070__2.call(this,x, y);
case 3:
return G__7070__3.call(this,x, y, z);
default:
return G__7070__4.cljm$lang$arity$variadic(x, y, z, cljm.core.array_seq(arguments, 3));
}
throw('Invalid arity: ' + arguments.length);
};
G__7070.cljm$lang$maxFixedArity = 3;
G__7070.cljm$lang$applyTo = G__7070__4.cljm$lang$applyTo;
return G__7070;
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
];
/**
* When lazy sequences are produced via functions that have side
* effects, any effects other than those needed to produce the first
* element in the seq do not occur until the seq is consumed. dorun can
* be used to force any effects. Walks through the successive nexts of
* the seq, does not retain the head and returns nil.
*/
cljm_DOT_core_SLASH_dorun = [[CLJMVar alloc] initWithValue:(function() {
var dorun = null;
var dorun__1 = ^id(id coll) {
while(YES) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(coll))) {
{
id G__7073 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(coll);
coll = G__7073;
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
if(cljm_truthy({id and__3822__auto____7072 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(coll);
if(cljm_truthy(and__3822__auto____7072)) {
return (n > @0);

} else {
return and__3822__auto____7072;

}
})) {
{
id G__7074 = (n - @1);
id G__7075 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(coll);
n = G__7074;
coll = G__7075;
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
];
/**
* When lazy sequences are produced via functions that have side
* effects, any effects other than those needed to produce the first
* element in the seq do not occur until the seq is consumed. doall can
* be used to force any effects. Walks through the successive nexts of
* the seq, retains the head and returns it, thus causing the entire
* seq to reside in memory at one time.
*/
cljm_DOT_core_SLASH_doall = [[CLJMVar alloc] initWithValue:(function() {
var doall = null;
var doall__1 = ^id(id coll) {
((id (^)(id )) cljm_DOT_core_SLASH_dorun.value)(coll);
return coll;
};
var doall__2 = ^id(id n, id coll) {
((id (^)(id , id )) cljm_DOT_core_SLASH_dorun.value)(n, coll);
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
];
cljm_DOT_core_SLASH_regexp_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id o) {
return o instanceof RegExp;
}];
/**
* Returns the result of (re-find re s) if re fully matches s.
*/
cljm_DOT_core_SLASH_re_matches = [[CLJMVar alloc] initWithValue:^id(id re, id s) {
id matches__7077 = [re execs];
if(cljm_truthy(((id (^)(id , id , ...)) cljm_DOT_core_SLASH__EQ_.value)(((id (^)(id )) cljm_DOT_core_SLASH_first.value)(matches__7077), s, nil))) {
if(cljm_truthy(([((id (^)(id )) cljm_DOT_core_SLASH_count.value)(matches__7077) isEqual:@1]))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(matches__7077);

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH_vec.value)(matches__7077);

}

} else {
return nil;

}
}];
/**
* Returns the first regex match, if any, of s to re, using
* re.exec(s). Returns a vector, containing first the matching
* substring, then any capturing groups if the regular expression contains
* capturing groups.
*/
cljm_DOT_core_SLASH_re_find = [[CLJMVar alloc] initWithValue:^id(id re, id s) {
id matches__7079 = [re execs];
if(cljm_truthy((matches__7079 == nil))) {
return nil;

} else {
if(cljm_truthy(([((id (^)(id )) cljm_DOT_core_SLASH_count.value)(matches__7079) isEqual:@1]))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(matches__7079);

} else {
return ((id (^)(id )) cljm_DOT_core_SLASH_vec.value)(matches__7079);

}

}
}];
/**
* Returns a lazy sequence of successive matches of re in s.
*/
cljm_DOT_core_SLASH_re_seq = [[CLJMVar alloc] initWithValue:^id(id re, id s) {
id match_data__7084 = ((id (^)(id , id )) cljm_DOT_core_SLASH_re_find.value)(re, s);
id match_idx__7085 = [s searchre];
id match_str__7086 = (cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_coll_QMARK_.value)(match_data__7084))) ?((id (^)(id )) cljm_DOT_core_SLASH_first.value)(match_data__7084):match_data__7084;
id post_match__7087 = ((id (^)(id , id )) cljm_DOT_core_SLASH_subs.value)(s, (match_idx__7085 + ((id (^)(id )) cljm_DOT_core_SLASH_count.value)(match_str__7086)));
if(cljm_truthy(match_data__7084)) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];

} else {
return nil;

}
}];
/**
* Returns an instance of RegExp which has compiled the provided string.
*/
cljm_DOT_core_SLASH_re_pattern = [[CLJMVar alloc] initWithValue:^id(id s) {
id vec__7094__7095 = ((id (^)(id , id )) cljm_DOT_core_SLASH_re_find.value)(/^(?:\(\?([idmsux]*)\))?(.*)/, s);
id ___7096 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_nth.value)(vec__7094__7095, @0, nil);
id flags__7097 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_nth.value)(vec__7094__7095, @1, nil);
id pattern__7098 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_nth.value)(vec__7094__7095, @2, nil);
return [RegExp.value alloc];
}];
cljm_DOT_core_SLASH_pr_sequential = [[CLJMVar alloc] initWithValue:^id(id print_one, id begin, id sep, id end, id opts, id coll) {
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_concat.value)(@[ begin ], ((id (^)(id )) cljm_DOT_core_SLASH_flatten1.value)(((id (^)(id , id )) cljm_DOT_core_SLASH_interpose.value)(@[ sep ], ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_map.value)(^id(id p1__7088_SHARP_) {
return ((id (^)(id , id )) print_one.value)(p1__7088_SHARP_, opts);
}, coll, nil))), @[ end ], nil);
}];
cljm_DOT_core_SLASH_string_print = [[CLJMVar alloc] initWithValue:^id(id x) {
((id (^)(id )) cljm_DOT_core_SLASH__STAR_print_fn_STAR_.value)(x);
return nil;
}];
cljm_DOT_core_SLASH_flush = [[CLJMVar alloc] initWithValue:^id() {
return nil;
}];
cljm_DOT_core_SLASH_pr_seq = [[CLJMVar alloc] initWithValue:^id(id obj, id opts) {
if(cljm_truthy((obj == nil))) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"nil", nil);

} else {
if(cljm_truthy(((void *) 0) === obj))) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"#<undefined>", nil);

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_concat.value)((cljm_truthy({id and__3822__auto____7108 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(opts, cljm_keyword(@":meta"), nil);
if(cljm_truthy(and__3822__auto____7108)) {
id and__3822__auto____7112 = {id G__7109__7110 = obj;
if(cljm_truthy(G__7109__7110)) {
if(cljm_truthy({id or__3824__auto____7111 = (G__7109__7110.cljm$lang$protocol_mask$partition0$ & @131072);
if(cljm_truthy(or__3824__auto____7111)) {
return or__3824__auto____7111;

} else {
return G__7109__7110.cljm$core$IMeta$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__7109__7110.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IMeta.value, G__7109__7110);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IMeta.value, G__7109__7110);

}
};
if(cljm_truthy(and__3822__auto____7112)) {
return ((id (^)(id )) cljm_DOT_core_SLASH_meta.value)(obj);

} else {
return and__3822__auto____7112;

}

} else {
return and__3822__auto____7108;

}
})) ?((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_concat.value)(@[ @"^" ], ((id (^)(id , id )) pr_seq.value)(((id (^)(id )) cljm_DOT_core_SLASH_meta.value)(obj), opts), @[ @" " ], nil):nil, (cljm_truthy({id and__3822__auto____7113 = ((id (^)(id )) cljm_DOT_core_SLASH_not.value)((obj == nil));
if(cljm_truthy(and__3822__auto____7113)) {
return obj.cljs$lang$type;

} else {
return and__3822__auto____7113;

}
})) ?[obj cljsobj lang]:(cljm_truthy({id G__7114__7115 = obj;
if(cljm_truthy(G__7114__7115)) {
if(cljm_truthy({id or__3824__auto____7116 = (G__7114__7115.cljm$lang$protocol_mask$partition0$ & @536870912);
if(cljm_truthy(or__3824__auto____7116)) {
return or__3824__auto____7116;

} else {
return G__7114__7115.cljm$core$IPrintable$;

}
})) {
return @YES;

} else {
if(cljm_truthy((!G__7114__7115.cljm$lang$protocol_mask$partition0$))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IPrintable.value, G__7114__7115);

} else {
return @NO;

}

}

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_type_satisfies_.value)(cljm_DOT_core_SLASH_IPrintable.value, G__7114__7115);

}
})) ?((id (^)(id , id )) cljm_DOT_core_SLASH__pr_seq.value)(obj, opts):(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_regexp_QMARK_.value)(obj))) ?((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_list.value)(@"#\"", obj.source, @"\"", nil):(cljm_truthy(cljm_keyword(@":else"))) ?((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_list.value)(@"#<", [@[ obj ] componentsSeperatedByString:@""], @">", nil):nil, nil);

} else {
return nil;

}

}

}
}];
cljm_DOT_core_SLASH_pr_sb = [[CLJMVar alloc] initWithValue:^id(id objs, id opts) {
id sb__7136 = [gstring_SLASH_StringBuffer.value alloc];
id G__7137__7138 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(((id (^)(id , id )) cljm_DOT_core_SLASH_pr_seq.value)(((id (^)(id )) cljm_DOT_core_SLASH_first.value)(objs), opts));
if(cljm_truthy(G__7137__7138)) {
id string__7139 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(G__7137__7138);
id G__7137__7140 = G__7137__7138;
while(YES) {
[sb__7136 appendstring__7139];
id temp__3974__auto____7141 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(G__7137__7140);
if(cljm_truthy(temp__3974__auto____7141)) {
id G__7137__7142 = temp__3974__auto____7141;
{
id G__7155 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(G__7137__7142);
id G__7156 = G__7137__7142;
string__7139 = G__7155;
G__7137__7140 = G__7156;
continue;
}

} else {

}
break;
}

} else {

}
id G__7143__7144 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(((id (^)(id )) cljm_DOT_core_SLASH_next.value)(objs));
if(cljm_truthy(G__7143__7144)) {
id obj__7145 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(G__7143__7144);
id G__7143__7146 = G__7143__7144;
while(YES) {
[sb__7136 append@" "];
id G__7147__7148 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(((id (^)(id , id )) cljm_DOT_core_SLASH_pr_seq.value)(obj__7145, opts));
if(cljm_truthy(G__7147__7148)) {
id string__7149 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(G__7147__7148);
id G__7147__7150 = G__7147__7148;
while(YES) {
[sb__7136 appendstring__7149];
id temp__3974__auto____7151 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(G__7147__7150);
if(cljm_truthy(temp__3974__auto____7151)) {
id G__7147__7152 = temp__3974__auto____7151;
{
id G__7157 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(G__7147__7152);
id G__7158 = G__7147__7152;
string__7149 = G__7157;
G__7147__7150 = G__7158;
continue;
}

} else {

}
break;
}

} else {

}
id temp__3974__auto____7153 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(G__7143__7146);
if(cljm_truthy(temp__3974__auto____7153)) {
id G__7143__7154 = temp__3974__auto____7153;
{
id G__7159 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(G__7143__7154);
id G__7160 = G__7143__7154;
obj__7145 = G__7159;
G__7143__7146 = G__7160;
continue;
}

} else {

}
break;
}

} else {

}
return sb__7136;
}];
/**
* Prints a sequence of objects to a string, observing all the
* options given in opts
*/
cljm_DOT_core_SLASH_pr_str_with_opts = [[CLJMVar alloc] initWithValue:^id(id objs, id opts) {
return [@[ ((id (^)(id , id )) cljm_DOT_core_SLASH_pr_sb.value)(objs, opts) ] componentsSeperatedByString:@""];
}];
/**
* Same as pr-str-with-opts followed by (newline)
*/
cljm_DOT_core_SLASH_prn_str_with_opts = [[CLJMVar alloc] initWithValue:^id(id objs, id opts) {
id sb__7162 = ((id (^)(id , id )) cljm_DOT_core_SLASH_pr_sb.value)(objs, opts);
[sb__7162 append@"\n"];
return [@[ sb__7162 ] componentsSeperatedByString:@""];
}];
/**
* Prints a sequence of objects using string-print, observing all
* the options given in opts
*/
cljm_DOT_core_SLASH_pr_with_opts = [[CLJMVar alloc] initWithValue:^id(id objs, id opts) {
id G__7181__7182 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(((id (^)(id , id )) cljm_DOT_core_SLASH_pr_seq.value)(((id (^)(id )) cljm_DOT_core_SLASH_first.value)(objs), opts));
if(cljm_truthy(G__7181__7182)) {
id string__7183 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(G__7181__7182);
id G__7181__7184 = G__7181__7182;
while(YES) {
((id (^)(id )) cljm_DOT_core_SLASH_string_print.value)(string__7183);
id temp__3974__auto____7185 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(G__7181__7184);
if(cljm_truthy(temp__3974__auto____7185)) {
id G__7181__7186 = temp__3974__auto____7185;
{
id G__7199 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(G__7181__7186);
id G__7200 = G__7181__7186;
string__7183 = G__7199;
G__7181__7184 = G__7200;
continue;
}

} else {

}
break;
}

} else {

}
id G__7187__7188 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(((id (^)(id )) cljm_DOT_core_SLASH_next.value)(objs));
if(cljm_truthy(G__7187__7188)) {
id obj__7189 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(G__7187__7188);
id G__7187__7190 = G__7187__7188;
while(YES) {
((id (^)(id )) cljm_DOT_core_SLASH_string_print.value)(@" ");
id G__7191__7192 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(((id (^)(id , id )) cljm_DOT_core_SLASH_pr_seq.value)(obj__7189, opts));
if(cljm_truthy(G__7191__7192)) {
id string__7193 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(G__7191__7192);
id G__7191__7194 = G__7191__7192;
while(YES) {
((id (^)(id )) cljm_DOT_core_SLASH_string_print.value)(string__7193);
id temp__3974__auto____7195 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(G__7191__7194);
if(cljm_truthy(temp__3974__auto____7195)) {
id G__7191__7196 = temp__3974__auto____7195;
{
id G__7201 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(G__7191__7196);
id G__7202 = G__7191__7196;
string__7193 = G__7201;
G__7191__7194 = G__7202;
continue;
}

} else {

}
break;
}

} else {

}
id temp__3974__auto____7197 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(G__7187__7190);
if(cljm_truthy(temp__3974__auto____7197)) {
id G__7187__7198 = temp__3974__auto____7197;
{
id G__7203 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(G__7187__7198);
id G__7204 = G__7187__7198;
obj__7189 = G__7203;
G__7187__7190 = G__7204;
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
}];
cljm_DOT_core_SLASH_newline = [[CLJMVar alloc] initWithValue:^id(id opts) {
((id (^)(id )) cljm_DOT_core_SLASH_string_print.value)(@"\n");
if(cljm_truthy(((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(opts, cljm_keyword(@":flush-on-newline"), nil))) {
return ((id (^)()) cljm_DOT_core_SLASH_flush.value)();

} else {
return nil;

}
}];
cljm_DOT_core_SLASH__STAR_flush_on_newline_STAR_ = [[CLJMVar alloc] initWithValue:@YES];
cljm_DOT_core_SLASH__STAR_print_readably_STAR_ = [[CLJMVar alloc] initWithValue:@YES];
cljm_DOT_core_SLASH__STAR_print_meta_STAR_ = [[CLJMVar alloc] initWithValue:@NO];
cljm_DOT_core_SLASH__STAR_print_dup_STAR_ = [[CLJMVar alloc] initWithValue:@NO];
cljm_DOT_core_SLASH_pr_opts = [[CLJMVar alloc] initWithValue:^id() {
return @{ cljm_keyword(@":flush-on-newline"): cljm_DOT_core_SLASH__STAR_flush_on_newline_STAR_.value, cljm_keyword(@":readably"): cljm_DOT_core_SLASH__STAR_print_readably_STAR_.value, cljm_keyword(@":meta"): cljm_DOT_core_SLASH__STAR_print_meta_STAR_.value, cljm_keyword(@":dup"): cljm_DOT_core_SLASH__STAR_print_dup_STAR_.value };
}];
/**
* pr to a string, returning it. Fundamental entrypoint to IPrintable.
*/
cljm_DOT_core_SLASH_pr_str = [[CLJMVar alloc] initWithValue:^id(id cljm__varargs, ...) {
NSMutableArray *objs = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[objs addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id , id )) cljm_DOT_core_SLASH_pr_str_with_opts.value)(objs, ((id (^)()) cljm_DOT_core_SLASH_pr_opts.value)());
}];
/**
* Same as pr-str followed by (newline)
*/
cljm_DOT_core_SLASH_prn_str = [[CLJMVar alloc] initWithValue:^id(id cljm__varargs, ...) {
NSMutableArray *objs = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[objs addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id , id )) cljm_DOT_core_SLASH_prn_str_with_opts.value)(objs, ((id (^)()) cljm_DOT_core_SLASH_pr_opts.value)());
}];
/**
* Prints the object(s) using string-print.  Prints the
* object(s), separated by spaces if there is more than one.
* By default, pr and prn print in a way that objects can be
* read by the reader
*/
cljm_DOT_core_SLASH_pr = [[CLJMVar alloc] initWithValue:^id(id cljm__varargs, ...) {
NSMutableArray *objs = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[objs addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id , id )) cljm_DOT_core_SLASH_pr_with_opts.value)(objs, ((id (^)()) cljm_DOT_core_SLASH_pr_opts.value)());
}];
/**
* Prints the object(s) using string-print.
* print and println produce output for human consumption.
*/
cljm_DOT_core_SLASH_print = [[CLJMVar alloc] initWithValue:^id(id cljm__varargs, ...) {
NSMutableArray *objs = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[objs addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id , id )) cljm_DOT_core_SLASH_pr_with_opts.value)(objs, ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_assoc.value)(((id (^)()) cljm_DOT_core_SLASH_pr_opts.value)(), cljm_keyword(@":readably"), @NO, nil));
}];
/**
* print to a string, returning it
*/
cljm_DOT_core_SLASH_print_str = [[CLJMVar alloc] initWithValue:^id(id cljm__varargs, ...) {
NSMutableArray *objs = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[objs addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id , id )) cljm_DOT_core_SLASH_pr_str_with_opts.value)(objs, ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_assoc.value)(((id (^)()) cljm_DOT_core_SLASH_pr_opts.value)(), cljm_keyword(@":readably"), @NO, nil));
}];
/**
* Same as print followed by (newline)
*/
cljm_DOT_core_SLASH_println = [[CLJMVar alloc] initWithValue:^id(id cljm__varargs, ...) {
NSMutableArray *objs = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[objs addObject:cljm__currentObject];
}
va_end(cljm__args);
((id (^)(id , id )) cljm_DOT_core_SLASH_pr_with_opts.value)(objs, ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_assoc.value)(((id (^)()) cljm_DOT_core_SLASH_pr_opts.value)(), cljm_keyword(@":readably"), @NO, nil));
return ((id (^)(id )) cljm_DOT_core_SLASH_newline.value)(((id (^)()) cljm_DOT_core_SLASH_pr_opts.value)());
}];
/**
* println to a string, returning it
*/
cljm_DOT_core_SLASH_println_str = [[CLJMVar alloc] initWithValue:^id(id cljm__varargs, ...) {
NSMutableArray *objs = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[objs addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id , id )) cljm_DOT_core_SLASH_prn_str_with_opts.value)(objs, ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_assoc.value)(((id (^)()) cljm_DOT_core_SLASH_pr_opts.value)(), cljm_keyword(@":readably"), @NO, nil));
}];
/**
* Same as pr followed by (newline).
*/
cljm_DOT_core_SLASH_prn = [[CLJMVar alloc] initWithValue:^id(id cljm__varargs, ...) {
NSMutableArray *objs = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[objs addObject:cljm__currentObject];
}
va_end(cljm__args);
((id (^)(id , id )) cljm_DOT_core_SLASH_pr_with_opts.value)(objs, ((id (^)()) cljm_DOT_core_SLASH_pr_opts.value)());
return ((id (^)(id )) cljm_DOT_core_SLASH_newline.value)(((id (^)()) cljm_DOT_core_SLASH_pr_opts.value)());
}];
/**
* Prints formatted output, as per format
*/
cljm_DOT_core_SLASH_printf = [[CLJMVar alloc] initWithValue:^id(id cljm__varargs, id fmt, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_print.value)(((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(cljm_DOT_core_SLASH_format.value, fmt, args, nil), nil);
}];
cljm_DOT_core_SLASH_HashMap.value.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_HashMap.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
id pr_pair__7205 = ^id(id keyval) {
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(cljm_DOT_core_SLASH_pr_seq.value, @"", @" ", @"", opts, keyval);
};
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(pr_pair__7205, @"{", @", ", @"}", opts, coll);
};
(cljm_DOT_core_SLASH_IPrintable.value[@"number"] = @YES);
(cljm_DOT_core_SLASH__pr_seq.value[@"number"] = ^id(id n, id opts) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)([@[ n ] componentsSeperatedByString:@""], nil);
});
cljm_DOT_core_SLASH_IndexedSeq.value.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_IndexedSeq.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(cljm_DOT_core_SLASH_pr_seq.value, @"(", @" ", @")", opts, coll);
};
cljm_DOT_core_SLASH_Subvec.value.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_Subvec.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(cljm_DOT_core_SLASH_pr_seq.value, @"[", @" ", @"]", opts, coll);
};
cljm_DOT_core_SLASH_ChunkedCons.value.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_ChunkedCons.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(cljm_DOT_core_SLASH_pr_seq.value, @"(", @" ", @")", opts, coll);
};
cljm_DOT_core_SLASH_PersistentTreeMap.value.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_PersistentTreeMap.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
id pr_pair__7206 = ^id(id keyval) {
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(cljm_DOT_core_SLASH_pr_seq.value, @"", @" ", @"", opts, keyval);
};
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(pr_pair__7206, @"{", @", ", @"}", opts, coll);
};
cljm_DOT_core_SLASH_PersistentArrayMap.value.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_PersistentArrayMap.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
id pr_pair__7207 = ^id(id keyval) {
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(cljm_DOT_core_SLASH_pr_seq.value, @"", @" ", @"", opts, keyval);
};
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(pr_pair__7207, @"{", @", ", @"}", opts, coll);
};
cljm_DOT_core_SLASH_PersistentQueue.value.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_PersistentQueue.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(cljm_DOT_core_SLASH_pr_seq.value, @"#queue [", @" ", @"]", opts, ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(coll));
};
cljm_DOT_core_SLASH_LazySeq.value.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_LazySeq.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(cljm_DOT_core_SLASH_pr_seq.value, @"(", @" ", @")", opts, coll);
};
cljm_DOT_core_SLASH_RSeq.value.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_RSeq.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(cljm_DOT_core_SLASH_pr_seq.value, @"(", @" ", @")", opts, coll);
};
cljm_DOT_core_SLASH_PersistentTreeSet.value.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_PersistentTreeSet.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(cljm_DOT_core_SLASH_pr_seq.value, @"#{", @" ", @"}", opts, coll);
};
(cljm_DOT_core_SLASH_IPrintable.value[@"boolean"] = @YES);
(cljm_DOT_core_SLASH__pr_seq.value[@"boolean"] = ^id(id bool, id opts) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)([@[ bool ] componentsSeperatedByString:@""], nil);
});
(cljm_DOT_core_SLASH_IPrintable.value[@"string"] = @YES);
(cljm_DOT_core_SLASH__pr_seq.value[@"string"] = ^id(id obj, id opts) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_keyword_QMARK_.value)(obj))) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)([@[ @":", {id temp__3974__auto____7208 = ((id (^)(id )) cljm_DOT_core_SLASH_namespace.value)(obj);
if(cljm_truthy(temp__3974__auto____7208)) {
id nspc__7209 = temp__3974__auto____7208;
return [@[ nspc__7209, @"/" ] componentsSeperatedByString:@""];

} else {
return nil;

}
}, ((id (^)(id )) cljm_DOT_core_SLASH_name.value)(obj) ] componentsSeperatedByString:@""], nil);

} else {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_symbol_QMARK_.value)(obj))) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)([@[ {id temp__3974__auto____7210 = ((id (^)(id )) cljm_DOT_core_SLASH_namespace.value)(obj);
if(cljm_truthy(temp__3974__auto____7210)) {
id nspc__7211 = temp__3974__auto____7210;
return [@[ nspc__7211, @"/" ] componentsSeperatedByString:@""];

} else {
return nil;

}
}, ((id (^)(id )) cljm_DOT_core_SLASH_name.value)(obj) ] componentsSeperatedByString:@""], nil);

} else {
if(cljm_truthy(cljm_keyword(@":else"))) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)((cljm_truthy(((id (^)(id )) .value)(opts))) ?((id (^)(id )) goog_SLASH_string_DOT_quote.value)(obj):obj, nil);

} else {
return nil;

}

}

}
});
cljm_DOT_core_SLASH_NodeSeq.value.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_NodeSeq.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(cljm_DOT_core_SLASH_pr_seq.value, @"(", @" ", @")", opts, coll);
};
cljm_DOT_core_SLASH_RedNode.value.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_RedNode.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(cljm_DOT_core_SLASH_pr_seq.value, @"[", @" ", @"]", opts, coll);
};
cljm_DOT_core_SLASH_ChunkedSeq.value.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_ChunkedSeq.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(cljm_DOT_core_SLASH_pr_seq.value, @"(", @" ", @")", opts, coll);
};
cljm_DOT_core_SLASH_PersistentHashMap.value.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_PersistentHashMap.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
id pr_pair__7212 = ^id(id keyval) {
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(cljm_DOT_core_SLASH_pr_seq.value, @"", @" ", @"", opts, keyval);
};
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(pr_pair__7212, @"{", @", ", @"}", opts, coll);
};
cljm_DOT_core_SLASH_Vector.value.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_Vector.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(cljm_DOT_core_SLASH_pr_seq.value, @"[", @" ", @"]", opts, coll);
};
cljm_DOT_core_SLASH_PersistentHashSet.value.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_PersistentHashSet.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(cljm_DOT_core_SLASH_pr_seq.value, @"#{", @" ", @"}", opts, coll);
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(cljm_DOT_core_SLASH_pr_seq.value, @"[", @" ", @"]", opts, coll);
};
cljm_DOT_core_SLASH_List.value.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_List.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(cljm_DOT_core_SLASH_pr_seq.value, @"(", @" ", @")", opts, coll);
};
(cljm_DOT_core_SLASH_IPrintable.value[@"array"] = @YES);
(cljm_DOT_core_SLASH__pr_seq.value[@"array"] = ^id(id a, id opts) {
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(cljm_DOT_core_SLASH_pr_seq.value, @"#<Array [", @", ", @"]>", opts, a);
});
(cljm_DOT_core_SLASH_IPrintable.value[@"function"] = @YES);
(cljm_DOT_core_SLASH__pr_seq.value[@"function"] = ^id(id this$) {
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_list.value)(@"#<", [@[ this$ ] componentsSeperatedByString:@""], @">", nil);
});
cljm_DOT_core_SLASH_EmptyList.value.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_EmptyList.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"()", nil);
};
cljm_DOT_core_SLASH_BlackNode.value.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_BlackNode.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(cljm_DOT_core_SLASH_pr_seq.value, @"[", @" ", @"]", opts, coll);
};
Date.value.prototype.cljm$core$IPrintable$ = @YES;
Date.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id d, id _) {
id normalize__7214 = ^id(id n, id len) {
id ns__7213 = [@[ n ] componentsSeperatedByString:@""];
while(YES) {
if(cljm_truthy((((id (^)(id )) cljm_DOT_core_SLASH_count.value)(ns__7213) < len))) {
{
id G__7216 = [@[ @"0", ns__7213 ] componentsSeperatedByString:@""];
ns__7213 = G__7216;
continue;
}

} else {
return ns__7213;

}
break;
}
};
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)([@[ @"#inst \"", [d getUTCFullYear], @"-", ((id (^)(id , id )) normalize__7214.value)(([d getUTCMonth] + @1), @2), @"-", ((id (^)(id , id )) normalize__7214.value)([d getUTCDate], @2), @"T", ((id (^)(id , id )) normalize__7214.value)([d getUTCHours], @2), @":", ((id (^)(id , id )) normalize__7214.value)([d getUTCMinutes], @2), @":", ((id (^)(id , id )) normalize__7214.value)([d getUTCSeconds], @2), @".", ((id (^)(id , id )) normalize__7214.value)([d getUTCMilliseconds], @3), @"-", @"00:00\"" ] componentsSeperatedByString:@""], nil);
};
cljm_DOT_core_SLASH_Cons.value.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_Cons.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(cljm_DOT_core_SLASH_pr_seq.value, @"(", @" ", @")", opts, coll);
};
cljm_DOT_core_SLASH_Range.value.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_Range.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(cljm_DOT_core_SLASH_pr_seq.value, @"(", @" ", @")", opts, coll);
};
cljm_DOT_core_SLASH_ArrayNodeSeq.value.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_ArrayNodeSeq.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(cljm_DOT_core_SLASH_pr_seq.value, @"(", @" ", @")", opts, coll);
};
cljm_DOT_core_SLASH_ObjMap.value.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_ObjMap.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
id pr_pair__7215 = ^id(id keyval) {
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(cljm_DOT_core_SLASH_pr_seq.value, @"", @" ", @"", opts, keyval);
};
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(pr_pair__7215, @"{", @", ", @"}", opts, coll);
};
cljm_DOT_core_SLASH_PersistentTreeMapSeq.value.prototype.cljm$core$IPrintable$ = @YES;
cljm_DOT_core_SLASH_PersistentTreeMapSeq.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id coll, id opts) {
return ((id (^)(id , id , id , id , id , id )) cljm_DOT_core_SLASH_pr_sequential.value)(cljm_DOT_core_SLASH_pr_seq.value, @"(", @" ", @")", opts, coll);
};
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$IComparable$ = @YES;
cljm_DOT_core_SLASH_PersistentVector.value.prototype.cljm$core$IComparable$_compare$arity$2 = ^id(id x, id y) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_compare_indexed.value)(x, y);
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
cljm_DOT_core_SLASH_Atom.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_Atom.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/Atom", nil);
};
cljm_DOT_core_SLASH_Atom.value.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id this$) {
var this__7217 = this;
return ((id (^)(id )) goog_SLASH_getUid.value)(this$);
};
cljm_DOT_core_SLASH_Atom.value.prototype.cljm$core$IWatchable$_notify_watches$arity$3 = ^id(id this$, id oldval, id newval) {
var this__7218 = this;
id G__7219__7220 = ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(this__7218_DOT_watches);
if(cljm_truthy(G__7219__7220)) {
id G__7222__7224 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(G__7219__7220);
id vec__7223__7225 = G__7222__7224;
id key__7226 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_nth.value)(vec__7223__7225, @0, nil);
id f__7227 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_nth.value)(vec__7223__7225, @1, nil);
id G__7219__7228 = G__7219__7220;
id G__7222__7229 = G__7222__7224;
id G__7219__7230 = G__7219__7228;
while(YES) {
id vec__7231__7232 = G__7222__7229;
id key__7233 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_nth.value)(vec__7231__7232, @0, nil);
id f__7234 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_nth.value)(vec__7231__7232, @1, nil);
id G__7219__7235 = G__7219__7230;
((id (^)(id , id , id , id )) f__7234.value)(key__7233, this$, oldval, newval);
id temp__3974__auto____7236 = ((id (^)(id )) cljm_DOT_core_SLASH_next.value)(G__7219__7235);
if(cljm_truthy(temp__3974__auto____7236)) {
id G__7219__7237 = temp__3974__auto____7236;
{
id G__7244 = ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(G__7219__7237);
id G__7245 = G__7219__7237;
G__7222__7229 = G__7244;
G__7219__7230 = G__7245;
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
cljm_DOT_core_SLASH_Atom.value.prototype.cljm$core$IWatchable$_add_watch$arity$3 = ^id(id this$, id key, id f) {
var this__7238 = this;
return this$.watches = ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_assoc.value)(this__7238_DOT_watches, key, f, nil);
};
cljm_DOT_core_SLASH_Atom.value.prototype.cljm$core$IWatchable$_remove_watch$arity$2 = ^id(id this$, id key) {
var this__7239 = this;
return this$.watches = ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_dissoc.value)(this__7239_DOT_watches, key, nil);
};
cljm_DOT_core_SLASH_Atom.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id a, id opts) {
var this__7240 = this;
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_concat.value)(@[ @"#<Atom: " ], ((id (^)(id , id )) cljm_DOT_core_SLASH__pr_seq.value)(this__7240_DOT_state, opts), @">", nil);
};
cljm_DOT_core_SLASH_Atom.value.prototype.cljm$core$IMeta$_meta$arity$1 = ^id(id _) {
var this__7241 = this;
return this__7241_DOT_meta;
};
cljm_DOT_core_SLASH_Atom.value.prototype.cljm$core$IDeref$_deref$arity$1 = ^id(id _) {
var this__7242 = this;
return this__7242_DOT_state;
};
cljm_DOT_core_SLASH_Atom.value.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id o, id other) {
var this__7243 = this;
return ([o isEqual:other]);
};
cljm_DOT_core_SLASH_Atom.value;
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
cljm_DOT_core_SLASH_atom = [[CLJMVar alloc] initWithValue:(function() {
var atom = null;
var atom__1 = ^id(id x) {
return [cljm_DOT_core_SLASH_Atom.value alloc];
};
var atom__2 = ^id(id cljm__varargs, id x, ...) {
NSMutableArray *p__7246 = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[p__7246 addObject:cljm__currentObject];
}
va_end(cljm__args);
id map__7252__7253 = p__7246;
id map__7252__7254 = (cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_seq_QMARK_.value)(map__7252__7253))) ?((id (^)(id , id , ...)) cljm_DOT_core_SLASH_apply.value)(cljm_DOT_core_SLASH_hash_map.value, map__7252__7253, nil):map__7252__7253;
id validator__7255 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(map__7252__7254, cljm_keyword(@":validator"), nil);
id meta__7256 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(map__7252__7254, cljm_keyword(@":meta"), nil);
return [cljm_DOT_core_SLASH_Atom.value alloc];
};
atom = function(x, var_args){
var p__7246 = var_args;
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
];
/**
* Sets the value of atom to newval without regard for the
* current value. Returns newval.
*/
cljm_DOT_core_SLASH_reset_BANG_ = [[CLJMVar alloc] initWithValue:^id(id a, id new_value) {
id temp__3974__auto____7260 = a.validator;
if(cljm_truthy(temp__3974__auto____7260)) {
id validate__7261 = temp__3974__auto____7260;
if(cljm_truthy(((id (^)(id )) validate__7261.value)(new_value))) {

} else {
throw [Error.value alloc];

}

} else {

}
id old_value__7262 = a.state;
a.state = new_value;
((id (^)(id , id , id )) cljm_DOT_core_SLASH__notify_watches.value)(a, old_value__7262, new_value);
return new_value;
}];
/**
* Atomically swaps the value of atom to be:
* (apply f current-value-of-atom args). Note that f may be called
* multiple times, and thus should be free of side effects.  Returns
* the value that was swapped in.
*/
cljm_DOT_core_SLASH_swap_BANG_ = [[CLJMVar alloc] initWithValue:(function() {
var swap_BANG_ = null;
var swap_BANG___2 = ^id(id a, id f) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_reset_BANG_.value)(a, ((id (^)(id )) f.value)(a.state));
};
var swap_BANG___3 = ^id(id a, id f, id x) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_reset_BANG_.value)(a, ((id (^)(id , id )) f.value)(a.state, x));
};
var swap_BANG___4 = ^id(id a, id f, id x, id y) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_reset_BANG_.value)(a, ((id (^)(id , id , id )) f.value)(a.state, x, y));
};
var swap_BANG___5 = ^id(id a, id f, id x, id y, id z) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_reset_BANG_.value)(a, ((id (^)(id , id , id , id )) f.value)(a.state, x, y, z));
};
var swap_BANG___6 = ^id(id cljm__varargs, id a, id f, id x, id y, id z, ...) {
NSMutableArray *more = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[more addObject:cljm__currentObject];
}
va_end(cljm__args);
return ((id (^)(id , id )) cljm_DOT_core_SLASH_reset_BANG_.value)(a, ((id (^)(id , id , id , id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(f, a.state, x, y, z, more, nil));
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
];
/**
* Atomically sets the value of atom to newval if and only if the
* current value of the atom is identical to oldval. Returns true if
* set happened, else false.
*/
cljm_DOT_core_SLASH_compare_and_set_BANG_ = [[CLJMVar alloc] initWithValue:^id(id a, id oldval, id newval) {
if(cljm_truthy(((id (^)(id , id , ...)) cljm_DOT_core_SLASH__EQ_.value)(a.state, oldval, nil))) {
((id (^)(id , id )) cljm_DOT_core_SLASH_reset_BANG_.value)(a, newval);
return @YES;

} else {
return @NO;

}
}];
cljm_DOT_core_SLASH_deref = [[CLJMVar alloc] initWithValue:^id(id o) {
return ((id (^)(id )) cljm_DOT_core_SLASH__deref.value)(o);
}];
/**
* Sets the validator-fn for an atom. validator-fn must be nil or a
* side-effect-free fn of one argument, which will be passed the intended
* new state on any state change. If the new state is unacceptable, the
* validator-fn should return false or throw an Error. If the current state
* is not acceptable to the new validator, an Error will be thrown and the
* validator will not be changed.
*/
cljm_DOT_core_SLASH_set_validator_BANG_ = [[CLJMVar alloc] initWithValue:^id(id iref, id val) {
return iref.validator = val;
}];
/**
* Gets the validator-fn for a var/ref/agent/atom.
*/
cljm_DOT_core_SLASH_get_validator = [[CLJMVar alloc] initWithValue:^id(id iref) {
return iref.validator;
}];
/**
* Atomically sets the metadata for a namespace/var/ref/agent/atom to be:
* 
* (apply f its-current-meta args)
* 
* f must be free of side-effects
*/
cljm_DOT_core_SLASH_alter_meta_BANG_ = [[CLJMVar alloc] initWithValue:^id(id cljm__varargs, id iref, id f, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
return iref.meta = ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(f, iref.meta, args, nil);
}];
/**
* Atomically resets the metadata for an atom
*/
cljm_DOT_core_SLASH_reset_meta_BANG_ = [[CLJMVar alloc] initWithValue:^id(id iref, id m) {
return iref.meta = m;
}];
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
cljm_DOT_core_SLASH_add_watch = [[CLJMVar alloc] initWithValue:^id(id iref, id key, id f) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__add_watch.value)(iref, key, f);
}];
/**
* Alpha - subject to change.
* 
* Removes a watch (set by add-watch) from a reference
*/
cljm_DOT_core_SLASH_remove_watch = [[CLJMVar alloc] initWithValue:^id(id iref, id key) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH__remove_watch.value)(iref, key);
}];
cljm_DOT_core_SLASH_gensym_counter = [[CLJMVar alloc] initWithValue:nil];
/**
* Returns a new symbol with a unique name. If a prefix string is
* supplied, the name is prefix# where # is some unique number. If
* prefix is not supplied, the prefix is 'G__'.
*/
cljm_DOT_core_SLASH_gensym = [[CLJMVar alloc] initWithValue:(function() {
var gensym = null;
var gensym__0 = ^id() {
return ((id (^)(id )) gensym.value)(@"G__");
};
var gensym__1 = ^id(id prefix_string) {
if(cljm_truthy((cljm_DOT_core_SLASH_gensym_counter.value == nil))) {
cljm_DOT_core_SLASH_gensym_counter.value = ((id (^)(id , ...)) cljm_DOT_core_SLASH_atom.value)(@0, nil);

} else {

}
return ((id (^)(id )) cljm_DOT_core_SLASH_symbol.value)([@[ prefix_string, ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_swap_BANG_.value)(cljm_DOT_core_SLASH_gensym_counter.value, cljm_DOT_core_SLASH_inc.value, nil) ] componentsSeperatedByString:@""]);
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
];
cljm_DOT_core_SLASH_fixture1 = [[CLJMVar alloc] initWithValue:@1];
cljm_DOT_core_SLASH_fixture2 = [[CLJMVar alloc] initWithValue:@2];

/**
* @constructor
*/
cljm_DOT_core_SLASH_Delay = (function (state, f){
this.state = state;
this.f = f;
this.cljm$lang$protocol_mask$partition1$ = 0;
this.cljm$lang$protocol_mask$partition0$ = 1073774592;
})
cljm_DOT_core_SLASH_Delay.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_Delay.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/Delay", nil);
};
cljm_DOT_core_SLASH_Delay.value.prototype.cljm$core$IPending$_realized_QMARK_$arity$1 = ^id(id d) {
var this__7263 = this;
return ((id (^)(id )) .value)(((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(this__7263_DOT_state));
};
cljm_DOT_core_SLASH_Delay.value.prototype.cljm$core$IDeref$_deref$arity$1 = ^id(id _) {
var this__7264 = this;
return ((id (^)(id )) .value)(((id (^)(id , id , ...)) cljm_DOT_core_SLASH_swap_BANG_.value)(this__7264_DOT_state, ^id(id p__7265) {
id map__7266__7267 = p__7265;
id map__7266__7268 = (cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_seq_QMARK_.value)(map__7266__7267))) ?((id (^)(id , id , ...)) cljm_DOT_core_SLASH_apply.value)(cljm_DOT_core_SLASH_hash_map.value, map__7266__7267, nil):map__7266__7267;
id curr_state__7269 = map__7266__7268;
id done__7270 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(map__7266__7268, cljm_keyword(@":done"), nil);
if(cljm_truthy(done__7270)) {
return curr_state__7269;

} else {
return @{ cljm_keyword(@":done"): @YES, cljm_keyword(@":value"): ((id (^)()) this__7264_DOT_f.value)() };

}
}, nil));
};
cljm_DOT_core_SLASH_Delay.value;
/**
* returns true if x is a Delay created with delay
*/
cljm_DOT_core_SLASH_delay_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id x) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljs_SLASH_core_DOT_Delay.value, x);
}];
/**
* If x is a Delay, returns the (possibly cached) value of its expression, else returns x
*/
cljm_DOT_core_SLASH_force = [[CLJMVar alloc] initWithValue:^id(id x) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_delay_QMARK_.value)(x))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(x);

} else {
return x;

}
}];
/**
* Returns true if a value has been produced for a promise, delay, future or lazy sequence.
*/
cljm_DOT_core_SLASH_realized_QMARK_ = [[CLJMVar alloc] initWithValue:^id(id d) {
return ((id (^)(id )) cljm_DOT_core_SLASH__realized_QMARK_.value)(d);
}];
/**
* Recursively transforms JavaScript arrays into ClojureScript
* vectors, and JavaScript objects into ClojureScript maps.  With
* option ':keywordize-keys true' will convert object fields from
* strings to keywords.
*/
cljm_DOT_core_SLASH_js__GT_clj = [[CLJMVar alloc] initWithValue:^id(id cljm__varargs, id x, ...) {
NSMutableArray *options = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[options addObject:cljm__currentObject];
}
va_end(cljm__args);
id map__7291__7292 = options;
id map__7291__7293 = (cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_seq_QMARK_.value)(map__7291__7292))) ?((id (^)(id , id , ...)) cljm_DOT_core_SLASH_apply.value)(cljm_DOT_core_SLASH_hash_map.value, map__7291__7292, nil):map__7291__7292;
id keywordize_keys__7294 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(map__7291__7293, cljm_keyword(@":keywordize-keys"), nil);
id keyfn__7295 = (cljm_truthy(keywordize_keys__7294)) ?cljm_DOT_core_SLASH_keyword.value:cljm_DOT_core_SLASH_str.value;
id f__7310 = ^id(id x) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_seq_QMARK_.value)(x))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_doall.value)(((id (^)(id , id , ...)) cljm_DOT_core_SLASH_map.value)(thisfn.value, x, nil));

} else {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_coll_QMARK_.value)(x))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_into.value)(((id (^)(id )) cljm_DOT_core_SLASH_empty.value)(x), ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_map.value)(thisfn.value, x, nil));

} else {
if(cljm_truthy(((id (^)(id )) goog_SLASH_isArray.value)(x))) {
return ((id (^)(id )) cljm_DOT_core_SLASH_vec.value)(((id (^)(id , id , ...)) cljm_DOT_core_SLASH_map.value)(thisfn.value, x, nil));

} else {
if(cljm_truthy(([((id (^)(id )) cljm_DOT_core_SLASH_type.value)(x) isEqual:Object.value]))) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_into.value)(@{}, {id iter__1572__auto____7309 = ^id(id s__7304) {
return [cljm_DOT_core_SLASH_LazySeq.value alloc];
};
return ((id (^)(id )) iter__1572__auto____7309.value)(((id (^)(id )) cljm_DOT_core_SLASH_js_keys.value)(x));
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
return ((id (^)(id )) f__7310.value)(x);
}];
/**
* Returns a memoized version of a referentially transparent function. The
* memoized version of the function keeps a cache of the mapping from arguments
* to results and, when calls with the same arguments are repeated often, has
* higher performance at the expense of higher memory use.
*/
cljm_DOT_core_SLASH_memoize = [[CLJMVar alloc] initWithValue:^id(id f) {
id mem__7315 = ((id (^)(id , ...)) cljm_DOT_core_SLASH_atom.value)(@{}, nil);
return ^id(id cljm__varargs, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
id temp__3971__auto____7316 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(mem__7315), args, nil);
if(cljm_truthy(temp__3971__auto____7316)) {
id v__7317 = temp__3971__auto____7316;
return v__7317;

} else {
id ret__7318 = ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_apply.value)(f, args, nil);
((id (^)(id , id , id , id , ...)) cljm_DOT_core_SLASH_swap_BANG_.value)(mem__7315, cljm_DOT_core_SLASH_assoc.value, args, ret__7318, nil);
return ret__7318;

}
};
}];
/**
* trampoline can be used to convert algorithms requiring mutual
* recursion without stack consumption. Calls f with supplied args, if
* any. If f returns a fn, calls that fn with no arguments, and
* continues to repeat, until the return value is not a fn, then
* returns that non-fn value. Note that if you want to return a fn as a
* final value, you must wrap it in some data structure and unpack it
* after trampoline returns.
*/
cljm_DOT_core_SLASH_trampoline = [[CLJMVar alloc] initWithValue:(function() {
var trampoline = null;
var trampoline__1 = ^id(id f) {
while(YES) {
id ret__7320 = ((id (^)()) f.value)();
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_fn_QMARK_.value)(ret__7320))) {
{
id G__7321 = ret__7320;
f = G__7321;
continue;
}

} else {
return ret__7320;

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
return ((id (^)(id , ...)) trampoline.value)(^id() {
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_apply.value)(f, args, nil);
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
];
/**
* Returns a random floating point number between 0 (inclusive) and
* n (default 1) (exclusive).
*/
cljm_DOT_core_SLASH_rand = [[CLJMVar alloc] initWithValue:(function() {
var rand = null;
var rand__0 = ^id() {
return ((id (^)(id )) rand.value)(@1);
};
var rand__1 = ^id(id n) {
return (((id (^)()) Math_SLASH_random.value)() * n);
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
];
/**
* Returns a random integer between 0 (inclusive) and n (exclusive).
*/
cljm_DOT_core_SLASH_rand_int = [[CLJMVar alloc] initWithValue:^id(id n) {
return ((id (^)(id )) Math_SLASH_floor.value)((((id (^)()) Math_SLASH_random.value)() * n));
}];
/**
* Return a random element of the (sequential) collection. Will have
* the same performance characteristics as nth for the given
* collection.
*/
cljm_DOT_core_SLASH_rand_nth = [[CLJMVar alloc] initWithValue:^id(id coll) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_nth.value)(coll, ((id (^)(id )) cljm_DOT_core_SLASH_rand_int.value)(((id (^)(id )) cljm_DOT_core_SLASH_count.value)(coll)));
}];
/**
* Returns a map of the elements of coll keyed by the result of
* f on each element. The value at each key will be a vector of the
* corresponding elements, in the order they appeared in coll.
*/
cljm_DOT_core_SLASH_group_by = [[CLJMVar alloc] initWithValue:^id(id f, id coll) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(^id(id ret, id x) {
id k__7323 = ((id (^)(id )) f.value)(x);
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_assoc.value)(ret, k__7323, ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_conj.value)(((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(ret, k__7323, @[]), x, nil), nil);
}, @{}, coll);
}];
/**
* Creates a hierarchy object for use with derive, isa? etc.
*/
cljm_DOT_core_SLASH_make_hierarchy = [[CLJMVar alloc] initWithValue:^id() {
return @{ cljm_keyword(@":parents"): @{}, cljm_keyword(@":descendants"): @{}, cljm_keyword(@":ancestors"): @{} };
}];
cljm_DOT_core_SLASH_global_hierarchy = [[CLJMVar alloc] initWithValue:((id (^)(id , ...)) cljm_DOT_core_SLASH_atom.value)(((id (^)()) cljm_DOT_core_SLASH_make_hierarchy.value)(), nil)];
/**
* Returns true if (= child parent), or child is directly or indirectly derived from
* parent, either via a JavaScript type inheritance relationship or a
* relationship established via derive. h must be a hierarchy obtained
* from make-hierarchy, if not supplied defaults to the global
* hierarchy
*/
cljm_DOT_core_SLASH_isa_QMARK_ = [[CLJMVar alloc] initWithValue:(function() {
var isa_QMARK_ = null;
var isa_QMARK___2 = ^id(id child, id parent) {
return ((id (^)(id , id , id )) isa_QMARK_.value)(((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(cljm_DOT_core_SLASH_global_hierarchy.value), child, parent);
};
var isa_QMARK___3 = ^id(id h, id child, id parent) {
id or__3824__auto____7332 = ((id (^)(id , id , ...)) cljm_DOT_core_SLASH__EQ_.value)(child, parent, nil);
if(cljm_truthy(or__3824__auto____7332)) {
return or__3824__auto____7332;

} else {
id or__3824__auto____7333 = ((id (^)(id , id )) cljm_DOT_core_SLASH_contains_QMARK_.value)(((id (^)(id )) .value)(child), parent);
if(cljm_truthy(or__3824__auto____7333)) {
return or__3824__auto____7333;

} else {
id and__3822__auto____7334 = ((id (^)(id )) cljm_DOT_core_SLASH_vector_QMARK_.value)(parent);
if(cljm_truthy(and__3822__auto____7334)) {
id and__3822__auto____7335 = ((id (^)(id )) cljm_DOT_core_SLASH_vector_QMARK_.value)(child);
if(cljm_truthy(and__3822__auto____7335)) {
id and__3822__auto____7336 = ([((id (^)(id )) cljm_DOT_core_SLASH_count.value)(parent) isEqual:((id (^)(id )) cljm_DOT_core_SLASH_count.value)(child)]);
if(cljm_truthy(and__3822__auto____7336)) {
id ret__7337 = @YES;
id i__7338 = @0;
while(YES) {
if(cljm_truthy({id or__3824__auto____7339 = ((id (^)(id )) cljm_DOT_core_SLASH_not.value)(ret__7337);
if(cljm_truthy(or__3824__auto____7339)) {
return or__3824__auto____7339;

} else {
return ([i__7338 isEqual:((id (^)(id )) cljm_DOT_core_SLASH_count.value)(parent)]);

}
})) {
return ret__7337;

} else {
{
id G__7340 = ((id (^)(id , id , id )) isa_QMARK_.value)(h, ((id (^)(id )) child.value)(i__7338), ((id (^)(id )) parent.value)(i__7338));
id G__7341 = (i__7338 + @1);
ret__7337 = G__7340;
i__7338 = G__7341;
continue;
}

}
break;
}

} else {
return and__3822__auto____7336;

}

} else {
return and__3822__auto____7335;

}

} else {
return and__3822__auto____7334;

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
];
/**
* Returns the immediate parents of tag, either via a JavaScript type
* inheritance relationship or a relationship established via derive. h
* must be a hierarchy obtained from make-hierarchy, if not supplied
* defaults to the global hierarchy
*/
cljm_DOT_core_SLASH_parents = [[CLJMVar alloc] initWithValue:(function() {
var parents = null;
var parents__1 = ^id(id tag) {
return ((id (^)(id , id )) parents.value)(((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(cljm_DOT_core_SLASH_global_hierarchy.value), tag);
};
var parents__2 = ^id(id h, id tag) {
return ((id (^)(id )) cljm_DOT_core_SLASH_not_empty.value)(((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(((id (^)(id )) .value)(h), tag, nil));
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
];
/**
* Returns the immediate and indirect parents of tag, either via a JavaScript type
* inheritance relationship or a relationship established via derive. h
* must be a hierarchy obtained from make-hierarchy, if not supplied
* defaults to the global hierarchy
*/
cljm_DOT_core_SLASH_ancestors = [[CLJMVar alloc] initWithValue:(function() {
var ancestors = null;
var ancestors__1 = ^id(id tag) {
return ((id (^)(id , id )) ancestors.value)(((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(cljm_DOT_core_SLASH_global_hierarchy.value), tag);
};
var ancestors__2 = ^id(id h, id tag) {
return ((id (^)(id )) cljm_DOT_core_SLASH_not_empty.value)(((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(((id (^)(id )) .value)(h), tag, nil));
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
];
/**
* Returns the immediate and indirect children of tag, through a
* relationship established via derive. h must be a hierarchy obtained
* from make-hierarchy, if not supplied defaults to the global
* hierarchy. Note: does not work on JavaScript type inheritance
* relationships.
*/
cljm_DOT_core_SLASH_descendants = [[CLJMVar alloc] initWithValue:(function() {
var descendants = null;
var descendants__1 = ^id(id tag) {
return ((id (^)(id , id )) descendants.value)(((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(cljm_DOT_core_SLASH_global_hierarchy.value), tag);
};
var descendants__2 = ^id(id h, id tag) {
return ((id (^)(id )) cljm_DOT_core_SLASH_not_empty.value)(((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(((id (^)(id )) .value)(h), tag, nil));
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
];
/**
* Establishes a parent/child relationship between parent and
* tag. Parent must be a namespace-qualified symbol or keyword and
* child can be either a namespace-qualified symbol or keyword or a
* class. h must be a hierarchy obtained from make-hierarchy, if not
* supplied defaults to, and modifies, the global hierarchy.
*/
cljm_DOT_core_SLASH_derive = [[CLJMVar alloc] initWithValue:(function() {
var derive = null;
var derive__2 = ^id(id tag, id parent) {
if(cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_namespace.value)(parent))) {

} else {
throw [Error.value alloc];

}
((id (^)(id , id , id , id , ...)) cljm_DOT_core_SLASH_swap_BANG_.value)(cljm_DOT_core_SLASH_global_hierarchy.value, derive.value, tag, parent, nil);
return nil;
};
var derive__3 = ^id(id h, id tag, id parent) {
if(cljm_truthy(((id (^)(id , id , ...)) cljm_DOT_core_SLASH_not_EQ_.value)(tag, parent, nil))) {

} else {
throw [Error.value alloc];

}
id tp__7350 = ((id (^)(id )) .value)(h);
id td__7351 = ((id (^)(id )) .value)(h);
id ta__7352 = ((id (^)(id )) .value)(h);
id tf__7353 = ^id(id m, id source, id sources, id target, id targets) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(^id(id ret, id k) {
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_assoc.value)(ret, k, ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(cljm_DOT_core_SLASH_conj.value, ((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(targets, k, [NSSet set]), ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(target, ((id (^)(id )) targets.value)(target))), nil);
}, m, ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(source, ((id (^)(id )) sources.value)(source)));
};
id or__3824__auto____7354 = (cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_contains_QMARK_.value)(((id (^)(id )) tp__7350.value)(tag), parent))) ?nil:{if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_contains_QMARK_.value)(((id (^)(id )) ta__7352.value)(tag), parent))) {
throw [Error.value alloc];

} else {

}
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_contains_QMARK_.value)(((id (^)(id )) ta__7352.value)(parent), tag))) {
throw [Error.value alloc];

} else {

}
return @{ cljm_keyword(@":parents"): ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_assoc.value)(((id (^)(id )) .value)(h), tag, ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_conj.value)(((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(tp__7350, tag, [NSSet set]), parent, nil), nil), cljm_keyword(@":ancestors"): ((id (^)(id , id , id , id , id )) tf__7353.value)(((id (^)(id )) .value)(h), tag, td__7351, parent, ta__7352), cljm_keyword(@":descendants"): ((id (^)(id , id , id , id , id )) tf__7353.value)(((id (^)(id )) .value)(h), parent, ta__7352, tag, td__7351) };
};
if(cljm_truthy(or__3824__auto____7354)) {
return or__3824__auto____7354;

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
];
/**
* Removes a parent/child relationship between parent and
* tag. h must be a hierarchy obtained from make-hierarchy, if not
* supplied defaults to, and modifies, the global hierarchy.
*/
cljm_DOT_core_SLASH_underive = [[CLJMVar alloc] initWithValue:(function() {
var underive = null;
var underive__2 = ^id(id tag, id parent) {
((id (^)(id , id , id , id , ...)) cljm_DOT_core_SLASH_swap_BANG_.value)(cljm_DOT_core_SLASH_global_hierarchy.value, underive.value, tag, parent, nil);
return nil;
};
var underive__3 = ^id(id h, id tag, id parent) {
id parentMap__7359 = ((id (^)(id )) .value)(h);
id childsParents__7360 = (cljm_truthy(((id (^)(id )) parentMap__7359.value)(tag))) ?((id (^)(id , id , ...)) cljm_DOT_core_SLASH_disj.value)(((id (^)(id )) parentMap__7359.value)(tag), parent, nil):[NSSet set];
id newParents__7361 = (cljm_truthy(((id (^)(id )) cljm_DOT_core_SLASH_not_empty.value)(childsParents__7360))) ?((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_assoc.value)(parentMap__7359, tag, childsParents__7360, nil):((id (^)(id , id , ...)) cljm_DOT_core_SLASH_dissoc.value)(parentMap__7359, tag, nil);
id deriv_seq__7362 = ((id (^)(id )) cljm_DOT_core_SLASH_flatten.value)(((id (^)(id , id , ...)) cljm_DOT_core_SLASH_map.value)(^id(id p1__7342_SHARP_) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_cons.value)(((id (^)(id )) cljm_DOT_core_SLASH_first.value)(p1__7342_SHARP_), ((id (^)(id , id )) cljm_DOT_core_SLASH_interpose.value)(((id (^)(id )) cljm_DOT_core_SLASH_first.value)(p1__7342_SHARP_), ((id (^)(id )) cljm_DOT_core_SLASH_second.value)(p1__7342_SHARP_)));
}, ((id (^)(id )) cljm_DOT_core_SLASH_seq.value)(newParents__7361), nil));
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_contains_QMARK_.value)(((id (^)(id )) parentMap__7359.value)(tag), parent))) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(^id(id p1__7343_SHARP_, id p2__7344_SHARP_) {
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_apply.value)(cljm_DOT_core_SLASH_derive.value, p1__7343_SHARP_, p2__7344_SHARP_, nil);
}, ((id (^)()) cljm_DOT_core_SLASH_make_hierarchy.value)(), ((id (^)(id , id )) cljm_DOT_core_SLASH_partition.value)(@2, deriv_seq__7362));

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
];
cljm_DOT_core_SLASH_reset_cache = [[CLJMVar alloc] initWithValue:^id(id method_cache, id method_table, id cached_hierarchy, id hierarchy) {
((id (^)(id , id , ...)) cljm_DOT_core_SLASH_swap_BANG_.value)(method_cache, ^id(id _) {
return ((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(method_table);
}, nil);
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_swap_BANG_.value)(cached_hierarchy, ^id(id _) {
return ((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(hierarchy);
}, nil);
}];
cljm_DOT_core_SLASH_prefers_STAR_ = [[CLJMVar alloc] initWithValue:^id(id x, id y, id prefer_table) {
id xprefs__7370 = ((id (^)(id )) .value)(x);
id or__3824__auto____7372 = (cljm_truthy({id and__3822__auto____7371 = xprefs__7370;
if(cljm_truthy(and__3822__auto____7371)) {
return ((id (^)(id )) xprefs__7370.value)(y);

} else {
return and__3822__auto____7371;

}
})) ?@YES:nil;
if(cljm_truthy(or__3824__auto____7372)) {
return or__3824__auto____7372;

} else {
id or__3824__auto____7374 = {id ps__7373 = ((id (^)(id )) cljm_DOT_core_SLASH_parents.value)(y);
while(YES) {
if(cljm_truthy((((id (^)(id )) cljm_DOT_core_SLASH_count.value)(ps__7373) > @0))) {
if(cljm_truthy(((id (^)(id , id , id )) prefers_STAR_.value)(x, ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(ps__7373), prefer_table))) {

} else {

}
{
id G__7377 = ((id (^)(id )) cljm_DOT_core_SLASH_rest.value)(ps__7373);
ps__7373 = G__7377;
continue;
}

} else {
return nil;

}
break;
}
};
if(cljm_truthy(or__3824__auto____7374)) {
return or__3824__auto____7374;

} else {
id or__3824__auto____7376 = {id ps__7375 = ((id (^)(id )) cljm_DOT_core_SLASH_parents.value)(x);
while(YES) {
if(cljm_truthy((((id (^)(id )) cljm_DOT_core_SLASH_count.value)(ps__7375) > @0))) {
if(cljm_truthy(((id (^)(id , id , id )) prefers_STAR_.value)(((id (^)(id )) cljm_DOT_core_SLASH_first.value)(ps__7375), y, prefer_table))) {

} else {

}
{
id G__7378 = ((id (^)(id )) cljm_DOT_core_SLASH_rest.value)(ps__7375);
ps__7375 = G__7378;
continue;
}

} else {
return nil;

}
break;
}
};
if(cljm_truthy(or__3824__auto____7376)) {
return or__3824__auto____7376;

} else {
return @NO;

}

}

}
}];
cljm_DOT_core_SLASH_dominates = [[CLJMVar alloc] initWithValue:^id(id x, id y, id prefer_table) {
id or__3824__auto____7380 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_prefers_STAR_.value)(x, y, prefer_table);
if(cljm_truthy(or__3824__auto____7380)) {
return or__3824__auto____7380;

} else {
return ((id (^)(id , id )) cljm_DOT_core_SLASH_isa_QMARK_.value)(x, y);

}
}];
cljm_DOT_core_SLASH_find_and_cache_best_method = [[CLJMVar alloc] initWithValue:^id(id name, id dispatch_val, id hierarchy, id method_table, id prefer_table, id method_cache, id cached_hierarchy) {
id best_entry__7398 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_reduce.value)(^id(id be, id p__7390) {
id vec__7391__7392 = p__7390;
id k__7393 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_nth.value)(vec__7391__7392, @0, nil);
id ___7394 = ((id (^)(id , id , id )) cljm_DOT_core_SLASH_nth.value)(vec__7391__7392, @1, nil);
id e__7395 = vec__7391__7392;
if(cljm_truthy(((id (^)(id , id )) cljm_DOT_core_SLASH_isa_QMARK_.value)(dispatch_val, k__7393))) {
id be2__7397 = (cljm_truthy({id or__3824__auto____7396 = (be == nil);
if(cljm_truthy(or__3824__auto____7396)) {
return or__3824__auto____7396;

} else {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_dominates.value)(k__7393, ((id (^)(id )) cljm_DOT_core_SLASH_first.value)(be), prefer_table);

}
})) ?e__7395:be;
if(cljm_truthy(((id (^)(id , id , id )) cljm_DOT_core_SLASH_dominates.value)(((id (^)(id )) cljm_DOT_core_SLASH_first.value)(be2__7397), k__7393, prefer_table))) {

} else {
throw [Error.value alloc];

}
return be2__7397;

} else {
return be;

}
}, nil, ((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(method_table));
if(cljm_truthy(best_entry__7398)) {
if(cljm_truthy(((id (^)(id , id , ...)) cljm_DOT_core_SLASH__EQ_.value)(((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(cached_hierarchy), ((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(hierarchy), nil))) {
((id (^)(id , id , id , id , ...)) cljm_DOT_core_SLASH_swap_BANG_.value)(method_cache, cljm_DOT_core_SLASH_assoc.value, dispatch_val, ((id (^)(id )) cljm_DOT_core_SLASH_second.value)(best_entry__7398), nil);
return ((id (^)(id )) cljm_DOT_core_SLASH_second.value)(best_entry__7398);

} else {
((id (^)(id , id , id , id )) cljm_DOT_core_SLASH_reset_cache.value)(method_cache, method_table, cached_hierarchy, hierarchy);
return ((id (^)(id , id , id , id , id , id , id )) find_and_cache_best_method.value)(name, dispatch_val, hierarchy, method_table, prefer_table, method_cache, cached_hierarchy);

}

} else {
return nil;

}
}];
cljm_DOT_core_SLASH_IMultiFn = [[CLJMVar alloc] initWithValue:{}];
cljm_DOT_core_SLASH__reset = [[CLJMVar alloc] initWithValue:^id(id mf) {
if(cljm_truthy({id and__3822__auto____7403 = mf;
if(cljm_truthy(and__3822__auto____7403)) {
return mf.cljm$core$IMultiFn$_reset$arity$1;

} else {
return and__3822__auto____7403;

}
})) {
return [mf cljmmf core];

} else {
id x__1473__auto____7404 = (cljm_truthy((mf == nil))) ?nil:mf;
return ((id (^)(id )) .value)(mf);

}
}];
cljm_DOT_core_SLASH__add_method = [[CLJMVar alloc] initWithValue:^id(id mf, id dispatch_val, id method) {
if(cljm_truthy({id and__3822__auto____7411 = mf;
if(cljm_truthy(and__3822__auto____7411)) {
return mf.cljm$core$IMultiFn$_add_method$arity$3;

} else {
return and__3822__auto____7411;

}
})) {
return [mf cljmmf coredispatch_val IMultiFnmethod add];

} else {
id x__1473__auto____7412 = (cljm_truthy((mf == nil))) ?nil:mf;
return ((id (^)(id , id , id )) .value)(mf, dispatch_val, method);

}
}];
cljm_DOT_core_SLASH__remove_method = [[CLJMVar alloc] initWithValue:^id(id mf, id dispatch_val) {
if(cljm_truthy({id and__3822__auto____7419 = mf;
if(cljm_truthy(and__3822__auto____7419)) {
return mf.cljm$core$IMultiFn$_remove_method$arity$2;

} else {
return and__3822__auto____7419;

}
})) {
return [mf cljmmf coredispatch_val IMultiFn];

} else {
id x__1473__auto____7420 = (cljm_truthy((mf == nil))) ?nil:mf;
return ((id (^)(id , id )) .value)(mf, dispatch_val);

}
}];
cljm_DOT_core_SLASH__prefer_method = [[CLJMVar alloc] initWithValue:^id(id mf, id dispatch_val, id dispatch_val_y) {
if(cljm_truthy({id and__3822__auto____7427 = mf;
if(cljm_truthy(and__3822__auto____7427)) {
return mf.cljm$core$IMultiFn$_prefer_method$arity$3;

} else {
return and__3822__auto____7427;

}
})) {
return [mf cljmmf coredispatch_val IMultiFndispatch_val_y prefer];

} else {
id x__1473__auto____7428 = (cljm_truthy((mf == nil))) ?nil:mf;
return ((id (^)(id , id , id )) .value)(mf, dispatch_val, dispatch_val_y);

}
}];
cljm_DOT_core_SLASH__get_method = [[CLJMVar alloc] initWithValue:^id(id mf, id dispatch_val) {
if(cljm_truthy({id and__3822__auto____7435 = mf;
if(cljm_truthy(and__3822__auto____7435)) {
return mf.cljm$core$IMultiFn$_get_method$arity$2;

} else {
return and__3822__auto____7435;

}
})) {
return [mf cljmmf coredispatch_val IMultiFn];

} else {
id x__1473__auto____7436 = (cljm_truthy((mf == nil))) ?nil:mf;
return ((id (^)(id , id )) .value)(mf, dispatch_val);

}
}];
cljm_DOT_core_SLASH__methods = [[CLJMVar alloc] initWithValue:^id(id mf) {
if(cljm_truthy({id and__3822__auto____7443 = mf;
if(cljm_truthy(and__3822__auto____7443)) {
return mf.cljm$core$IMultiFn$_methods$arity$1;

} else {
return and__3822__auto____7443;

}
})) {
return [mf cljmmf core];

} else {
id x__1473__auto____7444 = (cljm_truthy((mf == nil))) ?nil:mf;
return ((id (^)(id )) .value)(mf);

}
}];
cljm_DOT_core_SLASH__prefers = [[CLJMVar alloc] initWithValue:^id(id mf) {
if(cljm_truthy({id and__3822__auto____7451 = mf;
if(cljm_truthy(and__3822__auto____7451)) {
return mf.cljm$core$IMultiFn$_prefers$arity$1;

} else {
return and__3822__auto____7451;

}
})) {
return [mf cljmmf core];

} else {
id x__1473__auto____7452 = (cljm_truthy((mf == nil))) ?nil:mf;
return ((id (^)(id )) .value)(mf);

}
}];
cljm_DOT_core_SLASH__dispatch = [[CLJMVar alloc] initWithValue:^id(id mf, id args) {
if(cljm_truthy({id and__3822__auto____7459 = mf;
if(cljm_truthy(and__3822__auto____7459)) {
return mf.cljm$core$IMultiFn$_dispatch$arity$2;

} else {
return and__3822__auto____7459;

}
})) {
return [mf cljmmf coreargs IMultiFn];

} else {
id x__1473__auto____7460 = (cljm_truthy((mf == nil))) ?nil:mf;
return ((id (^)(id , id )) .value)(mf, args);

}
}];
cljm_DOT_core_SLASH_do_dispatch = [[CLJMVar alloc] initWithValue:^id(id mf, id dispatch_fn, id args) {
id dispatch_val__7465 = ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_apply.value)(dispatch_fn, args, nil);
id target_fn__7466 = ((id (^)(id , id )) cljm_DOT_core_SLASH__get_method.value)(mf, dispatch_val__7465);
if(cljm_truthy(target_fn__7466)) {

} else {
throw [Error.value alloc];

}
return ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_apply.value)(target_fn__7466, args, nil);
}];

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
cljm_DOT_core_SLASH_MultiFn.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_MultiFn.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/MultiFn", nil);
};
cljm_DOT_core_SLASH_MultiFn.value.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id this$) {
var this__7467 = this;
return ((id (^)(id )) goog_SLASH_getUid.value)(this$);
};
cljm_DOT_core_SLASH_MultiFn.value.prototype.cljm$core$IMultiFn$_reset$arity$1 = ^id(id mf) {
var this__7468 = this;
((id (^)(id , id , ...)) cljm_DOT_core_SLASH_swap_BANG_.value)(this__7468_DOT_method_table, ^id(id mf) {
return @{};
}, nil);
((id (^)(id , id , ...)) cljm_DOT_core_SLASH_swap_BANG_.value)(this__7468_DOT_method_cache, ^id(id mf) {
return @{};
}, nil);
((id (^)(id , id , ...)) cljm_DOT_core_SLASH_swap_BANG_.value)(this__7468_DOT_prefer_table, ^id(id mf) {
return @{};
}, nil);
((id (^)(id , id , ...)) cljm_DOT_core_SLASH_swap_BANG_.value)(this__7468_DOT_cached_hierarchy, ^id(id mf) {
return nil;
}, nil);
return mf;
};
cljm_DOT_core_SLASH_MultiFn.value.prototype.cljm$core$IMultiFn$_add_method$arity$3 = ^id(id mf, id dispatch_val, id method) {
var this__7469 = this;
((id (^)(id , id , id , id , ...)) cljm_DOT_core_SLASH_swap_BANG_.value)(this__7469_DOT_method_table, cljm_DOT_core_SLASH_assoc.value, dispatch_val, method, nil);
((id (^)(id , id , id , id )) cljm_DOT_core_SLASH_reset_cache.value)(this__7469_DOT_method_cache, this__7469_DOT_method_table, this__7469_DOT_cached_hierarchy, this__7469_DOT_hierarchy);
return mf;
};
cljm_DOT_core_SLASH_MultiFn.value.prototype.cljm$core$IMultiFn$_remove_method$arity$2 = ^id(id mf, id dispatch_val) {
var this__7470 = this;
((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_swap_BANG_.value)(this__7470_DOT_method_table, cljm_DOT_core_SLASH_dissoc.value, dispatch_val, nil);
((id (^)(id , id , id , id )) cljm_DOT_core_SLASH_reset_cache.value)(this__7470_DOT_method_cache, this__7470_DOT_method_table, this__7470_DOT_cached_hierarchy, this__7470_DOT_hierarchy);
return mf;
};
cljm_DOT_core_SLASH_MultiFn.value.prototype.cljm$core$IMultiFn$_get_method$arity$2 = ^id(id mf, id dispatch_val) {
var this__7471 = this;
if(cljm_truthy(((id (^)(id , id , ...)) cljm_DOT_core_SLASH__EQ_.value)(((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(this__7471_DOT_cached_hierarchy), ((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(this__7471_DOT_hierarchy), nil))) {

} else {
((id (^)(id , id , id , id )) cljm_DOT_core_SLASH_reset_cache.value)(this__7471_DOT_method_cache, this__7471_DOT_method_table, this__7471_DOT_cached_hierarchy, this__7471_DOT_hierarchy);

}
id temp__3971__auto____7472 = ((id (^)(id )) .value)(dispatch_val);
if(cljm_truthy(temp__3971__auto____7472)) {
id target_fn__7473 = temp__3971__auto____7472;
return target_fn__7473;

} else {
id temp__3971__auto____7474 = ((id (^)(id , id , id , id , id , id , id )) cljm_DOT_core_SLASH_find_and_cache_best_method.value)(this__7471_DOT_name, dispatch_val, this__7471_DOT_hierarchy, this__7471_DOT_method_table, this__7471_DOT_prefer_table, this__7471_DOT_method_cache, this__7471_DOT_cached_hierarchy);
if(cljm_truthy(temp__3971__auto____7474)) {
id target_fn__7475 = temp__3971__auto____7474;
return target_fn__7475;

} else {
return ((id (^)(id )) .value)(this__7471_DOT_default_dispatch_val);

}

}
};
cljm_DOT_core_SLASH_MultiFn.value.prototype.cljm$core$IMultiFn$_prefer_method$arity$3 = ^id(id mf, id dispatch_val_x, id dispatch_val_y) {
var this__7476 = this;
if(cljm_truthy(((id (^)(id , id , id )) cljm_DOT_core_SLASH_prefers_STAR_.value)(dispatch_val_x, dispatch_val_y, this__7476_DOT_prefer_table))) {
throw [Error.value alloc];

} else {

}
((id (^)(id , id , ...)) cljm_DOT_core_SLASH_swap_BANG_.value)(this__7476_DOT_prefer_table, ^id(id old) {
return ((id (^)(id , id , id , ...)) cljm_DOT_core_SLASH_assoc.value)(old, dispatch_val_x, ((id (^)(id , id , ...)) cljm_DOT_core_SLASH_conj.value)(((id (^)(id , id , id )) cljm_DOT_core_SLASH__lookup.value)(old, dispatch_val_x, [NSSet set]), dispatch_val_y, nil), nil);
}, nil);
return ((id (^)(id , id , id , id )) cljm_DOT_core_SLASH_reset_cache.value)(this__7476_DOT_method_cache, this__7476_DOT_method_table, this__7476_DOT_cached_hierarchy, this__7476_DOT_hierarchy);
};
cljm_DOT_core_SLASH_MultiFn.value.prototype.cljm$core$IMultiFn$_methods$arity$1 = ^id(id mf) {
var this__7477 = this;
return ((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(this__7477_DOT_method_table);
};
cljm_DOT_core_SLASH_MultiFn.value.prototype.cljm$core$IMultiFn$_prefers$arity$1 = ^id(id mf) {
var this__7478 = this;
return ((id (^)(id )) cljm_DOT_core_SLASH_deref.value)(this__7478_DOT_prefer_table);
};
cljm_DOT_core_SLASH_MultiFn.value.prototype.cljm$core$IMultiFn$_dispatch$arity$2 = ^id(id mf, id args) {
var this__7479 = this;
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH_do_dispatch.value)(mf, this__7479_DOT_dispatch_fn, args);
};
cljm_DOT_core_SLASH_MultiFn.value;
cljs_SLASH_core_DOT_MultiFn_DOT_prototype_DOT_call.value = ^id(id cljm__varargs, id _, ...) {
NSMutableArray *args = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[args addObject:cljm__currentObject];
}
va_end(cljm__args);
id self__7480 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH__dispatch.value)(self__7480, args);
};
cljs_SLASH_core_DOT_MultiFn_DOT_prototype_DOT_apply.value = ^id(id _, id args) {
id self__7481 = this;
return ((id (^)(id , id )) cljm_DOT_core_SLASH__dispatch.value)(self__7481, args);
};
/**
* Removes all of the methods of multimethod.
*/
cljm_DOT_core_SLASH_remove_all_methods = [[CLJMVar alloc] initWithValue:^id(id multifn) {
return ((id (^)(id )) cljm_DOT_core_SLASH__reset.value)(multifn);
}];
/**
* Removes the method of multimethod associated with dispatch-value.
*/
cljm_DOT_core_SLASH_remove_method = [[CLJMVar alloc] initWithValue:^id(id multifn, id dispatch_val) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH__remove_method.value)(multifn, dispatch_val);
}];
/**
* Causes the multimethod to prefer matches of dispatch-val-x over dispatch-val-y
* when there is a conflict
*/
cljm_DOT_core_SLASH_prefer_method = [[CLJMVar alloc] initWithValue:^id(id multifn, id dispatch_val_x, id dispatch_val_y) {
return ((id (^)(id , id , id )) cljm_DOT_core_SLASH__prefer_method.value)(multifn, dispatch_val_x, dispatch_val_y);
}];
/**
* Given a multimethod, returns a map of dispatch values -> dispatch fns
*/
cljm_DOT_core_SLASH_methods = [[CLJMVar alloc] initWithValue:^id(id multifn) {
return ((id (^)(id )) cljm_DOT_core_SLASH__methods.value)(multifn);
}];
/**
* Given a multimethod and a dispatch value, returns the dispatch fn
* that would apply to that value, or nil if none apply and no default
*/
cljm_DOT_core_SLASH_get_method = [[CLJMVar alloc] initWithValue:^id(id multifn, id dispatch_val) {
return ((id (^)(id , id )) cljm_DOT_core_SLASH__get_method.value)(multifn, dispatch_val);
}];
/**
* Given a multimethod, returns a map of preferred value -> set of other values
*/
cljm_DOT_core_SLASH_prefers = [[CLJMVar alloc] initWithValue:^id(id multifn) {
return ((id (^)(id )) cljm_DOT_core_SLASH__prefers.value)(multifn);
}];

/**
* @constructor
*/
cljm_DOT_core_SLASH_UUID = (function (uuid){
this.uuid = uuid;
this.cljm$lang$protocol_mask$partition1$ = 0;
this.cljm$lang$protocol_mask$partition0$ = 543162368;
})
cljm_DOT_core_SLASH_UUID.value.cljm$lang$type = @YES;
cljm_DOT_core_SLASH_UUID.value.cljm$lang$ctorPrSeq = ^id(id this__1419__auto__) {
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)(@"cljm.core/UUID", nil);
};
cljm_DOT_core_SLASH_UUID.value.prototype.cljm$core$IHash$_hash$arity$1 = ^id(id this$) {
var this__7482 = this;
return ((id (^)(id )) goog_DOT_string_SLASH_hashCode.value)(((id (^)(id , ...)) cljm_DOT_core_SLASH_pr_str.value)(this$, nil));
};
cljm_DOT_core_SLASH_UUID.value.prototype.cljm$core$IPrintable$_pr_seq$arity$2 = ^id(id _7484, id _) {
var this__7483 = this;
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_list.value)([@[ @"#uuid \"", this__7483_DOT_uuid, @"\"" ] componentsSeperatedByString:@""], nil);
};
cljm_DOT_core_SLASH_UUID.value.prototype.cljm$core$IEquiv$_equiv$arity$2 = ^id(id _, id other) {
var this__7485 = this;
id and__3822__auto____7486 = ((id (^)(id , id )) cljm_DOT_core_SLASH_instance_QMARK_.value)(cljm_DOT_core_SLASH_UUID.value, other);
if(cljm_truthy(and__3822__auto____7486)) {
return ([this__7485_DOT_uuid isEqual:other.uuid]);

} else {
return and__3822__auto____7486;

}
};
cljm_DOT_core_SLASH_UUID.value.prototype.toString = ^id() {
var this__7487 = this;
id this__7488 = this;
return ((id (^)(id , ...)) cljm_DOT_core_SLASH_pr_str.value)(this__7488, nil);
};
cljm_DOT_core_SLASH_UUID.value;
}
}

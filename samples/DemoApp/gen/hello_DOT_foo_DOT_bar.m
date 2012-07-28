#import <CLJMRuntime/CLJMRuntime.h>
#import "cljm_DOT_core.h"
#import "hello_DOT_foo_DOT_bar.h"
__attribute__((constructor))
void hello_DOT_foo_DOT_bar_SLASH_cljm_ns_init(void) {
@autoreleasepool {
hello_DOT_foo_DOT_bar_SLASH_blah = [[CLJMVar alloc] initWithValue:@"hi"];
hello_DOT_foo_DOT_bar_SLASH_stuff = [[CLJMVar alloc] initWithValue:@[ @1, @2, @3 ]];
hello_DOT_foo_DOT_bar_SLASH_wat = [[CLJMVar alloc] initWithValue:@{ cljm_keyword(@":hi"): @1, cljm_keyword(@":something"): @2 }];
hello_DOT_foo_DOT_bar_SLASH_more = [[CLJMVar alloc] initWithValue:[NSSet setWithObjects:@1, @3, @4, nil]];
cljm_var_def(@"hello.foo.bar/woah-buddy", @1);
cljm_var_def(@"hello.foo.bar/chchchchanges", ^id(id x) {
return ((id (^)(id )) hello_DOT_foo_DOT_bar_SLASH_nslog.value)(@"things change man");
});
hello_DOT_foo_DOT_bar_SLASH_uppers = [[CLJMVar alloc] initWithValue:^id(id x) {
if(cljm_truthy(@NO)) {
return @"hi";

} else {
return @"no";

}
}];
hello_DOT_foo_DOT_bar_SLASH_nslog = [[CLJMVar alloc] initWithValue:^id(id cljm__varargs, ...) {
NSMutableArray *shit_to_print = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[shit_to_print addObject:cljm__currentObject];
}
va_end(cljm__args);
NSLog(@"%@", shit_to_print.value);;
return nil;
}];
hello_DOT_foo_DOT_bar_SLASH_uppercase_the_bitches = [[CLJMVar alloc] initWithValue:^id(id x) {
return [x.value uppercaseString];
}];
hello_DOT_foo_DOT_bar_SLASH_the_things = [[CLJMVar alloc] initWithValue:^id(id the_thing_man) {
[NSArray.value alloc];
return @1;
}];
((id (^)(id , ...)) hello_DOT_foo_DOT_bar_SLASH_nslog.value)(@"hi", nil);
((id (^)(id , ...)) hello_DOT_foo_DOT_bar_SLASH_nslog.value)(cljm_var_lookup(@"hello.foo.bar/woah-buddy").value, nil);
((id (^)(id )) cljm_var_lookup(@"hello.foo.bar/chchchchanges").value)(@1);
}
}

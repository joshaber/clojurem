#import <CLJMRuntime/CLJMRuntime.h>
#import "cljm_DOT_core.h"
#import "hello_DOT_foo_DOT_bar.h"
__attribute__((constructor))
void hello_DOT_foo_DOT_bar_SLASH_cljm_ns_init(void) {
@autoreleasepool {
hello_DOT_foo_DOT_bar_SLASH_blah = @"hi";
hello_DOT_foo_DOT_bar_SLASH_stuff = @[ @1, @2, @3 ];
hello_DOT_foo_DOT_bar_SLASH_wat = @{ cljm_keyword(@":hi"): @1, cljm_keyword(@":something"): @2 };
hello_DOT_foo_DOT_bar_SLASH_more = [NSSet setWithObjects:@1, @3, @4, nil];
cljm_var_def(@"hello.foo.bar/woah-buddy", @1);
cljm_var_def(@"hello.foo.bar/chchchchanges", ^id(id x) {
return hello_DOT_foo_DOT_bar_SLASH_nslog(@"things change man");
});
hello_DOT_foo_DOT_bar_SLASH_uppers = ^id(id x) {
if(cljm_truthy(@NO)) {
return @"hi";

} else {
return @"no";

}
};
hello_DOT_foo_DOT_bar_SLASH_nslog = ^id(id cljm__varargs, ...) {
NSMutableArray *x = [NSMutableArray array];
va_list cljm__args;
va_start(cljm__args, cljm__varargs);
for(id cljm__currentObject = cljm__varargs; cljm__currentObject != nil; cljm__currentObject = va_arg(cljm__args, id)) {
[x addObject:cljm__currentObject];
}
va_end(cljm__args);
NSLog(@"%@", x);;
return nil;
};
hello_DOT_foo_DOT_bar_SLASH_uppercase_the_bitches = ^id(id x) {
return [x uppercaseString];
};
hello_DOT_foo_DOT_bar_SLASH_the_things = ^id(id the_thing_man) {
[NSArray alloc];
return @1;
};
hello_DOT_foo_DOT_bar_SLASH_nslog(@"hi", nil);
hello_DOT_foo_DOT_bar_SLASH_nslog(cljm_var_lookup(@"hello.foo.bar/woah-buddy").value, nil);
id (^hello_DOT_foo_DOT_bar_SLASH_chchchchanges)(id ) = (id (^)(id )) cljm_var_lookup(@"hello.foo.bar/chchchchanges").value;
hello_DOT_foo_DOT_bar_SLASH_chchchchanges(@1);
}
}

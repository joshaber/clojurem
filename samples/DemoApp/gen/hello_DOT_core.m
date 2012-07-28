#import <CLJMRuntime/CLJMRuntime.h>
#import "cljm_DOT_core.h"
#import "hello_DOT_core.h"
#import "hello_DOT_foo_DOT_bar.h"
__attribute__((constructor))
void hello_DOT_core_SLASH_cljm_ns_init(void) {
@autoreleasepool {
hello_DOT_core_SLASH_greet = [[CLJMVar alloc] initWithValue:^id(id n) {
return [@[ @"Hello ", n.value, @" world!" ] componentsSeperatedByString:@""];
}];
hello_DOT_core_SLASH_sum = [[CLJMVar alloc] initWithValue:^id(id xs) {
return ((id (^)(id )) hello_DOT_foo_DOT_bar_SLASH_sum.value)(xs.value);
}];
}
}

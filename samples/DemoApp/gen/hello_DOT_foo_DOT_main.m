#import <CLJMRuntime/CLJMRuntime.h>
//#import "cljm_DOT_core.h"
#import "hello_DOT_foo_DOT_main.h"
#import "hello_DOT_foo_DOT_bar.h"
__attribute__((constructor))
void hello_DOT_foo_DOT_main_SLASH_cljm_ns_init(void) {
@autoreleasepool {
hello_DOT_foo_DOT_main_SLASH_main = ^id(id x) {
return hello_DOT_foo_DOT_bar_SLASH_nslog(@"hi", nil);
};
}
}

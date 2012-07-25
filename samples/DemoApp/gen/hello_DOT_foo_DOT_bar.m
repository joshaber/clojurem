#import "hello_DOT_foo_DOT_bar.h"
//#import "cljm_DOT_core.h"
__attribute__((constructor))
void hello_DOT_foo_DOT_bar_SLASH_cljm_ns_init(void) {
hello_DOT_foo_DOT_bar_SLASH_blah = @"hi";
hello_DOT_foo_DOT_bar_SLASH_stuff = @[ @1, @2, @3 ];
hello_DOT_foo_DOT_bar_SLASH_uppers = ^id(id x) {
if(@NO) {
return @"hi";

} else {
return @"no";

}
};
hello_DOT_foo_DOT_bar_SLASH_nslog = ^id(id x) {
NSLog(@"%@", x);;
return nil;
};
hello_DOT_foo_DOT_bar_SLASH_uppercase_the_bitches = ^id(id x) {
return [x uppercaseString];
};
hello_DOT_foo_DOT_bar_SLASH_nslog(@"hi");
}
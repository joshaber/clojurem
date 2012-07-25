#import "hello_DOT_core.h"
//#import "cljm_DOT_core.h"
#import "hello_DOT_foo_DOT_bar.h"
__attribute__((constructor))
void hello_DOT_core_SLASH_cljm_ns_init(void) {
hello_DOT_core_SLASH_greet = ^id(id n) {
return hello_DOT_core_SLASH_js_STAR_(@"[cljm.core.str(~{}),cljm.core.str(~{})].join('')", @"Hello ", n);
};
hello_DOT_core_SLASH_sum = ^id(id xs) {
return hello_DOT_foo_DOT_bar_SLASH_sum(xs);
};
}
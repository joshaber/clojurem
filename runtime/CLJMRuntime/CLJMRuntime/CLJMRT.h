//
//  CLJMRT.h
//  CLJMRuntime
//
//  Created by Josh Abernathy on 7/26/12.
//  Copyright (c) 2012 Josh Abernathy. All rights reserved.
//

#import <Foundation/Foundation.h>

extern BOOL cljm_truthy(id object);

// Returns an object such that cljm_keyword(@":blah") == cljm_keyword(@":blah")
extern id<NSCopying> cljm_keyword(NSString *literal);
extern id<NSCopying> cljm_symbol(NSString *literal);

@class CLJMVar;

extern CLJMVar * cljm_var_def(NSString *name, id<NSCopying> value);
extern CLJMVar * cljm_var_lookup(NSString *name);
extern CLJMVar * cljm_var_bind(NSString *name, id<NSCopying> value);

extern void cljm_push_binding(void);
extern void cljm_pop_binding(void);

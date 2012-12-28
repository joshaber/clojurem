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

// Creates and interns a dynamic var with the given name and value.
// If value is nil, it does nothing and returns nil.
extern CLJMVar * cljm_var_def(NSString *name, id<NSCopying> value);

// Looks up a dynamic var of the given name. The lookup first searches
// queue-local bindings stack for a match before looking in the global table.
// Returns nil if no match was found.
extern CLJMVar * cljm_var_lookup(NSString *name);

// Creates and binds a new var of the given name and value to the top bindings
// table in the queue-local bindings stack. If there is no bindings table,
// it returns nil. If value is nil, it does nothing and returns nil.
extern CLJMVar * cljm_var_bind(NSString *name, id<NSCopying> value);

// Pushes a new binding table on to the queue-local bindings stack.
extern void cljm_push_binding(void);

// Pops the top binding table from the queue-local bindings stack. Raises an
// exception if there are no bindings tables on the queue-local bindings stack.
extern void cljm_pop_binding(void);

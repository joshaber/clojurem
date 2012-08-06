//
//  NSDictionary+CLJMInvokable.h
//  CLJMRuntime
//
//  Created by Josh Abernathy on 8/5/12.
//  Copyright (c) 2012 Josh Abernathy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLJMInvokable.h"


@interface NSDictionary (CLJMInvokable) <CLJMInvokable>

// Takes the first argument and looks up the object for that key. Asserts when
// given any more or less than 1 argument.
- (id)cljm_invoke:(NSArray *)arguments;

@end

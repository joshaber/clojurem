//
//  NSDictionary+CLJMInvokable.m
//  CLJMRuntime
//
//  Created by Josh Abernathy on 8/5/12.
//  Copyright (c) 2012 Josh Abernathy. All rights reserved.
//

#import "NSDictionary+CLJMInvokable.h"

@implementation NSDictionary (CLJMInvokable)

- (id)cljm_invoke:(NSArray *)arguments {
	NSParameterAssert(arguments.count == 1);

	id<NSCopying> key = arguments[0];
	return self[key];
}

@end

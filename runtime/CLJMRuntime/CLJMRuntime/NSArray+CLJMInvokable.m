//
//  NSArray+CLJMInvokable.m
//  CLJMRuntime
//
//  Created by Josh Abernathy on 8/5/12.
//  Copyright (c) 2012 Josh Abernathy. All rights reserved.
//

#import "NSArray+CLJMInvokable.h"

@implementation NSArray (CLJMInvokable)

- (id)cljm_invoke:(NSArray *)arguments {
	NSParameterAssert(arguments.count == 1);

	NSUInteger index = [arguments[0] unsignedIntegerValue];
	return self[index];
}

@end

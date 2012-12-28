//
//  CLJMFunction.m
//  CLJMRuntime
//
//  Created by Josh Abernathy on 8/5/12.
//  Copyright (c) 2012 Josh Abernathy. All rights reserved.
//

#import "CLJMFunction.h"

@implementation CLJMFunction

#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone {
	// The immutable life is the good life.
	return self;
}

#pragma mark API

- (instancetype)initWithBlock:(id)block {
	NSParameterAssert(block != NULL);

	self = [super init];
	if (self == nil) return nil;

	_block = [block copy];

	return self;
}

@end

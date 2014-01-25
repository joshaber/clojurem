//
//  CLJMVar.m
//  CLJMRuntime
//
//  Created by Josh Abernathy on 7/26/12.
//  Copyright (c) 2012 Josh Abernathy. All rights reserved.
//

#import "CLJMVar.h"

@implementation CLJMVar

#pragma mark API

- (id)initWithValue:(id)value {
	self = [super init];
	if (self == nil) return nil;
	
	_value = value;
	
	return self;
}

@end

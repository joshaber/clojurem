//
//  CLJMVar.m
//  CLJMRuntime
//
//  Created by Josh Abernathy on 7/26/12.
//  Copyright (c) 2012 Josh Abernathy. All rights reserved.
//

#import "CLJMVar.h"


@implementation CLJMVar


#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone {
	return self;
}


#pragma mark API

- (id)initWithValue:(id<NSCopying>)value {
	self = [super init];
	if(self == nil) return nil;
	
	_value = [value copyWithZone:nil];
	
	return self;
}

@end

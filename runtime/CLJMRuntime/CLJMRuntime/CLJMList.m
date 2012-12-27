//
//  CLJMList.m
//  CLJMRuntime
//
//  Created by Josh Abernathy on 7/26/12.
//  Copyright (c) 2012 Josh Abernathy. All rights reserved.
//

#import "CLJMList.h"

@implementation CLJMList

#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

#pragma mark NSObject

- (NSUInteger)hash {
    return [self.head hash];
}

- (BOOL)isEqual:(CLJMList *)list {
    if (![list isKindOfClass:CLJMList.class]) return NO;
    if (![self.head isEqual:list.head]) return NO;
	
    return [self.tail isEqual:list.tail];
}

- (NSString *)description {
    NSMutableString *valuesString = [NSMutableString stringWithString:@"("];
	
    CLJMList *next = self;
    // Compare against value to handle the case of the empty list where self
    // would have a nil value.
    while (next.head != nil) {
        [valuesString appendFormat:@"%@", next.head];
        next = next.tail;
        if (next != nil) [valuesString appendString:@", "];
    }
	
    [valuesString appendString:@")"];
	
    return valuesString;
}


#pragma mark API

+ (id)listWithValues:(id)value, ... NS_REQUIRES_NIL_TERMINATION {
    NSMutableArray *values = [NSMutableArray array];
    va_list args;
    va_start(args, value);
    for (id currentValue = value; currentValue != nil; currentValue = va_arg(args, id)) {
        [values addObject:currentValue];
    }
    va_end(args);
	
    CLJMList *last = nil;
    for (id currentValue in [values reverseObjectEnumerator]) {
        CLJMList *list = [[self alloc] initWithHead:currentValue tail:last];
        last = list;
    }
	
    return last;
}

- (id)initWithHead:(id)head tail:(CLJMList *)tail {
    self = [super init];
    if (self == nil) return nil;
	
    _head = head;
    _tail = [tail copy];
	
    return self;
}

- (instancetype)conjoin:(id)value {
    return [[self.class alloc] initWithHead:value tail:self];
}

@end

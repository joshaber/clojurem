//
//  CLJMList.h
//  CLJMRuntime
//
//  Created by Josh Abernathy on 7/26/12.
//  Copyright (c) 2012 Josh Abernathy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLJMList : NSObject <NSCopying>

@property (nonatomic, strong, readonly) id head;
@property (nonatomic, copy, readonly) CLJMList *tail;

+ (id)listWithValues:(id)value, ... NS_REQUIRES_NIL_TERMINATION;

- (id)initWithHead:(id)value tail:(CLJMList *)next;

- (instancetype)conjoin:(id)value;

@end

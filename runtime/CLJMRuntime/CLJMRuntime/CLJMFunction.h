//
//  CLJMFunction.h
//  CLJMRuntime
//
//  Created by Josh Abernathy on 8/5/12.
//  Copyright (c) 2012 Josh Abernathy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CLJMInvokable.h"

@interface CLJMFunction : NSObject <CLJMInvokable, NSCopying>

@property (nonatomic, readonly, copy) id (^block)(NSArray *arguments);

- (instancetype)initWithBlock:(id (^)(NSArray *arguments))block;

@end

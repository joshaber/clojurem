//
//  CLJMFunction.h
//  CLJMRuntime
//
//  Created by Josh Abernathy on 8/5/12.
//  Copyright (c) 2012 Josh Abernathy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLJMFunction : NSObject <NSCopying>

@property (nonatomic, readonly, copy) id block;

- (instancetype)initWithBlock:(id)block;

@end

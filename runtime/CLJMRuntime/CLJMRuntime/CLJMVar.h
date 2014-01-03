//
//  CLJMVar.h
//  CLJMRuntime
//
//  Created by Josh Abernathy on 7/26/12.
//  Copyright (c) 2012 Josh Abernathy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLJMVar : NSObject <NSCopying>

@property (nonatomic, readonly, strong) id value;

- (id)initWithValue:(id)value;

@end

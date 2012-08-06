//
//  CLJMInvokable.h
//  CLJMRuntime
//
//  Created by Josh Abernathy on 8/5/12.
//  Copyright (c) 2012 Josh Abernathy. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol CLJMInvokable <NSObject>

// Invoke the thing with the given arguments.
// The method is prefixed so that we can implement CLJMInvokable on existing
// classes and still feel good about ourselves.
- (id)cljm_invoke:(NSArray *)arguments;

@end

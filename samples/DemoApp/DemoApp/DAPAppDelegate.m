//
//  DAPAppDelegate.m
//  DemoApp
//
//  Created by Josh Abernathy on 7/24/12.
//  Copyright (c) 2012 Josh Abernathy. All rights reserved.
//

#import "DAPAppDelegate.h"
#import "hello_DOT_foo_DOT_bar.h"

@implementation DAPAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	// Insert code here to initialize your application
	
	NSLog(@"%@", hello_DOT_foo_DOT_bar_SLASH_stuff);
	hello_DOT_foo_DOT_bar_SLASH_nslog(hello_DOT_foo_DOT_bar_SLASH_stuff);
}

@end

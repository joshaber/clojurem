//
//  DAPAppDelegate.m
//  DemoApp
//
//  Created by Josh Abernathy on 7/24/12.
//  Copyright (c) 2012 Josh Abernathy. All rights reserved.
//

#import "DAPAppDelegate.h"
#import "hello_DOT_foo_DOT_bar.h"
#import <CLJMRuntime/CLJMRuntime.h>

@interface DAPAppDelegate ()
@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextField *outputField;
@property (assign) IBOutlet NSTextField *inputField;
@end

@implementation DAPAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification {	
	NSLog(@"%@", hello_DOT_foo_DOT_bar_SLASH_stuff);
	if(cljm_keyword(@":blah/stuff") == cljm_keyword(@":blah/stuff")) {
		NSLog(@"YUUUP");
	}
	
	NSDictionary *d = (NSDictionary *) hello_DOT_foo_DOT_bar_SLASH_people.value;
	id iceCream = [(id<CLJMInvokable>) hello_DOT_foo_DOT_bar_SLASH_favorite_ice_cream.value cljm_invoke:@[ [d objectForKey:cljm_keyword(@":josh")] ]];
	NSLog(@"iceCream: %@", iceCream);
}

- (IBAction)coolStoryBro:(id)sender {
	self.outputField.stringValue = cljm_invoke(hello_DOT_foo_DOT_bar_SLASH_cool_storyify, @[ self.inputField.stringValue ]);
}

@end

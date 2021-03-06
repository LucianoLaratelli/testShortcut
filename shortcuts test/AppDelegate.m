//
//  AppDelegate.m
//  shortcuts test
//
//  Created by Luciano Laratelli on 8/3/21.
//

#import "AppDelegate.h"
@import Intents;
@import testUtilities;
#import "CreateTaskIntentHandler.h"

@interface AppDelegate ()


@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

- (id)application:(NSApplication *)application handlerForIntent:(INIntent *)intent
{
    if ([intent isKindOfClass:[CreateTaskIntent class]]){
        return [[CreateTaskIntentHandler alloc] init];
    }
    return nil;
}

@end

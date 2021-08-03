//
//  IntentHandler.m
//  intents-extension
//
//  Created by Luciano Laratelli on 8/3/21.
//

#import "IntentHandler.h"

@interface IntentHandler ()

@end

@implementation IntentHandler

- (id)handlerForIntent:(INIntent *)intent {
    // This is the default implementation.  If you want different objects to handle different intents,
    // you can override this and return the handler you want for that particular intent.
    
    return self;
}

@end

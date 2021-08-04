//
//  CreateTaskIntentHandler.m
//  CreateTaskIntentHandler
//
//  Created by Luciano Laratelli on 8/3/21.
//

#import "CreateTaskIntentHandler.h"
@import Intents;

@implementation CreateTaskIntentHandler

- (void)handleCreateTask:(nonnull CreateTaskIntent *)intent completion:(nonnull void (^)(CreateTaskIntentResponse * _Nonnull))completion {
    CreateTaskIntentResponse *response =[[CreateTaskIntentResponse alloc] initWithCode:CreateTaskIntentResponseCodeSuccess userActivity:nil];
    
    Task *task = [[Task alloc] initWithIdentifier:[intent Title] displayString:[intent Title]];
    [task setDueDate:[intent dueDate]];
    [task setTitle:[intent Title]];
    
    [response setTask:task];
    
    NSLog(@"created task with title %@ and due date %@", [intent Title], [[intent dueDate] date]);
    
    completion(response);
}

- (void)resolveDueDateForCreateTask:(nonnull CreateTaskIntent *)intent withCompletion:(nonnull void (^)(CreateTaskDueDateResolutionResult * _Nonnull))completion {
    NSDateComponents * dueDateComponents = [intent dueDate];
    if (dueDateComponents == nil) {
        return completion([CreateTaskDueDateResolutionResult needsValue]);
    }
    if([[dueDateComponents date] compare: [NSDate date]] == NSOrderedAscending){
        return completion([CreateTaskDueDateResolutionResult unsupportedWithReason:CreateTaskDueDateUnsupportedReasonInvalidDate]);
    }
    
    return completion([CreateTaskDueDateResolutionResult successWithResolvedDateComponents:[intent dueDate]]);
}

- (void)resolveTitleForCreateTask:(nonnull CreateTaskIntent *)intent withCompletion:(nonnull void (^)(INStringResolutionResult * _Nonnull))completion {
    if ([intent Title] == nil){
        return completion([INStringResolutionResult needsValue]);
    }
    return completion([INStringResolutionResult successWithResolvedString:[intent Title]]);
}

@end

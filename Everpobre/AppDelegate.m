//
//  AppDelegate.m
//  Everpobre
//
//  Created by Fernando Rodríguez Romero on 07/04/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "AGTCoreDataStack.h"
#import "AppDelegate.h"
#import "AGTNotebook.h"
#import "AGTNote.h"

@interface AppDelegate ()
@property (nonatomic, strong) AGTCoreDataStack *stack;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // Creamos una instancia del stack
    self.stack = [AGTCoreDataStack coreDataStackWithModelName:@"Model"];
    
    // Creamos datos chorras
    [self createDummyData];
    
    
    self.window = [[UIWindow alloc] initWithFrame:
                   [[UIScreen mainScreen] bounds]];
    
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


-(void) createDummyData{
    
    AGTNotebook *exs = [AGTNotebook notebookWithName:@"Libreta1" context:self.stack.context];
    
    [AGTNote noteWithName:@"Nota1"
                 notebook:exs
                  context:self.stack.context];
    [AGTNote noteWithName:@"Nota2"
                 notebook:exs
                  context:self.stack.context];
    [AGTNote noteWithName:@"Nota3"
                 notebook:exs
                  context:self.stack.context];
    [AGTNote noteWithName:@"Nota4"
                 notebook:exs
                  context:self.stack.context];
    AGTNote *n5 = [AGTNote noteWithName:@"Nota5"
                 notebook:exs
                  context:self.stack.context];
    
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:[AGTNote entityName]];
    req.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:AGTNoteAttributes.name
                                                          ascending:YES
                                                           selector:@selector(caseInsensitiveCompare:)],
                            [NSSortDescriptor sortDescriptorWithKey:AGTNoteAttributes.modificationDate
                                                          ascending:NO]];
    req.fetchBatchSize = 20;
    //req.predicate = [NSPredicate predicateWithFormat:@"notebook = %@", exs];
    
    NSArray *results = [self.stack executeFetchRequest:req
                                            errorBlock:^(NSError *error) {
                                                NSLog(@"Error al buscar %@", error);
                                            }];
    [self.stack.context deleteObject:n5];
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"Error al guardar %@", error);

    }];
    
}
















@end

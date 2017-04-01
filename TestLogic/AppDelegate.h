//
//  AppDelegate.h
//  TestLogic
//
//  Created by Sahnawaj Biswas on 13/03/17.
//  Copyright © 2017 Sahnawaj Biswas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


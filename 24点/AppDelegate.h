//
//  AppDelegate.h
//  24点
//
//  Created by 潘若冰 on 2016/12/11.
//  Copyright © 2016年 潘若冰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


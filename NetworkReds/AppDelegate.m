//
//  AppDelegate.m
//  NetworkReds
//
//  Created by 方新俊 on 16/7/2.
//  Copyright © 2016年 方新俊. All rights reserved.
//

#import "AppDelegate.h"
#import "NRTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    [self setRootVc];

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

- (void)setRootVc
{
//    LSUserInfo *user = [LSUserInfo queryUserInfo];
//    id obj = [UserDefaults queryObjectForKey:LSUser_is_open];
    
//    if (user.token.length > 0 && user.status == UserStatus_normal) {
        NRTabBarController *vc = [UIStoryboard storyboardWithName:@"Main"
                                                       identifier:NSStringFromClass([NRTabBarController class])];
        self.window.rootViewController = vc;
//    } else if (obj) {
//        BOOL isOpen = [obj boolValue];
//        if (isOpen && user.token.length > 0) {   // 首页开放打开 && 已登录 && 审核通过
//            LSTabBarController *vc = [UIStoryboard storyboardWithName:@"Main"
//                                                           identifier:NSStringFromClass([LSTabBarController class])];
//            self.window.rootViewController = vc;
//        } else {    // 首页开放关闭 || 未登录 || 审核未通过
//            LSNavigationController *vc = [UIStoryboard storyboardWithName:@"Login"
//                                                               identifier:NSStringFromClass([LSNavigationController class])];
//            self.window.rootViewController = vc;
//        }
//    } else {
//        LSNavigationController *vc = [UIStoryboard storyboardWithName:@"Login"
//                                                           identifier:NSStringFromClass([LSNavigationController class])];
//        self.window.rootViewController = vc;
//    }
}

@end

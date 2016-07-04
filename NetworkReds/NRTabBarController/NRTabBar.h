//
//  NRTabBar.h
//  NetworkReds
//
//  Created by 方新俊 on 16/7/4.
//  Copyright © 2016年 方新俊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NRTabBar : UITabBar
@property (nonatomic, copy) void  (^ tabBarClicked)(NSUInteger from, NSUInteger to);
@property (nonatomic, assign) NSUInteger            selectedIndex;

- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@end

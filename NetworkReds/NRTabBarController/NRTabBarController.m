//
//  NRTabBarController.m
//  NetworkReds
//
//  Created by 方新俊 on 16/7/3.
//  Copyright © 2016年 方新俊. All rights reserved.
//

#import "NRTabBarController.h"
#import "NRTabBar.h"
#import <objc/message.h>
#import "NRNavigationController.h"

@interface NRTabBarController ()
@property (nonatomic, strong) NRTabBar                  *tabbar;
@property (nonatomic, strong) UINavigationController    *car;

@end

@implementation NRTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTabbar];
    [self addChildVC];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addTabbar
{
    _tabbar = [[NRTabBar alloc] init];
    [self setValue:_tabbar forKey:@"tabBar"];
    
    __weak __typeof(self) weakSelf = self;
    [_tabbar setTabBarClicked:^(NSUInteger from, NSUInteger to) {
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.selectedIndex = to;
        [strongSelf tabBarClicked];
    }];
}

- (void)tabBarClicked
{
    UINavigationController *nc = self.selectedViewController;
    UIViewController *vc = nc.topViewController;
    BOOL responds = class_respondsToSelector([vc class],
                                             @selector(tabBar:didSelectItem:));
    
    if (!responds) return;
    Method method = class_getInstanceMethod([vc class],
                                            @selector(tabBar:didSelectItem:));
    ((int (*)(id, Method, UITabBar *, UITabBarItem *))method_invoke)((id)vc,
                                                                     method,
                                                                     self.tabbar,
                                                                     self.tabbar.selectedItem);
}

- (void)addChildVC
{
    UINavigationController *home = [self storyboardWithName:@"Home"];
    [self addVCWithvc:home
                title:@"首页"
                image:@"tab_home_normal"
        selectedImage:@"tab_home_selected"
           badgeValue:@"0"];
    
    UINavigationController *category = [self storyboardWithName:@"Category"];
    [self addVCWithvc:category
                title:@"分类"
                image:@"tab_category_normal"
        selectedImage:@"tab_category_selected"
           badgeValue:@"0"];
    
    
    _car = [self storyboardWithName:@"Ad"];
    [self addVCWithvc:_car
                title:@"广告"
                image:@"tab_shoppingcart_normal"
        selectedImage:@"tab_shoppingcart_selected"
           badgeValue:[NSString stringWithFormat:@"%zd", 0]];
    
    UINavigationController *me = [self storyboardWithName:@"Me"];
    [self addVCWithvc:me
                title:@"我的"
                image:@"tab_my_normal"
        selectedImage:@"tab_my_selected"
           badgeValue:@"0"];
}

- (void)addVCWithvc:(UIViewController *)vc
              title:(NSString *)title
              image:(NSString *)image
      selectedImage:(NSString *)selectedImage
         badgeValue:(NSString *)badgeValue
{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    UIImage *selected = [UIImage imageNamed:selectedImage];
    vc.tabBarItem.selectedImage = [selected imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self addChildViewController:vc];
    
    [_tabbar addTabBarButtonWithItem:vc.tabBarItem];
    vc.tabBarItem.badgeValue = badgeValue;
}

- (id)storyboardWithName:(NSString *)name
{
    return [UIStoryboard storyboardWithName:name
                                 identifier:NSStringFromClass([NRNavigationController class])];
}

@end

//
//  NRNavigationController.m
//  NetworkReds
//
//  Created by 方新俊 on 16/7/4.
//  Copyright © 2016年 方新俊. All rights reserved.
//

#import "NRNavigationController.h"

@implementation NRNavigationController

+ (void)initialize
{
    [super initialize];
    
    [self setNavthem];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationBar.translucent = NO;
}

+ (void)setBarButtonThem
{
    UIBarButtonItem *barBtn = [UIBarButtonItem appearance];
    
    // 设置默认状态下的文字属性
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    dictM[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [barBtn setTitleTextAttributes:dictM forState:UIControlStateNormal];
    // 设置高亮状态下文字属性
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:dictM];
    dic[NSForegroundColorAttributeName] = [UIColor redColor];
    [barBtn setTitleTextAttributes:dic forState:UIControlStateHighlighted];
}

+ (void)setNavthem
{
    
    UINavigationBar *navBar = [UINavigationBar appearance];
    navBar.tintColor = [UIColor whiteColor];
    navBar.barTintColor = NROrangeColor;
    
    navBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor],
                                   NSFontAttributeName : [UIFont systemFontOfSize:19]};
    
    [navBar setBackgroundImage:[UIImage imageWithColor:NROrangeColor]
                 forBarMetrics:UIBarMetricsDefault];
    navBar.shadowImage = [[UIImage alloc] init];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backBarButtonItemWithTarget:self
                                                                                                action:@selector(leftBarButtonItemClicked)];
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)leftBarButtonItemClicked
{
    [self popViewControllerAnimated:YES];
}

@end

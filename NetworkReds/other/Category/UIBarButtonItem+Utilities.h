//
//  UIBarButtonItem+Utilities.h
//  NetworkReds
//
//  Created by 方新俊 on 16/7/4.
//  Copyright © 2016年 方新俊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Utilities)

- (instancetype)initWithImage:(NSString *)img
                       target:(id)target
                       action:(SEL)action;
+ (instancetype)barBtnItemWithImage:(NSString *)img
                             target:(id)target
                             action:(SEL)action;

- (instancetype)initWithTitle:(NSString *)title
                       target:(id)target
                       action:(SEL)action;
+ (instancetype)barBtnItemWithTitle:(NSString *)title
                             target:(id)target
                             action:(SEL)action;

+ (instancetype)searchBarButtonItemWithTarget:(id)target
                                       action:(SEL)action;
+ (instancetype)backBarButtonItemWithTarget:(id)target
                                     action:(SEL)action;

@end

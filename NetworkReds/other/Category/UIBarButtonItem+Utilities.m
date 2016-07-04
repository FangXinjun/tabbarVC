//
//  UIBarButtonItem+Utilities.m
//  NetworkReds
//
//  Created by 方新俊 on 16/7/4.
//  Copyright © 2016年 方新俊. All rights reserved.
//

#import "UIBarButtonItem+Utilities.h"

#import "UIImage+Utilities.h"

@implementation UIBarButtonItem (Utilities)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"

- (instancetype)initWithImage:(NSString *)img
                       target:(id)target
                       action:(SEL)action

{
    UIImage *image = [UIImage imageNamed:img];
    
    return [[UIBarButtonItem alloc] initWithImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                            style:UIBarButtonItemStyleDone
                                           target:target
                                           action:action];

}

+ (instancetype)barBtnItemWithImage:(NSString *)img
                             target:(id)target
                             action:(SEL)action

{
    return [[self alloc] initWithImage:img
                                target:target
                                action:action];
}

- (instancetype)initWithTitle:(NSString *)title target:(id)target action:(SEL)action
{
    return [[UIBarButtonItem alloc] initWithTitle:title
                                            style:UIBarButtonItemStylePlain
                                           target:target
                                           action:action];
    

}

+ (instancetype)barBtnItemWithTitle:(NSString *)title
                             target:(id)target
                             action:(SEL)action
{
    return [[self alloc] initWithTitle:title
                                target:target
                                action:action];
}

+ (instancetype)backBarButtonItemWithTarget:(id)target
                                     action:(SEL)action
{
    return [self barBtnItemWithImage:@"toolbar_back"
                              target:target
                              action:action];
}

+ (instancetype)searchBarButtonItemWithTarget:(id)target
                                       action:(SEL)action
{
    return [self barBtnItemWithImage:@"toolbar_search"
                              target:target
                              action:action];
}

@end

//
//  UIStoryboard+Utilities.m
//  NetworkReds
//
//  Created by 方新俊 on 16/7/4.
//  Copyright © 2016年 方新俊. All rights reserved.
//

#import "UIStoryboard+Utilities.h"

@implementation UIStoryboard (Utilities)

+ (id)storyboardWithName:(NSString *)name identifier:(NSString *)identifier
{
    id obj = [[self storyboardWithName:name bundle:[NSBundle mainBundle]]
              instantiateViewControllerWithIdentifier:identifier];
    
    return obj;
}

@end

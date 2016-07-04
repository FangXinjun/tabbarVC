//
//  UIImage+Utilities.h
//  NetworkReds
//
//  Created by 方新俊 on 16/7/4.
//  Copyright © 2016年 方新俊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Utilities)

#pragma mark - resizable

+ (UIImage *)resizableImage:(NSString *)name;

#pragma mark - Color
+ (UIImage *)imageWithColor:(UIColor *)color;


+ (UIImage *)imageWithColor:(UIColor *)color
                       size:(CGSize)size;

/**
 *  图片透明度
 */
- (UIImage *)imageWithAlpha:(CGFloat)alpha;

/**
 *  图片圆角
 */
+ (id)createRoundedRectImage:(UIImage *)image
                        size:(CGSize)size
                      radius:(NSInteger)r;

@end

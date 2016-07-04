//
//  NRBadgeButton.m
//  NetworkReds
//
//  Created by 方新俊 on 16/7/4.
//  Copyright © 2016年 方新俊. All rights reserved.
//

#import "NRBadgeButton.h"

@implementation NRBadgeButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
                
        self.hidden = YES;
        self.userInteractionEnabled = NO;
        self.layer.masksToBounds = YES;
        
        
        self.titleLabel.font = [UIFont systemFontOfSize:7];
        UIImage *image = [UIImage imageNamed:@"shoppinp_number_bg"];
        [self setBackgroundImage:image
                        forState:UIControlStateNormal];
        
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 1, 0, 0);
        
        CGFloat wh = 16;
        CGFloat x = NRScreenWidth / 4 / 2 + (image.size.width / 4) + 3;
        
        self.frame = CGRectMake(x, 2, wh, wh);
    }
    return self;
}

- (void)setBadgeValue:(NSString *)badgeValue
{
    if (badgeValue.length > 0) {
        
        NSUInteger value = badgeValue.integerValue;
        
        self.hidden = value == 0;
        
        NSString *text = value > 99 ? @"99+" : badgeValue;
        
        [self setTitle:text forState:UIControlStateNormal];
    }
}


@end

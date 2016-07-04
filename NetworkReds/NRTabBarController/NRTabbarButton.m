//
//  NRTabbarButton.m
//  NetworkReds
//
//  Created by 方新俊 on 16/7/4.
//  Copyright © 2016年 方新俊. All rights reserved.
//

#import "NRTabbarButton.h"
#import "NRBadgeButton.h"

@interface NRTabbarButton ()

@property (nonatomic, strong) NRBadgeButton  *badgeButton;

@end

@implementation NRTabbarButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        [self setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    }
    return self;
}

- (void)dealloc
{
    [_item removeObserver:self forKeyPath:@"badgeValue"];
}

- (NRBadgeButton *)badgeButton
{
    if (!_badgeButton) {
        
        _badgeButton = [[NRBadgeButton alloc] init];
        [self addSubview:_badgeButton];
    }
    return _badgeButton;
}

- (void)setHighlighted:(BOOL)highlighted {}

- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    
    [self setTitle:item.title forState:UIControlStateNormal];
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
    
    [_item addObserver:self
            forKeyPath:@"badgeValue"
               options:NSKeyValueObservingOptionNew
               context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    UITabBarItem *item = object;
    
    self.badgeButton.badgeValue = item.badgeValue;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    UIImage *image =  [self imageForState:UIControlStateNormal];
    CGFloat titleY = image.size.height + 5;
    CGFloat titleHeight = self.bounds.size.height - titleY;
    
    return CGRectMake(0, titleY, self.bounds.size.width,  titleHeight);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    UIImage *image = [self imageForState:UIControlStateNormal];
    
    return CGRectMake(0, 7, contentRect.size.width, image.size.height);
}


@end

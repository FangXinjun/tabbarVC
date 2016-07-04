//
//  NRTabBar.m
//  NetworkReds
//
//  Created by 方新俊 on 16/7/4.
//  Copyright © 2016年 方新俊. All rights reserved.
//

#import "NRTabBar.h"
#import "NRTabbarButton.h"

@interface NRTabBar ()

@property (nonatomic, assign) NSUInteger        count;
@property (nonatomic, strong) NRTabbarButton    *selectedBtn;

@end

@implementation NRTabBar

- (instancetype)init
{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[NRTabbarButton class]] && view.tag == selectedIndex) {
            [self btnClicked:(NRTabbarButton *)view];
        }
    }
}

- (void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    NRTabbarButton *btn = [[NRTabbarButton alloc] init];
    [btn setTitle:item.title forState:UIControlStateNormal];
    [btn setTitleColor:NRBlackTextColor forState:UIControlStateNormal];
    [btn setTitleColor:NROrangeColor forState:UIControlStateSelected];
    [btn setImage:item.image forState:UIControlStateNormal];
    [btn setImage:item.selectedImage forState:UIControlStateSelected];
    [btn addTarget:self
            action:@selector(btnClicked:)
  forControlEvents:UIControlEventTouchDown];
    btn.tag = _count;
    btn.item = item;
    [self addSubview:btn];
    
    if (_count == 0) {
        [self btnClicked:btn];
    }
    
    _count++;
}

- (void)btnClicked:(NRTabbarButton *)btn
{
    if (_selectedBtn != nil) {
        if (btn.tag == _selectedBtn.tag) return;
    }
    
    NSUInteger lastIndex = _selectedBtn.tag;
    
    _selectedBtn.selected = NO;
    btn.selected = YES;
    _selectedBtn = btn;
    
    if (self.tabBarClicked) {
        self.tabBarClicked(lastIndex, btn.tag);
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
    CGFloat buttonY = 0;
    CGFloat buttonW = width / _count;
    CGFloat buttonH = height;
    NSInteger index = 0;
    
    for (UIView *view in self.subviews) {
        
        if ([view isKindOfClass:[NRTabbarButton class]]) {
            CGFloat buttonX = index * buttonW;
            view.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
            index++;
            
        } else if ([view isKindOfClass:[UIImageView class]]) {
            
        } else {
            [view removeFromSuperview];
        }
    }
}


@end

//
//  MXTabBar.m
//  MxWeibo
//
//  Created by apple on 15/12/27.
//  Copyright © 2015年 vizz. All rights reserved.
//

#import "MXTabBar.h"
#import "UIView+Extension.h"

@interface MXTabBar()

@property (nonatomic, weak) UIButton *plusBtn;

@end

@implementation MXTabBar

- (instancetype)init
{
    if (self = [super init]) {
        UIButton *plusBtn = [[UIButton alloc] init];
        [plusBtn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        plusBtn.size = plusBtn.currentBackgroundImage.size;
        [self addSubview:plusBtn];
        self.plusBtn = plusBtn;
    }
    return self;
}


- (void)plusClick
{
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.delegate tabBarDidClickPlusButton:self];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.plusBtn.centerX = self.width * 0.5;
    self.plusBtn.centerY = self.height * 0.5;
    
    CGFloat width = self.width / 5;
    Class class = NSClassFromString(@"UITabBarButton");
    
    int index = 0;
    
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:class]) {
            subView.width = width;
            subView.x = index * width;
            
            index++;
            if (index == 2) {
                index++;
            }
        }
    }
}

@end

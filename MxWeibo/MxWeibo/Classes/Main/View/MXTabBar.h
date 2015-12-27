//
//  MXTabBar.h
//  MxWeibo
//
//  Created by apple on 15/12/27.
//  Copyright © 2015年 vizz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MXTabBar;

@protocol MXTabBarDelegate <UITabBarDelegate>

- (void)tabBarDidClickPlusButton:(MXTabBar *)tabBar;

@end

@interface MXTabBar : UITabBar

@property (nonatomic, weak) id<MXTabBarDelegate> delegate;

@end

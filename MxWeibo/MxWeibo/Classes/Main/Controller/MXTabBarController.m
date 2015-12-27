//
//  MXTabBarController.m
//  MxWeibo
//
//  Created by apple on 15/12/13.
//  Copyright © 2015年 vizz. All rights reserved.
//

#import "MXTabBarController.h"
#import "MXNavigationController.h"
#import "MXHomeViewController.h"
#import "MXMessageCenterViewController.h"
#import "MXDiscoverViewController.h"
#import "MXProfileViewController.h"
#import "MXTabBar.h"

@interface MXTabBarController()<MXTabBarDelegate>

@end

@implementation MXTabBarController

+ (void)initialize
{
    UITabBarItem *item = [UITabBarItem appearance];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [item setTitleTextAttributes:attrs forState:UIControlStateSelected];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addChildVc:[[MXHomeViewController alloc] init] title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    [self addChildVc:[[MXMessageCenterViewController alloc] init] title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    [self addChildVc:[[MXDiscoverViewController alloc] init] title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    [self addChildVc:[[MXProfileViewController alloc] init] title:@"我的" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    
    MXTabBar *tabBar = [[MXTabBar alloc] init];
    tabBar.delegate = self;
    [self setValue:tabBar forKeyPath:@"tabBar"];
}


- (void)addChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    MXNavigationController *nav = [[MXNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

- (void)tabBarDidClickPlusButton:(MXTabBar *)tabBar
{
    
}

@end

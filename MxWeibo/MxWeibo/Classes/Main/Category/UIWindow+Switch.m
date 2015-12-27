//
//  UIWindow+Switch.m
//  MxWeibo
//
//  Created by apple on 15/12/13.
//  Copyright © 2015年 vizz. All rights reserved.
//

#import "UIWindow+Switch.h"
#import "MXNewfeatureViewController.h"
#import "MXTabBarController.h"

@implementation UIWindow (Switch)

- (void)switchRootViewController
{
    self.rootViewController = [[MXTabBarController alloc] init];
}

@end

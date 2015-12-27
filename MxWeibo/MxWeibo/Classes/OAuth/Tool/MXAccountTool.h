//
//  MXAccountTool.h
//  MxWeibo
//
//  Created by apple on 15/12/13.
//  Copyright © 2015年 vizz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MXAccount.h"

@interface MXAccountTool : NSObject

+ (BOOL)saveAccount:(MXAccount *)account;

+ (MXAccount *)account;

@end

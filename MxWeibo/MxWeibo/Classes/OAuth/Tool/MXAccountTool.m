//
//  MXAccountTool.m
//  MxWeibo
//
//  Created by apple on 15/12/13.
//  Copyright © 2015年 vizz. All rights reserved.
//

#import "MXAccountTool.h"

#define MXAccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.archive"]

@implementation MXAccountTool

+ (BOOL)saveAccount:(MXAccount *)account
{
    BOOL result = [NSKeyedArchiver archiveRootObject:account toFile:MXAccountPath];
    
    return result;
}

+ (MXAccount *)account
{
    MXAccount *acccount = [NSKeyedUnarchiver unarchiveObjectWithFile:MXAccountPath];
    
    if (acccount == nil) return nil;
    
    //判断是否过期
    NSDate *date = [NSDate date];
    NSDate *endDate = [acccount.create_time dateByAddingTimeInterval:acccount.expires_in.doubleValue];
        
    if ([endDate compare:date] != NSOrderedDescending) {
        return nil;
    }
    
    return acccount;
}

@end

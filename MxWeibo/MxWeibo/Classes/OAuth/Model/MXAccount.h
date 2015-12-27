//
//  MXAccount.h
//  MxWeibo
//
//  Created by apple on 15/12/13.
//  Copyright © 2015年 vizz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MXAccount : NSObject<NSCoding>

@property (nonatomic, copy) NSString *access_token;

@property (nonatomic, strong) NSNumber *expires_in;

@property (nonatomic, strong) NSDate *create_time;

@property (nonatomic, copy) NSString *uid;

+ (MXAccount *)accountWithDict:(NSDictionary *)dict;

@end

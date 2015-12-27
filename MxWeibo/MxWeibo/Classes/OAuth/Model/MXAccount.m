//
//  MXAccount.m
//  MxWeibo
//
//  Created by apple on 15/12/13.
//  Copyright © 2015年 vizz. All rights reserved.
//

#import "MXAccount.h"

@implementation MXAccount

+ (MXAccount *)accountWithDict:(NSDictionary *)dict
{
    MXAccount *account = [[MXAccount alloc] init];
    
    account.access_token = dict[@"access_token"];
    account.expires_in = dict[@"expires_in"];
    account.uid = dict[@"uid"];
    
    //成功获取token后创建时间
    account.create_time = [NSDate date];
    
    return account;
}

- (void)encodeWithCoder:(NSCoder *)encode
{
    [encode encodeObject:self.access_token forKey:@"access_token"];
    [encode encodeObject:self.expires_in forKey:@"expires_in"];
    [encode encodeObject:self.uid forKey:@"uid"];
    [encode encodeObject:self.create_time forKey:@"create_time"];
}


- (instancetype)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.access_token = [decoder decodeObjectForKey:@"access_token"];
        self.expires_in = [decoder decodeObjectForKey:@"expires_in"];
        self.uid = [decoder decodeObjectForKey:@"uid"];
        self.create_time = [decoder decodeObjectForKey:@"create_time"];
    }
    return self;
}

@end

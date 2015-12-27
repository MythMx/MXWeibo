//
//  MXHttpTool.h
//  MxWeibo
//
//  Created by apple on 15/12/13.
//  Copyright © 2015年 vizz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface MXHttpTool : NSObject
+ (AFHTTPRequestOperation *)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
+ (AFHTTPRequestOperation *)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id json))success failure:(void (^)(NSError *error))failure;
@end

//
//  NetRequest.h
//  Myapp
//
//  Created by wangzhiwei8 on 2018/12/28.
//  Copyright © 2018年 wangzhiwei8. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetRequest : NSObject

#pragma POST请求
+ (void) NetRequestPOSTWithRequestURL:(NSString *) requestURLString
                        WithParameter:(NSDictionary *) parameter
                 WithReturnValeuBlock:(ReturnValueBlock) block
                   WithErrorCodeBlock:(ErrorCodeBlock) errorBlock;

#pragma GET请求
+ (void) NetRequestGETWithRequestURL:(NSString *) requestURLString
                        WithParameter:(NSDictionary *) parameter
                 WithReturnValeuBlock:(ReturnValueBlock) block
                   WithErrorCodeBlock:(ErrorCodeBlock) errorBlock;

#pragma DOWNLOAD请求
+ (void) NetRequestDownloadWithRequestURL:(NSString *) requestURLString
                        WithParameter:(NSDictionary *) parameter
                 WithReturnValeuBlock:(ReturnValueBlock) block
                   WithErrorCodeBlock:(ErrorCodeBlock) errorBlock;


@end

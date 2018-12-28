//
//  NetRequest.m
//  Myapp
//
//  Created by wangzhiwei8 on 2018/12/28.
//  Copyright © 2018年 wangzhiwei8. All rights reserved.
//

#import "NetRequest.h"
#import "AppDelegate.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "KVNProgress.h"

@implementation NetRequest

#pragma --mark GET请求方式
+ (void) NetRequestGETWithRequestURL: (NSString *) requestURLString
                       WithParameter: (NSDictionary *) parameter
                WithReturnValeuBlock: (ReturnValueBlock) block
                  WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [KVNProgress show];
    [KVNProgress showWithStatus:@"加载中..."];
    AppDelegate *appDlg = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSParameterAssert([appDlg.conn isKindOfClass: [Reachability class]]);
    NetworkStatus status = [appDlg.conn currentReachabilityStatus];
    if (status == NotReachable) {
        [KVNProgress dismiss];
        errorBlock(@"无网络连接!");
        return;
    }
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:requestURLString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [KVNProgress dismiss];
        block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [KVNProgress dismiss];
        NSLog(@"%@",error.description);
        errorBlock(error.description);
    }];
}

#pragma --mark POST请求方式

+ (void) NetRequestPOSTWithRequestURL: (NSString *) requestURLString
                        WithParameter: (NSDictionary *) parameter
                 WithReturnValeuBlock: (ReturnValueBlock) block
                   WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //manager.securityPolicy.allowInvalidCertificates = YES;
    //[manager.securityPolicy setValidatesDomainName:NO];
    AppDelegate *appDlg = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSParameterAssert([appDlg.conn isKindOfClass: [Reachability class]]);
    NetworkStatus status = [appDlg.conn currentReachabilityStatus];
    if (status == NotReachable) {
        //[KVNProgress dismiss];
        return;
    }
    
    [manager POST:requestURLString parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
    
}
+ (void) NetRequestDownloadWithRequestURL: (NSString *) requestURLString
                            WithParameter: (NSDictionary *) parameter
                     WithReturnValeuBlock: (ReturnValueBlock) block
                       WithErrorCodeBlock: (ErrorCodeBlock) errorBlock{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    //manager.securityPolicy.allowInvalidCertificates = YES;
    //[manager.securityPolicy setValidatesDomainName:NO];
    AppDelegate *appDlg = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSParameterAssert([appDlg.conn isKindOfClass: [Reachability class]]);
    NetworkStatus status = [appDlg.conn currentReachabilityStatus];
    if (status == NotReachable) {
        [KVNProgress dismiss];
        return;
    }
    NSURL *url=[NSURL URLWithString:requestURLString];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [KVNProgress show];
    NSURLSessionDownloadTask *task=[manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [KVNProgress showProgress:downloadProgress.fractionCompleted];
        });
    } destination: ^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    }
                                                  completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
                                                      [KVNProgress dismiss];
                                                      block(response.suggestedFilename);
                                                  }];
    [task resume];
    
}
@end

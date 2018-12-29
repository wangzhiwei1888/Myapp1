//
//  RNView.m
//  Helloworld
//
//  Created by laowen on 16/8/22.
//  Copyright © 2016年 laowen. All rights reserved.
//

#import "RNView.h"
#import "RCTBundleURLProvider.h"
#import "RCTRootView.h"
#import "SSZipArchive.h"

//引用全局变量
extern NSDictionary *rootDict;

@implementation RNView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        
        #if TARGET_IPHONE_SIMULATOR
                [[RCTBundleURLProvider sharedSettings] setJsLocation:@"localhost"];
        #else
                [[RCTBundleURLProvider sharedSettings] setDefaults];
        #endif
        
        NSException *downBool = [rootDict objectForKey:@"downBool"];
        
        if(downBool){
            
//            WS(weakself);
//            self.view.backgroundColor = [UIColor whiteColor];
            
            [NetRequest NetRequestDownloadWithRequestURL:@"http://localhost:8080/bundle.zip?v=2" WithParameter:nil WithReturnValeuBlock:^(id returnValue) {
                
                NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
                NSString *documentpath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
                NSString* unzipfrom = [documentpath stringByAppendingFormat:@"%@%@",@"/",returnValue];
                
                NSRange range = [returnValue rangeOfString:@"."];
                NSString * result = [returnValue substringToIndex:range.location];
                NSString* unzipto = [documentpath stringByAppendingFormat:@"%@%@",@"/",result];
                NSLog(@"unzipfrom:%@",unzipfrom);
                
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
                    [SSZipArchive unzipFileAtPath:unzipfrom toDestination:unzipto progressHandler:^(NSString *entry, unz_file_info zipInfo, long entryNumber, long total) {
                        
                    } completionHandler:^(NSString *path, BOOL succeeded, NSError *error) {
                        if(succeeded){
                            dispatch_async(dispatch_get_main_queue(),^{
//                                [weakself initReactModule:result];
                                
                                NSString * test = @"/Users/wangzhiwei8/www/work/rn_project/jdjr-app/study/01/Myapp/reactnative/bundle/news.ios.jsbundle";
                                NSURL *jsCodeLocationTest = [[NSURL alloc] initWithString:test];
                                NSLog(@"jsCodeLocationTest:%@",jsCodeLocationTest);
                                NSString * jsCodeLocationStr = [unzipto stringByAppendingString: @"/bundle/news.ios.jsbundle"];
                                NSLog(@"jsCodeLocationStr:%@",jsCodeLocationStr);
                                NSURL *jsCodeLocationStrURL = [[NSURL alloc] initWithString:jsCodeLocationStr];
                                
                                RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocationStrURL
                                                                                    moduleName:@"Helloworld"
                                                                             initialProperties:nil
                                                                                 launchOptions:nil];
                                [self addSubview:rootView];
                                rootView.frame = self.bounds;
                            });
                        }
                    }];
                    
                });
                
            } WithErrorCodeBlock:^(id errorCode) {
                
            }];
            
        }
        else{
            
            NSString *root = [rootDict objectForKey:@"root"];
            NSLog(@"dict = %@%@",root,@"index.ios");

            NSString *rootFile = [root stringByAppendingString:@"index.ios" ];

            NSURL *jsCodeLocation;
            jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:rootFile fallbackResource:nil];

            RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                                moduleName:@"Helloworld"
                                                         initialProperties:nil
                                                             launchOptions:nil];
            [self addSubview:rootView];
            rootView.frame = self.bounds;
            
        }
        
        
        
        
    }
    return self;
}



@end


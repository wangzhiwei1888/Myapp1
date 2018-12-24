//
//  OpenNativeModule.m
//  Myapp
//
//  Created by wangzhiwei8 on 2018/12/24.
//  Copyright © 2018年 wangzhiwei8. All rights reserved.
//

#import "OpenNativeModule.h"
#import "AppDelegate.h"
#import "VCSecond.h"


@implementation OpenNativeModule

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(openNativeVC){
   
    dispatch_async(dispatch_get_main_queue(), ^{
        
        AppDelegate *delegate = (AppDelegate *)([UIApplication sharedApplication].delegate);
        UINavigationController *rootNav = delegate.navController;
        VCSecond *vc = [[VCSecond alloc] init];
        [rootNav pushViewController:vc animated:YES];

    });
    
}
@end

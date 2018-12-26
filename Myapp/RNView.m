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
    return self;
}

@end


//
//  AppDelegate.h
//  Myapp
//
//  Created by wangzhiwei8 on 2018/12/21.
//  Copyright © 2018年 wangzhiwei8. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong) UINavigationController *navController;

@property (strong, nonatomic) Reachability *conn;

@end


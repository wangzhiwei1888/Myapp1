//
//  RNMainViewController.m
//  08-add-rn
//
//  Created by wangzhiwei8 on 2018/12/21.
//  Copyright © 2018年 wangzhiwei8. All rights reserved.
//

#import "RNMainViewController.h"

#import "RNView.h"

@interface RNMainViewController ()

@end

@implementation RNMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.title = @"RN模块首页";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    RNView * rnView = [[RNView alloc] initWithFrame:self.view.bounds];
    self.view = rnView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

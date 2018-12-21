//
//  VCSecond.m
//  Myapp
//
//  Created by wangzhiwei8 on 2018/12/21.
//  Copyright © 2018年 wangzhiwei8. All rights reserved.
//

#import "VCSecond.h"

@interface VCSecond ()

@end

@implementation VCSecond

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"second";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _mylabel = [[UILabel alloc] init];
    _mylabel.text = @"xxxx";
    _mylabel.frame = CGRectMake(140, 140, 260, 380);
    
    [self.view addSubview:_mylabel];
    
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

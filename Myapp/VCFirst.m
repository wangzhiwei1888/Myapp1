//
//  VCFirst.m
//  Myapp
//
//  Created by wangzhiwei8 on 2018/12/21.
//  Copyright © 2018年 wangzhiwei8. All rights reserved.
//

#import "VCFirst.h"
#import "VCSecond.h"
#import "RNMainViewController.h"

@interface VCFirst ()

@end

@implementation VCFirst

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"first";
    self.view.backgroundColor = [UIColor whiteColor];

    _mybutton = [[UIButton alloc] init];
    [_mybutton setTitle:@"aaaa" forState:UIControlStateNormal];
    _mybutton.backgroundColor = [UIColor redColor];
    _mybutton.frame = CGRectMake(40, 40, 100, 100);
    [_mybutton addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_mybutton];
    
    
    _mybutton1 = [[UIButton alloc] init];
    [_mybutton1 setTitle:@"onClickRN" forState:UIControlStateNormal];
    _mybutton1.backgroundColor = [UIColor redColor];
    _mybutton1.frame = CGRectMake(140, 140, 100, 100);
    [_mybutton1 addTarget:self action:@selector(onClickRN) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_mybutton1];
    
    
    
    
    // Do any additional setup after loading the view.
}


-(void)btnClick{
    
    VCSecond *vcsecond = [[VCSecond alloc] init];
    NSLog(@"test");
     [self.navigationController pushViewController:vcsecond animated:true];
}

-(void)onClickRN{
    
    RNMainViewController *vc = [[RNMainViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
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

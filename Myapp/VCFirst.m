//
//  VCFirst.m
//  Myapp
//
//  Created by wangzhiwei8 on 2018/12/21.
//  Copyright © 2018年 wangzhiwei8. All rights reserved.
//

#import "VCFirst.h"
#import "VCSecond.h"

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
    
//    [self.view addSubview:_imageView];
    
    
    [self.view addSubview:_mybutton];
    
    
    
    
    // Do any additional setup after loading the view.
}


-(void)btnClick{
    
    VCSecond *vcsecond = [[VCSecond alloc] init];
    NSLog(@"test");
     [self.navigationController pushViewController:vcsecond animated:true];
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

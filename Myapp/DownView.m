//
//  DownView.m
//  Myapp
//
//  Created by wangzhiwei8 on 2018/12/28.
//  Copyright © 2018年 wangzhiwei8. All rights reserved.
//

#import "DownView.h"
#import "SSZipArchive.h"
#import "RCTRootView.h"
#import "RCTBundleURLProvider.h"

@interface DownView (){
 RCTRootView *rootView;
}
@end

@implementation DownView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"in down view");
    
    [self download];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)download{
    
    
    WS(weakself)
    [NetRequest NetRequestDownloadWithRequestURL:@"http://10.13.86.131:8080/bundle.zip" WithParameter:nil WithReturnValeuBlock:^(id returnValue) {
        
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
                        [weakself initReactModule:result];
                    });
                }
            }];
            
        });
        
    } WithErrorCodeBlock:^(id errorCode) {
        
    }];
    
}

-(void)initReactModule:(NSString*)filename{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentpath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    NSString* unzipto = [documentpath stringByAppendingFormat:@"%@%@",@"/",filename];
    
    NSBundle *bundle=[NSBundle bundleWithPath:unzipto];

    NSURL *jsCodeLocation= [bundle URLForResource:@"bundle/news.ios" withExtension:@"jsbundle"];
    NSLog(@"resourcePath:%@", [bundle resourcePath]);
    rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                           moduleName:@"Helloworld"
                                    initialProperties:nil
                                        launchOptions:nil];
    [self.view addSubview:rootView];
//    [rootView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(SCREEN_WIDTH);
//        make.height.mas_equalTo(SCREEN_HEIGHT-TAB_BAR_HEIGHT-_scrollMenu.frame.size.height);
//        make.top.equalTo(_scrollMenu.mas_bottom);
//    }];
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

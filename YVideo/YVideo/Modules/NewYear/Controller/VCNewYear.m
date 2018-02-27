//
//  VCNewYear.m
//  YVideo
//
//  Created by simple on 2018/2/24.
//  Copyright © 2018年 simple. All rights reserved.
//

#import "VCNewYear.h"

@interface VCNewYear ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *web;
@end

@implementation VCNewYear

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMain];
}

- (void)initMain{
    [self.view addSubview:self.web];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"https://k.360kan.com/hotrizon2/topic/detail?topic_id=BolMjyGLWv&f=html"]];
    [self.web loadRequest:request];
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] init];
    [self.view addSubview:hud];
    hud.labelText = @"加载中......";
    hud.mode = MBProgressHUDModeIndeterminate;
    [hud show:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (UIWebView*)web{
    if(!_web){
        _web = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHEIGHT)];
        _web.backgroundColor = [UIColor whiteColor];
        _web.delegate = self;
    }
    return _web;
}

@end

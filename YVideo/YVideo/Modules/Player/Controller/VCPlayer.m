//
//  VCPlayer.m
//  YVideo
//
//  Created by simple on 2018/2/26.
//  Copyright © 2018年 simple. All rights reserved.
//

#import "VCPlayer.h"
#import "XjAVPlayerSDK.h"

@interface VCPlayer ()<XjAVPlayerSDKDelegate>
@property (nonatomic, strong) XjAVPlayerSDK *myPlayer;
@end

@implementation VCPlayer

- (void)dealloc{
    if (self.myPlayer) {
        [self.myPlayer xjStopPlayer];
        self.myPlayer = nil;
    }
}


- (void)viewDidDisappear:(BOOL)animated{
    if (self.myPlayer) {
        [self.myPlayer xjStopPlayer];
        self.myPlayer = nil;
    }
}

- (void)viewWillAppear:(BOOL)animated{
    self.myPlayer = [[XjAVPlayerSDK alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width/2)];
    self.myPlayer.xjPlayerUrl = self.url;
    self.myPlayer.xjPlayerTitle = self.title;
    self.myPlayer.xjAutoOrient = YES;
    self.myPlayer.XjAVPlayerSDKDelegate = self;
//    self.myPlayer.xjLastTime = 50;
    [self.view addSubview:self.myPlayer];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)xjGoBack{
    //    [myPlayer xjStopPlayer];
    //    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)xjNextPlayer{
}

@end

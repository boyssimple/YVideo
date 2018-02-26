//
//  HeaderHome.m
//  YVideo
//
//  Created by simple on 2018/2/26.
//  Copyright © 2018年 simple. All rights reserved.
//

#import "HeaderHome.h"

@interface HeaderHome()
@property (nonatomic, strong) UIImageView *ivImg;
@end

@implementation HeaderHome

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _ivImg = [[UIImageView alloc]initWithFrame:CGRectZero];
        _ivImg.userInteractionEnabled = YES;
        [self addSubview:_ivImg];
        [_ivImg pt_setImage:@"http://p7.qhimg.com/t01cace3962def5dd89.png"];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];\
    CGRect r = self.ivImg.frame;
    r.size.width = DEVICEWIDTH - 24;
    r.size.height = self.height;
    r.origin.x = 12;
    r.origin.y = 0;
    self.ivImg.frame = r;
}


@end

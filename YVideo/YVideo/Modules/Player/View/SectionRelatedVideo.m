//
//  SectionRelatedVideo.m
//  YVideo
//
//  Created by simple on 2018/2/27.
//  Copyright © 2018年 simple. All rights reserved.
//

#import "SectionRelatedVideo.h"

@interface SectionRelatedVideo()
@property (nonatomic, strong) UILabel *lbText;
@end

@implementation SectionRelatedVideo

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _lbText = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbText.font = [UIFont systemFontOfSize:10*RATIO_WIDHT320];
        _lbText.textColor = [UIColor blackColor];
        _lbText.text = @"相关视频";
        [self addSubview:_lbText];
    }
    
    return self;
}


- (void)updateData{
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGSize size = [self.lbText sizeThatFits:CGSizeMake(MAXFLOAT, 10*RATIO_WIDHT320)];
    CGRect r = self.lbText.frame;
    r.size = size;
    r.origin.x = 12;
    r.origin.y = (self.height - r.size.height)/2.0;
    self.lbText.frame = r;
}

@end

//
//  HeaderPlayerDetail.m
//  YVideo
//
//  Created by simple on 2018/2/27.
//  Copyright © 2018年 simple. All rights reserved.
//

#import "HeaderPlayerDetail.h"

@interface HeaderPlayerDetail()
@property (nonatomic, strong) UILabel *lbTitle;
@property (nonatomic, strong) UIImageView *ivArrowDown;

@property (nonatomic, strong) UIImageView *ivAvatar;
@property (nonatomic, strong) UILabel *lbAuthor;
@property (nonatomic, strong) UILabel *lbSign;
@property (nonatomic, strong) UIButton *btnAttention;
@property (nonatomic, strong) UIView *vLine;
@end

@implementation HeaderPlayerDetail

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _lbTitle = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbTitle.font = [UIFont boldSystemFontOfSize:14*RATIO_WIDHT320];
        _lbTitle.textColor = [UIColor blackColor];
        _lbTitle.numberOfLines = 0;
        [self addSubview:_lbTitle];
        
        _ivArrowDown = [[UIImageView alloc]initWithFrame:CGRectZero];
        _ivArrowDown.image = [UIImage imageNamed:@"arrowDown-black"];
        _ivArrowDown.userInteractionEnabled = YES;
        [self addSubview:_ivArrowDown];
        
        _ivAvatar = [[UIImageView alloc]initWithFrame:CGRectZero];
        _ivAvatar.backgroundColor = [UIColor grayColor];
        _ivAvatar.layer.cornerRadius = 25*RATIO_WIDHT320 * 0.5;
        _ivAvatar.layer.masksToBounds = YES;
        [self addSubview:_ivAvatar];
        
        _lbAuthor = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbAuthor.font = [UIFont systemFontOfSize:10*RATIO_WIDHT320];
        _lbAuthor.textColor = [UIColor blackColor];
        [self addSubview:_lbAuthor];
        
        _lbSign = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbSign.font = [UIFont systemFontOfSize:8*RATIO_WIDHT320];
        _lbSign.textColor = [UIColor grayColor];
        [self addSubview:_lbSign];
        
        _btnAttention = [[UIButton alloc]initWithFrame:CGRectZero];
        [_btnAttention setTitle:@"已关注" forState:UIControlStateSelected];
        [_btnAttention setTitle:@"关注" forState:UIControlStateNormal];
        [_btnAttention setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_btnAttention setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        _btnAttention.layer.borderWidth = 1.f;
        _btnAttention.layer.cornerRadius = 2.f;
        _btnAttention.layer.borderColor = [UIColor orangeColor].CGColor;
        _btnAttention.titleLabel.font = [UIFont systemFontOfSize:10*RATIO_WIDHT320];
        [self addSubview:_btnAttention];
        
        
        _vLine = [[UIView alloc]initWithFrame:CGRectZero];
        _vLine.backgroundColor = RGB3(247);
        [self addSubview:_vLine];
    }
    
    return self;
}

- (void)updateData:(NSDictionary*)data{
    if (data) {
        NSDictionary *authorInfo = [data getDictionary:@"authorInfo"];
        if (authorInfo) {
            self.lbAuthor.text = [authorInfo getString:@"name"];
            self.lbSign.text = [authorInfo getString:@"description"];
            [self.ivAvatar pt_setImage:[authorInfo getString:@"avatar"]];
        }
        
        self.lbTitle.text = [data getString:@"title"];
    }
}

- (void)updateData{
    [self.ivAvatar pt_setImage:@"http://p0.qhimg.com/video/568_320_70/t014f2af9d902135f1d.jpg"];
    
    self.lbTitle.text = @"中国和印度都参加了俄罗斯的阅兵，解放负责帅，印度负责手笔";
    self.lbAuthor.text = @"用户1902852385";
    self.lbSign.text = @"这个家伙很懒，什么都没留下";
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGSize size = [self.lbTitle sizeThatFits:CGSizeMake(DEVICEWIDTH - 24 - 50, MAXFLOAT)];
    CGRect r = self.lbTitle.frame;
    r.size.height = size.height;
    r.size.width = DEVICEWIDTH - 24 - 50;
    r.origin.x = 12;
    r.origin.y = 10;
    self.lbTitle.frame = r;
    
    r = self.ivArrowDown.frame;
    r.size.width = 10*RATIO_WIDHT320;
    r.size.height = r.size.width;
    r.origin.x = DEVICEWIDTH - 12 - 10 - r.size.width;
    r.origin.y = self.lbTitle.top;
    self.ivArrowDown.frame = r;

    
    r = self.ivAvatar.frame;
    r.size.width = 25*RATIO_WIDHT320;
    r.size.height = r.size.width;
    r.origin.x = 12;
    r.origin.y = self.lbTitle.bottom + 35;
    self.ivAvatar.frame = r;
    
    r = self.btnAttention.frame;
    r.size.width = 40*RATIO_WIDHT320;
    r.size.height = 18*RATIO_WIDHT320;
    r.origin.x = DEVICEWIDTH - 12 - r.size.width;
    r.origin.y = self.ivAvatar.top + (self.ivAvatar.height - r.size.height)/2.0;
    self.btnAttention.frame = r;
    
    size = [self.lbAuthor sizeThatFits:CGSizeMake(DEVICEWIDTH - self.ivAvatar.right - 10 - 12 - self.btnAttention.width - 10, MAXFLOAT)];
    r = self.lbAuthor.frame;
    r.size = size;
    r.origin.x = self.ivAvatar.right + 10;
    r.origin.y = self.ivAvatar.top;
    self.lbAuthor.frame = r;
    
    size = [self.lbSign sizeThatFits:CGSizeMake(self.lbAuthor.width, MAXFLOAT)];
    r = self.lbSign.frame;
    r.size = size;
    r.origin.x = self.ivAvatar.right + 10;
    r.origin.y = self.ivAvatar.bottom - r.size.height;
    self.lbSign.frame = r;
    
    r = self.vLine.frame;
    r.size.width = DEVICEWIDTH;
    r.size.height = 0.5;
    r.origin.x = 0;
    r.origin.y = self.ivAvatar.bottom + 10;
    self.vLine.frame = r;
}

+ (CGFloat)calHeight:(NSDictionary*)data{
    CGFloat height = 10 + 35 + 25*RATIO_WIDHT320 + 10.5;
    NSString *title = @"中国和印度都参加了俄罗斯的阅兵，解放负责帅，印度负责手笔";
    
    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectZero];
    lb.font = [UIFont boldSystemFontOfSize:14*RATIO_WIDHT320];
    lb.text = title;
    lb.numberOfLines = 0;
    CGSize size = [lb sizeThatFits:CGSizeMake(DEVICEWIDTH - 24 - 50, MAXFLOAT)];
    height += size.height;
    return height;
}

@end

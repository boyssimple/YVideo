//
//  CellRelatedVideo.m
//  YVideo
//
//  Created by simple on 2018/2/27.
//  Copyright © 2018年 simple. All rights reserved.
//

#import "CellRelatedVideo.h"

@interface CellRelatedVideo()
@property (nonatomic, strong) UIImageView *ivCover;
@property (nonatomic, strong) UILabel *lbTime;
@property (nonatomic, strong) UILabel *lbTitle;;
@property (nonatomic, strong) UILabel *lbAuthor;
@property (nonatomic, strong) UILabel *lbBrowse;

@end

@implementation CellRelatedVideo

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _ivCover = [[UIImageView alloc]initWithFrame:CGRectZero];
        _ivCover.userInteractionEnabled = YES;
        [self.contentView addSubview:_ivCover];
        
        _lbTime = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbTime.font = [UIFont systemFontOfSize:8*RATIO_WIDHT320];
        _lbTime.textColor = [UIColor whiteColor];
        _lbTime.backgroundColor = RGBA(0, 0, 0, 0.5);
        _lbTime.layer.cornerRadius = 12*RATIO_WIDHT320 * 0.5f;
        _lbTime.layer.masksToBounds = YES;
        _lbTime.textAlignment = NSTextAlignmentCenter;
        [_ivCover addSubview:_lbTime];
        
        _lbTitle = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbTitle.font = [UIFont systemFontOfSize:12*RATIO_WIDHT320];
        _lbTitle.textColor = [UIColor blackColor];
        _lbTitle.numberOfLines = 2;
        [self.contentView addSubview:_lbTitle];
        
        _lbAuthor = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbAuthor.font = [UIFont systemFontOfSize:9*RATIO_WIDHT320];
        _lbAuthor.textColor = [UIColor grayColor];
        [self.contentView addSubview:_lbAuthor];
        
        _lbBrowse = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbBrowse.font = [UIFont systemFontOfSize:9*RATIO_WIDHT320];
        _lbBrowse.textColor = [UIColor grayColor];
        [self.contentView addSubview:_lbBrowse];
        
    }
    return self;
}

- (void)updateData:(NSDictionary*)data{
    if (data) {
        NSDictionary *authorInfo = [data getDictionary:@"authorInfo"];
        if (authorInfo) {
            self.lbAuthor.text = [authorInfo getString:@"name"];
        }
        [self.ivCover pt_setImage:[data getString:@"cover"]];
        self.lbTitle.text = [data getString:@"title"];
        NSInteger playCnt = [data getInt:@"playCnt"];
        if (playCnt < 10000) {
            self.lbBrowse.text = [NSString stringWithFormat:@"%zi次观看",playCnt];
        }else{
            self.lbBrowse.text = [NSString stringWithFormat:@"%.1f万次观看",playCnt/10000.0];
        }
        self.lbTime.text =[data getString:@"durationStr"];
    }
}

- (void)updateData{
    
    [self.ivCover pt_setImage:@"http://p0.qhimg.com/video/568_320_70/t014f2af9d902135f1d.jpg"];
    self.lbTime.text = @"00:54";
    
    self.lbTitle.text = @"中国和印度都参加了俄罗斯的阅兵，解放负责帅，印度负责手笔";
    self.lbAuthor.text = @"用户1902852385";
    self.lbBrowse.text = @"21.5万次观看";
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect r = self.ivCover.frame;
    r.size.width = 100*RATIO_WIDHT320;
    r.size.height = 60*RATIO_WIDHT320;
    r.origin.x = 12;
    r.origin.y = 0;
    self.ivCover.frame = r;
    
    CGSize size = [self.lbTime sizeThatFits:CGSizeMake(MAXFLOAT, 12*RATIO_WIDHT320)];
    r = self.lbTime.frame;
    r.size.height = 12*RATIO_WIDHT320;
    r.size.width = 30*RATIO_WIDHT320;
    r.origin.x = self.ivCover.width - r.size.width - 5;
    r.origin.y = self.ivCover.height - r.size.height - 5;
    self.lbTime.frame = r;
    
    size = [self.lbTitle sizeThatFits:CGSizeMake(DEVICEWIDTH - self.ivCover.right - 10 - 12, MAXFLOAT)];
    r = self.lbTitle.frame;
    r.size.height = size.height;
    r.size.width = DEVICEWIDTH - self.ivCover.right - 10 - 12;
    r.origin.x = self.ivCover.right + 10;
    r.origin.y = self.ivCover.top + 2;
    self.lbTitle.frame = r;
    
    size = [self.lbAuthor sizeThatFits:CGSizeMake(MAXFLOAT, 9*RATIO_WIDHT320)];
    r = self.lbAuthor.frame;
    r.size = size;
    r.origin.x = self.ivCover.right + 10;
    r.origin.y = self.ivCover.bottom - r.size.height - 2;
    self.lbAuthor.frame = r;
    
    size = [self.lbBrowse sizeThatFits:CGSizeMake(MAXFLOAT, 9*RATIO_WIDHT320)];
    r = self.lbBrowse.frame;
    r.size.height = size.height;
    r.size.width = size.width;
    r.origin.x = DEVICEWIDTH - r.size.width - 12;
    r.origin.y = self.ivCover.bottom - r.size.height - 2;
    self.lbBrowse.frame = r;
}

+ (CGFloat)calHeight{
    return 60*RATIO_WIDHT320 + 10*RATIO_WIDHT320;
}

@end

//
//  CellHome.m
//  YVideo
//
//  Created by simple on 2018/2/24.
//  Copyright © 2018年 simple. All rights reserved.
//

#import "CellHome.h"

@interface CellHome()
@property (nonatomic, strong) UIImageView *ivImg;
@property (nonatomic, strong) UILabel *lbTitle;
@property (nonatomic, strong) UILabel *lbBrowse;
@property (nonatomic, strong) UILabel *lbTime;
@property (nonatomic, strong) UIImageView *ivAvatar;
@property (nonatomic, strong) UILabel *lbAuthor;
@property (nonatomic, strong) UIImageView *ivSupport;
@property (nonatomic, strong) UILabel *lbSupport;
@property (nonatomic, strong) UIImageView *ivComment;
@property (nonatomic, strong) UILabel *lbComment;
@end

@implementation CellHome

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _ivImg = [[UIImageView alloc]initWithFrame:CGRectZero];
        _ivImg.userInteractionEnabled = YES;
        [self.contentView addSubview:_ivImg];
        
        _lbTitle = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbTitle.font = [UIFont systemFontOfSize:14*RATIO_WIDHT320];
        _lbTitle.textColor = [UIColor whiteColor];
        _lbTitle.numberOfLines = 0;
        [_ivImg addSubview:_lbTitle];
        
        _lbBrowse = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbBrowse.font = [UIFont systemFontOfSize:9*RATIO_WIDHT320];
        _lbBrowse.textColor = [UIColor whiteColor];
        [_ivImg addSubview:_lbBrowse];
        
        _lbTime = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbTime.font = [UIFont systemFontOfSize:9*RATIO_WIDHT320];
        _lbTime.textColor = [UIColor whiteColor];
        _lbTime.backgroundColor = RGBA(0, 0, 0, 0.8);
        [_ivImg addSubview:_lbTime];
        
    }
    return self;
}


- (void)updateData:(NSDictionary*)data{
    self.lbTitle.text = [data valueForKey:@"title"];
    [self.ivImg pt_setImage:[data valueForKey:@"cover"]];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect r = self.ivImg.frame;
    r.size.width = DEVICEWIDTH - 24;
    r.size.height = 130*RATIO_WIDHT320;
    r.origin.x = 12;
    r.origin.y = 0;
    self.ivImg.frame = r;
    
    CGSize size = [self.lbTitle sizeThatFits:CGSizeMake(self.ivImg.width - 24, MAXFLOAT)];
    r = self.lbTitle.frame;
    r.size.height = size.height;
    r.size.width = DEVICEWIDTH - 48;
    r.origin.x = 12;
    r.origin.y = 10;
    self.lbTitle.frame = r;
    
    size = [self.lbBrowse sizeThatFits:CGSizeMake(self.ivImg.width - 24, MAXFLOAT)];
    r = self.lbBrowse.frame;
    r.size = size;
    r.origin.x = 12;
    r.origin.y = self.lbTitle.bottom + 10;
    self.lbBrowse.frame = r;
    
}

+ (CGFloat)calHeight{
    return 170 *RATIO_WIDHT320;
}

@end

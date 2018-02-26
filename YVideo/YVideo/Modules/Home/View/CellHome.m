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
@property (nonatomic, strong) UIImageView *ivPlayer;
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

        UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc]initWithActionBlock:^(id  _Nonnull sender) {
            if (self.playBlock) {
                self.playBlock(self.index);
            }
        }];
        [_ivImg addGestureRecognizer:ges];
        
        
        _lbTitle = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbTitle.font = [UIFont boldSystemFontOfSize:13*RATIO_WIDHT320];
        _lbTitle.textColor = [UIColor whiteColor];
        _lbTitle.numberOfLines = 0;
        [_ivImg addSubview:_lbTitle];
        
        _lbBrowse = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbBrowse.font = [UIFont systemFontOfSize:9*RATIO_WIDHT320];
        _lbBrowse.textColor = [UIColor whiteColor];
        [_ivImg addSubview:_lbBrowse];
        
        _lbTime = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbTime.font = [UIFont systemFontOfSize:8*RATIO_WIDHT320];
        _lbTime.textColor = [UIColor whiteColor];
        _lbTime.backgroundColor = RGBA(0, 0, 0, 0.5);
        _lbTime.textAlignment = NSTextAlignmentCenter;
        _lbTime.layer.cornerRadius = 13*RATIO_WIDHT320 *0.5;
        _lbTime.layer.masksToBounds = YES;
        _lbTime.layer.borderColor = [UIColor whiteColor].CGColor;
        _lbTime.layer.borderWidth = 0.5f;
        [_ivImg addSubview:_lbTime];
        
        _ivPlayer = [[UIImageView alloc]initWithFrame:CGRectZero];
        _ivPlayer.userInteractionEnabled = YES;
        _ivPlayer.image = [UIImage imageNamed:@"player"];
        [_ivImg addSubview:_ivPlayer];
        
        _ivAvatar = [[UIImageView alloc]initWithFrame:CGRectZero];
        _ivAvatar.userInteractionEnabled = YES;
        _ivAvatar.layer.cornerRadius = 25*RATIO_WIDHT320 *0.5;
        _ivAvatar.layer.masksToBounds = YES;
        _ivAvatar.layer.borderColor = [UIColor whiteColor].CGColor;
        _ivAvatar.layer.borderWidth = 2.f;
        [self.contentView addSubview:_ivAvatar];
        
        _lbAuthor = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbAuthor.font = [UIFont systemFontOfSize:9*RATIO_WIDHT320];
        _lbAuthor.textColor = [UIColor blackColor];
        [self.contentView addSubview:_lbAuthor];
        
        
        _ivSupport = [[UIImageView alloc]initWithFrame:CGRectZero];
        _ivSupport.userInteractionEnabled = YES;
        _ivSupport.image = [UIImage imageNamed:@"support"];
        [self.contentView addSubview:_ivSupport];
        
        _lbSupport = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbSupport.font = [UIFont systemFontOfSize:8*RATIO_WIDHT320];
        _lbSupport.textColor = [UIColor blackColor];
        [self.contentView addSubview:_lbSupport];
        
        _ivComment = [[UIImageView alloc]initWithFrame:CGRectZero];
        _ivComment.userInteractionEnabled = YES;
        _ivComment.image = [UIImage imageNamed:@"comment"];
        [self.contentView addSubview:_ivComment];
        
        _lbComment = [[UILabel alloc]initWithFrame:CGRectZero];
        _lbComment.font = [UIFont systemFontOfSize:8*RATIO_WIDHT320];
        _lbComment.textColor = [UIColor blackColor];
        [self.contentView addSubview:_lbComment];
    }
    return self;
}


- (void)updateData:(NSDictionary*)data{
    self.lbTitle.text = [data valueForKey:@"title"];
    [self.ivImg pt_setImage:[data valueForKey:@"cover"]];
    
    self.lbTime.text = [data valueForKey:@"durationStr"];
    
    NSDictionary *authorInfo = [data valueForKey:@"authorInfo"];
    [self.ivAvatar pt_setImage:[authorInfo valueForKey:@"avatar"]];
    self.lbAuthor.text = [authorInfo valueForKey:@"name"];
    
    
    NSDictionary *cnts = [data valueForKey:@"cnts"];
    self.lbSupport.text = [NSString stringWithFormat:@"%@",[cnts valueForKey:@"favorCnt"]];
    self.lbComment.text = [NSString stringWithFormat:@"%@",[cnts valueForKey:@"commentCnt"]];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect r = self.ivImg.frame;
    r.size.width = DEVICEWIDTH - 24;
    r.size.height = 150*RATIO_WIDHT320;
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
    
    size = [self.lbTime sizeThatFits:CGSizeMake(MAXFLOAT, 13*RATIO_WIDHT320)];
    r = self.lbTime.frame;
    r.size.width = size.width + 10;
    r.size.height = 13*RATIO_WIDHT320;
    r.origin.x = self.ivImg.width - r.size.width - 10;
    r.origin.y = self.ivImg.bottom - r.size.height - 7;
    self.lbTime.frame = r;
    
    r = self.ivPlayer.frame;
    r.size.width = 30*RATIO_WIDHT320;
    r.size.height = r.size.width;
    r.origin.x = (self.ivImg.width - r.size.width)/2.0;
    r.origin.y = (self.ivImg.height - r.size.height)/2.0;
    self.ivPlayer.frame = r;
    
    r = self.ivAvatar.frame;
    r.size.width = 25*RATIO_WIDHT320;
    r.size.height = r.size.width;
    r.origin.x = self.ivImg.left + 10;
    r.origin.y = self.ivImg.bottom - r.size.height + r.size.height * 0.3;
    self.ivAvatar.frame = r;
    
    size = [self.lbAuthor sizeThatFits:CGSizeMake(MAXFLOAT, 9*RATIO_WIDHT320)];
    r = self.lbAuthor.frame;
    r.size = size;
    r.origin.x = self.ivImg.left + 10;
    r.origin.y = self.ivImg.bottom + (40*RATIO_WIDHT320 - r.size.height)/2.0;
    self.lbAuthor.frame = r;
    
    size = [self.lbComment sizeThatFits:CGSizeMake(MAXFLOAT, 9*RATIO_WIDHT320)];
    r = self.lbComment.frame;
    r.size = size;
    r.origin.x = DEVICEWIDTH - self.lbAuthor.left - r.size.width;
    r.origin.y = self.ivImg.bottom + (40*RATIO_WIDHT320 - r.size.height)/2.0;
    self.lbComment.frame = r;
    
    r = self.ivComment.frame;
    r.size.width = 12*RATIO_WIDHT320;
    r.size.height = r.size.width;
    r.origin.x = self.lbComment.left - r.size.width;
    r.origin.y = self.ivImg.bottom + (40*RATIO_WIDHT320 - r.size.height)/2.0;
    self.ivComment.frame = r;
    
    size = [self.lbSupport sizeThatFits:CGSizeMake(MAXFLOAT, 9*RATIO_WIDHT320)];
    r = self.lbSupport.frame;
    r.size = size;
    r.origin.x = self.ivComment.left - r.size.width - 30;
    r.origin.y = self.ivImg.bottom + (40*RATIO_WIDHT320 - r.size.height)/2.0;
    self.lbSupport.frame = r;
    
    r = self.ivSupport.frame;
    r.size.width = 12*RATIO_WIDHT320;
    r.size.height = r.size.width;
    r.origin.x = self.lbSupport.left - r.size.width;
    r.origin.y = self.ivImg.bottom + (40*RATIO_WIDHT320 - r.size.height)/2.0;
    self.ivSupport.frame = r;
    
}

+ (CGFloat)calHeight{
    return 190 *RATIO_WIDHT320;
}

@end

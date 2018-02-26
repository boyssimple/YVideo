//
//  CellHome.h
//  YVideo
//
//  Created by simple on 2018/2/24.
//  Copyright © 2018年 simple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PlayBtnCallBackBlock)(NSIndexPath*index);

@interface CellHome : UITableViewCell
/** 播放按钮block */
@property (nonatomic, copy  ) PlayBtnCallBackBlock       playBlock;
@property (nonatomic, strong) NSIndexPath *index;

- (void)updateData:(NSDictionary*)data;
@end

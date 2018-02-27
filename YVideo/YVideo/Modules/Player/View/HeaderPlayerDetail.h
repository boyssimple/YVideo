//
//  HeaderPlayerDetail.h
//  YVideo
//
//  Created by simple on 2018/2/27.
//  Copyright © 2018年 simple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderPlayerDetail : UIView
- (void)updateData:(NSDictionary*)data;
+ (CGFloat)calHeight:(NSDictionary*)data;
@end

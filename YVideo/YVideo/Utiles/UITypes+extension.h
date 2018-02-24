//
//  UITypes+extension.h
//  School
//
//  Created by zhouMR on 2017/11/16.
//  Copyright © 2017年 luowei. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIImage (extension)
+ (UIImage*)stretchImage:(NSString*)name;
+ (UIImage*)stretchAllImage:(NSString*)name;
@end

@interface UIView (extension)
- (void)updateData;
-(UINavigationController *) navgationController;
@end

@interface UIImageView (extension)
- (void)pt_setImage:(NSString*)url;
@end

@interface UITableViewCell (extension)
+ (CGFloat)calHeight;
@end



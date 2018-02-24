//
//  UITypes+extension.m
//  School
//
//  Created by zhouMR on 2017/11/16.
//  Copyright © 2017年 luowei. All rights reserved.
//

#import "UITypes+extension.h"
#import "AppDelegate.h"

@implementation UIImage (extension)

+ (UIImage*)stretchImage:(NSString*)name
{
    UIImage *image = nil;
    if (name && name.length > 0) {
        image = [self imageNamed:name];
        CGSize imgSize = image.size;
        CGPoint pt = CGPointMake(.5, .5);
        image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(imgSize.height * pt.y,
                                                                    imgSize.width * pt.x,
                                                                    imgSize.height * (1 - pt.y),
                                                                    imgSize.width * (1 - pt.x))];
        
        return image;
    }
    return nil;
}

+ (UIImage*)stretchAllImage:(NSString*)name
{
    UIImage *image = nil;
    if (name && name.length > 0) {
        image = [self imageNamed:name];
        image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0,0,0,0)];
        
        return image;
    }
    return nil;
}

@end

@implementation UIView (extension)

- (void)updateData{
    
}

-(UINavigationController *) navgationController
{
    UINavigationController *curNav =  ((AppDelegate *)[UIApplication sharedApplication].delegate).nav;
    return curNav;
}

@end

@implementation UIImageView(extension)

- (void)pt_setImage:(NSString*)url{
    [self setImageURL:[NSURL URLWithString:url]];
}



@end

@implementation UITableViewCell(extension)


+ (CGFloat)calHeight{
    return 0;
}

@end

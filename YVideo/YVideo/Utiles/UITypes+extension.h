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

@interface NSDictionary (extension)

// 使用转换器转换
+ (instancetype)dictionaryFromArray:(NSArray*)arr keyConverter:(id(^)(id))keyConverter valueConverter:(id(^)(id))valueConverter;

- (BOOL)exists:(id<NSCopying>)key;
- (id)objectForKey:(id)aKey def:(id)def;
- (id)valueForKey:(NSString*)key def:(id)def;

- (int)getInt:(id<NSCopying>)key;
- (int)getInt:(id<NSCopying>)key def:(int)def;

- (int)getBool:(id<NSCopying>)key;
- (int)getBool:(id<NSCopying>)key def:(bool)def;

- (NSString*)getString:(id<NSCopying>)key;
- (NSString*)getString:(id<NSCopying>)key def:(NSString*)def;

- (NSArray*)getArray:(id<NSCopying>)key;
- (NSArray*)getArray:(id<NSCopying>)key def:(NSArray*)def;

- (NSDictionary*)getDictionary:(id<NSCopying>)key;
- (NSDictionary*)getDictionary:(id<NSCopying>)key def:(NSDictionary*)def;

- (id)initWithObject:(id)obj forKey:(id)key;

- (id)objectForInt:(NSInteger)idx;

// 返回安全的对象，如果 obj 为 NSNull，返回的将是 nil
- (id)objectForKeySafe:(id<NSCopying>)key;

@end



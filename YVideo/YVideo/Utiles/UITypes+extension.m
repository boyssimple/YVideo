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


@implementation NSDictionary (extension)

- (instancetype)clone {
    return [self.class dictionaryWithDictionary:self];
}

+ (instancetype)dictionaryFromArray:(NSArray*)arr keyConverter:(id(^)(id))keyConverter valueConverter:(id(^)(id))valueConverter {
    NSMutableDictionary* dict = [NSMutableDictionary dictionaryWithCapacity:arr.count];
    for (id each in arr) {
        id key = keyConverter(each);
        id val = valueConverter(each);
        if (key && val)
            [dict setObject:val forKey:key];
    }
    return dict;
}

- (BOOL)exists:(id<NSCopying>)key {
    return [self objectForKeySafe:key] != nil;
}

- (id)objectForKey:(id)aKey def:(id)def {
    id ret = [self objectForKeySafe:aKey];
    if (ret == nil)
        return def;
    return ret;
}

- (id)valueForKey:(NSString *)key def:(id)def {
    id ret = [self objectForKeySafe:key];
    if (ret == nil)
        return def;
    return ret;
}

- (int)getInt:(id<NSCopying>)key {
    return [self getInt:key def:0];
}

- (int)getInt:(id<NSCopying>)key def:(int)def {
    id obj = [self objectForKeySafe:key];
    if (obj == nil)
        return def;
    return [obj intValue];
}

- (int)getBool:(id<NSCopying>)key {
    return [self getBool:key def:false];
}

- (int)getBool:(id<NSCopying>)key def:(bool)def {
    id obj = [self objectForKeySafe:key];
    if (obj == nil)
        return def;
    return [obj boolValue];
}

- (NSString*)getString:(id<NSCopying>)key {
    return [self getString:key def:@""];
}

- (NSString*)getString:(id<NSCopying>)key def:(NSString *)def {
    id obj = [self objectForKeySafe:key];
    if (obj == nil || obj ==  [NSNull null])
        return def;
    if ([obj isKindOfClass:[NSString class]]) {
        return obj;
    }
    return [obj stringValue];
}

- (NSArray*)getArray:(id<NSCopying>)key {
    return [self getArray:key def:nil];
}

- (NSArray*)getArray:(id<NSCopying>)key def:(NSArray *)def {
    id ret = [self objectForKeySafe:key];
    if (ret == nil || ret ==  [NSNull null])
        return def;
    if(![ret isKindOfClass:[NSArray class]])
    {
        return def;
    }
    return ret;
}

- (NSDictionary*)getDictionary:(id<NSCopying>)key {
    return [self getDictionary:key def:nil];
}

- (NSDictionary*)getDictionary:(id<NSCopying>)key def:(NSDictionary*)def {
    id ret = [self objectForKeySafe:key];
    if (ret == nil || ret ==  [NSNull null])
        return def;
    if(![ret isKindOfClass:[NSDictionary class]])
    {
        return def;
    }
    return ret;
}

- (id)initWithObject:(id)obj forKey:(id)key {
    return [self initWithObjectsAndKeys:obj, key, nil];
}

- (id)objectForKeySafe:(id<NSCopying>)key {
    id ret = [self objectForKey:key];
    if ([ret isKindOfClass:[NSNull class]])
        return nil;
    return ret;
}

- (id)objectForInt:(NSInteger)idx {
    return [self objectForKeySafe:[NSNumber numberWithInteger:idx]];
}

+ (instancetype)restrict:(id)obj {
    if ([obj isKindOfClass:[NSDictionary class]])
        return obj;
    if ([obj isKindOfClass:[NSMutableDictionary class]])
        return obj;
    return nil;
}



@end

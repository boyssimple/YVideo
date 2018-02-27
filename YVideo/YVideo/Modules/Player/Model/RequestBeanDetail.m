//
//  RequestBeanHome.m
//  YVideo
//
//  Created by simple on 2018/2/24.
//  Copyright © 2018年 simple. All rights reserved.
//

#import "RequestBeanDetail.h"

@implementation RequestBeanDetail

- (NSString *)apiPath{
    return Net_video_detail;
}

- (NSString *)hubTips{
    return @"加载中...";
}

- (BOOL)isShowHub{
    return YES;
}

- (BOOL)cacheResponse{
    return YES;
}

- (NSUInteger)cacheLiveSecond{
    return 60*60*24*2;
}

- (HTTP_METHOD)httpMethod{
    return HTTP_METHOD_GET;
}

- (HTTP_SCHEME)httpScheme{
    return HTTP_SCHEME_HTTPS;
}

@end

@implementation ResponseBeanDetail

- (NSString *)responseMessage{
    return @"请求失败";
}

- (BOOL)checkSuccess{
    if([self.errmsg isEqualToString:@"success"]){
        return TRUE;
    }
    return FALSE;
}

@end


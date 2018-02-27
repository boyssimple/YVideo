//
//  RequestBeanHome.h
//  YVideo
//
//  Created by simple on 2018/2/24.
//  Copyright © 2018年 simple. All rights reserved.
//

#import <AJNetworking/AJNetworking.h>

@interface RequestBeanHome : RequestBeanModel
/*
@property (nonatomic, strong) NSString *appid;
@property (nonatomic, strong) NSString *cdn_url;
@property (nonatomic, strong) NSString *ch;
@property (nonatomic, strong) NSString *channel_id;
@property (nonatomic, strong) NSString *ckw;
@property (nonatomic, strong) NSString *columns;
@property (nonatomic, strong) NSString *detection;
@property (nonatomic, strong) NSString *direction;
@property (nonatomic, strong) NSString *ios;
@property (nonatomic, strong) NSString *kw;
@property (nonatomic, strong) NSString *m2;
@property (nonatomic, strong) NSString *os_type;
@property (nonatomic, strong) NSString *sign;
@property (nonatomic, strong) NSString *svc;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *vc;
*/


@property (nonatomic, strong) NSString *cdn_url;
@property (nonatomic, strong) NSString *ckw;
@property (nonatomic, strong) NSString *columns;
@property (nonatomic, strong) NSString *detection;
@property (nonatomic, strong) NSString *direction;
@property (nonatomic, strong) NSString *kw;
@property (nonatomic, strong) NSString *svc;
@property (nonatomic, strong) NSString *sign;
@property (nonatomic, strong) NSString *time;
@end

@interface ResponseBeanHome : AJResponseBeanBase
@property (nonatomic, strong) NSString *errmsg;
@property (nonatomic, strong) NSDictionary *data;
@end

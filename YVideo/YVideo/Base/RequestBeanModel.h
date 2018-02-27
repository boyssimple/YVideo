//
//  RequestBeanModel.h
//  YVideo
//
//  Created by simple on 2018/2/27.
//  Copyright © 2018年 simple. All rights reserved.
//

#import <AJNetworking/AJNetworking.h>

@interface RequestBeanModel : AJRequestBeanBase
@property (nonatomic, strong) NSString *appid;//
@property (nonatomic, strong) NSString *ch;//
@property (nonatomic, strong) NSString *channel_id;//
@property (nonatomic, strong) NSString *ios;//
@property (nonatomic, strong) NSString *m2;//
@property (nonatomic, strong) NSString *os_type;//
@property (nonatomic, strong) NSString *vc;//
@end

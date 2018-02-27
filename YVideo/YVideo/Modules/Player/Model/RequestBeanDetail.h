//
//  RequestBeanDetail.h
//  YVideo
//
//  Created by simple on 2018/2/27.
//  Copyright © 2018年 simple. All rights reserved.
//


@interface RequestBeanDetail : RequestBeanModel
@property (nonatomic, strong) NSString *clickfrom;
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *requestNum;
@property (nonatomic, strong) NSString *strategy;
@property (nonatomic, strong) NSString *sign;//
@property (nonatomic, strong) NSString *time;//

@end
@interface ResponseBeanDetail : AJResponseBeanBase
@property (nonatomic, strong) NSString *errmsg;
@property (nonatomic, strong) NSDictionary *data;
@end

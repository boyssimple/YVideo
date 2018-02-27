//
//  RequestBeanRlated.h
//  YVideo
//
//  Created by simple on 2018/2/27.
//  Copyright © 2018年 simple. All rights reserved.
//

#import "RequestBeanModel.h"

@interface RequestBeanRlated : RequestBeanModel
@property (nonatomic, strong) NSString *clickfrom;
@property (nonatomic, strong) NSString *id;
@property (nonatomic, strong) NSString *pageNo;
@property (nonatomic, strong) NSString *pageSize;
@property (nonatomic, strong) NSString *sign;//
@property (nonatomic, strong) NSString *time;//
@property (nonatomic, strong) NSString *strategy;//

@end
@interface ResponseBeanRlated: AJResponseBeanBase
@property (nonatomic, strong) NSString *errmsg;
@property (nonatomic, strong) NSDictionary *data;
@end


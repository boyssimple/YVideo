//
//  VCHome.m
//  YVideo
//
//  Created by simple on 2018/2/24.
//  Copyright © 2018年 simple. All rights reserved.
//

#import "VCHome.h"
#import "CellHome.h"
#import "RequestBeanHome.h"

@interface VCHome ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation VCHome

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMain];
    [self loadData];
}

- (void)initMain{
    [self.view addSubview:self.table];
    _dataSource = [NSMutableArray array];
}

- (void)loadData{
    RequestBeanHome *requestBean = [RequestBeanHome new];
//    [AJNetworkConfig shareInstance].hubDelegate = self;
    requestBean.appid = @"hotrizon2";
    requestBean.cdn_url = @"1";
    requestBean.ch = @"AppStore";
    requestBean.channel_id = @"0";
    requestBean.ckw = @"0";
    requestBean.columns = @"1";
    requestBean.detection = @"2";
    requestBean.direction = @"up";
    requestBean.ios = @"11.2.5";
    requestBean.kw = @"0";
    requestBean.m2 = @"b4db2c78c225e65183ba260e6ecd859f";
    requestBean.os_type = @"ios";
    requestBean.sign = @"0958FF9EEF86C2F1AE0353F69D7E018C";
    requestBean.svc = @"3";
    requestBean.time = @"1519462718638";
    requestBean.vc = @"10201";
    
    [NetworkManager requestWithBean:requestBean callBack:^(__kindof AJResponseBeanBase * _Nullable responseBean, AJError * _Nullable err) {
        [self.table.mj_header endRefreshing];
//        [self.table.mj_footer endRefreshing];
        ResponseBeanHome *response = responseBean;
        if (!err) {
            NSArray *d = [response.data objectForKey:@"videoList"];
            [self.dataSource addObjectsFromArray:d];
            [self.table reloadData];
        }else{
          
            AJLog(@"Error:%@", response.errmsg);
        }
    }];
}


#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [CellHome calHeight];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"CellHome";
    CellHome *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[CellHome alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSDictionary *data = [self.dataSource objectAtIndex:indexPath.row];
    [cell updateData:data];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.00001f;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"Header"];
    if (!header) {
        header = [[UIView alloc]init];
    }
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.00001f;
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"Footer"];
    if (!footer) {
        footer = [[UIView alloc]init];
    }
    return footer;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - Getter Setter
- (UITableView*)table{
    if(!_table){
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, DEVICEHEIGHT) style:UITableViewStyleGrouped];
        _table.delegate = self;
        _table.dataSource = self;
        _table.backgroundColor = [UIColor clearColor];
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        __weak VCHome *weakSelf = self;
        _table.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf loadData];
        }];
    }
    return _table;
}

@end

//
//  VCPlayerDetail.m
//  YVideo
//
//  Created by simple on 2018/2/27.
//  Copyright © 2018年 simple. All rights reserved.
//

#import "VCPlayerDetail.h"
#import "HeaderPlayerDetail.h"
#import "CellRelatedVideo.h"
#import "SectionRelatedVideo.h"
#import "RequestBeanDetail.h"
#import "RequestBeanRlated.h"

@interface VCPlayerDetail ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIImageView *ivPlayer;
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) HeaderPlayerDetail *header;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) NSDictionary *videoInfo;
@end

@implementation VCPlayerDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMain];
    [self loadData];
    [self loadRelatedData];
}

- (void)initMain{
    [self.view addSubview:self.ivPlayer];
    [self.view addSubview:self.table];
    _dataSource = [NSMutableArray array];
}


- (void)loadData{
    RequestBeanDetail *requestBean = [RequestBeanDetail new];
    requestBean.clickfrom = @"list";
    requestBean.id = self.ID;
    requestBean.requestNum = @"1";
    requestBean.sign = @"6029B7D135466ED92C4723113B7A634F";
    requestBean.strategy = @"2.6.9.8.9q67a50fp74u.9.1e5.30.vgwqap..1.8adqx2p9rkp0";
    requestBean.time = @"1519700028475";
    
    __weak typeof(self) safeSelf = self;
    [NetworkManager requestWithBean:requestBean callBack:^(__kindof AJResponseBeanBase * _Nullable responseBean, AJError * _Nullable err) {
        ResponseBeanDetail *response = responseBean;
        if (!err) {
            safeSelf.videoInfo = [response.data getDictionary:@"videoInfo"];
            [safeSelf.ivPlayer pt_setImage:[safeSelf.videoInfo getString:@"cover"]];
            [safeSelf.header updateData:safeSelf.videoInfo];
        }else{
            
            AJLog(@"Error:%@", response.errmsg);
        }
    }];
}

- (void)loadRelatedData{
    RequestBeanRlated *requestBean = [RequestBeanRlated new];
    requestBean.clickfrom = @"list";
    requestBean.id = @"9404GELnlAKx";
    requestBean.pageNo = @"0";
    requestBean.pageSize = @"20";
    requestBean.sign = @"C242925FB41E853DC3310A1DFCEF2E4A";
    requestBean.strategy = @"2.6.9.8.9q67a50fp74u.9.1e5.30.vgwqap..1.8adqx2p9rkp0";
    requestBean.time = @"1519700028485";
    
    __weak typeof(self) safeSelf = self;
    [NetworkManager requestWithBean:requestBean callBack:^(__kindof AJResponseBeanBase * _Nullable responseBean, AJError * _Nullable err) {
        ResponseBeanRlated *response = responseBean;
        if (!err) {
            NSArray *d = [response.data getArray:@"videoList"];
            [safeSelf.dataSource addObjectsFromArray:d];
            [safeSelf.table reloadData];
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
    return [CellRelatedVideo calHeight];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"CellRelatedVideo";
    CellRelatedVideo *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[CellRelatedVideo alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSDictionary *data = [self.dataSource objectAtIndex:indexPath.row];
    [cell updateData:data];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 25*RATIO_WIDHT320;
    }
    return 0.00001f;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        SectionRelatedVideo *header = (SectionRelatedVideo*)[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"Header"];
        if (!header) {
            header = [[SectionRelatedVideo alloc]init];
        }
        return header;
    }
    return nil;
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
    NSDictionary *data = [self.dataSource objectAtIndex:indexPath.row];
    VCPlayerDetail *vc = [[VCPlayerDetail alloc]init];
    vc.ID = [data getString:@"id"];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - Getter Setter
- (UITableView*)table{
    if(!_table){
        _table = [[UITableView alloc]initWithFrame:CGRectMake(0, self.ivPlayer.height, DEVICEWIDTH, DEVICEHEIGHT - NAV_STATUS_HEIGHT - self.ivPlayer.height) style:UITableViewStyleGrouped];
        _table.delegate = self;
        _table.dataSource = self;
        _table.backgroundColor = [UIColor clearColor];
        _table.separatorStyle = UITableViewCellSeparatorStyleNone;
        _table.tableHeaderView = self.header;
    }
    return _table;
}

- (HeaderPlayerDetail*)header{
    if(!_header){
        _header = [[HeaderPlayerDetail alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, [HeaderPlayerDetail calHeight:nil])];
        [_header updateData];
    }
    return _header;
}


- (UIImageView*)ivPlayer{
    if(!_ivPlayer){
        _ivPlayer = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, DEVICEWIDTH, 170*RATIO_WIDHT320)];
        [_ivPlayer pt_setImage:@"http://p0.qhimg.com/video/568_320_70/t014f2af9d902135f1d.jpg"];
    }
    return _ivPlayer;
}



@end

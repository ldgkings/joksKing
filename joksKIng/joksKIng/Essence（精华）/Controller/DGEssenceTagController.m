//
//  DGEssenceTagController.m
//  joksKIng
//
//  Created by LDG on 16/1/15.
//  Copyright © 2016年 ldg. All rights reserved.
//

#import <MJExtension.h>
#import "DGProgressHUD.h"
#import "DGEssenceTagController.h"
#import "DGHTTPSessionManager.h"
#import "DGEssenceTag.h"
#import "DGEssenceTagCell.h"

@interface DGEssenceTagController ()
@property (nonatomic,strong) DGHTTPSessionManager * manager;
@property (nonatomic,strong) NSArray * essenceTags;
@end

@implementation DGEssenceTagController
#pragma mark - 本文件用的全局常量
static NSString * const DGEssenceTagCellId = @"essenceTag";
static CGFloat const DGCellRoWHeight = 70.0;

#pragma mark - 懒加载
- (DGHTTPSessionManager *)manager
{
    if (_manager == nil) {
        self.manager = [DGHTTPSessionManager manager];
    }
    return _manager;
}

- (NSArray *)essenceTags
{
    if (_essenceTags == nil) {
        self.essenceTags = [NSArray array];
    }
    return _essenceTags;
}

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = DGCellRoWHeight;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = DGCommonBgColor;
    
    [self loadEssenceTag];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DGEssenceTagCell class]) bundle:nil] forCellReuseIdentifier:DGEssenceTagCellId];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [DGProgressHUD dismiss];
    
    // 取消所有任务
    [self.manager invalidateSessionCancelingTasks:YES];
}

#pragma mark - 私有方法

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.essenceTags.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   DGEssenceTagCell *cell = [tableView dequeueReusableCellWithIdentifier:DGEssenceTagCellId];
    cell.essencetag = self.essenceTags[indexPath.row];
    return cell;
}

#pragma mark - netWorking
/**
 *  请求标签
 */
- (void)loadEssenceTag
{
     [DGProgressHUD showWithStatus:@"正在加载中..."];

    // 请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"tag_recommend";
    params[@"action"] = @"sub";
    params[@"c"] = @"topic";
    
    __weak typeof(self) weakSelf = self;
    [self.manager GET:DGHttpRequestURL parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [DGProgressHUD dismiss];
        weakSelf.essenceTags = [DGEssenceTag mj_objectArrayWithKeyValuesArray:responseObject];
        [weakSelf.tableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (error.code == NSURLErrorCancelled)  return;
        [DGProgressHUD showErrorWithStatus:@"加载失败"];
    }];
}

@end

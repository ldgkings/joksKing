//
//  DGProfileController.m
//  joksKIng
//
//  Created by LDG on 16/1/14.
//  Copyright © 2016年 ldg. All rights reserved.
//

#import "DGProfileController.h"
#import "DGProfileCell.h"
#import "DGProfileCellView.h"
#import "DGLoginViewController.h"
#import "DGProfileFootView.h"

@interface DGProfileController ()

@end

@implementation DGProfileController

#pragma mark - 本文件全局访问的常量
static NSString * const DGProfileReuseCellID = @"profileReuseCellID";


- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(DGMainMargin - DGGroupCellMargin, 0, 0, 0);
    self.tableView.sectionFooterHeight = DGMainMargin;
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.backgroundColor = DGCommonBgColor;
    self.tableView.tableFooterView = [[DGProfileFootView alloc] init];
    
    [self setUpNavigation];
    
    [self.tableView registerClass:[DGProfileCell class] forCellReuseIdentifier:DGProfileReuseCellID];
}


#pragma mark - Navigation
- (void)setUpNavigation
{
    self.navigationItem.title = @"我的";
  UIBarButtonItem *moon =  [UIBarButtonItem barButtonItemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)];
  UIBarButtonItem *setting =  [UIBarButtonItem barButtonItemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
    self.navigationItem.rightBarButtonItems = @[setting,moon];
}

#pragma mark - 私有方法
- (void)moonClick
{

}
- (void)settingClick
{
    
}

#pragma mark UITabelViewdataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DGProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:DGProfileReuseCellID];
    if (indexPath.section == 0) {
    cell.imageView.image = [UIImage circleImageWithImage:[UIImage imageNamed:@"defaultUserIcon"] borderWidth:0.0 borderColor:nil];
    cell.textLabel.text = @"登录/注册";
    }else if (indexPath.section == 1){
    cell.textLabel.text = @"离线下载";
    cell.textLabel.font = [UIFont boldSystemFontOfSize:16];
    cell.imageView.image = [UIImage circleImageWithImage:[UIImage imageNamed:@"defaultUserIcon"] borderWidth:0.0 borderColor:nil];
    }else if (indexPath.section == 2){
      DGProfileCellView *cellView =  [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([DGProfileCellView class]) owner:nil options:nil] lastObject] ;
        cellView.frame = cell.bounds;
        [cell.contentView addSubview:cellView];
    }
    return cell;
}

#pragma mark UITabelViewdelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        DGLoginViewController *loginVc = [[DGLoginViewController alloc] init];
        [self presentViewController:loginVc animated:YES completion:nil];
    }
}
#pragma mark - 网络请求


@end

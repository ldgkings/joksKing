//
//  DGProfileController.m
//  joksKIng
//
//  Created by LDG on 16/1/14.
//  Copyright © 2016年 ldg. All rights reserved.
//

#import "DGProfileController.h"

@interface DGProfileController ()

@end

@implementation DGProfileController

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavigation];
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

#pragma mark - 网络请求


@end

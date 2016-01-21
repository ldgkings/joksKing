//
//  DGFriendTrendsController.m
//  joksKIng
//
//  Created by LDG on 16/1/20.
//  Copyright © 2016年 ldg. All rights reserved.
//

#import "DGFriendTrendsController.h"
#import "DGLoginViewController.h"

@interface DGFriendTrendsController ()

- (IBAction)LoginBtnClick;
- (IBAction)registerBtnClick;

@end

@implementation DGFriendTrendsController

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavigation];

}

#pragma mark - Navigation
- (void)setUpNavigation
{
    self.navigationItem.title = @"我的关注";
   
    [UIImage imageNamed:@"friendsTrend_login_click"];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(friendsRecommentIconclick)];
}

#pragma mark - 监听点击
- (void)friendsRecommentIconclick
{
    DGLogFuc;
}

- (IBAction)LoginBtnClick {
    DGLoginViewController *loginVc = [[DGLoginViewController alloc] init];
    loginVc.LoginClick = YES;
    [self presentViewController:loginVc animated:YES completion:nil];
    
}

- (IBAction)registerBtnClick {
    DGLoginViewController *loginVc = [[DGLoginViewController alloc] init];
    loginVc.LoginClick = NO;
    [self presentViewController:loginVc animated:YES completion:nil];
}
@end

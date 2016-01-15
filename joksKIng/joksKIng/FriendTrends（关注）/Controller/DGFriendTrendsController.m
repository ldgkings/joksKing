//
//  DGFriendTrendsController.m
//  joksKIng
//
//  Created by LDG on 16/1/14.
//  Copyright © 2016年 ldg. All rights reserved.
//

#import "DGFriendTrendsController.h"

@interface DGFriendTrendsController ()

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
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:@"friendsRecommentIcon" highImage:@"friendsRecommentIcon-click" target:self action:@selector(friendsRecomment)];
}

#pragma mark - 私有方法
/**
 * 添加关注朋友
 */
- (void)friendsRecomment
{
    
}



@end

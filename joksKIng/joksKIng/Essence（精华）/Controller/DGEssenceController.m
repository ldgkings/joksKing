//
//  DGEssenceController.m
//  joksKIng
//
//  Created by LDG on 16/1/14.
//  Copyright © 2016年 ldg. All rights reserved.
//

#import "DGEssenceController.h"
#import "DGEssenceTagController.h"

@interface DGEssenceController ()

@end

@implementation DGEssenceController


#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavigation];
}


#pragma mark - Navigation
- (void)setUpNavigation
{
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    [UIImage imageNamed:@"MainTagSubIconClick"];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(addtag)];
}

#pragma mark - 私有方法
- (void)addtag
{
    DGEssenceTagController *tag = [[DGEssenceTagController alloc] init];
    tag.title = @"标签订阅";
    [self.navigationController pushViewController:tag animated:YES];
}

@end

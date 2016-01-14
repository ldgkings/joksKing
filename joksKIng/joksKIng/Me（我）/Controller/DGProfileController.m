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
    self.title = @"我的";
}


@end

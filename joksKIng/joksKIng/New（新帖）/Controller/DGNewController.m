//
//  DGNewController.m
//  joksKIng
//
//  Created by LDG on 16/1/14.
//  Copyright © 2016年 ldg. All rights reserved.
//

#import "DGNewController.h"

@interface DGNewController ()

@end

@implementation DGNewController

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavigation];
}


#pragma mark - Navigation
- (void)setUpNavigation
{
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}


@end

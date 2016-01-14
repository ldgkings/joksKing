//
//  DGEssenceController.m
//  joksKIng
//
//  Created by LDG on 16/1/14.
//  Copyright © 2016年 ldg. All rights reserved.
//

#import "DGEssenceController.h"

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
}


@end

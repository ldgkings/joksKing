//
//  DGTabBarButton.h
//  微博项目
//
//  Created by etcxm on 15/9/25.
//  Copyright (c) 2015年 etcxm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DGTabBarButton : UIButton

/** 每个button对应的模型 */
@property (strong,nonatomic)UITabBarItem * item;

@end

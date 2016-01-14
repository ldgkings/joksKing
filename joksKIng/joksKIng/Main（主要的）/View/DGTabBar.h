//
//  DGTabBar.h
//  微博项目
//
//  Created by etcxm on 15/9/24.
//  Copyright (c) 2015年 etcxm. All rights reserved.
//



#import <UIKit/UIKit.h>

@class DGTabBar;

@protocol DGTabBarDelegate <NSObject>

@optional
- (void)tabBar:(DGTabBar *)tabBar didClickButton:(NSInteger)index;

- (void)tabBarDidClickPlusButton:(DGTabBar *)tabBer;
@end


@interface DGTabBar : UIView

//@property (nonatomic, assign) NSUInteger tabBarButtonCount;

// items:保存每一个按钮对应tabBarItem模型
@property (nonatomic, strong) NSArray *items;

@property (nonatomic, weak) id<DGTabBarDelegate> delegate;

@end
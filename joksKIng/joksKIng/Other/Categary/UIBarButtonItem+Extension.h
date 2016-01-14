//
//  UIBarButtonItem+Extension.h
//  微博项目
//
//  Created by wtlf on 15/9/25.
//  Copyright (c) 2015年 etcxm. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIBarButtonItem (Extension)
// 设置导航栏的左右两边的item属性
+ (UIBarButtonItem *)barButtonItemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

// 设置返回按钮
+ (UIBarButtonItem *)barButtonItemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action title:(NSString *)title;

@end

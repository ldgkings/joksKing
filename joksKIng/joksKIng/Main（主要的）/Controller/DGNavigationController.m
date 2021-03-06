
//
//  DGNavigationController.m
//  joksKIng
//
//  Created by LDG on 16/1/14.
//  Copyright © 2016年 ldg. All rights reserved.
//

#define DGNavTitleSize  [UIFont boldSystemFontOfSize:18]

#import "DGNavigationController.h"

@interface DGNavigationController ()<UINavigationControllerDelegate>

@property (strong,nonatomic) id  popDelegate;

@end

@implementation DGNavigationController

/**
 *  一些一次性的操作
 */
+ (void)initialize
{
    // 设置整个导航条的一些内容
    UINavigationBar *nav = [UINavigationBar appearance];
    [nav setBackgroundImage:[UIImage resizableImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"]] forBarMetrics:UIBarMetricsDefault];
   
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = DGNavTitleSize;
   
    [nav setTitleTextAttributes:attr];
    
    // 设置导航条的item的文字
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    // 普通状态的文字
    NSMutableDictionary *attrNomal = [NSMutableDictionary dictionary];
    attrNomal[NSFontAttributeName] = DGNavItemTitleSize;
    attrNomal[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:attrNomal forState:UIControlStateNormal];
    
    // 设置高亮时的文字
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = DGNavItemTitleSize;
    attrs[NSForegroundColorAttributeName] = [UIColor redColor];
    [item setTitleTextAttributes:attrs forState:UIControlStateHighlighted];
    
    // 设置失效时的文字
    NSMutableDictionary *attr1 = [NSMutableDictionary dictionary];
    attr1[NSFontAttributeName] = DGNavItemTitleSize;
    attr1[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [item setTitleTextAttributes:attr1 forState:UIControlStateDisabled];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.popDelegate = self.interactivePopGestureRecognizer.delegate ;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 每次跳转都会隐藏下面的tabBar
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
       
        // 设置返回键
        viewController.navigationItem.leftBarButtonItem  = [UIBarButtonItem barButtonItemWithImage:@"navigationButtonReturn" highImage:@"navigationButtonReturnClick" target:self action:@selector(back) title:@"返回"];
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

#pragma mark --UINavigationControllerDelegate 代理方法
/**
 *  在这个方法中判断是否是根控制器
 */

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 每次push的时候都放到了栈顶。所以第0个元素肯定是栈底的更控制器
    if(viewController == self.viewControllers[0]){// 是根控制器
        self.interactivePopGestureRecognizer.delegate = self.popDelegate;
    }else
    {
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UITabBarController *tabVc = (UITabBarController *)window.rootViewController;
    for (UIView *tabBarButton in tabVc.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButton removeFromSuperview];
        }
    }
}

@end


//
//  DGTabBarController.m
//  joksKIng
//
//  Created by LDG on 16/1/14.
//  Copyright © 2016年 ldg. All rights reserved.
//

#import "DGTabBarController.h"
#import "DGNavigationController.h"
#import "DGNewController.h"
#import "DGEssenceController.h"
#import "DGFriendTrendsController.h"
#import "DGProfileController.h"
#import "DGTabBar.h"
#import "DGTabBarButton.h"
#import "DGBadgeView.h"

@interface DGTabBarController ()<DGTabBarDelegate>

/** 存放着tabBar的模型 */
@property (strong,nonatomic)NSMutableArray * items;
@property (nonatomic,weak) DGNewController  *postsVc;
@property (nonatomic, weak) DGEssenceController *essenceVc;
@property (nonatomic, weak) DGFriendTrendsController *friendTrendsVc;
@property (nonatomic, weak) DGProfileController *profileVc;

@end

@implementation DGTabBarController

#pragma mark - 懒加载
- (NSMutableArray *)items
{
    if (_items == nil) {
        
        _items = [NSMutableArray array];
    }
    return _items;
}

#pragma mark - 生命周期方法

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加子控制器
    [self setUpAllChildController];
    
    // 初始化TabBar
    [self setUpTabBar];
}

- (void)setupxxx
{
    NSLog(@"xxxx");
}

// 在这个方法中才会加载tabBar的自控件 所以在viewdidload中把tabBar设置成dgTabBar；
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButton removeFromSuperview];
        }
    }
}



#pragma mark ---DGTabBarDelegate的方法
- (void)tabBar:(DGTabBar *)tabBar didClickButton:(NSInteger)index
{
    self.selectedIndex = index;
}

- (void)tabBarDidClickPlusButton:(DGTabBar *)tabBer
{
    
#warning 中间加号的接口
}


#pragma mark - 私有方法
/**
 *  初始化tabBar
 */
- (void)setUpTabBar
{
    DGTabBar *myTabBar = [[DGTabBar alloc] initWithFrame:self.tabBar.bounds];
    myTabBar.items = self.items;
    // 设置代理
    myTabBar.delegate = self;
    [self.tabBar addSubview:myTabBar];
}

/**
 *  添加子控制器
 */
- (void)setUpAllChildController
{
    // 精华
    DGEssenceController *essenceVc = [[DGEssenceController alloc] init];
    [self setUpOneChildViewController:essenceVc ImageName:@"tabBar_essence_icon" selName:@"tabBar_essence_click_icon" title:@"精华"];
    self.essenceVc = essenceVc;
    
    // 新帖
    DGNewController *postsVc = [[DGNewController alloc] init];
    [self setUpOneChildViewController:postsVc ImageName:@"tabBar_new_icon" selName:@"tabBar_new_click_icon" title:@"新帖"];
    self.postsVc = postsVc;
    
    // 关注
    DGFriendTrendsController *friendTrendsVc = [[DGFriendTrendsController alloc] init];
    [self setUpOneChildViewController:friendTrendsVc ImageName:@"tabBar_friendTrends_icon" selName:@"tabBar_friendTrends_click_icon" title:@"关注"];
    
    // 我
    DGProfileController *profileVc = [[DGProfileController alloc] init];
    [self setUpOneChildViewController:profileVc ImageName:@"tabBar_me_icon" selName:@"tabBar_me_click_icon" title:@"我"];
    self.profileVc = profileVc;
}

// 添加一个子控制器
- (void)setUpOneChildViewController:(UIViewController *)Vc ImageName:(NSString *)name selName:(NSString *)selName title:(NSString *)title
{
    Vc.tabBarItem.title = title;
    //    Vc.tabBarItem.badgeValue = @"10";
    Vc.tabBarItem.image = [UIImage imageNamed:name];
    Vc.tabBarItem.selectedImage = [UIImage imageNamed:selName];
    // 保存每个buttonitem的模型
    [self.items addObject:Vc.tabBarItem];
    DGNavigationController *nav = [[DGNavigationController alloc] initWithRootViewController:Vc];
    [self addChildViewController:nav];
}


@end

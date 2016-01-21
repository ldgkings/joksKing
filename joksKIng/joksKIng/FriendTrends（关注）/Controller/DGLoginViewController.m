//
//  DGLoginViewController.m
//  joksKIng
//
//  Created by LDG on 16/1/20.
//  Copyright © 2016年 ldg. All rights reserved.
//

#import "DGLoginViewController.h"

@interface DGLoginViewController ()
- (IBAction)cancalBtnClick;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UIView *registView;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@end

@implementation DGLoginViewController

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginBtn.layer.cornerRadius = 5;
    self.loginBtn.layer.masksToBounds = YES;

    [self setUpView];
}

#pragma mark - 私有方法
- (void)setUpView
{
    if (self.isLoginClick) { // 点击了登录
        self.registView.transform = CGAffineTransformMakeTranslation(self.view.width, 0);
        [self.rightBtn setTitle:@"注册账号" forState:UIControlStateNormal];
    }else{ // 点击了注册
        self.loginView.transform = CGAffineTransformMakeTranslation(-self.view.width, 0);
        [self.rightBtn setTitle:@"已有账号?" forState:UIControlStateNormal];
    }
}

#pragma mark - 监听点击
/**
 * 点击屏幕退键盘
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (IBAction)cancalBtnClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 * 点击了右上角的按钮
 */
- (IBAction)rightBtnClick:(UIButton *)rightBtn {
if ([rightBtn.currentTitle isEqualToString:@"注册账号"]) {
    [self.rightBtn setTitle:@"已有账号?" forState:UIControlStateNormal];
    [UIView animateWithDuration:0.25 animations:^{
        self.loginView.transform = CGAffineTransformMakeTranslation(-self.view.width, 0);
        self.registView.transform = CGAffineTransformIdentity;
    }];
    }else{
    [self.rightBtn setTitle:@"注册账号" forState:UIControlStateNormal];
    [UIView animateWithDuration:0.25 animations:^{
        self.registView.transform = CGAffineTransformMakeTranslation(self.view.width, 0);
        self.loginView.transform = CGAffineTransformIdentity;
    }];
}
}

@end

//
//  DGProfileFootView.m
//  joksKIng
//
//  Created by LDG on 16/1/24.
//  Copyright © 2016年 ldg. All rights reserved.
//

#import <MJExtension.h>
#import "DGProfileFootView.h"
#import "DGHTTPSessionManager.h"
#import "DGProfileSquare.h"
#import "DGProfileFooterButton.h"

@interface DGProfileFootView ()
@property (nonatomic,strong) NSArray * squares;
@end

@implementation DGProfileFootView

#pragma mark - 本文件访问的全局变量
static NSInteger const columnsOfFooter = 4;


#pragma mark - 懒加载
- (NSArray *)squares
{
    if (_squares == nil) {
        self.squares = [NSArray array ];
    }
    return _squares;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 通过网络加载格子数据
        [self loadSquare];
       
    }
    return self;
}

- (void)addSquare
{
    for (int i = 0; i<self.squares.count; i++) {
        DGProfileFooterButton *squareView = [[DGProfileFooterButton alloc] init];
        squareView.adjustsImageWhenHighlighted = NO;
        squareView.square = self.squares[i];
        [self addSubview:squareView];
    }
}

/**
 * 计算每个格子的尺寸
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat squareW = self.width / columnsOfFooter;
    CGFloat squareH = squareW;
    for (int i = 0; i < self.squares.count; i++) {
        int row = i / columnsOfFooter;
        int column = i % columnsOfFooter;
        
        CGFloat squareX = squareW * column;
        CGFloat squareY = squareH * row;
        UIButton *square = self.subviews[i];
        square.frame = CGRectMake(squareX, squareY, squareW, squareH);
    }
    self.height = CGRectGetMaxY(self.subviews.lastObject.frame);
    UITableView *tableView =  (UITableView *)self.superview;
    tableView.tableFooterView = self;
}

#pragma mark - netWorking
- (void)loadSquare
{
    // 请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"square";
    params[@"c"] = @"topic";
    
    __weak typeof(self) weakSelf = self;
    [[DGHTTPSessionManager manager] GET:DGHttpRequestURL parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        weakSelf.squares = [DGProfileSquare mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
        
        // 根据加载的数据添加格子
        [weakSelf addSquare];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        DGLog(@"加载失败");
    }];

}

@end

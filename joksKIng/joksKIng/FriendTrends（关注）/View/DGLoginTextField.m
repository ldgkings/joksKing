//
//  DGLoginTextField.m
//  joksKIng
//
//  Created by LDG on 16/1/21.
//  Copyright © 2016年 ldg. All rights reserved.
//

#import "DGLoginTextField.h"
#import "UITextField+XMGExtension.h"

@implementation DGLoginTextField

- (void)awakeFromNib
{

}

// 开始编辑的时候会调用这个方法
- (BOOL)becomeFirstResponder
{
    self.placeholderColor = [UIColor whiteColor];
    return [super becomeFirstResponder];
}

// 停止编辑的时候调用
- (BOOL)resignFirstResponder
{
    self.placeholderColor = [UIColor lightGrayColor];
    return [super resignFirstResponder];
}


@end

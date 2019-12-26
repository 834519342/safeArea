//
//  BaseViewController.m
//  GoodLuck
//
//  Created by admin on 2019/12/26.
//  Copyright © 2019 YAZX. All rights reserved.
//

#import "BaseViewController.h"
#import "Masonry.h"

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

// 初始化安全区域
- (UIView *)safeAreaView
{
    if (_safeAreaView == nil) {
        _safeAreaView = [[UIView alloc] init];
        _safeAreaView.backgroundColor = [UIColor whiteColor];
        _safeAreaView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:_safeAreaView];
        if (@available(iOS 11.0, *)) {
            __weak typeof(self) weakSelf = self;
            [_safeAreaView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(weakSelf.view.mas_safeAreaLayoutGuideTop);
                make.left.mas_equalTo(weakSelf.view.mas_safeAreaLayoutGuideLeft);
                make.right.mas_equalTo(weakSelf.view.mas_safeAreaLayoutGuideRight);
                make.bottom.mas_equalTo(weakSelf.view.mas_safeAreaLayoutGuideBottom);
            }];
        }else if (@available(iOS 9.0, *)) {
            [self.view addConstraints:@[
                [NSLayoutConstraint constraintWithItem:_safeAreaView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view.readableContentGuide attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0],
                [NSLayoutConstraint constraintWithItem:_safeAreaView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view.readableContentGuide attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0],
                [NSLayoutConstraint constraintWithItem:_safeAreaView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view.readableContentGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0],
                [NSLayoutConstraint constraintWithItem:_safeAreaView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view.readableContentGuide attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]
            ]];
        }else {
            _safeAreaView.translatesAutoresizingMaskIntoConstraints = YES;
            _safeAreaView.frame = self.view.bounds;
        }
    }
    return _safeAreaView;
}

@end

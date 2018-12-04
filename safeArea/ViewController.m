//
//  ViewController.m
//  safeArea
//
//  Created by xt on 2018/11/27.
//  Copyright © 2018 TJ. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:view];
    
    UIEdgeInsets padding = UIEdgeInsetsMake(0, 0, 0, 0);
    
    
    if (@available(iOS 11.0, *)) {
        __weak typeof(self) weakSelf = self;
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
            make.top.mas_equalTo(strongSelf.view.mas_safeAreaLayoutGuideTop).mas_offset(padding.top);
            make.left.mas_equalTo(strongSelf.view.mas_safeAreaLayoutGuideLeft).with.offset(padding.left);
            make.right.equalTo(strongSelf.view.mas_safeAreaLayoutGuideRight).mas_offset(-padding.right);
            make.bottom.equalTo(strongSelf.view.mas_safeAreaLayoutGuideBottom).with.offset(-padding.bottom);
        }];
    } else if (@available(iOS 9.0, *)) {
        [self.view addConstraints:@[
                                    [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view.readableContentGuide attribute:NSLayoutAttributeTop multiplier:1.0 constant:padding.top],
                                    [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view.readableContentGuide attribute:NSLayoutAttributeLeft multiplier:1.0 constant:padding.left],
                                    [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view.readableContentGuide attribute:NSLayoutAttributeRight multiplier:1.0 constant:-padding.right],
                                    [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view.readableContentGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-padding.bottom]
                                    ]];
    }else {
        view.translatesAutoresizingMaskIntoConstraints = YES;
        view.frame = self.view.bounds;
    }
    
}


@end

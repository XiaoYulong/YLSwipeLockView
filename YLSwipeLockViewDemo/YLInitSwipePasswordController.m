//
//  YLInitSwipePasswordController.m
//  YLSwipeLockViewDemo
//
//  Created by 肖 玉龙 on 15/2/27.
//  Copyright (c) 2015年 Yulong Xiao. All rights reserved.
//

#import "YLInitSwipePasswordController.h"
#import "YLSwipeLockView.h"

@interface YLInitSwipePasswordController ()<YLSwipeLockViewDelegate>
@property (nonatomic, weak) YLSwipeLockView *lockView;
@end

@implementation YLInitSwipePasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:35/255.0 green:39/255.0 blue:54/255.0 alpha:1];
    CGFloat viewWidth = self.view.bounds.size.width - 40;
    CGFloat viewHeight = viewWidth;
    YLSwipeLockView *lockView = [[YLSwipeLockView alloc] initWithFrame:CGRectMake(20, self.view.bounds.size.height - viewHeight - 40 - 100, viewWidth, viewHeight)];
    [self.view addSubview:lockView];
    
    self.lockView = lockView;
    self.lockView.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(YLSwipeLockViewState)swipeView:(YLSwipeLockView *)swipeView didEndSwipeWithPassword:(NSString *)password
{
    return YLSwipeLockViewStateWarning;
}

@end

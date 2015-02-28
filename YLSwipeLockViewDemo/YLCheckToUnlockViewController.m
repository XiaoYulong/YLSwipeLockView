//
//  YLCheckToUnlockViewController.m
//  YLSwipeLockViewDemo
//
//  Created by 肖 玉龙 on 15/2/28.
//  Copyright (c) 2015年 Yulong Xiao. All rights reserved.
//

#import "YLCheckToUnlockViewController.h"
#import "YLSwipeLockView.h"
@interface YLCheckToUnlockViewController ()<YLSwipeLockViewDelegate>
@property (nonatomic, weak) YLSwipeLockView *lockView;
@property (nonatomic, weak) UILabel *titleLabel;
@end

@implementation YLCheckToUnlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:35/255.0 green:39/255.0 blue:54/255.0 alpha:1];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"swipe to unlock";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.frame = CGRectMake(10, 60, self.view.bounds.size.width - 20, 20);
    titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [self.view addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
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
    NSString *savedPassword = [[NSUserDefaults standardUserDefaults] objectForKey:@"gesturePassword"];
    if ([savedPassword isEqualToString:password]) {
        [self performSelector:@selector(dismiss) withObject:nil afterDelay:1];
        return YLSwipeLockViewStateNormal;
    }else{
        return YLSwipeLockViewStateWarning;
    }
}

-(void)dismiss{
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


@end

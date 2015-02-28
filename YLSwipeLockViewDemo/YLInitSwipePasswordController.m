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
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, strong) NSString *passwordString;
@end

@implementation YLInitSwipePasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:35/255.0 green:39/255.0 blue:54/255.0 alpha:1];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"set your gesture password";
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
    if (self.passwordString == nil) {
        self.passwordString = password;
        self.titleLabel.text = @"confirm your gesture password again";
        return YLSwipeLockViewStateNormal;
    }else if ([self.passwordString isEqualToString:password]){
        self.titleLabel.text = @"set succeed";
        self.passwordString = nil;
        
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault setObject:password forKey:@"gesturePassword"];
        
        [self performSelector:@selector(dismiss) withObject:nil afterDelay:1];
        return YLSwipeLockViewStateNormal;
    }else{
        self.titleLabel.text = @"different from last time";
        return YLSwipeLockViewStateWarning;
    }
    
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(void)dismiss{
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end

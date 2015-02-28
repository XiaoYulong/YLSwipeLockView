//
//  ViewController.m
//  YLSwipeLockViewDemo
//
//  Created by 肖 玉龙 on 15/2/12.
//  Copyright (c) 2015年 Yulong Xiao. All rights reserved.
//

#import "ViewController.h"
#import "YLSwipeLockView.h"
#import "YLInitSwipePasswordController.h"

@interface ViewController ()
@property (nonatomic, weak) UIButton *setButton;
@property (nonatomic, weak) UIButton *checkButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
    label.text = @"hello world";
    CGFloat margin = 20.0f;
    CGFloat width = self.view.bounds.size.width - margin * 2;
    [[UIButton appearance] setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    UIButton *setButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 60, width, 20)];
    [setButton setTitle:@"set gesture password" forState:UIControlStateNormal];
    [setButton addTarget:self action:@selector(setButtonBeTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:setButton];
    
    UIButton *checkButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, width, 20)];
    [checkButton setTitle:@"check gesture password" forState:UIControlStateNormal];
    [checkButton addTarget:self action:@selector(checkButtonBeTouched) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:checkButton];
    
    
}

-(void)setButtonBeTouched
{
    YLInitSwipePasswordController *controller = [YLInitSwipePasswordController new];
    [self presentViewController:controller animated:YES completion:nil];
}

-(void)checkButtonBeTouched
{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"gesturePassword"]) {
        ;
    }else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Attention" message:@"no gesture password set" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        [alert show];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

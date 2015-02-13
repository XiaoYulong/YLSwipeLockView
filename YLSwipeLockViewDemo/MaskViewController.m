//
//  MaskViewController.m
//  YLSwipeLockViewDemo
//
//  Created by 肖 玉龙 on 15/2/12.
//  Copyright (c) 2015年 Yulong Xiao. All rights reserved.
//

#import "MaskViewController.h"

@interface MaskViewController ()
@property (nonatomic, strong) CAShapeLayer *lineLayer;
@property (nonatomic, strong) UIBezierPath *linePath;
@end

@implementation MaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    CALayer *redLayer = [[CALayer alloc] init];
    redLayer.frame = self.view.bounds;
    redLayer.backgroundColor = [UIColor redColor].CGColor;
//    [self.view.layer addSublayer:redLayer];
    
    CAShapeLayer *maskLayer = [CAShapeLayer new];
    maskLayer.frame = self.view.bounds;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.view.bounds];
    [path appendPath:[UIBezierPath bezierPathWithOvalInRect:(CGRect){{100, 100}, 100, 100}]];
    [path appendPath:[UIBezierPath bezierPathWithOvalInRect:(CGRect){{300, 100}, 100, 100}]];
    
    maskLayer.fillRule = kCAFillRuleEvenOdd;
    maskLayer.lineWidth = 3.0f;
    maskLayer.strokeColor = [UIColor blackColor].CGColor;
    maskLayer.fillColor = [UIColor redColor].CGColor;
    maskLayer.path = path.CGPath;
    
//    redLayer.mask = maskLayer;
    
    self.lineLayer = [CAShapeLayer new];
    self.lineLayer.frame = self.view.bounds;
    self.lineLayer.lineWidth = 1.0f;
    self.lineLayer.strokeColor = [UIColor redColor].CGColor;
    self.lineLayer.fillColor = [UIColor clearColor].CGColor;
    self.linePath = [UIBezierPath new];
    self.lineLayer.path = self.linePath.CGPath;
    
    [self.view.layer addSublayer:self.lineLayer];
    
    UIPanGestureRecognizer *panRec = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:panRec];
    
}

-(void)pan:(UIPanGestureRecognizer *)rec
{
    CGPoint touchPoint = [rec locationInView:self.view];
    if (rec.state == UIGestureRecognizerStateBegan) {
        NSLog(@"begin:%@", self.linePath);
        [self.linePath moveToPoint:touchPoint];
        self.lineLayer.path = self.linePath.CGPath;
    }
    if (rec.state == UIGestureRecognizerStateChanged) {
        NSLog(@"changed:%@", self.linePath);
        [self.linePath addLineToPoint:touchPoint];
        self.lineLayer.path = self.linePath.CGPath;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

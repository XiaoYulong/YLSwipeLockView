//
//  YLSwipeLockNodeView.m
//  YLSwipeLockViewDemo
//
//  Created by 肖 玉龙 on 15/2/12.
//  Copyright (c) 2015年 Yulong Xiao. All rights reserved.
//

#import "YLSwipeLockNodeView.h"

@interface YLSwipeLockNodeView()
@property (nonatomic, strong)CAShapeLayer *outlineLayer;
@end


@implementation YLSwipeLockNodeView
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.layer addSublayer:self.outlineLayer];
        self.nodeViewStatus = YLSwipeLockNodeViewStatusNormal;
        UIPanGestureRecognizer *panRec = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
//        [self addGestureRecognizer:panRec];
    }
    return self;
}

-(void)pan:(UIPanGestureRecognizer *)rec
{
    NSLog(@"what the fuck");
    CGPoint point = [rec locationInView:self];
    NSLog(@"location in view:%f, %f", point.x, point.y);
    self.nodeViewStatus = YLSwipeLockNodeViewStatusSelected;
}

-(void)setNodeViewStatus:(YLSwipeLockNodeViewStatus)nodeViewStatus
{
    _nodeViewStatus = nodeViewStatus;
    switch (_nodeViewStatus) {
        case YLSwipeLockNodeViewStatusNormal:
            self.outlineLayer.strokeColor = [UIColor blueColor].CGColor;
            break;
        case YLSwipeLockNodeViewStatusSelected:
            self.outlineLayer.strokeColor = [UIColor redColor].CGColor;
            break;
        case YLSwipeLockNodeViewStatusWorming:
            ;
            break;
        default:
            break;
    }
}

-(void)layoutSubviews
{
    self.outlineLayer.frame = self.bounds;
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    self.outlineLayer.path = circlePath.CGPath;
    UILabel *label  = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 40, 20)];
    label.text = [@(self.tag) stringValue];
    [self addSubview:label];

}

-(CAShapeLayer *)outlineLayer
{
    if (_outlineLayer == nil) {
        _outlineLayer = [[CAShapeLayer alloc] init];
        _outlineLayer.strokeColor = [UIColor blueColor].CGColor;
        _outlineLayer.lineWidth = 1.0f;
        _outlineLayer.fillColor  = [UIColor clearColor].CGColor;
    }
    return _outlineLayer;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

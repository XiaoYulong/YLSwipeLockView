//
//  YLSwipeLockView.m
//  YLSwipeLockViewDemo
//
//  Created by 肖 玉龙 on 15/2/12.
//  Copyright (c) 2015年 Yulong Xiao. All rights reserved.
//

#import "YLSwipeLockView.h"
#import "YLSwipeLockNodeView.h"
@interface YLSwipeLockView()
@property (nonatomic, strong) NSMutableArray *nodeArray;
@end

@implementation YLSwipeLockView
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _nodeArray = [NSMutableArray arrayWithCapacity:9];
        for (int i = 0; i < 9; ++i) {
            YLSwipeLockNodeView *nodeView = [YLSwipeLockNodeView new];
            [_nodeArray addObject:nodeView];
            nodeView.tag = i;
            [self addSubview:nodeView];
            UIPanGestureRecognizer *panRec = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
            [self addGestureRecognizer:panRec];
        }
    }
    return self;
}

-(void)pan:(UIPanGestureRecognizer *)rec
{
    NSLog(@"what the fuck");
    CGPoint point = [rec locationInView:self];
    NSInteger index = [self indexForNodeAtPoint:point];
    if (index >= 0) {
        YLSwipeLockNodeView *node = self.nodeArray[index];
        node.nodeViewStatus = YLSwipeLockNodeViewStatusSelected;
    }
}

-(void)layoutSubviews{
    //TODO: here should be more decent
    for (int i = 0; i < self.nodeArray.count; ++i) {
        YLSwipeLockNodeView *nodeView = _nodeArray[i];
        // TODO: change to use MIN marco in the future
        CGFloat min = self.bounds.size.width < self.bounds.size.height ? self.bounds.size.width : self.bounds.size.height;
        CGFloat width = min / 5;
        CGFloat height = min / 5;
        int row = i % 3;
        int column = i / 3;
        CGRect frame = CGRectMake(row *(width * 2), column * (width *2), width, height);
        nodeView.frame = frame;
    }
}

-(NSInteger)indexForNodeAtPoint:(CGPoint)point
{
    for (int i = 0; i < self.nodeArray.count; ++i) {
        YLSwipeLockNodeView *node = self.nodeArray[i];
        CGPoint pointInNode = [node convertPoint:point fromView:self];
        if ([node pointInside:pointInNode withEvent:nil]) {
            NSLog(@"点中了第%d个~~", i);
            return i;
        }
    }
    return -1;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

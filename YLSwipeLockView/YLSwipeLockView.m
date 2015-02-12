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
            [self addSubview:nodeView];
        }
    }
    return self;
}
-(void)layoutSubviews{
    for (int i = 0; i < 9; ++i) {
        YLSwipeLockNodeView *nodeView = _nodeArray[i];
        // TODO: change to use MIN marco in the future
        CGFloat min = self.bounds.size.width < self.bounds.size.height ? self.bounds.size.width : self.bounds.size.height;
        CGFloat width = min / 3;
        CGFloat height = min / 3;
        int row = i / 3;
        int column = i % 3;
        CGRect frame = CGRectMake(row *width, column * height, width, height);
        nodeView.frame = frame;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

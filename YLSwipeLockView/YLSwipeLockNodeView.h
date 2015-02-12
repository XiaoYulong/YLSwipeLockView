//
//  YLSwipeLockNodeView.h
//  YLSwipeLockViewDemo
//
//  Created by 肖 玉龙 on 15/2/12.
//  Copyright (c) 2015年 Yulong Xiao. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, YLSwipeLockNodeViewStatus) {
    YLSwipeLockNodeViewStatusNormal,
    YLSwipeLockNodeViewStatusSelected,
    YLSwipeLockNodeViewStatusWarning
};

@interface YLSwipeLockNodeView : UIView
@property (nonatomic) YLSwipeLockNodeViewStatus nodeViewStatus;

@end

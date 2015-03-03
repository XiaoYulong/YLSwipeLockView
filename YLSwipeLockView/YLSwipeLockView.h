//
//  YLSwipeLockView.h
//  YLSwipeLockViewDemo
//
//  Created by 肖 玉龙 on 15/2/12.
//  Copyright (c) 2015年 Yulong Xiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#define LIGHTBLUE [UIColor colorWithRed:0 green:170/255.0 blue:1 alpha:1]

typedef NS_ENUM(NSUInteger, YLSwipeLockViewState) {
    YLSwipeLockViewStateNormal,
    YLSwipeLockViewStateWarning,
    YLSwipeLockViewStateSelected
};
@protocol YLSwipeLockViewDelegate;

@interface YLSwipeLockView : UIView
@property (nonatomic, weak) id<YLSwipeLockViewDelegate> delegate;
@end


@protocol YLSwipeLockViewDelegate<NSObject>
@optional
-(YLSwipeLockViewState)swipeView:(YLSwipeLockView *)swipeView didEndSwipeWithPassword:(NSString *)password;
@end
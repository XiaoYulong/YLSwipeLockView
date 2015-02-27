//
//  YLSwipeLockView.h
//  YLSwipeLockViewDemo
//
//  Created by 肖 玉龙 on 15/2/12.
//  Copyright (c) 2015年 Yulong Xiao. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, YLSwipeLockViewState) {
    YLSwipeLockViewStateNormal,
    YLSwipeLockViewStateWarning
};
@protocol YLSwipeLockViewDelegate;

@interface YLSwipeLockView : UIView
@property (nonatomic, strong) id<YLSwipeLockViewDelegate> delegate;
@end


@protocol YLSwipeLockViewDelegate<NSObject>
@optional
-(YLSwipeLockViewState)swipeView:(YLSwipeLockView *)swipeView didEndSwipeWithPassword:(NSString *)password;
@end
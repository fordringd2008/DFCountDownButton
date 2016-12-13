//
//  DFCountDownButton.h
//  JKCountDownButton
//
//  Created by DFD on 2016/12/13.
//  Copyright © 2016年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DFCountDownButton;

typedef NSString* (^CountDownChanging)(DFCountDownButton *countDownButton, NSUInteger second);

typedef NSString* (^CountDownFinished)(DFCountDownButton *countDownButton);

typedef void (^TouchedCountDownButtonBlock)(DFCountDownButton *countDownButton,NSInteger tag);


@interface DFCountDownButton : UIButton

// 点击触发的回调
@property (nonatomic, copy) TouchedCountDownButtonBlock countDownButtonBlock;

// 时间变化触发回调
@property (nonatomic, copy) CountDownChanging countDownChanging;

// 结束时触发的回调
@property (nonatomic, copy) CountDownFinished countDownFinished;

//开始倒计时
- (void)startCountDownWithSecond:(NSUInteger)second;

///停止倒计时
- (void)stopCountDown;


@end

//
//  DFCountDownButton.m
//  JKCountDownButton
//
//  Created by DFD on 2016/12/13.
//  Copyright © 2016年 www.skyfox.org. All rights reserved.
//

#import "DFCountDownButton.h"

@implementation DFCountDownButton
{
    NSInteger       _second;                // 当前剩余时间 (s)
    NSUInteger      _totalSecond;           // 总时间（s）
    NSTimer *       _timer;                 // 计数器
    NSDate *        _startDate;             // 开始的时间
}

// 设置点击事件
- (void)setCountDownButtonBlock:(TouchedCountDownButtonBlock)countDownButtonBlock{
    _countDownButtonBlock = [countDownButtonBlock copy];
    [self addTarget:self action:@selector(touched:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)touched:(DFCountDownButton*)sender{
    if (_countDownButtonBlock) {
        _countDownButtonBlock(sender, sender.tag);
    }
}

- (void)startCountDownWithSecond:(NSUInteger)second{
    _totalSecond = _second = second;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerStart:) userInfo:nil repeats:YES];
    _startDate = [NSDate date];
    [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)timerStart:(NSTimer *)theTimer{
    double interval = [[NSDate date] timeIntervalSinceDate:_startDate];
    _second = _totalSecond - (NSUInteger)(interval + 0.5);
    if (_second < 0.0) {
        // 停止计数器
        [self stopCountDown];
    }else{
        NSString *newTitle = _countDownChanging ? _countDownChanging(self, _second) : [NSString stringWithFormat:@"%zd秒",_second];
        [self setTitle:newTitle forState:UIControlStateNormal];
        [self setTitle:newTitle forState:UIControlStateDisabled];
    }
}

- (void)stopCountDown{
    if (_timer) {
        if ([_timer respondsToSelector:@selector(isValid)])
        {
            if ([_timer isValid])
            {
                [_timer invalidate];
                _second = _totalSecond;
                NSString *newTitle = _countDownFinished ? _countDownFinished(self) : @"重新获取";
                [self setTitle:newTitle forState:UIControlStateNormal];
                [self setTitle:newTitle forState:UIControlStateDisabled];
                
            }
        }
    }
}

#pragma -mark block
- (void)countDownChanging:(CountDownChanging)countDownChanging{
    _countDownChanging = [countDownChanging copy];
}
- (void)countDownFinished:(CountDownFinished)countDownFinished{
    _countDownFinished = [countDownFinished copy];
}










@end

//
//  TimerManager.m
//  TestTimeSingleton
//
//  Created by ys on 16/6/24.
//  Copyright © 2016年 jzh. All rights reserved.
//

#import "TimerManager.h"

@interface TimerManager ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, copy) CurrentTimeBlock block;
@property (nonatomic, assign) NSInteger nowTime;

@end

@implementation TimerManager

+ (instancetype)sharedTimerManager
{
    static TimerManager *timerManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timerManager = [[TimerManager alloc] init];
        [timerManager start];
    });
    return timerManager;
}

- (void)start
{
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    _nowTime = [date timeIntervalSince1970] - self.subTime;
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
//        [[NSRunLoop currentRunLoop] run];
//    });
}

- (void)timerAction:(NSTimer *)timer
{
    if (_block) {
        _block(++_nowTime);
    }
}

- (void)timerManagerCurrentTime:(CurrentTimeBlock)currentTime
{
    if (currentTime) {
        _block = currentTime;
    }
}

- (void)stop
{
    [_timer invalidate];
}

@end

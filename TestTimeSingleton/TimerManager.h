//
//  TimerManager.h
//  TestTimeSingleton
//
//  Created by ys on 16/6/24.
//  Copyright © 2016年 jzh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CurrentTimeBlock)(NSInteger nowTime);

@interface TimerManager : NSObject

+ (instancetype)sharedTimerManager;

// 与服务器的时间差
@property (nonatomic, assign) int subTime;

// 当前服务器时间
- (void)timerManagerCurrentTime:(CurrentTimeBlock)currentTime;

// 开始计时
- (void)start;

// 停止计时
- (void)stop;

@end

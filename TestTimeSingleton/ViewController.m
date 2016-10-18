//
//  ViewController.m
//  TestTimeSingleton
//
//  Created by ys on 16/6/24.
//  Copyright © 2016年 jzh. All rights reserved.
//

#import "ViewController.h"

#import "TimerManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [TimerManager sharedTimerManager].subTime = 3;
    [[TimerManager sharedTimerManager] timerManagerCurrentTime:^(NSInteger nowTime) {
        NSLog(@"%ld", nowTime);
        self.view.backgroundColor = nowTime % 2 ? [UIColor redColor] : [UIColor greenColor];
    }];
    [[TimerManager sharedTimerManager] start];
}

@end

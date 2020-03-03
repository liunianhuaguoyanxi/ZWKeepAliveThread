//
//  ViewController.m
//  ZWKeepAliveThread
//
//  Created by 流年划过颜夕 on 2020/3/3.
//  Copyright © 2020 liunianhuaguoyanxi. All rights reserved.
//

#import "ViewController.h"
#import "ZWKeepAliveThread.h"

@interface ViewController ()
/** 线程保活 */
@property (nonatomic, strong) ZWKeepAliveThread *keepAliveThread;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.keepAliveThread  = [[ZWKeepAliveThread alloc] init];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.keepAliveThread executeTask:^{
        NSLog(@"执行任务 --  %@", [NSThread currentThread]);
    }];
}

- (void)dealloc
{
    [self.keepAliveThread stop];
}

@end

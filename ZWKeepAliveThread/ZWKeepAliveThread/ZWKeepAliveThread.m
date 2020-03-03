//
//  ZWKeepAliveThread.m
//  ZWKeepAliveThread
//
//  Created by 流年划过颜夕 on 2020/3/3.
//  Copyright © 2020 liunianhuaguoyanxi. All rights reserved.
//

#import "ZWKeepAliveThread.h"

@interface ZWKeepAliveThread ()

/** 保活线程 */
@property (nonatomic, strong) NSThread *keepAliveThread;

@end


@implementation ZWKeepAliveThread

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.keepAliveThread = [[NSThread alloc] initWithBlock:^{
            //创建初始化上下文
            CFRunLoopSourceContext  context = {0};
            
            //创建source
            CFRunLoopSourceRef source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
            
            //向runLoop中添加source
            CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
            
            //销毁source
            CFRelease(source);
            
            //启动
            CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, false);
        }];
        
        [self.keepAliveThread start];
    }
    return self;
}
;/// 在保活线程执行任务
/// @param task 任务
- (void)executeTask:(ZWKeepAliveThreadTask)task
{
    if (!self.keepAliveThread || !task) {
        
        return;
    }else
    {
       
        [self performSelector:@selector(__executeTask:) onThread:self.keepAliveThread withObject:task waitUntilDone:YES];
    }
}


/// 结束线程
- (void)stop
{
    if (!self.keepAliveThread) {
        return;
    }else
    {
        [self performSelector:@selector(__stop) onThread:self.keepAliveThread withObject:nil waitUntilDone:YES];
    }
}


- (void)__executeTask:(ZWKeepAliveThreadTask)task
{
    
    task();
}

- (void)__stop
{
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.keepAliveThread = nil;
}
@end

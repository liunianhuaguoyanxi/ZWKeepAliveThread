//
//  ZWKeepAliveThread.h
//  ZWKeepAliveThread
//
//  Created by 流年划过颜夕 on 2020/3/3.
//  Copyright © 2020 liunianhuaguoyanxi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^ZWKeepAliveThreadTask)(void);

@interface ZWKeepAliveThread : NSObject

/// 在保活线程执行任务
/// @param task 任务
- (void)executeTask:(ZWKeepAliveThreadTask)task;


/// 结束线程
- (void)stop;






@end

NS_ASSUME_NONNULL_END

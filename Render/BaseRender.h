//
//  BaseRender.h
//  BaseMetalDemo
//
//  Created by fenwei on 2020/8/21.
//  Copyright © 2020 sxcoal.com. All rights reserved.
//

#import <Foundation/Foundation.h>
//导入MetalKit工具包
@import MetalKit;
NS_ASSUME_NONNULL_BEGIN
//MTKViewDelegate协议:允许对象呈现在视图中并响应调整大小事件
@interface BaseRender : NSObject<MTKViewDelegate>

///初始化一个MTKView
-(instancetype)initWithMetalKitView:(MTKView *)mtkView;

@end

NS_ASSUME_NONNULL_END

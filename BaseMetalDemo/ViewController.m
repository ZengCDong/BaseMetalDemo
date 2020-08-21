//
//  ViewController.m
//  BaseMetalDemo
//
//  Created by fenwei on 2020/8/21.
//  Copyright © 2020 sxcoal.com. All rights reserved.
//

#import "ViewController.h"
#import "BaseRender.h"
@import MetalKit;
@interface ViewController ()
{
    MTKView *_view;
    
    BaseRender *_renderer;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _view = (MTKView *)self.view;
    _view.device = MTLCreateSystemDefaultDevice();
    if(!_view.device)
    {
        NSLog(@"Metal is not supported on this device");
        return;
    }
    _renderer = [[BaseRender alloc]initWithMetalKitView:_view];
    if(!_renderer)
    {
        NSLog(@"Renderer failed initialization");
        return;
    }
    [_renderer mtkView:_view drawableSizeWillChange:_view.drawableSize];
    _view.delegate = _renderer;
    
}


@end

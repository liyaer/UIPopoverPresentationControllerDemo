//
//  ItemPopoverViewController.m
//  PopoverControllerDemo
//
//  Created by 侯卫磊 on 2017/6/22.
//  Copyright © 2017年 houweilei. All rights reserved.
//

#import "ItemPopoverViewController.h"


@interface ItemPopoverViewController ()

@property (nonatomic, strong) UILabel *label;

@end


@implementation ItemPopoverViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.text = @"hello";
    [self.view addSubview:self.label];
    self.view.backgroundColor = [UIColor redColor];
    
    //这里的值还是默认的全屏大小
    NSLog(@"-----%@",NSStringFromCGRect(self.view.frame));
}

- (void)viewWillLayoutSubviews
{
    //这里的值才是我们设置的大小
    NSLog(@"-----%@",NSStringFromCGRect(self.view.frame));
    //因此，在这重新修改子视图的布局
    self.label.frame = self.view.bounds;
}

- (void)viewDidLayoutSubviews
{

}


@end

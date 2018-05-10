//
//  ViewController.m
//  PopoverControllerDemo
//
//  Created by 侯卫磊 on 2017/6/22.
//  Copyright © 2017年 houweilei. All rights reserved.
//

#import "ViewController.h"
#import "ItemPopoverViewController.h"
#import "ButtonPopoverViewController.h"


@interface ViewController () <UIPopoverPresentationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *barItem;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
}

//方式1：barButtonItem类型
- (IBAction)clickDoneItem:(UIBarButtonItem *)sender
{
    ItemPopoverViewController *controller = [[ItemPopoverViewController alloc] init];
    controller.preferredContentSize = CGSizeMake(300, 200); // 设置popover出来的视图的大小
    controller.modalPresentationStyle = UIModalPresentationPopover;
    

    UIPopoverPresentationController *popController = [controller popoverPresentationController];
    popController.delegate = self;
    popController.barButtonItem = self.barItem;
    
    [self presentViewController:controller animated:YES completion:nil];
}

//方式2：UIView 类型
- (IBAction)clickButton:(UIButton *)sender
{
    ButtonPopoverViewController *controller = [[ButtonPopoverViewController alloc] init];
    controller.preferredContentSize = CGSizeMake(50, 100);
    controller.modalPresentationStyle = UIModalPresentationPopover;
    
    
    UIPopoverPresentationController *popController = [controller popoverPresentationController];
    popController.delegate = self;
    popController.sourceView = self.button;
    popController.sourceRect = self.button.bounds;
    //控制方向
    popController.permittedArrowDirections = UIPopoverArrowDirectionDown;

    [self presentViewController:controller animated:YES completion:nil];
}

// 设立实现代理，注意要返回UIModalPresentationNone
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    return UIModalPresentationNone;
}


@end

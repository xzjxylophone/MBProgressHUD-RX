//
//  UIViewController+RXMBProgressHUD.m
//  MBProgressHUD-RXExample
//
//  Created by ceshi on 16/5/20.
//  Copyright © 2016年 Rush. All rights reserved.
//

#import "UIViewController+RXMBProgressHUD.h"
#import <objc/runtime.h>
@implementation UIViewController (RXMBProgressHUD)


- (MBProgressHUD *)rx_progressHUD
{
    MBProgressHUD *hud = objc_getAssociatedObject(self, "rx_progressHUD");
    if(hud == nil) {
        UIView *hudSuperView = self.view;
        hud = [[MBProgressHUD alloc] initWithView:hudSuperView];
        hud.dimBackground = YES;
        hud.removeFromSuperViewOnHide = YES;
        [hudSuperView addSubview:hud];
        self.rx_progressHUD = hud;
    }
    return hud;
}

- (void)setRx_progressHUD:(MBProgressHUD *)rx_progressHUD
{
    objc_setAssociatedObject(self, @"rx_progressHUD", rx_progressHUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



@end

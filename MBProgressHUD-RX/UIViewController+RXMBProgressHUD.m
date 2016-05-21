//
//  UIViewController+RXMBProgressHUD.m
//  MBProgressHUD-RXExample
//
//  Created by ceshi on 16/5/20.
//  Copyright © 2016年 Rush. All rights reserved.
//

#import "UIViewController+RXMBProgressHUD.h"
#import <objc/runtime.h>
#import "MBProgressHUD+RX.h"
@implementation UIViewController (RXMBProgressHUD)


#pragma mark - loading
- (void)rx_showHUD
{
    [self __private_rx_showHUDWithMessage:nil];
}

- (void)rx_showHUDWithMessage:(NSString *)message
{
    [self __private_rx_showHUDWithMessage:message];
}

- (void)rx_hideHUD
{
    if(!self.rx_progressHUD.taskInProgress) {
        return;
    }
    self.rx_progressHUD.taskInProgress = NO;
    [self.rx_progressHUD hide:YES];
    self.rx_progressHUD = nil;
}

- (void)rx_hideHUDWithCompletionMessage:(NSString *)message
{
    self.rx_progressHUD.labelText = message;
    [self performSelector:@selector(rx_hideHUD) withObject:nil afterDelay:1];
}

- (void)rx_hideHUDWithCompletionMessage:(NSString *)message completionBlock:(dispatch_block_t)completionBlock
{
    self.rx_progressHUD.completionBlock = completionBlock;
    [self rx_hideHUDWithCompletionMessage:message];
}



#pragma mark - Warning
- (MBProgressHUD *)rx_showWarningWithMessage:(NSString *)message
{
    return [self rx_showWarningWithMessage:message completionBlock:nil];
}
- (MBProgressHUD *)rx_showWarningWithMessage:(NSString *)message completionBlock:(dispatch_block_t)completionBlock
{
    MBProgressHUD *hud = [MBProgressHUD rx_hudWithMessage:message view:self.view completionBlock:completionBlock];
    [hud hide:YES afterDelay:2.0];
    return hud;
}







#pragma mark - Private

- (void)__private_rx_showHUDWithMessage:(NSString *)message
{
    self.rx_progressHUD.labelText = message;
    if (self.rx_progressHUD.taskInProgress) {
        return;
    }
    self.rx_progressHUD.taskInProgress = YES;
    [self.rx_progressHUD show:YES];
}


#pragma mark - Property
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
    objc_setAssociatedObject(self, "rx_progressHUD", rx_progressHUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}







@end

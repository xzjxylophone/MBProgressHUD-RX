//
//  MBProgressHUD+RX.m
//  MBProgressHUD-RXExample
//
//  Created by ceshi on 16/5/20.
//  Copyright © 2016年 Rush. All rights reserved.
//

#import "MBProgressHUD+RX.h"
#import <objc/runtime.h>

@implementation MBProgressHUD (RX)
+ (MBProgressHUD *)rx_showWarningWithMessage:(NSString *)message
{
    return [self rx_showWarningWithMessage:message completionBlock:nil];
}

+ (MBProgressHUD *)rx_showWarningWithMessage:(NSString *)message completionBlock:(dispatch_block_t)completionBlock
{
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD rx_hudWithMessage:message view:window completionBlock:completionBlock];
    [hud hide:YES afterDelay:2.0];
    return hud;
}


+ (MBProgressHUD *)rx_hudWithMessage:(NSString *)message view:(UIView *)view completionBlock:(dispatch_block_t)completionBlock

{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.dimBackground = NO;
    hud.completionBlock = completionBlock;
    hud.mode = MBProgressHUDModeCustomView;
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 20 * 2;
    CGFloat labelMaxWidth = width - 20 * 2;
    CGFloat labelY = 0;
    CGFloat labelX = 0;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(labelX, labelY, labelMaxWidth, 0)];
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:17];
    label.numberOfLines = 2;
    label.numberOfLines = 0;
    [label sizeToFit];
    hud.customView = label;
    return hud;
    
}



#pragma mark - MBProgressHUDDelegate
- (void)hudWasHidden:(MBProgressHUD *)hud
{
    if(hud.rx_hudFinished) {
        hud.rx_hudFinished();
        hud.rx_hudFinished = nil;
    }
    hud.delegate = nil;
}



#pragma mark - Property
- (dispatch_block_t)rx_hudFinished
{
    dispatch_block_t block = objc_getAssociatedObject(self, "rx_hudFinished");
    return block;
}

- (void)setRx_hudFinished:(dispatch_block_t)rx_hudFinished
{
    objc_setAssociatedObject(self, "rx_hudFinished", rx_hudFinished, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end

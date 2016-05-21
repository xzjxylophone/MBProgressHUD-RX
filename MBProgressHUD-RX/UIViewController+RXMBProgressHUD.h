//
//  UIViewController+RXMBProgressHUD.h
//  MBProgressHUD-RXExample
//
//  Created by ceshi on 16/5/20.
//  Copyright © 2016年 Rush. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface UIViewController (RXMBProgressHUD)

@property (nonatomic, strong) MBProgressHUD *rx_progressHUD;



// loading & hidden loading
- (void)rx_showHUD;
- (void)rx_showHUDWithMessage:(NSString *)message;
- (void)rx_hideHUD;
- (void)rx_hideHUDWithCompletionMessage:(NSString *)message;
- (void)rx_hideHUDWithCompletionMessage:(NSString *)message completionBlock:(dispatch_block_t)completionBlock;



// warning text
- (MBProgressHUD *)rx_showWarningWithMessage:(NSString *)message;

- (MBProgressHUD *)rx_showWarningWithMessage:(NSString *)message completionBlock:(dispatch_block_t)completionBlock;



@end

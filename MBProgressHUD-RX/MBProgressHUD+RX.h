//
//  MBProgressHUD+RX.h
//  MBProgressHUD-RXExample
//
//  Created by ceshi on 16/5/20.
//  Copyright © 2016年 Rush. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (RX)




+ (MBProgressHUD *)rx_showWarningWithMessage:(NSString *)message;
+ (MBProgressHUD *)rx_showWarningWithMessage:(NSString *)message completionBlock:(dispatch_block_t)completionBlock;







+ (MBProgressHUD *)rx_hudWithMessage:(NSString *)message view:(UIView *)view completionBlock:(dispatch_block_t)completionBlock;



@end

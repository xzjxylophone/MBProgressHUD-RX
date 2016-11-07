//
//  MainViewController.m
//  MBProgressHUD-RXExample
//
//  Created by ceshi on 16/5/20.
//  Copyright © 2016年 Rush. All rights reserved.
//

#import "MainViewController.h"
#import "MBProgressHUD+RXHeader.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)testShowHud
{
    MBProgressHUD *hud = self.rx_progressHUD;
    hud.dimBackground = NO;
    [self rx_showHUDWithMessage:@"kkkk"];
    
    [self performSelector:@selector(testHidHud) withObject:nil afterDelay:3];
    
}

- (void)testHidHud
{
//    [self rx_hideHUD];
    
//    [self rx_hideHUDWithCompletionMessage:@"1234567"];
    

    [self rx_hideHUDWithCompletionMessage:@"123" completionBlock:^{
        NSLog(@"kkkk");
    }];
}

- (void)testShowWarning
{

    [self rx_showWarningWithMessage:@"111w11111111111111111111111omslgkjslgjlskajglsjgljsl;gjslkjalksjglksjaglkjsdlkajglksjljsdlkgjaslkgjdskl" completionBlock:^{
        NSLog(@"222");
    }];
    
//    NSLog(@"%p", hud);
    
//    [self performSelector:@selector(testShowWarning) withObject:nil afterDelay:5];
    
//    [MBProgressHUD rx_showWarningWithMessage:@"3333"];
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self performSelector:@selector(testShowWarning) withObject:nil afterDelay:1];
    
//    [self performSelector:@selector(testShowHud) withObject:nil afterDelay:1];

    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

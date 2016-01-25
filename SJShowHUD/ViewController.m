//
//  ViewController.m
//  SJShowHUD
//
//  Created by SPIREJ on 16/1/19.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import "ViewController.h"
#import "SJShowWaitingAlert.h"

@interface ViewController ()
- (IBAction)showHudBtnTouch:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)showHudBtnTouch:(UIButton *)sender {
    [SJShowWaitingAlert showWaitingContent:SJLoadingViewLoadingText inView:self];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SJShowWaitingAlert hideWaitingInView:self];
    });
}

@end

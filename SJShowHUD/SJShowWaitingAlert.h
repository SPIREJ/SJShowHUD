//
//  SJShowWaitingAlert.h
//  SJShowHUD
//
//  Created by SPIREJ on 16/1/25.
//  Copyright © 2016年 SPIREJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SJShowHUDView.h"

@interface SJShowWaitingAlert : NSObject

//显示加载窗
+ (void)showWaitingContent:(NSString *)alert inView:(id)delegate;
//影藏加载窗
+ (void)hideWaitingInView:(id)delegate;
@end

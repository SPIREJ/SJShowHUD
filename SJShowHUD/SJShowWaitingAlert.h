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

+ (void)showWaitingContent:(NSString *)alert inView:(id)delegate;
+ (void)hideWaitingInView:(id)delegate;
@end

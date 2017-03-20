//
//  NetworkNoticeView.h
//  statusView
//
//  Created by lab702 on 2017/3/19.
//  Copyright © 2017年 Wlson.lin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideInView.h"

@interface NetworkNoticeView : SlideInView


+ (void)showNetworkNotice;

+ (void)hide;

- (IBAction)onCancelClicked:(id)sender;

@end

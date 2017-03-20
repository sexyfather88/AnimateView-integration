//
//  StatusView.m
//  statusView
//
//  Created by lab702 on 2017/3/19.
//  Copyright © 2017年 Wlson.lin. All rights reserved.
//

#import "StatusView.h"

__strong static StatusView *_instance = nil;


@implementation StatusView


+ (void)showStatusView{
    
    StatusView *statusView = [[NSBundle mainBundle] loadNibNamed:@"StatusView" owner:nil options:nil].lastObject;

    //statusView.frame=[UIScreen mainScreen].bounds;

    [statusView show];
}

- (IBAction)onCancelClicked:(id)sender
{
    [self hide];
}

@end

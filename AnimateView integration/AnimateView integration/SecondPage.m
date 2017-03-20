//
//  SecondPage.m
//  statusView
//
//  Created by lab702 on 2017/3/19.
//  Copyright © 2017年 Wlson.lin. All rights reserved.
//

#import "SecondPage.h"
#import "StatusView.h"
#import "NetworkNoticeView.h"

@interface SecondPage ()

@end

@implementation SecondPage

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title=@"SecondView";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onShowViewClicked:(id)sender
{
    [StatusView showStatusView];
}
-(IBAction)onSlideViewClicked:(id)sender
{
    [NetworkNoticeView showNetworkNotice];
}


-(IBAction)onHideClicked:(id)sender
{
    [NetworkNoticeView hide];
}

@end

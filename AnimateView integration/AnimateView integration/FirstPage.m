//
//  FirstPage.m
//  statusView
//
//  Created by lab702 on 2017/3/19.
//  Copyright © 2017年 Wlson.lin. All rights reserved.
//

#import "FirstPage.h"
#import "SecondPage.h"
#import "StatusView.h"
#import "NetworkNoticeView.h"


@interface FirstPage ()

@end

@implementation FirstPage

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=@"FirstView";
    
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

-(IBAction)onPushViewClicked:(id)sender
{
    SecondPage *page=[[SecondPage alloc]initWithNibName:@"SecondPage" bundle:nil];
    
    [self.navigationController pushViewController:page animated:YES];
}

-(IBAction)onHideClicked:(id)sender
{
    [NetworkNoticeView hide];
}
@end

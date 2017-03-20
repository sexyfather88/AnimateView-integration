//
//  NetworkNoticeView.m
//  statusView
//
//  Created by lab702 on 2017/3/19.
//  Copyright © 2017年 Wlson.lin. All rights reserved.
//

#import "NetworkNoticeView.h"

__strong static NetworkNoticeView *_instance = nil;


@implementation NetworkNoticeView

+ (void)showNetworkNotice{
    
    void(^action)() = ^{
        
        if ( _instance )
        {
            [_instance remove];
            
            _instance = nil;
        }
        
         _instance= [[NSBundle mainBundle] loadNibNamed:@"NetworkNoticeView" owner:nil options:nil].lastObject;
        
        [_instance show];
    };
    
    
    if ( [NSThread isMainThread] )
    {
        action();
    }
    else
    {
        dispatch_sync( dispatch_get_main_queue() , action );
    }
    

}

+ (void)hide{

    void(^action)() = ^{
        
        if ( _instance )
        {
            [_instance hide];
            
            _instance = nil;
        }
    };
    
    if ( [NSThread isMainThread] )
    {
        action();
    }
    else
    {
        dispatch_sync( dispatch_get_main_queue() , action );
    }
}

- (IBAction)onCancelClicked:(id)sender
{
    [self hide];
}

@end

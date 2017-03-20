//
//  PopupView.m
//
//
//  Created by Wilson.Lin on 2017/3/19.
//  Copyright © 2017年 All rights reserved.
//

#import "PopupView.h"
#import "AppDelegate.h"


@implementation PopupView

@synthesize dialogView;

- (void)show
{
    
    if ( ! self.superview )
    {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        
        [window makeKeyAndVisible];
        
        NSLog(@"%@",NSStringFromCGRect(self.dialogView.frame));
        
       // UIViewController *root_view_controller = window.rootViewController;
        
        UIViewController *root_view_controller =(UIViewController*)[[(AppDelegate*)[[UIApplication sharedApplication]delegate] window] rootViewController];

        
        while ( root_view_controller.presentedViewController )
        {
            root_view_controller = root_view_controller.presentedViewController;
        }
        


        if ( root_view_controller )
        {
            [self.layer removeAllAnimations];
            
            [self.dialogView.layer removeAllAnimations];
            
            self.alpha = 0.0f;
            
            self.dialogView.alpha = 0.5f;
            
            self.frame = root_view_controller.view.bounds;
            
            [root_view_controller.view addSubview:self];
            
            [self viewDidLoad];
            
            [UIView animateWithDuration:0.2f
                                  delay:0.0f
                                options:0
                             animations:^{
                                 self.alpha = 1.0f;
                                 
                                 self.dialogView.alpha = 1.0f;
                             }
                             completion:^(BOOL finished) {
                                 
                             }];
            
            self.dialogView.transform = CGAffineTransformMakeScale(0.5f, 0.5f);
            
            [self animate1];
            
            [[NSNotificationCenter defaultCenter] addObserver:self
                                                     selector:@selector(onKeyboardWillChangeFrame:)
                                                         name:UIKeyboardWillChangeFrameNotification
                                                       object:nil];
        }
    }
    else
    {
        [self setNeedsLayout];
    }
}


- (void)onKeyboardWillChangeFrame:(NSNotification *)aNotification
{
    UIWindow *window = self.window;
    
    NSDictionary *user_info = aNotification.userInfo;
    
    CGRect keyboard_frame = [[user_info objectForKey:@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];

    CGFloat animation_duration = [[user_info objectForKey:@"UIKeyboardAnimationDurationUserInfoKey"] doubleValue];
    
    CGRect keyboard_frame_in_superview = [self.superview convertRect:keyboard_frame fromView:window];
    
    CGFloat maximum_height = self.superview.bounds.size.height;
    
    CGFloat keyboard_y = CGRectGetMinY( keyboard_frame_in_superview );
    
    CGFloat keyboard_height = MIN( maximum_height , keyboard_y );
    
    CGRect new_keyboard_frame = CGRectMake( 0.0f , 0.0f , self.superview.frame.size.width , keyboard_height );
    
    if ( ! CGRectEqualToRect(self.frame, new_keyboard_frame) )
    {
        [UIView animateWithDuration:animation_duration
                         animations:^{
                             self.frame = new_keyboard_frame;
                         }];
    }
}

- (void)animate1
{
    [UIView animateWithDuration:0.16f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.dialogView.transform = CGAffineTransformMakeScale(1.03f, 1.03f);
                     }
                     completion:^(BOOL finished) {
                         [self animate2];
                     }];
}

- (void)animate2
{
    [UIView animateWithDuration:0.04f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.dialogView.transform = CGAffineTransformIdentity;
                     }
                     completion:^(BOOL finished) {
                     }];
}

- (void)hide
{
    if ( self.superview )
    {
        [self.layer removeAllAnimations];
        
        [self.dialogView.layer removeAllAnimations];
        
        [[NSNotificationCenter defaultCenter] removeObserver:self];
        
        self.alpha = 1.0f;
        
        self.dialogView.alpha = 1.0f;
        
        [UIView animateWithDuration:0.2f
                              delay:0.0f
                            options:0
                         animations:^{
                             
                             self.alpha = 0.0f;
                             
                             self.dialogView.alpha = 0.5f;
                             
                             self.dialogView.transform = CGAffineTransformMakeScale(0.5f, 0.5f);
                         }
                         completion:^(BOOL finished)
         {
             [self removeFromSuperview];
         }];
    }

}

- (void)viewDidLoad
{
    
}

@end

//
//  PopupView.h
//
//
//  Created by Wilson.Lin on 2017/3/19.
//  Copyright © 2017年 All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopupView : UIView
{
    UIView *dialogView;
}

@property (nonatomic, strong) IBOutlet UIView *dialogView;

- (void)show;
- (void)hide;

- (void)viewDidLoad;
@end

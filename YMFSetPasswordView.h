//
//  YMFSetPasswordView.h
//  PasswordDemo
//
//  Created by Arlexovincy on 14-10-1.
//  Copyright (c) 2014年 Arlexovincy. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YMFSetPasswordView;

@protocol YMFSetPasswordViewDelegate <NSObject>

- (void)YMFSetPasswordView:(YMFSetPasswordView*)passwordView endSetPassword:(NSString*)password;

@end

@interface YMFSetPasswordView : UIView <UITextFieldDelegate>
{
    
    NSMutableArray *passwordIndicatorArrary;
    
}

@property (nonatomic, weak) id<YMFSetPasswordViewDelegate> delegate;

@property (nonatomic, strong) UITextField *passwordTextField;

- (void)clearUpPassword;

@end

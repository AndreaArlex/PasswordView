//
//  YMFSetPasswordView.m
//  PasswordDemo
//
//  Created by Arlexovincy on 14-10-1.
//  Copyright (c) 2014年 Arlexovincy. All rights reserved.
//

#import "YMFSetPasswordView.h"

@implementation YMFSetPasswordView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [[NSNotificationCenter defaultCenter] addObserverForName:UITextFieldTextDidChangeNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
        
            if ([note.object isEqual:_passwordTextField]) {
                
                [self setDotWithCount:_passwordTextField.text.length];
                
                if (_passwordTextField.text.length == 6) {
                    
                    if ([_delegate respondsToSelector:@selector(YMFSetPasswordView:endSetPassword:)]) {
                        
                        [_delegate YMFSetPasswordView:self endSetPassword:_passwordTextField.text];
                    }
                }
            }
            
        }];
        
        [self initView];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserverForName:UITextFieldTextDidChangeNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note){
            
            if ([note.object isEqual:_passwordTextField]) {
                
                [self setDotWithCount:_passwordTextField.text.length];
                
                if (_passwordTextField.text.length == 6) {
                    
                    if ([_delegate respondsToSelector:@selector(YMFSetPasswordView:endSetPassword:)]) {
                        
                        [_delegate YMFSetPasswordView:self endSetPassword:_passwordTextField.text];
                    }
                }
            }
            
            
            
        }];
        
        [self initView];
    }
    
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)initView
{
    self.backgroundColor = [UIColor whiteColor];
    
    passwordIndicatorArrary = [[NSMutableArray alloc] init];
    
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 294, 43)];
    _passwordTextField.hidden = YES;
    _passwordTextField.delegate = self;
    _passwordTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    _passwordTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:_passwordTextField];
    
    [_passwordTextField becomeFirstResponder];
    
//    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, 294, 43);
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [UIColor colorWithRed:171.0/255.0 green:171.0/255.0 blue:171.0/255.0 alpha:1.0].CGColor;
    self.layer.cornerRadius = 2;
    
    for (int i = 0; i< 5; i++) {
        
        UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH(self)/6 + i * (WIDTH(self)/6), 0, 0.5, 43)];
        lineImageView.backgroundColor = [UIColor colorWithRed:208.0/255.0 green:212.0/255.0 blue:217.0/255.0 alpha:1.0];
        [self addSubview:lineImageView];
        
    }
    
    for (int i = 0; i < 6; i++) {
        
        UIImageView *dotImageView = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH(self)/12 - 5 + i * (WIDTH(self)/6) , 16.5, 10, 10)];
        dotImageView.backgroundColor = [UIColor colorWithRed:93.0/255.0 green:202.0/255.0 blue:136.0/255.0 alpha:1.0];
        dotImageView.layer.cornerRadius = dotImageView.bounds.size.height/2;
        dotImageView.clipsToBounds = YES;
        dotImageView.hidden = YES;
        [self addSubview:dotImageView];
        
        [passwordIndicatorArrary addObject:dotImageView];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if([string isEqualToString:@"\n"]){
        //按回车关闭键盘
        [textField resignFirstResponder];
        return NO;
    }else if (string.length == 0){
        //判断是不是删除键
        
        return YES;
    }else if(textField.text.length >= 6){
        //输入的字符个数大于10，则无法继续输入，返回NO表示禁止输入
        
        return NO;
    }else{
        
        return YES;
    }
}

- (void)setDotWithCount:(int)count
{
    for (UIImageView *dotImageView in passwordIndicatorArrary) {
        
        dotImageView.hidden = YES;
    }
    
    for (int i = 0; i< count; i++) {
        
        ((UIImageView*)[passwordIndicatorArrary objectAtIndex:i]).hidden = NO;
    }
}

- (void)clearUpPassword
{
    _passwordTextField.text = @"";
    [self setDotWithCount:_passwordTextField.text.length];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

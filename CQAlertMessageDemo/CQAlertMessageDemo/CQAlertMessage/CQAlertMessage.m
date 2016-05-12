//
//  CQAlertMessage.m
//  DreamHome
//
//  Created by apple on 16/4/28.
//  Copyright © 2016年 wangz. All rights reserved.
//

#import "CQAlertMessage.h"

@interface CQAlertMessage ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *destroyBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (copy, nonatomic)void(^destroyBlock)();
@property (copy, nonatomic)void(^cancelBlock)();

@property (weak, nonatomic) IBOutlet UIView *alertView;

@end

@implementation CQAlertMessage

static CQAlertMessage *alertV;
+(instancetype)dreamAlertView{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alertV = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
        alertV.frame = [UIScreen mainScreen].bounds;
        alertV.alertView.transform = CGAffineTransformMakeTranslation(0, [UIScreen mainScreen].bounds.size.height);
        alertV.alertView.layer.cornerRadius = 8;
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        effectView.alpha = 0.3f;
        effectView.frame = alertV.bounds;
        [alertV insertSubview:effectView belowSubview:alertV.alertView];
    });
    
    return alertV;
}

+(instancetype)dreamAlertViweWithTitle:(NSString *)title destroyBtnTitle:(NSString *)destroyTitle destroyBlock:(void (^)())destroyBlock cancelBtnTitle:(NSString *)cancelTitle cancelBlock:(void (^)())cancelBlock{
    CQAlertMessage *alert = [CQAlertMessage dreamAlertView];
    alert.titleLabel.text = title;
    [alert.destroyBtn setTitle:destroyTitle forState:UIControlStateNormal];
    [alert.cancelBtn setTitle:cancelTitle forState:UIControlStateNormal];
    alert.destroyBlock = destroyBlock;
    alert.cancelBlock = cancelBlock;
    return alert;
}

-(void)show{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:self];
  
    [UIView animateWithDuration:0.5 animations:^{
        self.transform = CGAffineTransformIdentity;
        self.alertView.transform = CGAffineTransformIdentity;
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self disMiss];
    
}

-(void)disMiss{
    [UIView animateWithDuration:0.5 animations:^{
      self.alertView.transform = CGAffineTransformMakeTranslation(0, [UIScreen mainScreen].bounds.size.height);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

-(void)setDestroyBtnTitleColor:(UIColor *)destroyBtnTitleColor{
    _destroyBtnTitleColor = destroyBtnTitleColor;
    [self.destroyBtn setTitleColor:destroyBtnTitleColor forState:UIControlStateNormal];
}

-(void)setCancelBtnTitleColor:(UIColor *)cancelBtnTitleColor{
    _cancelBtnTitleColor = cancelBtnTitleColor;
    [self.cancelBtn setTitleColor:cancelBtnTitleColor forState:UIControlStateNormal];
}

- (IBAction)destroyClick:(UIButton *)sender {
    if (self.destroyBlock) {
        self.destroyBlock();
    }
    [self disMiss];
}

- (IBAction)cancelClick:(UIButton *)sender {
    if (self.cancelBlock) {
        self.cancelBlock();
    }
    [self disMiss];
    
    
}














@end

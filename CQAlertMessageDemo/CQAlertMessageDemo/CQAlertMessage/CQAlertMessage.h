//
//  CQAlertMessage.h
//  DreamHome
//
//  Created by apple on 16/4/28.
//  Copyright © 2016年 wangz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CQAlertMessage : UIView

+(instancetype)dreamAlertView;

+(instancetype)dreamAlertViweWithTitle:(NSString *)title destroyBtnTitle:(NSString *)destroyTitle destroyBlock:(void(^)())destroyBlock cancelBtnTitle:(NSString *)cancelTitle cancelBlock:(void(^)())cancelBlock;

@property (strong, nonatomic)UIColor *titleColor;
@property (strong, nonatomic)UIColor *destroyBtnTitleColor;
@property (strong, nonatomic)UIColor *cancelBtnTitleColor;

-(void)show;
-(void)disMiss;

@end

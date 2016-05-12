//
//  ViewController.m
//  CQAlertMessageDemo
//
//  Created by apple on 16/5/12.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "CQAlertMessage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CQAlertMessage *alert = [CQAlertMessage dreamAlertViweWithTitle:@"地方大幅度" destroyBtnTitle:@"地方" destroyBlock:^{
        
    } cancelBtnTitle:@"地地方地方" cancelBlock:^{
        
    }];
    [alert show];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

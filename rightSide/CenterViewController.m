//
//  CenterViewController.m
//  rightSide
//
//  Created by Eternity on 15/1/17.
//  Copyright (c) 2015年 Eternity. All rights reserved.
//

#import "CenterViewController.h"

@interface CenterViewController ()
@property (nonatomic, strong) UIButton *btn1;
@end

@implementation CenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self resgisterNoti];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(190, 100, 60, 40);
    [btn1 setTitle:@"显示" forState:UIControlStateNormal];
    [btn1 setTitle:@"隐藏" forState:UIControlStateSelected];
    [btn1 addTarget:self action:@selector(btn1Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    self.btn1 = btn1;
    btn1.layer.borderColor = [UIColor redColor].CGColor;
    btn1.layer.borderWidth = 1;
}
- (void)resgisterNoti
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(buttonNameChange:) name:@"buttonNameChange" object:nil];
}
- (void)buttonNameChange:(NSNotification *)noti
{
    NSString *name = [noti object];
    [self.btn1 setTitle:name forState:UIControlStateNormal];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
- (void)btn1Click:(UIButton *)btn
{
    if (btn.selected) {
        btn.selected = NO;
    }else{
        btn.selected = YES;
    }
    if ([self.delegate respondsToSelector:@selector(centerViewController:didButton:)]) {
        [self.delegate centerViewController:self didButton:btn];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

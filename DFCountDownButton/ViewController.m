//
//  ViewController.m
//  DFCountDownButton
//
//  Created by DFD on 2016/12/13.
//  Copyright © 2016年 dfd. All rights reserved.
//

#import "ViewController.h"
#import "DFCountDownButton.h"

@interface ViewController (){

    DFCountDownButton *_dfCountDownButton;
    IBOutlet DFCountDownButton *dfCountDownButtonXib;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dfCountDownButton = [[DFCountDownButton alloc] init];
    _dfCountDownButton.frame = CGRectMake(106, 170, 120, 32);
    _dfCountDownButton.backgroundColor = [UIColor redColor];
    [_dfCountDownButton setTitle:@"开始" forState:UIControlStateNormal];
    [self.view addSubview:_dfCountDownButton];
    
    __weak typeof(self) weakSelf = self;
    
    _dfCountDownButton.countDownButtonBlock = ^(DFCountDownButton *sender,NSInteger tag){
        
        sender.enabled = NO;
                
        [sender startCountDownWithSecond:10];
        
        sender.countDownChanging = ^NSString *(DFCountDownButton *countDownButton, NSUInteger second){
            return [NSString stringWithFormat:@"剩余%zd秒",second];
        };
        sender.countDownFinished = ^NSString *(DFCountDownButton *countDownButton){
            countDownButton.enabled = YES;
            __strong typeof(self) self = weakSelf;
            NSLog(@"%@", self);
            return @"点击重新获取";
        };
    };
}

- (void)dealloc{
    NSLog(@"%s", __FUNCTION__);
}

- (IBAction)dfCountDownButtonXibClick:(DFCountDownButton *)sender {
    __weak typeof(self) weakSelf = self;
    sender.enabled = NO;
    [sender startCountDownWithSecond:10];
    
    sender.countDownChanging = ^NSString *(DFCountDownButton *countDownButton,NSUInteger second) {
        NSString *title = [NSString stringWithFormat:@"剩余%zd秒",second];
        return title;
    };
    sender.countDownFinished = ^NSString *(DFCountDownButton *countDownButton) {
        countDownButton.enabled = YES;
        __strong typeof(self) self = weakSelf;
        NSLog(@"%@", self);
        return @"点击重新获取";
    };
}





- (IBAction)stopCountDown:(id)sender {
    [dfCountDownButtonXib stopCountDown];
    [_dfCountDownButton stopCountDown];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

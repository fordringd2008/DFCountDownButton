# DFCountDownButton
DFCountDownButton，继承UIButton，实现IOS倒计时按钮，用于注册等发送验证码的时候进行倒计时操作

DFCountDownButton, subclassing UIButton implementation iOS countdown button, register with sending the verification code and countdown

## Installation

### Installation with CocoaPods

	platform :ios
 	pod 'DFCountDownButton'
 	
### Manually

Copy DFCountDownButtonn.h DFCountDownButtonn.m in DFCountDownButton/ to your project.

## Usage
### Code
    DFCountDownButton *_dfCountDownButton;
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

    
###xib
    @property (weak, nonatomic) IBOutlet DFCountDownButton *countDownXib;

    - (IBAction)countDownXibTouched:(DFCountDownButton*)sender {
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
## License

This code is distributed under the terms and conditions of the MIT license.

## Demo
![](https://github.com/dingfude2008/DFCountDownButton/blob/master/DFCountDownButton.gif)


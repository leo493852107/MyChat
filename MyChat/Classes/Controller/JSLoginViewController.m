//
//  JSLoginViewController.m
//  MyChat
//
//  Created by leo on 5/6/16.
//  Copyright © 2016 leo. All rights reserved.
//

#import "JSLoginViewController.h"
#import "EMSDK.h"

@interface JSLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;


@end

@implementation JSLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 注册
- (IBAction)registerAction:(id)sender {
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    EMError *error = [[EMClient sharedClient] registerWithUsername:username password:password];
    if (error == nil) {
        NSLog(@"注册成功");
    } else {
        NSLog(@"注册失败");
    }
}

#pragma mark - 登录
- (IBAction)loginAction:(id)sender {
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    
    EMError *error = [[EMClient sharedClient] loginWithUsername:username password:password];
    if (!error) {
        NSLog(@"登录成功");
        
        // 设置自动登录
        [[EMClient sharedClient].options setIsAutoLogin:YES];
        
        // 跳转到主界面
        self.view.window.rootViewController = [UIStoryboard storyboardWithName:@"Main" bundle:nil].instantiateInitialViewController;
        
    } else {
        NSLog(@"登录失败");
    }
    
}

@end

//
//  BKLandingViewController.m
//  BodyBeat
//
//  Created by Can Behran Kankul on 10/01/16.
//  Copyright © 2016 Can Behran Kankul. All rights reserved.
//

#import "BKLandingViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "SIAlertView.h"
#import "BKContainerViewController.h"

@interface BKLandingViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnFacebookLogin;
@end

@implementation BKLandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginWithFacebook:(id)sender {
    
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    
    [login logInWithReadPermissions: @[@"public_profile"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
             [self showAlertForFacebookLogin:@"İşlem sırasında bir hata oluştu. Lüften daha sonra tekrar deneyin."];
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
             
         }
     }];
}
-(void)showAlertForFacebookLogin:(NSString *) message{
    
    //alert popup initialization - 1
    SIAlertView *alertView = [[SIAlertView alloc] initWithTitle:@"BodyBeat" andMessage:message];
    
    [alertView addButtonWithTitle:@"Tamam"
                             type:SIAlertViewButtonTypeDefault
                          handler:^(SIAlertView *alert) {
                          }];
    [[SIAlertView appearance] setButtonColor:[UIColor colorWithRed:0.949 green:0.451 blue:0.18 alpha:1] /*#f2732e*/
     ];
    //alert popup initialization - 2
    alertView.willShowHandler = ^(SIAlertView *alertView) {
        NSLog(@"%@, willShowHandler", alertView);
    };
    alertView.didShowHandler = ^(SIAlertView *alertView) {
        NSLog(@"%@, didShowHandler", alertView);
    };
    alertView.willDismissHandler = ^(SIAlertView *alertView) {
        NSLog(@"%@, willDismissHandler", alertView);
    };
    alertView.didDismissHandler = ^(SIAlertView *alertView) {
        NSLog(@"%@, didDismissHandler", alertView);
    };
    
    alertView.transitionStyle = SIAlertViewTransitionStyleBounce;
    
    [alertView show];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    BKContainerViewController  *nextController = [segue destinationViewController];
    nextController.isUserLoggedWithFacebook = YES;
}

@end

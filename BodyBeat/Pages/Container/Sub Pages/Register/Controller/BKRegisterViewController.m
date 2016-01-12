//
//  BKRegisterViewController.m
//  BodyBeat
//
//  Created by Can Behran Kankul on 11/01/16.
//  Copyright © 2016 Can Behran Kankul. All rights reserved.
//

#import "BKRegisterViewController.h"
#import "Common.h"
#import "SIAlertView.h"

static NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";

@interface BKRegisterViewController ()

/* View definitions */
@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UITextField *txtSurname;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtPasswordRepeat;
@property (weak, nonatomic) IBOutlet UIButton *btnAgreedTerms;
@property (weak, nonatomic) IBOutlet UIButton *btnCompleteRegister;

/* other */
@property NSPredicate *emailTest;
@property BOOL isTermsAgreed;

@end

@implementation BKRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // view
    _emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    
    //other
    _isTermsAgreed = NO;
    _btnAgreedTerms.layer.cornerRadius = 15;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Register button action
- (IBAction)validateFormAndContinue:(id)sender {
    
    //alert popup initialization - 1
    SIAlertView *alertView = [[SIAlertView alloc] initWithTitle:@"BodyBeat" andMessage:@""];
    
    [alertView addButtonWithTitle:@"Tamam"
                             type:SIAlertViewButtonTypeDefault
                          handler:^(SIAlertView *alert) {
                              NSLog(@"Button1 Clicked");
                          }];
    [[SIAlertView appearance] setButtonColor:[UIColor colorWithRed:0.949 green:0.451 blue:0.18 alpha:1] /*#f2732e*/
];
    //Check form validation
    switch ([self formValidation]) {
        case Validated:
            
            //form validated
            
            break;
            
        //form not validated. Show correct message
        case Empty:
            alertView.message = @"Uygulamaya kayıt olabilmek için tüm bilgileri girmeniz gerekiyor.";
            break;
        case NotCorrect:
            alertView.message = @"Eposta adresinizi doğrulayamadık. Lütfen tekrar deneyin.";
            break;
        case PasswordNotMatched:
            alertView.message = @"Parolanızı doğrulayamadık. Lütfen tekrar deneyin.";
            break;
        case NotAgreedTerms:
            alertView.message = @"Uygulamaya kayıt olabilmek için katılım koşullarını kabul etmeniz gerekiyor.";
            break;
        default:
            break;
    }
    
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

#pragma mark - View
// Checks user has agreed the terms
- (IBAction)checkboxClicked:(id)sender {
    
    if (!_isTermsAgreed) {
        _btnAgreedTerms.layer.backgroundColor = [UIColor greenColor].CGColor;
        _isTermsAgreed = YES;
    }
    else{
        _btnAgreedTerms.layer.backgroundColor = [UIColor grayColor].CGColor;
        _isTermsAgreed = NO;
    }
    
}

#pragma mark Validation
// simple validation for form textboxes
-(enum ValidationResult)formValidation
{
    
    if ([_txtEmail.text isEqualToString:@""]) {
        return Empty;
    }
    if (
        [_txtName.text isEqualToString:@""]) {
        return Empty;
    }
    if ([_txtPassword.text isEqualToString:@""]) {
        return Empty;
    }
    if ([_txtPasswordRepeat.text isEqualToString:@""]) {
        return Empty;
    }
    if ([_txtSurname.text isEqualToString:@""]) {
        return Empty;
    }
    if ([_emailTest evaluateWithObject:_txtEmail.text] == NO)
    {
        return NotCorrect;
    }
    
    if (_txtPassword.text != _txtPasswordRepeat.text){
        return PasswordNotMatched;
    }
    if (!_isTermsAgreed) {
        return NotAgreedTerms;
    }
    return Validated;
}

#pragma mark - UIAlerts
-(void)generateUIAlerts {
    
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

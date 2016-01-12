//
//  BKRegisterViewController.m
//  BodyBeat
//
//  Created by Can Behran Kankul on 11/01/16.
//  Copyright © 2016 Can Behran Kankul. All rights reserved.
//

#import "BKRegisterViewController.h"
#import "Common.h"

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Register button action
- (IBAction)validateFormAndContinue:(id)sender {
    
    switch ([self formValidation]) {
        case Validated:
            
            break;
        case NotAgreedTerms:
            
            break;
        default:
            break;
    }
    
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
    if (!_isTermsAgreed) {
        return NotAgreedTerms;
    }
    if ([_emailTest evaluateWithObject:_txtEmail.text] == NO)
    {
        return NotCorrect;
    }
    if ([_txtEmail.text isEqualToString:@""] ||
        [_txtName.text isEqualToString:@""] ||
        [_txtPassword.text isEqualToString:@""] ||
        [_txtPasswordRepeat.text isEqualToString:@""] ||
        [_txtSurname.text isEqualToString:@""]) {
        return Empty;
    }
    if (
        [_txtPassword.text isEqualToString:_txtPasswordRepeat.text]){
        return PasswordNotMatched;
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

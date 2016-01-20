//
//  BKContainerViewController.m
//  BodyBeat
//
//  Created by Can Behran Kankul on 11/01/16.
//  Copyright © 2016 Can Behran Kankul. All rights reserved.
//

#import "BKContainerViewController.h"

@interface BKContainerViewController ()

/* View definitions */
@property (weak, nonatomic) IBOutlet UIView *viewContainer;
@property (weak, nonatomic) IBOutlet UIButton *btnBackward;
@property (weak, nonatomic) IBOutlet UIButton *btnForward;
@property NSInteger *containerIndex;
@end

@implementation BKContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // [self.viewContainer layoutIfNeeded];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)navigationButtonsClicked:(id)sender {
    
    if ([[sender text]  isEqual: @">"]) {
        
    }
    
}


@end

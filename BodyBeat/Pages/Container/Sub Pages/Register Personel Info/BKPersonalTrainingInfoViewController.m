//
//  BKPersonalTrainingInfoViewController.m
//  BodyBeat
//
//  Created by Can Behran Kankul on 17/01/16.
//  Copyright © 2016 Can Behran Kankul. All rights reserved.
//

#import "BKPersonalTrainingInfoViewController.h"
@interface BKPersonalTrainingInfoViewController()

@property (weak, nonatomic) IBOutlet UIPickerView *pickerTrainingStyle;
@property NSArray *trainingTypes;
@end
@implementation BKPersonalTrainingInfoViewController


-(void)viewDidLoad{
    
    _pickerTrainingStyle.dataSource = self;
    _pickerTrainingStyle.delegate = self;
    
    _trainingTypes = @[@"Seçin",@"Hiç yapmıyorum", @"Arada yapıyorum",@"Düzenli yapıyorum"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _trainingTypes.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _trainingTypes[row];
}


@end

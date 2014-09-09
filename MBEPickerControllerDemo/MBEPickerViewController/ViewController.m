//
//  ViewController.m
//  MBEActionSheetPicker
//
//  Created by Mark Evans on 9/5/14.
//  Copyright (c) 2014 3Advance, LLC. All rights reserved.
//

#import "ViewController.h"
#import "MBEPickerController.h"

@interface ViewController ()
{
    NSMutableArray *categories;
    IBOutlet UISegmentedControl *segControl;
}
@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    
    categories = [[NSMutableArray alloc] initWithObjects:@"Test", @"Test 2", @"Test 3" , nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - IBActions

- (IBAction)open:(id)sender {
    if (!self.isBeingPresented || !self.isBeingDismissed) {
        
        MBEPickerController *pickerController = [[MBEPickerController alloc] init];
        [pickerController setPickerTitle:@"Test Title"];
        [pickerController setPickerTypeState:PickerTypeText];
        [pickerController setPickerOptions:categories];
        [pickerController setSelectOption:@"Test 2"];
        pickerController.optionSelected =  ^(NSString *option) {
            if (option != nil) {
                if (option.length > 0) {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Selection" message:[NSString stringWithFormat:@"Selected: '%@'", option] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];
                }
            }
        };
        [pickerController showInViewController:self];
        
    }
}

- (IBAction)openDate:(id)sender {
    if (!self.isBeingPresented || !self.isBeingDismissed) {
        
        MBEPickerController *pickerController = [[MBEPickerController alloc] init];
        [pickerController setPickerTitle:@"Test Date Title"];
        [pickerController setPickerTypeState:PickerTypeDate];
        [pickerController setSelectDate:[NSDate date]];
        pickerController.dateSelected =  ^(NSDate *selectedDate) {
            if (selectedDate != nil) {
                if (selectedDate.description.length > 0) {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Selection" message:[NSString stringWithFormat:@"Selected: '%@'", selectedDate.description] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];
                }
            }
        };
        [pickerController showInViewController:self];
        
    }
}

@end

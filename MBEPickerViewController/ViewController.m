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
        
        // Create Custom Picker Instance
        MBEPickerController *pickerController = [[MBEPickerController alloc] initWithNibName:@"MBEPickerController" bundle:nil];
        
        // Account for iOS 8 & Under
        if ([UIDevice currentDevice].systemVersion.floatValue <= 7.1)
            self.modalPresentationStyle = UIModalPresentationCurrentContext;
        else
            pickerController.modalPresentationStyle = UIModalPresentationCustom;
        
        // Set Picker Title if present
        [pickerController setPickerTitle:@"Test Title"];
        
        // Set 'Yes' for Date Picker
        if (segControl.selectedSegmentIndex == 0)
            [pickerController setPickerTypeState:PickerTypeText];
        else if (segControl.selectedSegmentIndex == 1)
            [pickerController setPickerTypeState:PickerTypeDate];
        else if (segControl.selectedSegmentIndex == 2)
            [pickerController setPickerTypeState:PickerTypeTime];
        else
            [pickerController setPickerTypeState:PickerTypeDateTime];
        
        // Set Array Options
        [pickerController setPickerOptions:categories];
        
        // Set Picker Text if present
        [pickerController setText:@"Test 2"];
        
        // Set Picker Date if present
        [pickerController setDate:[NSDate dateWithTimeIntervalSince1970:[NSDate date].timeIntervalSince1970 - (86400 * 2)]];
        
        // Block to return Text Selection
        pickerController.select =  ^(NSString *selection) {
            if (selection != nil) {
                if (selection.length > 0) {
                    NSLog(@"text :: pos :: %i :: %@", 0, selection);
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Selection" message:[NSString stringWithFormat:@"Selected: '%@'", selection] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];
                }
            }
        };
        
        // Block to return Date/Time Selection
        pickerController.selectDate =  ^(NSDate *selectedDate) {
            if (selectedDate != nil) {
                if (selectedDate.description.length > 0) {
                    NSLog(@"date :: pos :: %i :: %@", 0, selectedDate.description);
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Selection" message:[NSString stringWithFormat:@"Selected: '%@'", selectedDate.description] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    [alert show];
                }
            }
        };
        
        // Present Custom Pickers
        [self presentViewController:pickerController animated:YES completion:nil];
    }
}

@end


## MBEPickerController
________________________

## MBEPickerController - Text Picker

A custom view component that presents a `UIPickerView` with a simple list of options, 
along with a toolbar for Select/Cancel and an optional faded backdrop view.

## MBEPickerController - Date/Time/DateTime Picker

A custom view component that presents a `UIDatePicker` with a toolbar for Select/Cancel.

## Usage

Usage is easy:

Add the dependency to your `Podfile`:

```ruby
platform :ios
pod 'MBEPickerController'
...
```

Run `pod install` to install the dependencies.

Next, import the header file wherever you want to use the picker:

```objc
#import <MBEPickerController/MBEPickerController.h>
```

Finally, present the picker when necessary (say on a button touch handler):

```objc

- (IBAction)openPicker:(id)sender {
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
        [pickerController setDate:[NSDate date]];
        //[pickerController setDate:[NSDate dateWithTimeIntervalSince1970:[NSDate date].timeIntervalSince1970 - (86400 * 2)]];
        
        
        if (segControl.selectedSegmentIndex == 0) {
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
        }
        else {
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
        }
        
        // Present Custom Pickers
        [self presentViewController:pickerController animated:YES completion:nil];
    }
}
```

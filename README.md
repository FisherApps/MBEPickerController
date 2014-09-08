{\rtf1\ansi\ansicpg1252\cocoartf1265\cocoasubrtf210
{\fonttbl\f0\fmodern\fcharset0 Courier;\f1\fnil\fcharset0 Menlo-Regular;\f2\fnil\fcharset0 Verdana;
}
{\colortbl;\red255\green255\blue255;\red57\green57\blue57;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720

\f0\fs26 \cf0 MBEPickerViewController\
=================\
\
## MBEPickerViewController - Text\
\
A custom view component that presents a `UIPickerView` with a simple list of options, \
along with a toolbar for Select/Cancel and an optional faded backdrop view.\
\
## MBEPickerViewController - Date/Time/DateTime\
\
A custom view component that presents a `UIDatePicker` with a toolbar for Select/Cancel.\
\
## Usage\
\
Usage is easy:\
\
Add the dependency to your `Podfile`:\
\
```ruby\
platform :ios\
pod 'MBEPickerViewController'\
...\
```\
\
Run `pod install` to install the dependencies.\
\
Next, import the header file wherever you want to use the picker:\
\
```objc\
#import <MBEPickerViewController/MBEPickerViewController.h>\
```\
\
Finally, present the picker when necessary (say on a button touch handler):\
\
```objc\
\pard\tx529\pardeftab529\pardirnatural

\f1\fs22 \cf0 \CocoaLigature0 - (IBAction)openPicker:(id)sender \{\
    if (!self.isBeingPresented || !self.isBeingDismissed) \{\
        \
        // Create Custom Picker Instance\
        MBEPickerController *pickerController = [[MBEPickerController alloc] initWithNibName:@"MBEPickerController" bundle:nil];\
        \
        // Account for iOS 8 & Under\
        if ([UIDevice currentDevice].systemVersion.floatValue <= 7.1)\
            self.modalPresentationStyle = UIModalPresentationCurrentContext;\
        else\
            pickerController.modalPresentationStyle = UIModalPresentationCustom;\
        \
        // Set Picker Title if present\
        [pickerController setPickerTitle:@"Test Title"];\
        \
        // Set 'Yes' for Date Picker\
        if (segControl.selectedSegmentIndex == 0)\
            [pickerController setPickerTypeState:PickerTypeText];\
        else if (segControl.selectedSegmentIndex == 1)\
            [pickerController setPickerTypeState:PickerTypeDate];\
        else if (segControl.selectedSegmentIndex == 2)\
            [pickerController setPickerTypeState:PickerTypeTime];\
        else\
            [pickerController setPickerTypeState:PickerTypeDateTime];\
        \
        // Set Array Options\
        [pickerController setPickerOptions:categories];\
        \
        // Set Picker Text if present\
        [pickerController setText:@"Test 2"];\
        \
        // Set Picker Date if present\
        [pickerController setDate:[NSDate date]];\
        //[pickerController setDate:[NSDate dateWithTimeIntervalSince1970:[NSDate date].timeIntervalSince1970 - (86400 * 2)]];\
        \
        \
        if (segControl.selectedSegmentIndex == 0) \{\
            // Block to return Text Selection\
            pickerController.select =  ^(NSString *selection) \{\
                if (selection != nil) \{\
                    if (selection.length > 0) \{\
                        NSLog(@"text :: pos :: %i :: %@", 0, selection);\
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Selection" message:[NSString stringWithFormat:@"Selected: '%@'", selection] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];\
                        [alert show];\
                    \}\
                \}\
            \};\
        \}\
        else \{\
            // Block to return Date/Time Selection\
            pickerController.selectDate =  ^(NSDate *selectedDate) \{\
                if (selectedDate != nil) \{\
                    if (selectedDate.description.length > 0) \{\
                        NSLog(@"date :: pos :: %i :: %@", 0, selectedDate.description);\
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Selection" message:[NSString stringWithFormat:@"Selected: '%@'", selectedDate.description] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];\
                        [alert show];\
                    \}\
                \}\
            \};\
        \}\
        \
        // Present Custom Pickers\
        [self presentViewController:pickerController animated:YES completion:nil];\
    \}\
\}
\f0\fs26 \CocoaLigature1 \
\pard\pardeftab720
\cf0 ```\
\
##
\f2\fs24 \cf2 The MIT License (MIT)\
\pard\pardeftab720\sa291
\cf2 Copyright (c) 2014 Mark Evans Jr\
Permission is hereby granted, free of charge, to any person obtaining a copy\uc0\u8232 of this software and associated documentation files (the "Software"), to deal\u8232 in the Software without restriction, including without limitation the rights\u8232 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell\u8232 copies of the Software, and to permit persons to whom the Software is\u8232 furnished to do so, subject to the following conditions:\
The above copyright notice and this permission notice shall be included in\uc0\u8232 all copies or substantial portions of the Software.\
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR\uc0\u8232 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,\u8232 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE\u8232 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER\u8232 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,\u8232 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN\u8232 THE SOFTWARE.}
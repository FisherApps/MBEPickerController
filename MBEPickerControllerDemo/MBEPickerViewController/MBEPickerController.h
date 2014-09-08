//
//  MBEPickerController.h
//  MBEPickerController
//
//  Created by Mark Evans on 9/6/14.
//  Copyright (c) 2014 3Advance, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

enum {
    PickerTypeDateTime = 3,
    PickerTypeTime = 2,
    PickerTypeDate = 1,
    PickerTypeText = 0
};
typedef NSInteger PickerTypeInt;

@interface MBEPickerController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) NSMutableArray *pickerOptions;
@property (nonatomic, strong) NSString *pickerTitle;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, assign) PickerTypeInt pickerTypeState;
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UIButton *cancelButton;
@property (nonatomic, strong) IBOutlet UIButton *selectButton;
@property (nonatomic, strong) IBOutlet UIView *titleContainer;
@property (nonatomic, strong) IBOutlet UIView *pickerContainer;
@property (nonatomic, strong) IBOutlet UIPickerView *pickerView;
@property (nonatomic, strong) IBOutlet UIDatePicker *datePickerView;
@property (nonatomic, copy) void (^select)(NSString *selection);
@property (nonatomic, copy) void (^selectDate)(NSDate *selectedDate);

@end

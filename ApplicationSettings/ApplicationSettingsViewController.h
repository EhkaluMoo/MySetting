//
//  ApplicationSettingsViewController.h
//  ApplicationSettings
//
//  Created by jmp32 on 8/8/13.
//  Copyright (c) 2013 j03_digital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApplicationSettingsViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate>
{
    IBOutlet UITextField *loginName;
    IBOutlet UITextField *password;
    IBOutlet UIPickerView *favoriteday;
}

@property (nonatomic, retain) UITextField *loginName;
@property (nonatomic, retain) UITextField *password;
@property (nonatomic, retain) UIPickerView *favoriteDay;

-(IBAction)loadSettings:(id)sender;
-(IBAction)saveSettings:(id)sender;
-(IBAction)doneEditing:(id)sender;

@end

//
//  ApplicationSettingsViewController.m
//  ApplicationSettings
//
//  Created by jmp32 on 8/8/13.
//  Copyright (c) 2013 j03_digital. All rights reserved.
//

#import "ApplicationSettingsViewController.h"

@interface ApplicationSettingsViewController ()

@end

@implementation ApplicationSettingsViewController

@synthesize loginName;
@synthesize password;
@synthesize favoriteDay;
NSMutableArray *colors;
NSString *favoriteColorSelected;

-(IBAction)doneEditing:(id)sender
{
    [sender resignFirstResponder];
}


- (void)viewDidLoad
{
    //--create an array containing the colors values--
    colors=[[NSMutableArray alloc] init];
    [colors addObject:@"Monday"];
    [colors addObject:@"TuesDay"];
    [colors addObject:@"WenesDay"];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

//--number of components in the Picker View--
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

//--number of items(rows) in the Picker View--
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [colors count];
}

//--populating the Picker View--
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [colors objectAtIndex:row];
}

//--the item selected by the user--
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    favoriteColorSelected=[colors objectAtIndex:row];
}

-(IBAction)loadSettings:(id)sender
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    loginName.text=[defaults objectForKey:@"login_name"];
    password.text=[defaults objectForKey:@"password"];
    
    //--find the index of the array for the color saved--
    favoriteColorSelected=[[NSString alloc] initWithString:[defaults objectForKey:@"color"]];
    int selIndex=[colors indexOfObject:favoriteColorSelected];
    
    //--display the saved color in the Picker view--
    [favoriteColor selectRow:selIndex inComponent:0 animated:YES];
}

-(IBAction)saveSettings:(id)sender
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:loginName.text forKey:@"login_name"];
    [defaults setObject:password.text forKey:@"password"];
    [defaults setObject:favoriteColorSelected forKey:@"color"];
    [defaults synchronize];
    
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Settings Value Saved" message:@"Settings Saved" delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil];
    [alert show];
    [alert release];
    
}

-(void)dealloc
{
    [colors release];
    [favoriteColorSelected release];
    [loginName release];
    [password release];
    [favoriteColor release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

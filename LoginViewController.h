//
//  LoginViewController.h
//  WodBoardApp
//
//  Created by Hilmar Ólafsson on 7/27/12.
//  Copyright (c) 2012 J&L. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController{
    UIButton *button;
    UIButton *fbbutton;
    UITextField *emailField;
    UITextField *passwordField;
    NSMutableData *webData;
    
}

@property(nonatomic, retain) IBOutlet UIButton *button;
@property(nonatomic, retain) IBOutlet UIButton *fbbutton;
@property(nonatomic, retain) IBOutlet UITextField *emailField;
@property(nonatomic, retain) IBOutlet UITextField *passwordField;
@property(nonatomic, retain) IBOutlet NSMutableData *webData;



-(IBAction)login:(id) sender;
-(IBAction)fblogin:(id) sender;


@end

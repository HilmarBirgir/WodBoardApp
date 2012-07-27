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
}

@property(nonatomic, retain) IBOutlet UIButton *button;

-(IBAction)login:(id) sender;

@end

//
//  LoginViewController.m
//  WodBoardApp
//
//  Created by Hilmar Ólafsson on 7/27/12.
//  Copyright (c) 2012 J&L. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize button, fbbutton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(IBAction)login:(id) sender{
    [self dismissModalViewControllerAnimated:YES];
}
-(IBAction)fblogin:(id) sender{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    Facebook *facebook = [appDelegate facebook];
    if (![facebook isSessionValid]) {
        [facebook authorize:nil];
    }else{
        [self dismissModalViewControllerAnimated:YES];
    }
    [self dismissModalViewControllerAnimated:YES];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

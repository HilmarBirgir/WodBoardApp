//
//  SecondViewController.m
//  WodBoardApp
//
//  Created by Hilmar Ólafsson on 7/27/12.
//  Copyright (c) 2012 J&L. All rights reserved.
//

#import "FifthViewController.h"

@interface FifthViewController ()

@end

@implementation FifthViewController

@synthesize nameLabel, labelText, profile, userID;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Settings", @"Settings");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    
    return self;
}

- (void)viewDidLoad
{
    NSString *string = [NSString stringWithFormat:@"%@/%@/%@", @"https://graph.facebook.com", userID, @"picture"];
    NSURL *url = [NSURL URLWithString:string];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    profile.image = image;
    nameLabel.text = self.labelText;
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
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
@synthesize button, fbbutton, emailField, passwordField, webData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSURL *url = [NSURL URLWithString:@"http://localhost/login"];
        NSString *email = @"hilmarbirgir@jl.is";
        NSString *password= @"serp";
        NSString *jsonRequest = [NSString stringWithFormat:@"{\"email\":\"%@\",\"password\":\"%@\"}",email,password];
        NSData *requestData = [NSData dataWithBytes:[jsonRequest UTF8String] length:strlen([jsonRequest UTF8String])];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

        [request setHTTPBody: requestData];
        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
        if( connection )
        {
            webData = [[NSMutableData data] retain];
        }
        else
        {
            NSLog(@"theConnection is NULL");
        }

        
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


-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [webData setLength: 0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [webData appendData:data];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"ERROR");
    [connection release];
    [webData release];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *response = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
    NSLog(@"%@",response);
    [response release];
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

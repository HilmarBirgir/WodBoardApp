//
//  AppDelegate.m
//  WodBoardApp
//
//  Created by Hilmar Ólafsson on 7/27/12.
//  Copyright (c) 2012 J&L. All rights reserved.
//

#import "AppDelegate.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
#import "LoginViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;
@synthesize facebook, username, userID, viewController1, viewController2, viewController3, viewController4 ,viewController5, loginViewController;

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [facebook handleOpenURL:url]; 
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [facebook handleOpenURL:url]; 
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    facebook = [[Facebook alloc] initWithAppId:@"402563593135427" andDelegate:self];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"FBAccessTokenKey"] 
        && [defaults objectForKey:@"FBExpirationDateKey"]) {
        facebook.accessToken = [defaults objectForKey:@"FBAccessTokenKey"];
        facebook.expirationDate = [defaults objectForKey:@"FBExpirationDateKey"];
    }
    [facebook requestWithGraphPath: @"me" andDelegate: self]; 
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    viewController1 = [[[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil] autorelease];
    viewController2 = [[[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil] autorelease];
    viewController3 = [[[ThirdViewController alloc] initWithNibName:@"ThirdViewController" bundle:nil] autorelease];
    viewController4 = [[[FourthViewController alloc] initWithNibName:@"FourthViewController" bundle:nil] autorelease];
    viewController5 = [[[FifthViewController alloc] initWithNibName:@"FifthViewController" bundle:nil] autorelease];
    loginViewController = [[[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil] autorelease];
    self.tabBarController = [[[UITabBarController alloc] init] autorelease];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:viewController1, viewController2, viewController3, viewController4, viewController5, nil];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    [self.tabBarController presentModalViewController:loginViewController animated:NO];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)fbDidLogin {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[facebook accessToken] forKey:@"FBAccessTokenKey"];
    [defaults setObject:[facebook expirationDate] forKey:@"FBExpirationDateKey"];
    [defaults synchronize];
    [facebook requestWithGraphPath: @"me" andDelegate: self]; 
}

- (void)request:(FBRequest *)request didLoad:(id)result {
    NSDictionary *userInfo = (NSDictionary *)result;
    username = [userInfo objectForKey:@"name"];
    userID = [userInfo objectForKey:@"id"];
    viewController5.labelText = username;
    viewController5.userID = userID;
}

  
- (void)fbDidNotLogin:(BOOL)cancelled{}
- (void)fbDidExtendToken:(NSString*)accessToken
               expiresAt:(NSDate*)expiresAt{}
- (void)fbDidLogout{
    // Remove saved authorization information if it exists
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"FBAccessTokenKey"]) {
        [defaults removeObjectForKey:@"FBAccessTokenKey"];
        [defaults removeObjectForKey:@"FBExpirationDateKey"];
        [defaults synchronize];
    }
}

- (void)fbSessionInvalidated{}


/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end

//
//  AppDelegate.h
//  WodBoardApp
//
//  Created by Hilmar Ólafsson on 7/27/12.
//  Copyright (c) 2012 J&L. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "src/FBConnect.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
#import "LoginViewController.h"


@interface AppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate, FBSessionDelegate, FBRequestDelegate>
{
    Facebook *facebook;
    NSString *username;
    NSString *userID;
    FirstViewController *viewController1;
    SecondViewController *viewController2;
    ThirdViewController *viewController3;
    FourthViewController *viewController4;
    FifthViewController *viewController5;
    LoginViewController *loginViewController;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (nonatomic, retain) Facebook *facebook;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *userID;
@property (strong, nonatomic) FirstViewController *viewController1;
@property (strong, nonatomic) SecondViewController *viewController2;
@property (strong, nonatomic) ThirdViewController *viewController3;
@property (strong, nonatomic) FourthViewController *viewController4;
@property (strong, nonatomic) FifthViewController *viewController5;
@property (strong, nonatomic) LoginViewController *loginViewController;

@end

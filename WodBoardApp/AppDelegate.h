//
//  AppDelegate.h
//  WodBoardApp
//
//  Created by Hilmar Ólafsson on 7/27/12.
//  Copyright (c) 2012 J&L. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "src/FBConnect.h"

@interface AppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate, FBSessionDelegate>
{
    Facebook *facebook;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@property (nonatomic, retain) Facebook *facebook;

@end

//
//  FifthViewController.h
//  WodBoardApp
//
//  Created by Hilmar Ólafsson on 7/28/12.
//  Copyright (c) 2012 J&L. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AppDelegate;

@interface FifthViewController : UIViewController<UITextFieldDelegate>{
    UILabel *nameLabel;
    NSString *labelText;
    NSString *userID;
    UIImageView *profile;
}

@property(nonatomic, retain) IBOutlet UILabel *nameLabel;
@property(nonatomic, copy) NSString *labelText;
@property(nonatomic, copy) NSString *userID;
@property(nonatomic, retain)IBOutlet UIImageView *profile;


@end

//
//  ViewController.h
//  LED_Flashlight
//
//  Created by User on 10/1/12.
//  Copyright (c) 2012 User. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController
{
    //flashlight app
    UIButton *onButton;
    UIButton *offButton;
    UIImageView *onView;
    UIImageView *offView;
    
    //clock app
    IBOutlet UILabel * label;
    NSTimer * timer;
}

//flashlight
@property(nonatomic, strong) IBOutlet UIButton *onButton;
@property(nonatomic, strong) IBOutlet UIButton *offButton;
@property(nonatomic, strong) IBOutlet UIImageView *onView;
@property(nonatomic, strong) IBOutlet UIImageView *offView;

-(IBAction)torchOn:(id)sender;
-(IBAction)torchOff:(id)sender;

//clock
-(void)updateTimer;
@end

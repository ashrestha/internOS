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
    
    //screen brightness
    UILabel * brightLabel;
    
    //LED brightness
    UILabel * ledbrightnessLabel;
    
    
    
}

//flashlight
@property(nonatomic, strong) IBOutlet UIButton *onButton;
@property(nonatomic, strong) IBOutlet UIButton *offButton;
@property(nonatomic, strong) IBOutlet UIImageView *onView;
@property(nonatomic, strong) IBOutlet UIImageView *offView;
@property(nonatomic, retain) IBOutlet UILabel *label;
@property(nonatomic, retain) IBOutlet UILabel *brightLabel;
@property(nonatomic, retain) IBOutlet UILabel *ledbrightnessLabel;


-(IBAction)changeScreenBrightness:(UISlider *)sender; //Screen brightness
-(IBAction)changeLEDBrightness:(UISlider *)sender; //LED brightness
-(IBAction)torchOn:(id)sender;
-(IBAction)torchOff:(id)sender;


//clock
-(void)updateTimer;
@end

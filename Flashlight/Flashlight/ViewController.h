//
//  ViewController.h
//  Flashlight
//
//  Created by User1 on 9/30/12.
//  Copyright (c) 2012 User1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface ViewController : UIViewController

{
    UIButton *onBotton;
    UIButton *offButton;
    UIImageView *onView;
    UIImageView *offView;
}



@property(nonatomic, strong) IBOutlet UIButton *onButton;
@property(nonatomic, strong) IBOutlet UIButton *offButton;
@property(nonatomic, strong) IBOutlet UIImageView *onView;
@property(nonatomic, strong) IBOutlet UIImageView *offView;


-(IBAction)torchOn:(id)sender;
-(IBAction)torchOff:(id)sender;



@end

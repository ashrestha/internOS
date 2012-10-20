//
//  ViewController.m
//  Flashlight
//
//  Created by User1 on 9/30/12.
//  Copyright (c) 2012 User1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize offButton, onView, onButton, offView;

-(IBAction)torchOn:(id)sender
{
    onButton.hidden = YES;
    offButton.hidden = NO;
    
    onView.hidden = NO;
    offView.hidden = YES;
    
    AVCaptureDevice *flashLight = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if([flashLight isTorchAvailable] && [flashLight isTorchModeSupported:AVCaptureTorchModeOn])
    {
        BOOL success = [flashLight lockForConfiguration:nil];
        if(success)
        {
            [flashLight setTorchMode:(AVCaptureTorchModeOn)];
            [flashLight unlockForConfiguration];
            
        }
    }
}



-(IBAction)torchOff:(id)sender
{
    onButton.hidden = NO;
    offButton.hidden = YES;
    
    
    onView.hidden = YES;
    offView.hidden = NO;
    
    AVCaptureDevice *flashLight = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if([flashLight isTorchAvailable] && [flashLight isTorchModeSupported:AVCaptureTorchModeOn])
    {
        BOOL success = [flashLight lockForConfiguration:nil];
        if(success)
        {
            [flashLight setTorchMode:(AVCaptureTorchModeOff)];
            [flashLight unlockForConfiguration];
            
        }
    }
}

- (void)viewDidLoad
{
    {
        onButton.hidden = YES;
        offButton.hidden = NO;
        
        onView.hidden = NO;
        offView.hidden = YES;
        
        AVCaptureDevice *flashLight = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if([flashLight isTorchAvailable] && [flashLight isTorchModeSupported:AVCaptureTorchModeOn])
        {
            BOOL success = [flashLight lockForConfiguration:nil];
            if(success)
            {
                [flashLight setTorchMode:(AVCaptureTorchModeOn)];
                [flashLight unlockForConfiguration];
                
            }
        }
    }

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

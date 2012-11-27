//
//  ViewController.m
//  LED_Flashlight
//
//  Created by User on 10/1/12.
//  Copyright (c) 2012 User. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


-(void)updateTimer{
  
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"hh:mm:ss a"];
    label.text = [formatter stringFromDate:[NSDate date]];

 
    
}

@synthesize offButton, onView, onButton, offView, label;

-(IBAction)torchOn:(id)sender
{
    onButton.hidden = YES;
    offButton.hidden = NO;
    onView.hidden = NO;
    offView.hidden = YES;
    
    
    AVCaptureDevice *flashlight =[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if([flashlight isTorchAvailable] && [flashlight isTorchModeSupported:AVCaptureTorchModeOn])
    {
        BOOL success = [flashlight lockForConfiguration:nil];
        if(success)
        {
            [flashlight setTorchMode: AVCaptureTorchModeOn];
            [flashlight unlockForConfiguration];
        }
    }
}

-(IBAction)torchOff:(id)sender
{
    onButton.hidden = NO;
    offButton.hidden = YES;
    onView.hidden = YES;
    offView.hidden = NO;

    
    
    AVCaptureDevice *flashlight =[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if([flashlight isTorchAvailable] && [flashlight isTorchModeSupported:AVCaptureTorchModeOn])
    {
        BOOL success = [flashlight lockForConfiguration:nil];
        if(success)
        {
            [flashlight setTorchMode: AVCaptureTorchModeOff];
            [flashlight unlockForConfiguration];
        }
    }
}


- (void)viewDidLoad

{


    onButton.hidden = YES;
    offButton.hidden = NO;
    onView.hidden = NO;
    offView.hidden = YES;
    
    AVCaptureDevice *flashlight =[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if([flashlight isTorchAvailable] && [flashlight isTorchModeSupported:AVCaptureTorchModeOn])
    {
        BOOL success = [flashlight lockForConfiguration:nil];
        if(success)
        {
            [flashlight setTorchMode: AVCaptureTorchModeOn];
            [flashlight unlockForConfiguration];
        
         }
    
    }

    //add brightness features
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(8,25,300,400)];
    [slider addTarget:self action:@selector(sliderHandler:) forControlEvents:UIControlEventValueChanged];
    slider.minimumValue = 0.f;
    NSLog(@"I am working");
    slider.maximumValue = 1.0f;
    NSLog(@"I am still working");
    slider.value = [[UIScreen mainScreen] brightness];
    [[self view]addSubview:slider];
   
    
    
    [super viewDidLoad];
    [label setFont:[UIFont fontWithName:@"Let's go Digital" size:45]];
    
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)sliderHandler:(UISlider *)sender
{
    //NSLog(@"value:%f", sender.value);
    [[UIScreen mainScreen] setBrightness:sender.value];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation


{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}


@end

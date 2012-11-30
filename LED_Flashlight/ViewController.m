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


-(void)updateTimer
{
  
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"hh:mm:ss a"];
    label.text = [formatter stringFromDate:[NSDate date]];
}

@synthesize offButton, onView, onButton, offView, label, brightLabel, ledbrightnessLabel;


-(IBAction)changeScreenBrightness:(UISlider *)sender
{
    
    brightLabel.text = [NSString stringWithFormat:@"%f", sender.value];
    [[UIScreen mainScreen] setBrightness:sender.value];
    
    //to make the slider vertical
    //CGAffineTransform trans = CGAffineTransformMakeRotation(M_PI*0.5);
    //brightLabel.transform = trans;
}

/**-(IBAction)changeLEDBrightness:(UISlider *)sender
{
    AVCaptureDevice *flashlight =[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    [flashlight lockForConfiguration:nil];
    [flashlight setTorchModeOnWithLevel:sender.value error:nil];//changed from NULL to nil
    
   [flashlight unlockForConfiguration];
   // ledbrightnessLabel.hidden = YES;
} **/



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
    if([flashlight isTorchAvailable] && [flashlight isTorchModeSupported:AVCaptureTorchModeOff])
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
    [super viewDidLoad];
    [label setFont:[UIFont fontWithName:@"Let's go Digital" size:65]];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
	// Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (BOOL)setTorchModeOnWithLevel:(float)torchLevel error:(NSError **)outError

 -(IBAction)changeLEDBrightness:(UISlider *)sender
{
    //UISlider *sender = [[UISlider alloc] initWithFrame:CGRectMake(20.0f, 20.0f, 280.0f, 40.0f)];
    sender.maximumValue = 1.0f;
    sender.minimumValue = 0.0000000001f;
    [sender setContinuous:YES];
    [sender addTarget:self action:@selector(sliderDidChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sender];
}



- (void)sliderDidChange:(UISlider *)sender
{
    AVCaptureDevice *flashlight = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    [flashlight lockForConfiguration:nil];
    [flashlight setTorchModeOnWithLevel:sender.value error:NULL];
    [flashlight unlockForConfiguration];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end

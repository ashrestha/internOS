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

@synthesize offButton, onView, onButton, offView, label, brightLabel;


-(IBAction)changeScreenBrightness:(UISlider *)sender
{
    brightLabel.text = [NSString stringWithFormat:@"%f", sender.value];
    [[UIScreen mainScreen] setBrightness:sender.value];
}



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
    
    
    
    
    // add dimming features
    UISlider *Dimslider = [[UISlider alloc] initWithFrame:CGRectMake(20.0f, 20.0f, 280.0f, 40.0f)];
    Dimslider.maximumValue = 1.0f;
    Dimslider.minimumValue = 0.0f; [Dimslider setContinuous:YES];
    [Dimslider addTarget:self action:@selector(sliderDidChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:Dimslider];

    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    [device lockForConfiguration:nil];
    [device setTorchModeOnWithLevel:Dimslider.value error:NULL];
    [device unlockForConfiguration];
    
    
  
   // add brightness features
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(8,25,300,400)];
    [slider addTarget:self action:@selector(sliderHandler:) forControlEvents:UIControlEventValueChanged];
    slider.minimumValue = 0.f;
    slider.maximumValue = 1.0f;
    slider.value = [[UIScreen mainScreen] brightness];
    [[self view]addSubview:slider];
  
    [super viewDidLoad];
   
    
    [label setFont:[UIFont fontWithName:@"Let's go Digital" size:45]];
    
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
	// Do any additional setup after loading the view, typically from a nib.
}

////slider for the screen brightness
//- (void)sliderHandler:(UISlider *)sender
//{
//    //NSLog(@"value:%f", sender.value);
//    [[UIScreen mainScreen] setBrightness:sender.value];
//}



- (void)sliderDidChange:(UISlider *)Dimslider
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    [device lockForConfiguration:nil];     [device setTorchModeOnWithLevel:Dimslider.value error:NULL];
    [device unlockForConfiguration];
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

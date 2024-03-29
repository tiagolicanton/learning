//
//  ViewController.m
//  Crashes
//
//  Created by 脚脚 on 12/30/13.
//  Copyright (c) 2013 脚脚. All rights reserved.
//

#import "ViewController.h"
#import "Crashers.h"
#import "AbandonedMemory.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)triggerCrash:(id)sender
{

    Crashers *crasher = [[Crashers alloc] init];

    //[crasher addnilToMutableArray];

    //[crasher addObjectToDeallocatedMutableArray];

    //[crasher callAnUnknownMethod];

    //[crasher callIndexBeyondBound];

    //[crasher callIndexOfObjectforNonExistingThing];
    
    //[crasher badAccessFromMemoryLeak];
    
    //[crasher badAccessFromMemoryLeakNonRetainedObject];
    
    //[crasher setNilObjectForKey];
    
    [crasher sessionTable];
    
    [crasher release];
}
- (IBAction)triggerAbandonedMemory:(id)sender {
    
    AbandonedMemory *memory = [[AbandonedMemory alloc] init];
    
    [memory loadImages];
    
    //if you don't add this, memory leak happens
    [memory release];
    
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

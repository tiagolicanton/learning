//
//  Crashers.m
//  Crashes
//
//  Created by 脚脚 on 12/30/13.
//  Copyright (c) 2013 脚脚. All rights reserved.
//

#import "Crashers.h"

@implementation Crashers

- (void) addnilToMutableArray
{
    NSMutableArray *myarray = [[NSMutableArray alloc] init];
    
    NSNumber *N = [[NSNumber alloc] initWithInt:100];
    
    [myarray addObject:N];
    
    N = nil;
    
    //crash here
    [myarray addObject:N];
    
}


//you need to enableZombie object to make it crash
- (void) addObjectToDeallocatedMutableArray
{
    NSMutableArray *myarray = [[NSMutableArray alloc] initWithObjects:@"hi", nil];
    //change this line to NSMutableArray *myarray2 = [myarray retain] could solve the problem
    NSMutableArray *myarray2 = myarray;
   
    [myarray release];
    myarray =  nil;
    
    [myarray2 addObject:@"something"];

}

- (void) callAnUnknownMethod
{
    NSMutableArray *myarray = [[NSMutableArray alloc] init];
    
    //crash here
    [myarray addobject:@"hi"];
}

- (void) callIndexBeyondBound
{
    NSArray *myarray = [[NSArray alloc] initWithObjects:@"hi",@"p", nil];
    
    NSLog(@"%@", [myarray objectAtIndex:0]);
    
    NSLog(@"%@", [myarray objectAtIndex:2]);
    
}


- (void) callIndexOfObjectforNonExistingThing
{
    NSArray *myarray = [[NSArray alloc] initWithObjects:@"hi",@"p", @2, nil];
    
    // in case we set it nil,  codes below always print out 0
    //myarray = nil;
    
    //this gonna print out 0
    NSLog(@"%lu", (unsigned long)[myarray indexOfObject:@"hi"]);
    
    //this is gonna print out 2147483647, somehow risky?
    NSLog(@"%lu", (unsigned long)[myarray indexOfObject:@"?"]);
    
    //this is gonna print out 2
    NSLog(@"%lu", (unsigned long)[myarray indexOfObject:@2]);
    
    //bad access
    NSLog(@"%lu", (unsigned long)[myarray indexOfObject:2]);
}


//you need to enableZombie object to make it crash
- (void) badAccessFromMemoryLeak
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString *s = [[NSString alloc] initWithString:@"let's start"];
    s = [s substringFromIndex:[s rangeOfString:@"s"].location];
    [s release];
    [pool drain];
}


@end

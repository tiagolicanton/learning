//
//  AbandonedMemory.m
//  Crashes
//
//  Created by 脚脚 on 1/8/14.
//  Copyright (c) 2014 脚脚. All rights reserved.
//

#import "AbandonedMemory.h"

@implementation AbandonedMemory


- (void) loadImages{
    
    for (int i=0; i<=100; i++)
    {
    
    NSURL *imageURL = [NSURL URLWithString:@"http://www.microstrategy.com/cmstemplates/microstrategy/images/microstrategy_logo.png"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND,0), ^{
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            image = [UIImage imageWithData:imageData];
        });
        
    });
    }
    
}

@end

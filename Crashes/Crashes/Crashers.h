//
//  Crashers.h
//  Crashes
//
//  Created by 脚脚 on 12/30/13.
//  Copyright (c) 2013 脚脚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Crashers : NSObject

- (void) addnilToMutableArray;

- (void) addObjectToDeallocatedMutableArray;

- (void) callAnUnknownMethod;

- (void) callIndexBeyondBound;

- (void) callIndexOfObjectforNonExistingThing;

- (void) badAccessFromMemoryLeak;

@end

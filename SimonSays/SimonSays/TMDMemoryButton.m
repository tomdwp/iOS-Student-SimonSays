//
//  TMDMemoryButton.m
//  SimonSays
//
//  Created by Tom Daggett on 2014-07-30.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import "TMDMemoryButton.h"

@implementation TMDMemoryButton

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
        NSUInteger randomNumber = arc4random_uniform(4);
        
        switch (randomNumber) {
            case 0:
                _colour = Red;
                break;
                
            case 1:
                _colour = Blue;
                break;
                
            case 2:
                _colour = Green;
                break;
                
            case 3:
                _colour = Orange;
                break;
                
            default:
                break;
        }
        
    }
    
    return self;
}

+ (instancetype)newButton
{
    return [[TMDMemoryButton alloc] init];
}

@end

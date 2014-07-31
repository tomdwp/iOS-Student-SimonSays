//
//  TMDMemoryButton.h
//  SimonSays
//
//  Created by Tom Daggett on 2014-07-30.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMDMemoryButton : NSObject

@property (strong, nonatomic) UIColor *colour;

+ (instancetype)newButton;

@end

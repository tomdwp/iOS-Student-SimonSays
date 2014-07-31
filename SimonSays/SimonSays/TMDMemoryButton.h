//
//  TMDMemoryButton.h
//  SimonSays
//
//  Created by Tom Daggett on 2014-07-30.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ENUM(NSUInteger, ButtonColour){
    Red,
    Blue,
    Green,
    Orange
};

@interface TMDMemoryButton : NSObject

//@property (strong, nonatomic) UIColor *colour;
@property enum ButtonColour colour;

+ (instancetype)newButton;

@end

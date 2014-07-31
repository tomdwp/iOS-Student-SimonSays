//
//  TMDViewController.m
//  SimonSays
//
//  Created by Tom Daggett on 2014-07-30.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import "TMDViewController.h"
#import "TMDMemoryButton.h"

@interface TMDViewController ()

@property (strong, nonatomic) NSMutableArray *sequenceOfMemoryButtons;


- (void)reciteMemoryButton:(TMDMemoryButton *)memoryButton withDelay:(NSUInteger)delayInSeconds;

@end

@implementation TMDViewController

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

- (NSMutableArray *)sequenceOfMemoryButtons
{
    if (!_sequenceOfMemoryButtons) {
        _sequenceOfMemoryButtons = [[NSMutableArray alloc] init];
    }
    
    return _sequenceOfMemoryButtons;
}

- (IBAction)startRound:(id)sender
{
    NSLog(@"startRound called ...");
    
    [self.startButton setUserInteractionEnabled:NO];
    self.startButton.alpha = 0.0;

    // add random memoryButton to sequence of buttons
    [self.sequenceOfMemoryButtons addObject:[TMDMemoryButton newButton]];
    
    for (int count = 0; count < [self.sequenceOfMemoryButtons count]; count++) {
    
        [self reciteMemoryButton:[self.sequenceOfMemoryButtons objectAtIndex:count] withDelay:count];
        
    }
    
    NSLog(@"startRound finished ...");
}

- (void)reciteMemoryButton:(TMDMemoryButton *)memoryButton withDelay:(NSUInteger)delayInSeconds
{
    UIButton *buttonToAnimate = nil;
    
    switch (memoryButton.colour) {
        case Blue:
            buttonToAnimate = self.blueButton;
            break;
            
        case Red:
            buttonToAnimate = self.redButton;
            break;
            
        case Green:
            buttonToAnimate = self.greenButton;
            break;
            
        case Orange:
            buttonToAnimate = self.orangeButton;
            break;
            
        default:
            break;
    }
    
    
    //play back sequence...
    void (^waxingAnimationBlock)(void) = ^void(void){
        
        buttonToAnimate.alpha = 1.0;
        
        //NSLog(@"animating button");
        
        if (buttonToAnimate == self.redButton) {
            NSLog(@"red button animated");
        } else if (buttonToAnimate == self.blueButton) {
            NSLog(@"blue button animated");
        } else if (buttonToAnimate == self.greenButton) {
            NSLog(@"green button animated");
        } else if (buttonToAnimate == self.orangeButton) {
            NSLog(@"orange button animated");
        }
        
        
    };
    
    void (^waningAnimationBlock)(BOOL) = ^void(BOOL someFlag){
        
        NSLog(@"someFlag is: %d", someFlag);
        
        buttonToAnimate.alpha = 0.5;
        if ([self.sequenceOfMemoryButtons count] -1 == delayInSeconds)
        {
            NSLog(@"Reenabled button");
            [self.startButton setUserInteractionEnabled:YES];
            self.startButton.alpha = 1.0;
        }
        
    };
    
    [UIView animateKeyframesWithDuration:0.5 delay:delayInSeconds options:(UIViewKeyframeAnimationOptionLayoutSubviews | UIViewAnimationOptionAutoreverse) animations:waxingAnimationBlock completion:waningAnimationBlock];
    
    
}

@end

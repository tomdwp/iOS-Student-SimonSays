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

- (void)reciteMemoryButton:(TMDMemoryButton *)memoryButton;

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
    // add random memoryButton to sequence of buttons
    [self.sequenceOfMemoryButtons addObject:[TMDMemoryButton newButton]];
    
    for (int count = 0; count < [self.sequenceOfMemoryButtons count]; count++) {
    
        [self reciteMemoryButton:[self.sequenceOfMemoryButtons objectAtIndex:count]];
        
    }
    
    
    
     
}

- (void)reciteMemoryButton:(TMDMemoryButton *)memoryButton
{
    UIButton *buttonToAnimate = nil;
    
    if (memoryButton.colour == [UIColor blueColor]) {
        buttonToAnimate = self.blueButton;
    } else if (memoryButton.colour == [UIColor redColor]) {
        buttonToAnimate = self.redButton;
    } else if (memoryButton.colour == [UIColor greenColor]) {
        buttonToAnimate = self.greenButton;
    } else if (memoryButton.colour == [UIColor orangeColor]) {
        buttonToAnimate = self.orangeButton;
    }
    
    //play back sequence...
    void (^waxingAnimationBlock)(void) = ^void(void){
        
        buttonToAnimate.alpha = 1.0;
    };
    
    void (^waningAnimationBlock)(BOOL) = ^void(BOOL someFlag){
        
        buttonToAnimate.alpha = 0.5;
        
    };
    
    [UIView animateKeyframesWithDuration:1 delay:0 options:(UIViewKeyframeAnimationOptionLayoutSubviews | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionAllowUserInteraction) animations:waxingAnimationBlock completion:waningAnimationBlock];
    
    
}

@end

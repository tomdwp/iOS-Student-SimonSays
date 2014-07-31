//
//  TMDViewController.h
//  SimonSays
//
//  Created by Tom Daggett on 2014-07-30.
//  Copyright (c) 2014 Tom Daggett. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMDViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *redButton;
@property (weak, nonatomic) IBOutlet UIButton *blueButton;
@property (weak, nonatomic) IBOutlet UIButton *greenButton;
@property (weak, nonatomic) IBOutlet UIButton *orangeButton;

@property (weak, nonatomic) IBOutlet UIButton *startButton;


- (IBAction)startRound:(id)sender;



@end

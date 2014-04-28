//
//  MatchingGameViewController.h
//  Test1b
//
//  Created by Michael Vitone on 4/28/14.
//  Copyright (c) 2014 Michael Vitone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardMatchingGame.h"

@interface MatchingGameViewController : UIViewController{
    CardMatchingGame *cardGame;
}

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
- (IBAction)buttonPressed:(UIButton *)sender;

@end

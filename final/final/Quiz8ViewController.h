//
//  Q8ViewController.h
//  Quiz8
//
//  Created by Michael Vitone on 4/28/14.
//  Copyright (c) 2014 Michael Vitone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Quiz8EtchView.h"

@interface Quiz8ViewController : UIViewController
- (IBAction)leftKnobRotated:(UIRotationGestureRecognizer *)sender;
- (IBAction)rightKnobRotated:(UIRotationGestureRecognizer *)sender;
@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *rightView;
@property (strong, nonatomic) IBOutlet UIRotationGestureRecognizer *pleaseDontDeleteXCodeYourTerribleLeft;
@property (strong, nonatomic) IBOutlet UIRotationGestureRecognizer *pleaseDontDeleteCodeYourTerribleRight;

@property (weak, nonatomic) IBOutlet Quiz8EtchView *etchView;

@property (readonly) BOOL usedYet;

@end

//
//  SpirographViewController.h
//  MoravianSpirograph
//
//  Created by Michael Toth on 2/21/14.
//  Copyright (c) 2014 Michael Toth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpirographView.h"
#import "HarmonigraphView.h"

@interface SpirographViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet SpirographView *spirographView;
@property (weak, nonatomic) IBOutlet HarmonigraphView *harmonigraphView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *lLablel;
@property (weak, nonatomic) IBOutlet UILabel *kLabel;
@property (weak, nonatomic) IBOutlet UISlider *l;
@property (weak, nonatomic) IBOutlet UISlider *k;
@property (weak, nonatomic) IBOutlet UITextField *numberOfSteps;
@property (weak, nonatomic) IBOutlet UITextField *sizeOfSteps;
- (IBAction)redraw:(UIButton *)sender;



@end

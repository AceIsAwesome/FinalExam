//
//  SpirographViewController.m
//  MoravianSpirograph
//
//  Created by Michael Toth on 2/21/14.
//  Copyright (c) 2014 Michael Toth. All rights reserved.
//

#import "SpirographViewController.h"

@interface SpirographViewController ()

@end

@implementation SpirographViewController
@synthesize spirographView;
@synthesize harmonigraphView;
@synthesize scrollView;
@synthesize lLablel;
@synthesize kLabel;
@synthesize l;
@synthesize k;
@synthesize numberOfSteps;
@synthesize sizeOfSteps;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.spirographView.numberOfSteps = [numberOfSteps.text intValue];
    self.spirographView.stepSize = [sizeOfSteps.text floatValue];
    self.spirographView.l = l.value;
    self.spirographView.k = k.value;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardAppeared:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWentAway:) name:UIKeyboardWillHideNotification object:nil];
    self.sizeOfSteps.delegate = self;
    self.numberOfSteps.delegate = self;
}

- (void)viewDidUnload
{
    [self setSpirographView:nil];
    [self setScrollView:nil];
    [self setHarmonigraphView:nil];
    [self setLLablel:nil];
    [self setKLabel:nil];
    [self setL:nil];
    [self setK:nil];
    [self setNumberOfSteps:nil];
    [self setSizeOfSteps:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (void)viewDidLayoutSubviews{
        [self.scrollView setContentSize:CGSizeMake(560,280)];
         
}
- (void)keyboardAppeared:(NSNotification *)note {
    CGSize keyboardSize = [[[note userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    CGRect newFrame = self.view.frame;
    newFrame.origin.y -= keyboardSize.height;
    self.view.frame = newFrame;
}

- (void)keyboardWentAway:(NSNotification *)note {
    CGSize keyboardSize = [[[note userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    CGRect newFrame = self.view.frame;
    newFrame.origin.y += keyboardSize.height;
    self.view.frame = newFrame;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)redraw:(UIButton *)sender {
    self.spirographView.numberOfSteps = [numberOfSteps.text intValue];
    self.spirographView.stepSize = [sizeOfSteps.text floatValue];
    self.spirographView.l = l.value;
    self.spirographView.k = k.value;
    [self.spirographView setNeedsDisplay];
    [self.harmonigraphView setNeedsDisplay];
}
@end

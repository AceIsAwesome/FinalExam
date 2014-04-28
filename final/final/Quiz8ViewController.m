//
//  Q8ViewController.m
//  Quiz8
//
//  Created by Michael Vitone on 4/28/14.
//  Copyright (c) 2014 Michael Vitone. All rights reserved.
//

#import "Quiz8ViewController.h"

@interface Quiz8ViewController ()

@end

@implementation Quiz8ViewController
@synthesize leftView;
@synthesize rightView;
@synthesize pleaseDontDeleteXCodeYourTerribleLeft;
@synthesize pleaseDontDeleteCodeYourTerribleRight;
@synthesize etchView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CGAffineTransform transform = CGAffineTransformMakeRotation(-M_PI/2);
    self.view.transform = transform;
    
    CGRect contentRect = CGRectMake(0, 0, 480, 320);
    self.view.bounds = contentRect;
    
    _usedYet = NO;
}

- (void)viewDidUnload
{
    //[self setEtchView:nil];
    //[self setLeftView:nil];
    //[self setRightView:nil];
    [self setPleaseDontDeleteXCodeYourTerribleLeft:nil];
    [self setPleaseDontDeleteCodeYourTerribleRight:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
-(BOOL)canBecomeFirstResponder {
    return YES;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
    if(!_usedYet){
        //recenter the view
        [etchView.currentPath removeAllPoints];
        [etchView.currentPath moveToPoint:CGPointMake(etchView.bounds.size.width/2, etchView.bounds.size.height/2)];
        etchView.currentPoint = CGPointMake(etchView.bounds.size.width/2, etchView.bounds.size.height/2);
        [etchView setNeedsDisplay];
        _usedYet = YES;
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return NO;
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return NO;
    }
}

- (IBAction)leftKnobRotated:(UIRotationGestureRecognizer *)sender {
    //NSLog(@"works");
    float x;
    //prolly going to need adjusting
    if(sender.velocity < 0){
        x = etchView.currentPoint.x - fabs(sender.rotation);
    }else{
        x = etchView.currentPoint.x + fabs(sender.rotation);
    }
    if(x > etchView.bounds.size.width){
        x = etchView.bounds.size.width;
    }
    if(x < 0){
        x = 0;
    }
   // NSLog(@"%f",sender.rotation);
    float y = etchView.currentPoint.y;
    etchView.currentPoint = CGPointMake(x,y);
    //NSLog(@"%@", NSStringFromCGPoint(etchView.currentPoint));
    [etchView setNeedsDisplay];
    //reset the rotation to 0
    [sender setRotation:0];
}

- (IBAction)rightKnobRotated:(UIRotationGestureRecognizer *)sender {
    //NSLog(@"Works");
    float y;
    //prolly going to need adjusting
    if(sender.velocity < 0){
        y = etchView.currentPoint.y - fabs(sender.rotation);
    }else{
        y = etchView.currentPoint.y + fabs(sender.rotation);
    }
    if(y > etchView.bounds.size.height){
        y = etchView.bounds.size.height;
    }
    if(y < 0){
        y = 0;
    }
    float x = etchView.currentPoint.x;
    etchView.currentPoint = CGPointMake(x,y);
    [etchView setNeedsDisplay];
    //reset the rotation to 0
    sender.rotation = 0;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        [etchView.currentPath removeAllPoints];
        [etchView.currentPath moveToPoint:CGPointMake(etchView.bounds.size.width/2, etchView.bounds.size.height/2)];
        etchView.currentPoint = CGPointMake(etchView.bounds.size.width/2, etchView.bounds.size.height/2);
        [etchView setNeedsDisplay];
    }
}
@end

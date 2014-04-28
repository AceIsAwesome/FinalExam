//
//  SpirographView.m
//  Spirograph4
//
//  Created by Vincent Pillinger on 2/25/14.
//  Copyright (c) 2014 Vincent Pillinger. All rights reserved.
//

#import "SpirographView.h"

@implementation SpirographView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //stuff
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIBezierPath *bz = [[UIBezierPath alloc] init];
    CGFloat t = 0.0;
    [bz moveToPoint:[self sCurve:t l:self.l k:self.k]];
    for(t=0; t<self.numberOfSteps * self.stepSize; t= t+self.stepSize){
        CGPoint p = [self sCurve:t l:self.l k:self.k] ;
        
        [bz addLineToPoint:p];
    }
    [bz stroke];
}
- (CGPoint) sCurve:(CGFloat)t l:(CGFloat)l k:(CGFloat)k {
    
    return CGPointMake(140+120*((1-k)*cos(t)+l*k*cos(((1-k)/k)*t)), 140+120*((1-k)*sin(t)-l*k*sin(((1-k)/k)*t)));
}
@end

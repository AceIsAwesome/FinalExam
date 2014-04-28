//
//  Q8EtchView.m
//  Quiz8
//
//  Created by Michael Vitone on 4/28/14.
//  Copyright (c) 2014 Michael Vitone. All rights reserved.
//

#import "Quiz8EtchView.h"

@implementation Quiz8EtchView

-(id)init{
    self = [super init];
    if(self){
        [_currentPath moveToPoint:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2)];
        _currentPoint = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        _currentPath = [[UIBezierPath alloc]init];
        [_currentPath moveToPoint:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2)];
        _currentPoint = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        
        //set background
        [self setBackgroundColor:[UIColor lightGrayColor]];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [_currentPath moveToPoint:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2)];
        _currentPoint = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{

    //draw dot
    [[UIColor whiteColor] setFill];
    UIRectFill(CGRectMake(_currentPoint.x, _currentPoint.y, 2, 2));
    //draw path
    [[UIColor blackColor] setFill];
    [_currentPath addLineToPoint:_currentPoint];
    [_currentPath stroke];
}


@end

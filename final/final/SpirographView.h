//
//  SpirographView.h
//  Spirograph4
//
//  Created by Vincent Pillinger on 2/25/14.
//  Copyright (c) 2014 Vincent Pillinger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpirographView : UIView

@property (nonatomic) CGFloat l;
@property (nonatomic) CGFloat k;
@property (nonatomic) CGFloat stepSize;
@property (nonatomic) NSUInteger numberOfSteps;
@end

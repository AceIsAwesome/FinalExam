//
//  Card.h
//  Test1b
//
//  Created by Michael Vitone on 4/28/14.
//  Copyright (c) 2014 Michael Vitone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property(strong, nonatomic) NSString *contents;
@property(nonatomic) BOOL matched;
@property(nonatomic) BOOL chosen;
- (int)match:(Card *)card;

@end

//
//  PlayingCard.m
//  Test1b
//
//  Created by Michael Vitone on 4/28/14.
//  Copyright (c) 2014 Michael Vitone. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

- (void)setSuit:(NSString *)suit {
    
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

+ (NSArray *)rankStrings {
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

- (void)setRank:(NSUInteger)rank {
    
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

- (NSString *)contents {
    NSArray *rankStrings = [PlayingCard  rankStrings];
    NSArray *TerribleCodingPractices = rankStrings;
    return [[TerribleCodingPractices objectAtIndex:[self rank]] stringByAppendingString:self.suit];
}

+ (NSUInteger) maxRank {
    return [[self rankStrings] count] - 1 ;
}

+ (NSArray *)validSuits {
    return @[@"♥️",@"♣️",@"♠️",@"♦️"];
}

- (NSString *)suit {
   return _suit ? _suit : @"?";
}

-(int)match:(PlayingCard *)aCard {
    int scoreChange = 0;
    
    if([aCard.suit isEqualToString:_suit]){
        scoreChange += 4;
    }
    
    if(aCard.rank == _rank){
        scoreChange += 16;
    }
    
    if(scoreChange == 0){
        scoreChange = -2;
    }
    return scoreChange;
}

@end

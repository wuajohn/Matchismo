//
//  PlayingCard.m
//  Matchismo
//
//  Created by wuajohn on 14-6-2.
//  Copyright (c) 2014年 wuajohn. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard


-(NSString *)contents
{
//    NSArray *rankStrings =@[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",
//                            @"10", @"J",@"Q",@"K"];
//    return [NSString stringWithFormat:@"%@%@",rankStrings[self.rank],self.suit];
    return [NSString stringWithFormat:@"%@%@",self.suit,
            [PlayingCard rankStrings][self.rank]];
}

-(int)match:(NSArray *)otherCards
{
    int score=0;
    
    if (otherCards.count==1) {
        PlayingCard *otherCard=[otherCards objectAtIndex:0];
        if (otherCard.rank==self.rank) {//大小相等，点数相等，花色不相等
            score=4;
        } else if([otherCard.suit isEqualToString:self.suit]) {//花色相等
            score=1;
        }
        
    }
    else if (otherCards.count==2) {
        PlayingCard *card0=[otherCards objectAtIndex:0];
        PlayingCard *card1=[otherCards objectAtIndex:1];
        if (card0.rank==self.rank&&card1.rank==self.rank) {//大小相等，点数相等，花色不相等
            score=4;
        } else if([card0.suit isEqualToString:self.suit] &&
                  [card1.suit isEqualToString:self.suit]) {//花色相等
            score=1;
        }
        
    }
    
    return score;
}


@synthesize suit=_suit;

-(void)setSuit:(NSString *)suit
{
//    NSArray *suitStrings=@[@"♠",@"♣",@"♥",@"♦"];
//    if ([suitStrings containsObject:suit]) {
//        _suit=suit;
//    }
    if ([[PlayingCard validSuits]containsObject:suit]) {
        _suit=suit;
    }
}

-(NSString *)suit
{
    return _suit ? _suit:@"?";
}

+(NSArray *)validSuits
{
    return @[@"♠",@"♣",@"♥",@"♦"];
}



+(NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",
             @"10",@"J",@"Q",@"K"];
}

+(NSUInteger)maxRank
{
    return ([[PlayingCard rankStrings]count]-1);
}

-(void)setRank:(NSUInteger)rank
{
    if (rank<=[PlayingCard maxRank]) {
        _rank=rank;
    }
}

@end

//
//  Card.m
//  Matchismo
//
//  Created by wuajohn on 14-6-2.
//  Copyright (c) 2014年 wuajohn. All rights reserved.
//

#import "Card.h"

@implementation Card

- (NSUInteger)numberOfMatchingCards
{
    if (!_numberOfMatchingCards) _numberOfMatchingCards = 2;
    return _numberOfMatchingCards;
}

-(int)match:(NSArray *)otherCards
{
    int cnt=0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            ++cnt;
        }
    }   
    
    return cnt;
}

@end

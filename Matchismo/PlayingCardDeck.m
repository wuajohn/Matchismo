//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by wuajohn on 14-6-2.
//  Copyright (c) 2014年 wuajohn. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

-(id)init
{
    if (self=[super init]) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (int i=1; i<=[PlayingCard maxRank]; ++i) {//for (int i=1; i<[PlayingCard maxRank]; ++i) {
                PlayingCard *card=[PlayingCard new];
                card.suit=suit;
                card.rank=i;
                
                [self addCard:card];
            }
        }
        
    }
    return self;

}

@end

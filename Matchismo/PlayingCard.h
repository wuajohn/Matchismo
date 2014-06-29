//
//  PlayingCard.h
//  Matchismo
//
//  Created by wuajohn on 14-6-2.
//  Copyright (c) 2014年 wuajohn. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property(strong,nonatomic)NSString *suit;
@property(nonatomic)NSUInteger rank;

//@property(nonatomic,getter = isFaceUp) BOOL faceUp;
//@property(nonatomic,getter = isUnplayable)BOOL unplayable;

+(NSArray *)validSuits;
+(NSUInteger)maxRank;
@end

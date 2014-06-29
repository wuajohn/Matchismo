//
//  Card.h
//  Matchismo
//
//  Created by wuajohn on 14-6-2.
//  Copyright (c) 2014年 wuajohn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property(strong,nonatomic)NSString *contents;
@property(nonatomic,getter = isChosen) BOOL chosen;
@property(nonatomic,getter = isMatched)BOOL matched;

@property (nonatomic) NSUInteger numberOfMatchingCards;

-(int)match:(NSArray *)otherCards;

@end

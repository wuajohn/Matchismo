//
//  Deck.h
//  Matchismo
//
//  Created by wuajohn on 14-6-2.
//  Copyright (c) 2014年 wuajohn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(void)addCard:(Card *)card;

-(Card *)drawRandomCard;

@end

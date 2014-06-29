//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Martin Mandl on 06.11.13.
//  Copyright (c) 2013 m2m server software gmbh. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card
@property (nonatomic, strong) NSArray *lastChosenCards;
@property (nonatomic, readwrite) NSInteger lastScore;
@property (strong, nonatomic) Deck *deck;

@end

@implementation CardMatchingGame

- (NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}
    
- (NSUInteger)maxMatchingCards
{
    Card *card = [self.cards objectAtIndex:0];
    if (_maxMatchingCards < card.numberOfMatchingCards) {
        _maxMatchingCards = card.numberOfMatchingCards;
    }
    return _maxMatchingCards;
}

- (NSUInteger)numberOfDealtCards {
    return [self.cards count];
}

- (id)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        _deck = deck;
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
            _matchBonus = MATCH_BONUS;
            _mismatchPenalty = MISMATCH_PENALTY;
            _flipCost = COST_TO_CHOOSE;
        }
    }
    
    return self;
}

- (void)addCard:(NSInteger)count
{
    if (count>0) {            
        for (int i = 0; i < count; i++) {
            Card *card = [_deck drawRandomCard];
            if (card)
                [self.cards addObject:card];
        }
    }
    else
    {        
        for (int i = count; i > 0; i++) {
            if (self.cards.count>0)
                [self.cards removeLastObject];
        }
    }
}



//#define MISMATCH_PENALTY 2
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            NSMutableArray *otherCards = [NSMutableArray array];
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [otherCards addObject:otherCard];
                }
            }
            self.lastScore = 0;
            self.lastChosenCards = [otherCards arrayByAddingObject:card];
            if ([otherCards count] + 1 == self.maxMatchingCards) {
                int matchScore = [card match:otherCards];
                if (matchScore) {
                    self.lastScore = matchScore * self.matchBonus;
                    card.matched = YES;
                    for (Card *otherCard in otherCards) {
                        otherCard.matched = YES;
                    }
                } else {
                    self.lastScore = - self.mismatchPenalty;
                    for (Card *otherCard in otherCards) {
                        otherCard.chosen = NO;
                    }
                }
            }
            self.score += self.lastScore - self.flipCost;
            card.chosen = YES;
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

- (void)drawNewCard
{
    Card *card = [self.deck drawRandomCard];
    if (card) {
        [self.cards addObject:card];
    }
}

- (BOOL)deckIsEmpty
{
    Card *card = [self.deck drawRandomCard];
    if (card) {
        [self.deck addCard:card];
        return NO;
    }
    return YES;
}


@end

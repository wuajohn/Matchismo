//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by CS193p Instructor.
//  Copyright (c) 2013 Stanford University.
//  All rights reserved.
//

#import "SetCardGameViewController.h"
#import "SetCardDeck.h"
#import "SetCard.h"
#import "SetCardCollectionViewCell.h"

@implementation SetCardGameViewController

- (Deck *)createDeck
{
    return [[SetCardDeck alloc] init];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.cardCount=63;
}

//- (NSUInteger)startingCardCount
//{
//    return 63;
//}

- (void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card
{
    if ([cell isKindOfClass:[SetCardCollectionViewCell class]]) {
        SetCardView *setCardView = ((SetCardCollectionViewCell *)cell).setCardView;
        if ([card isKindOfClass:[SetCard class]]) {
            SetCard *setCard = (SetCard *)card;
            
            setCardView.color=setCard.color;
            setCardView.symbol=setCard.symbol;
            setCardView.shading=setCard.shading;
            setCardView.number=setCard.number;
            
            setCardView.chosen=setCard.isChosen;            

            setCardView.alpha = setCard.isMatched ? 0.3 : 1.0;

        }
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SetCardCell" forIndexPath:indexPath];
    Card *card = [self.game cardAtIndex:indexPath.item];
    [self updateCell:cell usingCard:card];
    return cell;
}

- (IBAction)increaseCard:(id)sender {
    [self addCard:3];
}

- (IBAction)decreaseCard:(id)sender {
    [self addCard:-3];
}

@end

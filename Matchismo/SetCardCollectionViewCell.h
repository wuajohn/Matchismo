//
//  PlayingCardCollectionViewCell.h
//  Matchismo
//
//  Created by CS193p Instructor.
//  Copyright (c) 2013 Stanford University.
//  All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SetCardView.h"

@interface SetCardCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet SetCardView *setCardView;

@end

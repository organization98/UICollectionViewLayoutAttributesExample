//
//  SeatCollectionViewCell.m
//  UICollectionViewLayoutAttributesExample
//
//  Created by Dmitriy Demchenko on 9/1/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#import "SeatCollectionViewCell.h"

@interface SeatCollectionViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *seatNumberLabel;

@end


@implementation SeatCollectionViewCell

- (void)configSeat:(NSDictionary *)seat {
    self.seatNumberLabel.text = seat[@"seatNumber"];
    self.backgroundColor = ([seat[@"seatSelect"] boolValue]) ? [UIColor grayColor] : [UIColor orangeColor];
}

@end
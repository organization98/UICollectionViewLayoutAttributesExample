//
//  TestController.m
//  UICollectionViewLayoutAttributesExample
//
//  Created by Dmitriy Demchenko on 8/31/15.
//  Copyright (c) 2015 Dmitriy Demchenko. All rights reserved.
//

#define RAND_FROM_TO(min, max) (min + arc4random_uniform(max - min + 1))

#import "TestController.h"
#import "SeatCollectionViewCell.h"

@interface TestController () <UICollectionViewDataSource, UIBarPositioningDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *seatsArray;

@end

@implementation TestController

static NSString *const ReuseIdentifier = @"SeatCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self generateSeats];
}

#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.seatsArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SeatCollectionViewCell *seatCell = [collectionView dequeueReusableCellWithReuseIdentifier:ReuseIdentifier forIndexPath:indexPath];
    [seatCell configSeat:self.seatsArray[indexPath.item]];

    return seatCell;
}

#pragma mark - Private methods

- (void)generateSeats {
    
    self.seatsArray = [[NSMutableArray alloc] init];
    
    for (NSInteger seat = 0; seat < 40; seat++) {
        NSDictionary *seatDict = @{@"seatNumber" : [@(seat + 1) stringValue],
                                   @"seatSelect" : [@(RAND_FROM_TO(0, 1)) stringValue]};
        [self.seatsArray addObject:seatDict];
    }
    NSLog(@"%@", self.seatsArray);
}

@end

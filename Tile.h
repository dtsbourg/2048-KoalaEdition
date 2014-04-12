//
//  Tile.h
//  2048
//
//  Created by Dylan Bourgeois on 12/04/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"

@interface Tile : CCNode
@property (nonatomic, assign) NSInteger value;
@property (nonatomic, assign) BOOL mergedThisRound;

- (void)updateValueDisplay;

@end

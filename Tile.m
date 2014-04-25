//
//  Tile.m
//  2048
//
//  Created by Dylan Bourgeois on 12/04/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Tile.h"

@implementation Tile {
    CCLabelTTF *_valueLabel;
    CCNodeColor *_backgroundNode;
}

- (id)init {
    self = [super init];
    if (self) {
        self.value = (arc4random()%2+1)*2;
    }
    return self;
}

- (void)updateValueDisplay {
    CCColor *backgroundColor = nil;
    switch (self.value) {
        case 2:
            backgroundColor = [CCColor colorWithRed:214.f/255.f green:201.f/255.f blue:191.f/255.f];
            _valueLabel.color = [CCColor colorWithRed:100.f/255.f green:91.f/255.f blue:82.f/255.f];
            break;
        case 4:
            backgroundColor = [CCColor colorWithRed:233.f/255.f green:218.f/255.f blue:187.f/255.f];
            _valueLabel.color = [CCColor colorWithRed:100.f/255.f green:91.f/255.f blue:82.f/255.f];
            break;
        case 8:
            backgroundColor = [CCColor colorWithRed:239.f/255.f green:162.f/255.f blue:98.f/255.f];
            _valueLabel.color = [CCColor whiteColor];
            break;
        case 16:
            backgroundColor = [CCColor colorWithRed:243.f/255.f green:130.f/255.f blue:76.f/255.f];
            break;
        case 32:
            backgroundColor = [CCColor colorWithRed:244.f/255.f green:101.f/255.f blue:72.f/255.f];
            break;
        case 64:
            backgroundColor = [CCColor colorWithRed:244.f/255.f green:69.f/255.f blue:38.f/255.f];
            break;
        case 128:
            backgroundColor = [CCColor colorWithRed:232.f/255.f green:200.f/255.f blue:88.f/255.f];
            break;
        case 256:
            backgroundColor = [CCColor colorWithRed:233.f/255.f green:196.f/255.f blue:70.f/255.f];
            break;
        case 512:
            backgroundColor = [CCColor colorWithRed:233.f/255.f green:192.f/255.f blue:53.f/255.f];
            break;
        case 1024:
            backgroundColor = [CCColor colorWithRed:233.f/255.f green:188.f/255.f blue:35.f/255.f];
            break;
        case 2048:
            backgroundColor = [CCColor colorWithRed:233.f/255.f green:185.f/255.f blue:13.f/255.f];
            break;
        default:
            backgroundColor = [CCColor blackColor];
            break;
    }
    _backgroundNode.color = backgroundColor;
    _valueLabel.string = [NSString stringWithFormat:@"%ld", (long)self.value];
}

- (void)didLoadFromCCB {
    [self updateValueDisplay];
}

@end

//
//  GameEnd.m
//  2048
//
//  Created by Dylan Bourgeois on 13/04/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Grid.h"
#import "MainScene.h"
#import "GameEnd.h"

@implementation GameEnd {
    CCLabelTTF *_messageLabel;
    CCLabelTTF *_scoreLabel;
}

- (void)newGame {
    CCScene *mainScene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector] replaceScene:mainScene];
}

- (void)setMessage:(NSString *)message score:(NSInteger)score {
    _messageLabel.string = message;
    _scoreLabel.string = [NSString stringWithFormat:@"%ld", (long)score];
}

- (void)keepPlaying {
    if([_messageLabel.string isEqualToString:@"You win!"]) {
        CCScene *current = [[CCDirector sharedDirector] runningScene];
    
        Grid*grid = [[[[current children] firstObject] children] objectAtIndex:1];
        NSArray*d = [grid children];
        GameEnd *popover = [d lastObject];
    
        [grid removeChild:popover];
    }
}


@end

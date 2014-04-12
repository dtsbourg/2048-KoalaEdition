//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"
#import "Grid.h"
@implementation MainScene {
    Grid *_grid;
    CCLabelTTF *_scoreLabel;
    CCLabelTTF *_highscoreLabel;
    CCSprite *_koala;

}

- (void)didLoadFromCCB {
    [_grid addObserver:self forKeyPath:@"score" options:0 context:NULL];
    [[NSUserDefaults standardUserDefaults] addObserver:self
                                            forKeyPath:@"highscore"
                                               options:0
                                               context:NULL];
    // load highscore
    [self updateHighscore];
    
    int newHighscore = [[[NSUserDefaults standardUserDefaults] objectForKey:@"highscore"]intValue];
    if (newHighscore < 1000) {
       [_koala setTexture:[[CCSprite spriteWithImageNamed:@"koala_peace.png"]texture]];
    }
    else if (newHighscore < 15000)
    {
        [_koala setTexture:[[CCSprite spriteWithImageNamed:@"koala_cane.png"]texture]];
    }
    else if (newHighscore < 30000)
    {
        [_koala setTexture:[[CCSprite spriteWithImageNamed:@"koala_lightsaber.png"]texture]];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if ([keyPath isEqualToString:@"score"]) {
        _scoreLabel.string = [NSString stringWithFormat:@"%d", _grid.score];
    } else if ([keyPath isEqualToString:@"highscore"]) {
        [self updateHighscore];
    }
}

- (void)dealloc {
    [_grid removeObserver:self forKeyPath:@"score"];
}

- (void)updateHighscore {
    NSNumber *newHighscore = [[NSUserDefaults standardUserDefaults] objectForKey:@"highscore"];
    if (newHighscore) {
        _highscoreLabel.string = [NSString stringWithFormat:@"%d", [newHighscore intValue]];
    }
    
    int highscore = [[[NSUserDefaults standardUserDefaults] objectForKey:@"highscore"]intValue];
    if (highscore < 1000) {
        [_koala setTexture:[[CCSprite spriteWithImageNamed:@"koala_peace.png"]texture]];
    }
    else if (highscore < 15000)
    {
        [_koala setTexture:[[CCSprite spriteWithImageNamed:@"koala_cane.png"]texture]];
    }
    else if (highscore < 30000)
    {
        [_koala setTexture:[[CCSprite spriteWithImageNamed:@"koala_lightsaber.png"]texture]];
    }
}



@end

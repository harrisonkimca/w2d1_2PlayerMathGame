//
//  Player.m
//  2w2d1_2PlayerMath
//
//  Created by Seantastic31 on 03/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "Player.h"

@interface Player()

@property (strong, readwrite) NSString *name;
@property (readwrite) NSInteger lives;
@property (readwrite) NSInteger score;

@end

@implementation Player

- (instancetype)initWithName:(NSString*)name andLives:(NSInteger)lives andScore:(NSInteger)score
{
    self = [super init];
    if (self) {
        _name = name;
        _lives = lives;
        _score = score;
    }
    return self;
}

- (void)decreaseLivesBy:(NSInteger)livesLost
{
    self.lives -= livesLost;
}

- (void)increaseScoreBy:(NSInteger)scoreIncrease
{
    self.score += scoreIncrease;
}

- (NSInteger)getCurrentLives
{
    return self.lives;
}

- (NSInteger)getCurrentScore
{
    return self.score;
}

- (NSString*)getPlayerName
{
    return self.name;
}




@end

//
//  Player.h
//  2w2d1_2PlayerMath
//
//  Created by Seantastic31 on 03/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (strong, readonly) NSString *name;
@property (readonly) NSInteger lives;
@property (readonly) NSInteger score;

- (instancetype)initWithName:(NSString*)name andLives:(NSInteger)lives andScore:(NSInteger)score;
- (void)decreaseLivesBy:(NSInteger)livesLost;
- (void)increaseScoreBy:(NSInteger)scoreIncrease;
- (NSInteger)getCurrentScore;
- (NSInteger)getCurrentLives;
- (NSString*)getPlayerName;

@end

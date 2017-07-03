//
//  GameControl.h
//  2w2d1_2PlayerMath
//
//  Created by Seantastic31 on 03/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface GameControl : NSObject

- (NSString*)generateMathQuestion;
- (void)switchActivePlayer;
- (BOOL)checkAnswer:(NSString*)playerAnswer;
- (NSString*)getPlayerScore:(NSString*)player;
- (NSString*)getPlayerLives:(NSString*)player;
- (BOOL)checkPlayerLives:(Player*)player;
- (BOOL)gameOver;

@end

//
//  GameControl.m
//  2w2d1_2PlayerMath
//
//  Created by Seantastic31 on 03/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "GameControl.h"

@implementation GameControl

{
    Player *playerOne;
    Player *playerTwo;
    Player *activePlayer;
    NSInteger currentQuestionAnswer;
    BOOL gameOver;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        playerOne = [[Player alloc]initWithName:@"Player 1" andLives:3 andScore:0];
        playerTwo = [[Player alloc]initWithName:@"Player 2" andLives:3 andScore:0];
        activePlayer = playerOne;
    }
    return self;
}

- (NSString*)generateMathQuestion
{
    NSString *randomQuestion;
    NSInteger leftValue = arc4random_uniform(19) + 1;
    NSInteger rightValue = arc4random_uniform(19) + 1;
    // bonus 1
    NSInteger questionType = arc4random_uniform(3);
    
    if (questionType == 0)
    {
        // question in string form
        randomQuestion = [NSString stringWithFormat:@"%@: %li + %li = ?", [activePlayer getPlayerName], leftValue, rightValue];
        // question in NSInteger form
        currentQuestionAnswer = leftValue + rightValue;
    }
    else if (questionType == 1)
    {
        randomQuestion = [NSString stringWithFormat:@"%@: %li - %li = ?", [activePlayer getPlayerName], leftValue, rightValue];
        currentQuestionAnswer = leftValue - rightValue;
    }
    else if (questionType == 2)
    {
        randomQuestion = [NSString stringWithFormat:@"%@: %li x %li = ?", [activePlayer getPlayerName], leftValue, rightValue];
        currentQuestionAnswer = leftValue * rightValue;
    }
    else if (questionType == 3)
    {
        randomQuestion = [NSString stringWithFormat:@"%@: %li / %li = ?", [activePlayer getPlayerName], leftValue, rightValue];
        currentQuestionAnswer = leftValue * rightValue;
    }
    
    return randomQuestion;
}

- (void)switchActivePlayer
{
    if ([activePlayer isEqual:playerOne])
    {
        activePlayer = playerTwo;
    }
    else
    {
        activePlayer = playerOne;
    }
}

- (BOOL)checkAnswer:(NSString*)playerAnswer
{
    BOOL isCorrect = NO;
    if(currentQuestionAnswer == [playerAnswer integerValue])
    {
        isCorrect = YES;
        [activePlayer increaseScoreBy:1];
    }
    else
    {
        [activePlayer decreaseLivesBy:1];
    }
    [self switchActivePlayer];
    return isCorrect;
}

- (NSString*)getPlayerScore:(NSString*)player
{
    NSString *score;
    
    if ([player isEqualToString:@"Player 1"])
    {
        score = [NSString stringWithFormat:@"Player 1 score: %li", [playerOne getCurrentScore]];
    }
    else if ([player isEqualToString:@"Player 2"])
    {
        score = [NSString stringWithFormat:@"Player 2 score: %li", [playerTwo getCurrentScore]];
    }
    return score;
}

- (NSString*)getPlayerLives:(NSString *)player
{
    NSString *lives;
    
    if([player isEqualToString:@"Player 1"])
    {
        lives = [NSString stringWithFormat:@"Player 1 lives: %li", [playerOne getCurrentLives]];
    }
    else if ([player isEqualToString:@"Player 2"])
    {
        lives = [NSString stringWithFormat:@"Player 2 lives: %li", [playerTwo getCurrentLives]];
    }
    return lives;
}

- (BOOL)checkPlayerLives:(Player*)player
{
    return [player getCurrentLives];
}

- (BOOL)gameOver
{
    if ([playerOne getCurrentLives] == 0 || [playerTwo getCurrentLives] == 0)
    {
        gameOver = YES;
    }
    return gameOver;
}

@end

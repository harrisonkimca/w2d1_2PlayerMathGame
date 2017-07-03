//
//  ViewController.m
//  2w2d1_2PlayerMath
//
//  Created by Seantastic31 on 03/07/2017.
//  Copyright © 2017 Seantastic31. All rights reserved.
//

#import "ViewController.h"
#import "GameControl.h"
#define kPlayer1 @"Player 1"
#define kPlayer2 @"Player 2"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *mathQuestionLabel;
@property (weak, nonatomic) IBOutlet UITextField *answerTextField;
@property (weak, nonatomic) IBOutlet UILabel *feedBackLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerOneScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerTwoScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerOneLivesLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerTwoLivesLabel;

@property (strong, nonatomic) GameControl *currentGame;
@property (strong, nonatomic) NSMutableString *playerResponse;
// use for the +/- button to check positive or negative
@property (nonatomic) BOOL isNegative;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // INITIALIZE IN viewDidLoad
    [self initializeGame];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initializeGame
{
    // init game control & string to hold player responses
    self.currentGame = [[GameControl alloc]init];
    self.playerResponse = [[NSMutableString alloc]init];
    // call methods to load into UI
    self.mathQuestionLabel.text = [self.currentGame generateMathQuestion];
    self.playerOneScoreLabel.text = [self.currentGame getPlayerScore:kPlayer1];
    self.playerTwoScoreLabel.text = [self.currentGame getPlayerScore:kPlayer2];
    self.playerOneLivesLabel.text = [self.currentGame getPlayerLives:kPlayer1];
    self.playerTwoLivesLabel.text = [self.currentGame getPlayerLives:kPlayer2];
    self.isNegative = NO;
}

- (IBAction)enterButton:(UIButton *)sender
{
    // bonus 2 (fade feedback)
    [UIView animateWithDuration:1 animations:^{self.feedBackLabel.alpha = 1.0;} completion:nil];
    // check answer and give feeback
    if ([self.currentGame checkAnswer:self.playerResponse])
    {
        // bonus 2 (fade feedback)
        self.feedBackLabel.textColor = [UIColor greenColor];
        self.feedBackLabel.text = @"Correct!";
        [UIView animateWithDuration:1 animations:^{self.feedBackLabel.alpha = 0.0;} completion:nil];
    }
    else
    {
        // bonus 2 (fade feedback)
        self.feedBackLabel.textColor = [UIColor redColor];
        self.feedBackLabel.text = @"Wrong!";
        [UIView animateWithDuration:1 animations:^{self.feedBackLabel.alpha = 0.0;} completion:nil];
    }
    
    // update score & lives
    self.playerOneScoreLabel.text = [self.currentGame getPlayerScore:kPlayer1];
    self.playerTwoScoreLabel.text = [self.currentGame getPlayerScore:kPlayer2];
    self.playerOneLivesLabel.text = [self.currentGame getPlayerLives:kPlayer1];
    self.playerTwoLivesLabel.text = [self.currentGame getPlayerLives:kPlayer2];
    
    // bonus 3 (restart game with alert)
    if ([self.currentGame gameOver])
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Game Over!"
                                                                       message:@"Would you like to play again?"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okay = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * action) {[self initializeGame];}];
        
        [alert addAction:okay];
        [self presentViewController:alert animated:YES completion:nil];
    }
    // bonus 3 (restart game with alert)
    else
    {
        self.mathQuestionLabel.text = [self.currentGame generateMathQuestion];
    }
    
    //self.mathQuestionLabel.text = [self.currentGame generateMathQuestion];
    [self.playerResponse setString:@""];
    self.answerTextField.text = @"";
    
}

- (IBAction)numberButton:(UIButton *)sender
{
    [self.playerResponse appendString:[sender currentTitle]];
    self.answerTextField.text = self.playerResponse;
}

- (IBAction)plusMinusButton:(UIButton *)sender
{
    [self.playerResponse setString:@""];
    self.answerTextField.text = @"";
    
    if (!self.isNegative)
    {
        self.isNegative = YES;
        [self.playerResponse appendString:@"-"];
        self.answerTextField.text = self.playerResponse;
    }
    else
    {
        self.isNegative = NO;
        [self.playerResponse appendString:@""];
        self.answerTextField.text = self.playerResponse;
    }
}

- (IBAction)clearButton:(UIButton *)sender
{
    [self.playerResponse setString:@""];
    self.answerTextField.text = @"";
}

@end

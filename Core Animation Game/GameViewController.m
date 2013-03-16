//
//  GameViewController.m
//  Core Animation Game
//
//  Created by Alsey Coleman Miller on 3/14/13.
//  Copyright (c) 2013 ColemanCDA. All rights reserved.
//

#import "GameViewController.h"
#import "CASprite.h"
#import "../Chipmunk-iPhone/chipmunk.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - GameViewDataSource Protocol

-(NSInteger)numberOfGameObjectsForGameView:(GameView *)gameView
{
    if (gameView == self.gameView) {
        
        
    }
}

-(CGImageRef)gameView:(GameView *)gameView imageOfGameObjectAtIndex:(NSInteger)index
{
    if (gameView == self.gameView) {
        
        
    }
    
}

-(CGPoint)gameView:(GameView *)gameView positionOfGameObjectAtIndex:(NSInteger)index
{
    if (gameView == self.gameView) {
        
        
    }
}

@end

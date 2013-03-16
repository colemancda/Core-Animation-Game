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
#import "GameView.h"
#import "Level.h"
#import "GameObject.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // TEMP
    Level *level1 = [[Level alloc] init];
    GameObject *monkey = [[GameObject alloc] init];
    monkey.position = self.gameView.center;
    monkey.imageFileName = @"monkey_1";
    [level1.objects addObject:monkey];
    
    [self loadLevel:level1];
    
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

#pragma mark

-(void)loadLevel:(Level *)level
{
    // set value
    _level = level;
    
    // start animations
    [self.gameView startAnimationWithTimeInterval:0];
    
}




#pragma mark - GameViewDataSource Protocol

-(NSInteger)numberOfGameObjectsForGameView:(GameView *)gameView
{
    if (gameView == self.gameView) {
        
        return _level.objects.count;
    }
    
    else return 0;
}

-(CGImageRef)gameView:(GameView *)gameView imageOfGameObjectAtIndex:(NSInteger)index
{
    if (gameView == self.gameView) {
        
        GameObject *gameObject = _level.objects[index];
        CGImageRef image = [UIImage imageNamed:gameObject.imageFileName].CGImage;
        return image;
    }
    
    else return 0;
    
}

-(CGPoint)gameView:(GameView *)gameView positionOfGameObjectAtIndex:(NSInteger)index
{
    if (gameView == self.gameView) {
        
        GameObject *gameObject = _level.objects[index];
        return gameObject.position;
    }
    
    else return CGPointZero;
}

@end

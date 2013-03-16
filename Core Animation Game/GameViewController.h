//
//  GameViewController.h
//  Core Animation Game
//
//  Created by Alsey Coleman Miller on 3/14/13.
//  Copyright (c) 2013 ColemanCDA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Chipmunk-iPhone/chipmunk.h"
#import "GameView.h"
@class Level;


@interface GameViewController : UIViewController <GameViewDataSourceProtocol>
{
    NSMutableArray *_gameObjects;
}

@property (strong, nonatomic) IBOutlet GameView *gameView;

@property cpSpace *space;

-(void)loadLevel:(Level *)level;

@end

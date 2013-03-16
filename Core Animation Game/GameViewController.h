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
    Level *_level;
    
    cpSpace *_space;
}

@property (strong, nonatomic) IBOutlet GameView *gameView;

-(void)loadLevel:(Level *)level;

@end

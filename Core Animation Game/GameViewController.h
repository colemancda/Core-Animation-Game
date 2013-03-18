//
//  GameViewController.h
//  Core Animation Game
//
//  Created by Alsey Coleman Miller on 3/14/13.
//  Copyright (c) 2013 ColemanCDA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameView.h"
#import "ChipmunkPro-iPhone-Trial/ObjectiveChipmunk.h"
@class Level;


@interface GameViewController : UIViewController <GameViewDataSourceProtocol>
{
    Level *_level;
}

@property (strong, nonatomic) IBOutlet GameView *gameView;

- (id)initWithLevel:(Level *)level;

@end

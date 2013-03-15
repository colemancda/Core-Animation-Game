//
//  GameViewController.h
//  Core Animation Game
//
//  Created by Alsey Coleman Miller on 3/14/13.
//  Copyright (c) 2013 ColemanCDA. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Level;

@interface GameViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *gameView;

-(void)loadLevel:(Level *)level;

@end

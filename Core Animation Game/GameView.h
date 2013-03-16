//
//  GameView.h
//  Core Animation Game
//
//  Created by Alsey Coleman Miller on 3/16/13.
//  Copyright (c) 2013 ColemanCDA. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GameViewDataSourceProtocol;

@interface GameView : UIView
{
    CADisplayLink *_timer;
    
    NSArray *_gameSprites;
}

@property (weak) IBOutlet id <GameViewDataSourceProtocol> dataSource;

-(void)reloadData;

-(void)startAnimation;

-(void)stopAnimation;

@end

@protocol GameViewDataSourceProtocol <NSObject>

-(NSInteger)numberOfGameObjectsForGameView:(GameView *)gameView;

-(CGPoint)gameView:(GameView *)gameView positionOfGameObjectAtIndex:(NSInteger)index;

-(CGImageRef)gameView:(GameView *)gameView imageOfGameObjectAtIndex:(NSInteger)index;
  
@end

//
//  GameView.m
//  Core Animation Game
//
//  Created by Alsey Coleman Miller on 3/16/13.
//  Copyright (c) 2013 ColemanCDA. All rights reserved.
//

#import "GameView.h"
#import <QuartzCore/QuartzCore.h>

@implementation GameView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)reloadData
{
    NSInteger objectCount = [self.dataSource numberOfGameObjectsForGameView:self];
        
    // if objectCount doesn't equal _gameObjects.count, then create a new array
    if (objectCount != _gameSprites.count) {
        NSMutableArray *tempMutArray = [[NSMutableArray alloc] initWithCapacity:objectCount];
        for (NSInteger i = 0; i < objectCount; i++) {
            
            // create sprite
            CALayer *sprite = [CALayer layer];
            
            // add to array
            [tempMutArray addObject:sprite];
            
            // add as sublayer
            [self.layer addSublayer:sprite];
            
        }
        
        // set the array to load the data for
        _gameSprites = tempMutArray.copy;
    }
    
    // update the properties of the sprites
    for (CALayer *sprite in _gameSprites) {
        
        // get index
        NSInteger index = [_gameSprites indexOfObject:sprite];
        
        // set position
        sprite.position = [self.dataSource gameView:self
                        positionOfGameObjectAtIndex:index];
        
        // set new image if image has changed
        CGImageRef newImage = [self.dataSource gameView:self
                               imageOfGameObjectAtIndex:index];
        
        if (sprite.contents != (__bridge id)(newImage)) {
            // set the new image
            sprite.contents = (__bridge id)(newImage);
            
            // set the new frame
            CGRect newFrame;
            newFrame.origin = sprite.position;
            newFrame.size = CGSizeMake(CGImageGetWidth(newImage), CGImageGetHeight(newImage));
            sprite.frame = newFrame;
        }
    }
}

-(void)startAnimationWithTimeInterval:(NSTimeInterval)time
{
    // if no time is set default to 60 FPS
    if (!time) {
        time = 1.0/60.0;
    }
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:time
                                              target:self
                                            selector:@selector(reloadData)
                                            userInfo:nil
                                             repeats:YES];
}

-(void)stopAnimation
{
    [_timer invalidate];
}

@end

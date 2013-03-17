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

-(void)reloadData
{
    NSInteger objectCount = [self.dataSource numberOfGameObjectsForGameView:self];
        
    // if objectCount doesn't equal _gameObjects.count, then create a new array
    if (objectCount != _gameSprites.count) {
        NSMutableArray *tempMutArray = [[NSMutableArray alloc] initWithCapacity:objectCount];
        for (NSInteger i = 0; i < objectCount; i++) {
            
            // create sprite
            CALayer *sprite = [CALayer layer];
            
            // set initial position
            sprite.position = [self.dataSource gameView:self
                            positionOfGameObjectAtIndex:i];
            
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
        
        // get the image
        CGImageRef newImage = [self.dataSource gameView:self
                               imageOfGameObjectAtIndex:index];
        
        // set new image if image has changed
        if (sprite.contents != (__bridge id)(newImage)) {
            
            // set the new image
            sprite.contents = (__bridge id)(newImage);
            
            // set the new frame
            CGRect newFrame;
            newFrame.origin = sprite.position;
            
            // get the scale (Retina support)
            float scale = [UIScreen mainScreen].scale;
            newFrame.size = CGSizeMake(CGImageGetWidth(newImage) / scale,
                                       CGImageGetHeight(newImage) / scale);
            sprite.frame = newFrame;
        }
    }
}

-(void)startAnimation
{
    _timer = [CADisplayLink displayLinkWithTarget:self
                                         selector:@selector(reloadData)];
    
    [_timer addToRunLoop:[NSRunLoop mainRunLoop]
                 forMode:NSDefaultRunLoopMode];

}

-(void)stopAnimation
{
    [_timer invalidate];
}

@end

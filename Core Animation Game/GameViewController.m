//
//  GameViewController.m
//  Core Animation Game
//
//  Created by Alsey Coleman Miller on 3/14/13.
//  Copyright (c) 2013 ColemanCDA. All rights reserved.
//

#import "GameViewController.h"
#import "CASprite.h"
#import "ChipmunkPro-iPhone-Trial/ObjectiveChipmunk.h"
#import "GameView.h"
#import "Level.h"
#import "GameObject.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (id)initWithLevel:(Level *)level
{
    self = [super init];
    if (self) {
        
        // set value
        _level = level;
        
    }
    return self;
}

- (id)init
{
    [NSException raise:@"Wrong initialization method"
                format:@"You cannot use %@ with %@, you have to use %@",
     NSStringFromSelector(@selector(init)),
     self,
     NSStringFromSelector(@selector(initWithLevel:))];
    return nil;
}

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

-(void)viewDidLayoutSubviews
{
    // start animations
    [self.gameView startAnimation];
    
    // start chipmunk
    [_level startChipmunk];
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
    
    else return nil;
    
}

-(CGPoint)gameView:(GameView *)gameView positionOfGameObjectAtIndex:(NSInteger)index
{
    if (gameView == self.gameView) {
        
        GameObject *gameObject = _level.objects[index];
        
        // convert chipmunk coordinate to UIKit coordinates (flip Y)
        CGPoint chipmunkPoint = gameObject.position;
        CGPoint convertedPoint = CGPointMake(chipmunkPoint.x,
                                             self.gameView.bounds.size.height - chipmunkPoint.y);        
        return convertedPoint;
    }
    
    else return CGPointZero;
}

-(CGFloat)gameView:(GameView *)gameView angleOfGameObjectAtIndex:(NSInteger)index
{
    if (gameView == self.gameView) {
        
        GameObject *gameObject = _level.objects[index];
        return gameObject.angle;
    }
    
    else return 0.0;
}

-(BOOL)gameView:(GameView *)gameView drawBoundingBoxOfGameObjectAtIndex:(NSInteger)index
{
    if (gameView == self.gameView) {
        
        return YES;
    }
    
    return NO;
}

@end

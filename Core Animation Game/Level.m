//
//  Level.m
//  Core Animation Game
//
//  Created by Alsey Coleman Miller on 3/14/13.
//  Copyright (c) 2013 ColemanCDA. All rights reserved.
//

#import "Level.h"
#import "../ChipmunkPro-iPhone-Trial/ObjectiveChipmunk.h"

@implementation Level

- (id)init
{
    self = [super init];
    if (self) {
        
        _objects = [[NSMutableArray alloc] init];
        
        // create the chipmunk space
        _space = [[ChipmunkSpace alloc] init];
        
        [_space addBounds:[UIScreen mainScreen]
                thickness:10
               elasticity:1
                 friction:1
                   layers:CP_ALL_LAYERS
                    group:CP_NO_GROUP
            collisionType:kSpaceBoundingBoxCollisionType];
        
        // add the game objects
        for (GameObject *gameObject in level.objects) {
            
            
        }
        
    }
    return self;
}


@end

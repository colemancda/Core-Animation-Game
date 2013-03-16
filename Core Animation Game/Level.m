//
//  Level.m
//  Core Animation Game
//
//  Created by Alsey Coleman Miller on 3/14/13.
//  Copyright (c) 2013 ColemanCDA. All rights reserved.
//

#import "Level.h"
#import "ChipmunkPro-iPhone-Trial/ObjectiveChipmunk.h"
#import "GameObject.h"

NSString *const kSpaceBoundingBoxCollisionType = @"SpaceBoundingBoxCollisionType";

@implementation Level

#pragma mark - Initialization

- (id)initWithSpaceBounds:(CGRect)bounds
{
    self = [super init];
    if (self) {
        
        _objects = [[NSMutableArray alloc] init];
        
        // create the chipmunk space
        _space = [[ChipmunkSpace alloc] init];
        
        [_space addBounds:bounds
                thickness:10
               elasticity:0
                 friction:1
                   layers:CP_ALL_LAYERS
                    group:CP_NO_GROUP
            collisionType:kSpaceBoundingBoxCollisionType];
        
        _space.gravity = CGPointMake(0.0, 10);
        
    }
    return self;
}

- (id)init
{
    self = [self initWithSpaceBounds:[UIScreen mainScreen].bounds];
    return self;
}


#pragma mark



@end

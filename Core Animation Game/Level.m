//
//  Level.m
//  Core Animation Game
//
//  Created by Alsey Coleman Miller on 3/14/13.
//  Copyright (c) 2013 ColemanCDA. All rights reserved.
//

#import "Level.h"
#import "ObjectiveChipmunk.h"
#import "GameObject.h"
#import <QuartzCore/QuartzCore.h>

NSString *const kSpaceBoundingBoxCollisionType = @"SpaceBoundingBoxCollisionType";

@implementation Level

#pragma mark - Initialization

- (id)initWithSpaceBounds:(CGRect)bounds
{
    self = [super init];
    if (self) {
        
        // initialize variables
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
        
        _space.gravity = CGPointMake(0.0, -100);
        
    }
    return self;
}

- (id)init
{
    self = [self initWithSpaceBounds:[UIScreen mainScreen].bounds];
    return self;
}


#pragma mark - Add Objects

-(void)addObject:(GameObject *)object
{
    // add to array
    [_objects addObject:object];
    
    // create chipmunk body and shape
    
    // get the size of the image to create box
    CGSize size = [UIImage imageNamed:object.imageFileName].size;
    
    // create body
    float mass = 1.0;
    ChipmunkBody *body = [_space addBody:[ChipmunkBody bodyWithMass:mass
                                                          andMoment:cpMomentForBox(mass,
                                                                                   size.width,
                                                                                   size.height)]];
    // give the body a pointer to our model object to update its values
    body.data = object;
    
    // set the initial position
    body.pos = object.position;
    
    // create shape
    ChipmunkShape *shape = [ChipmunkPolyShape boxWithBody:body
                                                    width:size.width
                                                   height:size.height];
    shape.friction = 0.8;
    shape.elasticity = 0.1;
}

#pragma mark - Chipmunk Simulations

-(void)startChipmunk
{
    _timer = [CADisplayLink displayLinkWithTarget:self
                                         selector:@selector(simulate)];
    
    [_timer addToRunLoop:[NSRunLoop mainRunLoop]
                 forMode:NSDefaultRunLoopMode];
}

-(void)stopChipmunk
{
    [_timer invalidate];
}

-(void)simulate
{
    // update model objects with chipmunk's body properties
    for (ChipmunkBody *body in _space.bodies) {
        
        // get the model object associated with the simulated body
        GameObject *object = (GameObject *)body.data;
        
        // update properties
        object.position = body.pos;
        
        NSLog(@"new position %@", NSStringFromCGPoint(body.pos));
    }
}

#pragma mark - Properties

-(NSArray *)objects
{
    return _objects;
}

@end

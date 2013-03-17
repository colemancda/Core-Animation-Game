//
//  Level.h
//  Core Animation Game
//
//  Created by Alsey Coleman Miller on 3/14/13.
//  Copyright (c) 2013 ColemanCDA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjectiveChipmunk.h"
@class GameObject;

@interface Level : NSObject
{
    ChipmunkSpace *_space;
    
    NSMutableArray *_objects;
    
    CADisplayLink *_timer;
}

@property (readonly) NSArray *objects;

-(void)startChipmunk;

-(void)stopChipmunk;

-(void)simulate;

-(void)addObject:(GameObject *)object;


@end

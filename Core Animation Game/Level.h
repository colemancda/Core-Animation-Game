//
//  Level.h
//  Core Animation Game
//
//  Created by Alsey Coleman Miller on 3/14/13.
//  Copyright (c) 2013 ColemanCDA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../ChipmunkPro-iPhone-Trial/ObjectiveChipmunk.h"

@interface Level : NSObject
{
    ChipmunkSpace *_space;
}

@property NSMutableArray *objects;

@end

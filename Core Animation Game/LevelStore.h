//
//  LevelStore.h
//  Core Animation Game
//
//  Created by Alsey Coleman Miller on 3/17/13.
//  Copyright (c) 2013 ColemanCDA. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Level;

@interface LevelStore : NSObject
{
    NSArray *_levels;
}

+ (LevelStore *)sharedStore;

-(Level *)level:(NSInteger)number;


@end

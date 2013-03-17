//
//  LevelStore.m
//  Core Animation Game
//
//  Created by Alsey Coleman Miller on 3/17/13.
//  Copyright (c) 2013 ColemanCDA. All rights reserved.
//

#import "LevelStore.h"
#import "Level.h"
#import "GameObject.h"

@implementation LevelStore

+ (LevelStore *)sharedStore
{
    static LevelStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedStore];
}

- (id)init
{
    self = [super init];
    if (self) {
        
        NSMutableArray *tempMutArray = [[NSMutableArray alloc] init];
        
        // create levels //
        
        Level *level1 = [[Level alloc] init];
        
        
        // end of creating levels //
        
        _levels = tempMutArray.copy;
    }
    return self;
}

-(Level *)level:(NSInteger)number
{
    NSInteger index = number - 1;
    Level *level = _levels[index];
    return level;
}

@end

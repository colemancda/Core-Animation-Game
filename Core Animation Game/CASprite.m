//
//  CASprite.m
//  Core Animation Game
//
//  Created by Alsey Coleman Miller on 3/14/13.
//  Copyright (c) 2013 ColemanCDA. All rights reserved.
//

#import "CASprite.h"

@implementation CASprite

@synthesize fileName = _fileName;

#pragma mark Properties

-(NSString *)fileName
{
    return _fileName;
}

-(void)setFileName:(NSString *)fileName
{
    // set the value
    _fileName = fileName;
    
    // set the CALayer's contents
    UIImage *image = [UIImage imageNamed:fileName];
    self.contents = (__bridge id)(image.CGImage);
    
    // resize
    CGRect newFrame;
    newFrame.origin = self.position;
    newFrame.size = image.size;
    self.frame = newFrame;
}

@end

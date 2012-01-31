//
//  JJNode.m
//  TreeControllerTest
//
//  Created by Jörg Jacobsen on 30.01.12.
//  Copyright (c) 2012 Jacobsen Software Engineering. All rights reserved.
//

#import "JJNode.h"

@implementation JJNode

@synthesize value;
@synthesize subNodes;

- (BOOL) isLeaf
{
    return (self.subNodes == nil || [self.subNodes count] == 0);
}

- (void) dealloc
{
    [value release];
    [subNodes release];
    
    [super dealloc];
}

@end

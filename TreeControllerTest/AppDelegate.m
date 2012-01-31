//
//  AppDelegate.m
//  TreeControllerTest
//
//  Created by Jörg Jacobsen on 29.01.12.
//  Copyright (c) 2012 Jacobsen Software Engineering. All rights reserved.
//

#import "AppDelegate.h"
#import "JJNode.h"

#define STRESS_TEST 1

@implementation AppDelegate

@synthesize window = _window;
@synthesize treeController = _treeController;
@synthesize rootNodes = _rootNodes;
@synthesize stressTestTimer = _stressTestTimer;

- (void)dealloc
{
    [_stressTestTimer invalidate];
    [_stressTestTimer release];
    [_rootNodes release];
    [_treeController release];
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Initialize some arbitrary node tree as a basis to prove our point
    
    JJNode *rootNode, *subNode1, *subNode2, *subNode3, *subSubNode1;
    
    subSubNode1 = [[[JJNode alloc] init] autorelease];
    subSubNode1.value = @"Deep, deep down!";
    
    subNode1 = [[[JJNode alloc] init] autorelease];
    subNode1.value = @"I am first sub-level";
    subNode1.subNodes = [NSArray arrayWithObject:subSubNode1];
    
    // This is the node we will subsequently replace every two seconds
    subNode2 = [[[JJNode alloc] init] autorelease];
    subNode2.value = @"I am also first sub-level";
    
    subNode3 = [[[JJNode alloc] init] autorelease];
    subNode3.value = @"Yep, me too first sub-level";
    
    rootNode = [[[JJNode alloc] init] autorelease];
    rootNode.value = @"Hey, big root I am!";
    rootNode.subNodes = [NSArray arrayWithObjects:subNode1, subNode2, subNode3, nil];
    
    self.rootNodes = [NSArray arrayWithObject:rootNode];
    
    // Try to provoke the error
    
#if STRESS_TEST
    self.stressTestTimer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(replaceNode:) userInfo:nil repeats:YES];
#endif
}


- (void)replaceNode:(NSTimer *)timer
{
    static NSUInteger counter = 1;
    
    JJNode *newNode = [[[JJNode alloc] init] autorelease];
    newNode.value = [NSString stringWithFormat:@"I am number %lu", counter];
    
    NSMutableArray *nodes = [NSMutableArray arrayWithArray:[[self.rootNodes objectAtIndex:0] subNodes]];
    [nodes replaceObjectAtIndex:1 withObject:newNode];
    [(JJNode *)[self.rootNodes objectAtIndex:0] setSubNodes:[NSArray arrayWithArray:nodes]];
    
    counter++;
}

@end

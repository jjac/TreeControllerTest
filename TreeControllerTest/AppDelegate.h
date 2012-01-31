//
//  AppDelegate.h
//  TreeControllerTest
//
//  Created by Jörg Jacobsen on 29.01.12.
//  Copyright (c) 2012 Jacobsen Software Engineering. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "JJNode.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, retain) IBOutlet NSTreeController *treeController;
@property (nonatomic, retain) NSArray *rootNodes;
@property (nonatomic, retain) NSTimer *stressTestTimer;

@end

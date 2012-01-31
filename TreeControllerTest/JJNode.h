//
//  JJNode.h
//  TreeControllerTest
//
//  Created by Jörg Jacobsen on 30.01.12.
//  Copyright (c) 2012 Jacobsen Software Engineering. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JJNode : NSObject

@property(nonatomic, copy) NSString *value;
@property(nonatomic, retain) NSMutableArray *subNodes;

- (BOOL) isLeaf;

@end

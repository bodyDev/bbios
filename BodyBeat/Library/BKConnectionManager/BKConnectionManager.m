//
//  BKConnectionManager.m
//  BodyBeat
//
//  This class handles all communication with server, facebook etc.
//
//  Created by Can Behran Kankul on 12/01/16.
//  Copyright © 2016 Can Behran Kankul. All rights reserved.
//

#import "BKConnectionManager.h"

@implementation BKConnectionManager

#pragma mark Singleton Methods

/* Required */
+ (id)sharedManager {
    static BKConnectionManager *sharedCache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedCache = [[self alloc] init];
    });
    return sharedCache;
}
/* Required */
- (id)init {
    if (self = [super init]) {

    }
    return self;
}
- (void)dealloc {
    // Should never be called, but just here for clarity really.
}
@end

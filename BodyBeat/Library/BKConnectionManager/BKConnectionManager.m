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
#import "AFNetworking.h"
#import "Common.h"

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
    NSLog(@"Connection Manager started");
    return self;
}

#pragma mark - Connection Status
//Connection Monitoring - starts on app launch
-(void)startMonitoring {
    
    //Start monitoring for connection
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"Current Connection Status: %@", AFStringFromNetworkReachabilityStatus(status));
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}
#pragma mark - Registration

//Check email available
-(BOOL)checkEmailAvailable:(NSString *)email{
    return YES;
}

//Register new user
-(BOOL)registerUserWith:(NSString *)name
                surname:(NSString *)surname
                  email:(NSString *)email
               password:(NSString *)password
                   type:(NSInteger) type
             facebookId:(NSString *)fbId
             accessToken:(NSString *)token
                 gender:(NSString *)gender
               birthday:(NSString *)birthday
             deviceInfo:(NSString *)device
                 osInfo:(NSString *)os
                 weight:(NSString *)weight
                 height:(NSString *)height

{
    
    return YES;
}

@end

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
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "BKCache.h"
#import <UIKit/UIKit.h>


@interface BKConnectionManager()

@property NSDictionary *facebookParams;

@end
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
    //Default permissions for facebook graph api
    _facebookParams = @{@"fields" : @"id,name,email,birthday,gender,first_name,last_name"};
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
-(BOOL)registerUserWith:(NSDictionary *) parameters
{
    [[AFHTTPSessionManager manager] POST:[self generateUrlByRequest:Register] parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //TODO
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //TODO
        
    }];
    return YES;
}

-(NSString *)generateUrlByRequest:(enum UrlType)requestType{
    
    /* Switch this to connect different server */
    
    NSString *serverAddress = localServerUrl;
    
    switch (requestType)
    {
        case EmailCheck:
            return [NSString stringWithFormat:@"%@/%@/%@", serverAddress, apiVersion, emailCheckUrl];
            break;
        case Register:
            return [NSString stringWithFormat:@"%@/%@/%@", serverAddress, apiVersion, postNewUserUrl];
        break;
        case Login:
            return [NSString stringWithFormat:@"%@/%@/%@", serverAddress, apiVersion, postLoginUrl];
            break;
        default:
        break;
    }
    
}

-(void) connectFacebooktoGetUserInfo{
    
    //Make a FBGraph request to get user information
    
    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:_facebookParams HTTPMethod:@"GET"] startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        
        if (!error) {
        
            //TODO:
        }
        else{
            NSDictionary *userData = @{userFBIDKey:result[@"id"],
                                       userEmailKey:result[@"email"],
                                       userNameKey:result[@"first_name"],
                                       userSurnameKey:result[@"last_name"],
                                       userFullnameKey:[NSString stringWithFormat:@"%@ %@",result[@"first_name"],result[@"last_name"]],
                                       userGenderKey:result[@"gender"],
                                       userFBTokenKey:@"",
                                       userBirthdayKey:result[@"birthday"],
                                       userDevice:[[UIDevice currentDevice] model],
                                       userOsInfo:[[UIDevice currentDevice] systemVersion],
                                       userConnectedFBKey:@YES
                                       };
            //now we have user info. Lets save them.
            [[BKCache sharedManager] saveUserData:userData :NO];
        }
        
    }];
}

@end

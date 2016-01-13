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
               fullname:(NSString *)fullname
                  email:(NSString *)email
               password:(NSString *)password
                   type:(NSString *) typeId
             facebookId:(NSString *)facebookId
            accessToken:(NSString *)accesstoken
                 gender:(NSString *)gender
               birthday:(NSString *)birthday
             deviceInfo:(NSString *)device
                 osInfo:(NSString *)osInfo
               bodyType:(NSString *)bodyType
                 weight:(NSString *)weight
                 height:(NSString *)height
               language:(NSString *)language

{
    NSDictionary *params = @{
                             @"name": name,
                             @"surname": surname,
                             @"fullname": fullname,
                             @"email": email,
                             @"password": password,
                             @"typeid": typeId,
                             @"facebookId": facebookId,
                             @"googleplusid":@"",
                             @"twitterid":@"",
                             @"accesstoken": accesstoken,
                             @"gender": gender,
                             @"birthday": birthday,
                             @"device": device,
                             @"osInfo": osInfo,
                             @"bodyType": bodyType,
                             @"weight": weight,
                             @"height": height,
                             @"language": language
                            };
    
    
    [[AFHTTPSessionManager manager] POST:[self generateUrlByRequest:Register] parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
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

@end

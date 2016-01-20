//
//  BKCache.h
//  BodyBeat
//
//
//  Created by Can Behran Kankul on 09/01/16.
//  Copyright © 2016 Can Behran Kankul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Common.h"

@interface BKCache : NSObject {
    
    NSString *appUserId;
    NSString *name;
    NSString *surname;
    NSString *fullname;
    NSString *gender;
    NSString *birthday;
    NSString *email;
    NSString *password;
    NSString *facebookId;
    NSString *twitterId;
    NSString *googleplusId;
    NSString *userType;
    NSString *height;
    NSString *weight;
    NSString *bodyType;
    
    BOOL isUserConnectedWithFacebook;
    BOOL isUserConnectedWithEmail;
    BOOL isUserConnectedWithGoogle;
    BOOL isUserConnectedWithTwitter;
    BOOL isAppInstalled;
    
}
@property (nonatomic, retain) NSString *appUserId;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *surname;
@property (nonatomic, retain) NSString *fullname;
@property (nonatomic, retain) NSString *gender;
@property (nonatomic, retain) NSString *birthday;
@property (nonatomic, retain) NSString *email;
@property (nonatomic, retain) NSString *password;
@property (nonatomic, retain) NSString *facebookId;
@property (nonatomic, retain) NSString *twitterId;
@property (nonatomic, retain) NSString *googleplusId;
@property (nonatomic, retain) NSString *userType;
@property (nonatomic, retain) NSString *height;
@property (nonatomic, retain) NSString *weight;
@property (nonatomic, retain) NSString *bodyType;

@property BOOL isUserConnectedWithFacebook;
@property BOOL isUserConnectedWithEmail;
@property BOOL isUserConnectedWithGoogle;
@property BOOL isUserConnectedWithTwitter;
@property BOOL isAppInstalled;

+ (id)sharedManager;
- (void) saveUserData:(NSDictionary *)userData :(BOOL) isFirstTime;
- (void) updateAppData:(NSString *)key withData:(NSObject*)data;
- (BOOL) checkAppInstalled;
@end

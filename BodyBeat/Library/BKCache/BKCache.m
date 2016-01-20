//
//  BKCache.m
//  BodyBeat
//
//  This class is required to handle all default user data operations.
//
//  Created by Can Behran Kankul on 09/01/16.
//  Copyright © 2016 Can Behran Kankul. All rights reserved.
//

#import "BKCache.h"

@implementation BKCache

/* Default properties */

@synthesize appUserId;
@synthesize name;
@synthesize surname;
@synthesize fullname;
@synthesize gender;
@synthesize birthday;
@synthesize email;
@synthesize password;
@synthesize facebookId;
@synthesize twitterId;
@synthesize googleplusId;
@synthesize userType;
@synthesize height;
@synthesize weight;
@synthesize bodyType;
@synthesize isUserConnectedWithFacebook;
@synthesize isUserConnectedWithEmail;
@synthesize isUserConnectedWithGoogle;
@synthesize isUserConnectedWithTwitter;
@synthesize isAppInstalled;

#pragma mark Singleton Methods

/* Required */
+ (id)sharedManager {
    static BKCache *sharedCache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedCache = [[self alloc] init];
    });
    return sharedCache;
}

/* Required */
- (id)init {
    if (self = [super init]) {
        
        /* read userInfo for fast access. */
        
        appUserId = [[NSUserDefaults standardUserDefaults] objectForKey:applicationUserIdKey];
        name = [[NSUserDefaults standardUserDefaults] objectForKey:userNameKey];
        surname = [[NSUserDefaults standardUserDefaults] objectForKey:userSurnameKey];
        fullname = [[NSUserDefaults standardUserDefaults] objectForKey:userFullnameKey];
        gender = [[NSUserDefaults standardUserDefaults] objectForKey:userGenderKey];
        birthday = [[NSUserDefaults standardUserDefaults] objectForKey:userBirthdayKey];
        email = [[NSUserDefaults standardUserDefaults] objectForKey:userEmailKey];
        password = [[NSUserDefaults standardUserDefaults] objectForKey:userPasswordKey];
        facebookId = [[NSUserDefaults standardUserDefaults] objectForKey:userFBIDKey];
        twitterId = [[NSUserDefaults standardUserDefaults] objectForKey:userTWIDKey];
        googleplusId = [[NSUserDefaults standardUserDefaults] objectForKey:userGGLIDKey];
        userType = [[NSUserDefaults standardUserDefaults] objectForKey:userTypeKey];
        height = [[NSUserDefaults standardUserDefaults] objectForKey:userHeightKey];
        weight = [[NSUserDefaults standardUserDefaults] objectForKey:userWeightKey];
        bodyType = [[NSUserDefaults standardUserDefaults] objectForKey:userBodyTypeKey];
        
        //TODO:Add bool controls
    }
    return self;
}

/* Sub methods */
- (void) saveUserData:(NSDictionary *)userData :(BOOL) isFirstTime {
    
    /* this condition works only on first launch of app */
    if (isFirstTime) {
        userData = @{
                     applicationUserIdKey:@"0000",
                     userNameKey:@"name",
                     userSurnameKey:@"surname",
                     userFullnameKey:@"fullname",
                     userGenderKey:@"gender",
                     userBirthdayKey:@"birthday",
                     userEmailKey:@"email",
                     userPasswordKey:@"password",
                     userFBIDKey:@"facebookId",
                     userTWIDKey:@"twitterId",
                     userGGLIDKey:@"googleplusId",
                     userTypeKey:@"userType",
                     userHeightKey:@"height",
                     userWeightKey:@"weight",
                     userBodyTypeKey:@"bodyType",
                     userConnectedFBKey:@NO,
                     userConnectedGGLKey:@NO,
                     userConnectedTWKey:@NO,
                     userConnectedEmailKey:@NO,
                     };
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isAppInstalled"];
    }
    else
    {
        /* This part checks if a key has a value or not and sets value for key. */
        
        for (NSString *key in userData) {
            [[NSUserDefaults standardUserDefaults] setObject:userData[key] forKey:key];
        }
    }
    
}
- (void) updateAppData:(NSString *)key withData:(NSObject*)data {
    
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
}
/* this method only required for first time launch */
- (BOOL) checkAppInstalled {
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    NSObject * object = [prefs objectForKey:@"isAppInstalled"];
    if(object != nil){
        return YES;
    }
    return NO;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end

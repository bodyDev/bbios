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
        appUserId = [[NSUserDefaults standardUserDefaults] objectForKey:@"appUserId"];
        name = [[NSUserDefaults standardUserDefaults] objectForKey:@"name"];
        surname = [[NSUserDefaults standardUserDefaults] objectForKey:@"surname"];
        fullname = [[NSUserDefaults standardUserDefaults] objectForKey:@"fullname"];
        gender = [[NSUserDefaults standardUserDefaults] objectForKey:@"gender"];
        birthday = [[NSUserDefaults standardUserDefaults] objectForKey:@"birthday"];
        email = [[NSUserDefaults standardUserDefaults] objectForKey:@"email"];
        password = [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
        facebookId = [[NSUserDefaults standardUserDefaults] objectForKey:@"facebookId"];
        twitterId = [[NSUserDefaults standardUserDefaults] objectForKey:@"twitterId"];
        googleplusId = [[NSUserDefaults standardUserDefaults] objectForKey:@"googleplusId"];
        userType = [[NSUserDefaults standardUserDefaults] objectForKey:@"typeid"];
        height = [[NSUserDefaults standardUserDefaults] objectForKey:@"height"];
        weight = [[NSUserDefaults standardUserDefaults] objectForKey:@"weight"];
        bodyType = [[NSUserDefaults standardUserDefaults] objectForKey:@"bodyType"];
        
        //TODO:Add bool controls
    }
    return self;
}

/* Sub methods */
- (void) setAppDefaults {
    
    //this method only works on first install.
    [[NSUserDefaults standardUserDefaults] setObject:@"0000" forKey:@"appUserId"];
    [[NSUserDefaults standardUserDefaults] setObject:@"name" forKey:@"name"];
    [[NSUserDefaults standardUserDefaults] setObject:@"surname" forKey:@"surname"];
    [[NSUserDefaults standardUserDefaults] setObject:@"fullname" forKey:@"fullname"];
    [[NSUserDefaults standardUserDefaults] setObject:@"gender" forKey:@"gender"];
    [[NSUserDefaults standardUserDefaults] setObject:@"birthday" forKey:@"birthday"];
    [[NSUserDefaults standardUserDefaults] setObject:@"email" forKey:@"email"];
    [[NSUserDefaults standardUserDefaults] setObject:@"password" forKey:@"password"];
    [[NSUserDefaults standardUserDefaults] setObject:@"facebookId" forKey:@"facebookId"];
    [[NSUserDefaults standardUserDefaults] setObject:@"twitterId" forKey:@"twitterId"];
    [[NSUserDefaults standardUserDefaults] setObject:@"googleplusId" forKey:@"googleplusId"];
    [[NSUserDefaults standardUserDefaults] setObject:@"userType" forKey:@"userType"];
    [[NSUserDefaults standardUserDefaults] setObject:@"height" forKey:@"height"];
    [[NSUserDefaults standardUserDefaults] setObject:@"weight" forKey:@"v"];
    [[NSUserDefaults standardUserDefaults] setObject:@"bodyType" forKey:@"bodyType"];

    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isUserConnectedWithFacebook"];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isUserConnectedWithEmail"];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isUserConnectedWithGoogle"];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isUserConnectedWithTwitter"];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isUserConnectedWithTwitter"];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isAppInstalled"];
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

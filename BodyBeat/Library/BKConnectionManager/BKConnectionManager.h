//
//  BKConnectionManager.h
//  BodyBeat
//
//  Created by Can Behran Kankul on 12/01/16.
//  Copyright © 2016 Can Behran Kankul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BKConnectionManager : NSObject

/* Required */
+ (id)sharedManager;

/* Connection */
- (void)startMonitoring;

/* Registration */
-(BOOL)checkEmailAvailable:(NSString *)email;

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
                 height:(NSString *)height;
@end

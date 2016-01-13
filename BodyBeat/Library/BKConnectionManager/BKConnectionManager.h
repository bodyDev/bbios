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
               language:(NSString *)language;
@end

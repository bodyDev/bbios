//
//  Common.h
//  BodyBeat
//
//  Created by Can Behran Kankul on 12/01/16.
//  Copyright © 2016 Can Behran Kankul. All rights reserved.
//

#ifndef Common_h
#define Common_h

/* Definitions for prod/test/local server */
#define apiVersion    @"api/v1"

#define testServerUrl @""
#define prodServerUrl @""
#define localServerUrl @"http://localhost:3000"

#define emailCheckUrl @"checkemail"
#define postNewUserUrl @"register"
#define postLoginUrl @"login"

/* Reused Cache keys */
#define applicationInstalledKey @"isAppInstalled"
#define applicationUserIdKey @"appUserId"
#define userNameKey @"name"
#define userSurnameKey @"surname"
#define userFullnameKey @"fullname"
#define userGenderKey @"gender"
#define userBirthdayKey @"birthday"
#define userEmailKey @"email"
#define userPasswordKey @"password"
#define userFBIDKey @"facebookId"
#define userTWIDKey @"twitterId"
#define userGGLIDKey @"googleplusId"
#define userTypeKey @"userType"
#define userHeightKey @"height"
#define userWeightKey @"weight"
#define userBodyTypeKey @"bodyType"
#define userConnectedFBKey @"isUserConnectedWithFacebook"
#define userConnectedEmailKey @"isUserConnectedWithEmail"
#define userConnectedGGLKey @"isUserConnectedWithGoogle"
#define userConnectedTWKey @"isUserConnectedWithTwitter"
#define userFBTokenKey @"accesstoken"
#define userDevice @"device"
#define userOsInfo  @"osInfo"

/* Segue Identifiers */
#define userDetailsSegue @"userDetailsSegue"
#define userHeightWeightSegue @"userHeWeSegue"

/* Enums */

enum ConnectionState {
    ServerUp,
    ServerDown,
    NoInternet
};
enum ValidationResult {
    Validated,
    Empty,
    NotCorrect,
    PasswordNotMatched,
    NotAgreedTerms
};
enum FacebookConnectionResult{
    FacebookConnectionHasAnError,
    FacebookConnectionSucceded
};
enum UrlType {
    Login,
    Register,
    EmailCheck
};

#endif /* Common_h */



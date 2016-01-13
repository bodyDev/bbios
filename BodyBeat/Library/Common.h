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

enum UrlType {
    Login,
    Register,
    EmailCheck
};

#endif /* Common_h */



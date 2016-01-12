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
#define localServerUrl @""

#define emailCheck @"/checkemail"
#define postNewUser @"/register"
#define postLogin @"/login"

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

#endif /* Common_h */



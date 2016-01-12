//
//  Common.h
//  BodyBeat
//
//  Created by Can Behran Kankul on 12/01/16.
//  Copyright © 2016 Can Behran Kankul. All rights reserved.
//

#ifndef Common_h
#define Common_h

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



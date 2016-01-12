//
//  BKHelperMethods.m
//  BodyBeat
//
//  Created by Can Behran Kankul on 12/01/16.
//  Copyright © 2016 Can Behran Kankul. All rights reserved.
//

#import "BKHelperMethods.h"
#import <UIKit/UIKit.h>

@implementation BKHelperMethods

-(NSString *) getDeviceInfo{
    return [[UIDevice currentDevice] model];
}

-(NSString *) getOSInfo {
    return [[UIDevice currentDevice] systemVersion];
}

@end

//
//  RedditLabs.h
//  RedditLabsMobile
//
//  Created by vyga on 8/12/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

//#import <Foundation/Foundation.h>
//
//@interface RedditLabs : NSObject
//
//@end

#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

#if __has_include(<React/RCTConvert.h>)
#import <React/RCTConvert.h>
#elif __has_include("RCTConvert.h")
#import "RCTConvert.h"
#else
#import "React/RCTConvert.h"   // Required when used as a Pod in a Swift project
#endif



@interface RedditLabs : NSObject <RCTBridgeModule>

@end

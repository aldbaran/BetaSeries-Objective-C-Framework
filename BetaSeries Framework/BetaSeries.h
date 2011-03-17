//
//  BetaSeries.h
//  BetaSeries
//
//  Created by Giovanni Olivera on 17/03/11.
//  Copyright 2011 PofMagicfingers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BetaSeries_Prefix.h"

@interface BetaSeries : NSObject {

    //BetaSeries keys
    NSString *APIKey;
    NSString *token;
    
    //Requests global parameters
    NSString *userAgent;
    NSTimeInterval timeout;
    
}

//BetaSeries keys
@property (nonatomic, retain) NSString *APIKey;
@property (nonatomic, retain) NSString *token;

//Requests global parameters
@property (nonatomic, retain) NSString *userAgent;
@property NSTimeInterval timeout;

#pragma mark +
#pragma mark Signup/Login/Tokens Methods

+(NSDictionary *)registerWithUsername:(NSString *)username 
                         password:(NSString *)password 
                         andEmail:(NSString *)email;

+(NSString *)obtainTokenWithUsername:(NSString *)username 
                         andPassword:(NSString *)password;

+(NSString *)obtainTokenWithUsername:(NSString *)username 
                      andPasswordMD5:(NSString *)passwordMD5;

+(BOOL)isActiveToken:(NSString *)bs_token;
+(void)destroyToken:(NSString *)bs_token;
  
#pragma mark -
#pragma mark init

-(id)initWithAPIKey:(NSString *)bs_APIKey 
           andToken:(NSString *)bs_token;

-(id)initWithAPIKey:(NSString *)bs_APIKey;

@end

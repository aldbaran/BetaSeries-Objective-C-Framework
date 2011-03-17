//
//  BetaSeries.m
//  BetaSeries
//
//  Created by Giovanni Olivera on 17/03/11.
//  Copyright 2011 PofMagicfingers. All rights reserved.
//

#import "BetaSeries.h"

@implementation BetaSeries

@synthesize APIKey;
@synthesize token;
@synthesize userAgent;
@synthesize timeout;

#pragma mark -
#pragma mark init

-(id)init {
    if((self = [super init])) {
        self.APIKey = @"";
        self.token = @"";
        self.userAgent = BETASERIES_FRAMEWORK_USER_AGENT;
        self.timeout = 20;
    }
    
    return self;
}

-(id)initWithAPIKey:(NSString *)bs_APIKey andToken:(NSString *)bs_token {
    if ((self = [self init])) {
        if(APIKey != nil)
            APIKey = [bs_APIKey retain];
        if(bs_token != nil)
            token = [bs_token retain];
    }
    return self;
}

-(id)initWithAPIKey:(NSString *)bs_APIKey {
    return [self initWithAPIKey:bs_APIKey andToken:nil];
}

#pragma mark +
#pragma mark Signup/Login/Tokens Methods

+(NSDictionary *)registerWithUsername:(NSString *)username 
                        password:(NSString *)password 
                        andEmail:(NSString *)email {

#warning This function is not yet implemented !
    return nil;
}

+(NSString *)obtainTokenWithUsername:(NSString *)username 
                         andPassword:(NSString *)password {

#warning This function is not yet implemented !
    return nil;
}

+(NSString *)obtainTokenWithUsername:(NSString *)username 
                      andPasswordMD5:(NSString *)passwordMD5 {

#warning This function is not yet implemented !
    return nil;
}

+(BOOL)isActiveToken:(NSString *)bs_token {
#warning This function is not yet implemented !
    return NO;
}

+(void)destroyToken:(NSString *)bs_token {
#warning This function is not yet implemented !
}

#pragma mark -
#pragma mark Dealloc

-(void)dealloc {
    [APIKey release];
    [token release];
    [userAgent release];
    [super dealloc];
}

@end

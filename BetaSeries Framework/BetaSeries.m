//
//  BetaSeries.m
//  BetaSeries
//
//  Created by Giovanni Olivera on 17/03/11.
//  Copyright 2011 PofMagicfingers. All rights reserved.
//

#import "BetaSeries.h"
#import "BSRequest.h"

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
                        andEmail:(NSString *)email 
                       andAPIKey:(NSString *)APIKey {

#warning This function is not yet implemented !
    return nil;
}

+(NSString *)obtainTokenWithUsername:(NSString *)username 
                         andPassword:(NSString *)password
                           andAPIKey:(NSString *)APIKey {

#warning This function is not yet implemented !
    return nil;
}

+(NSString *)obtainTokenWithUsername:(NSString *)username 
                      andPasswordMD5:(NSString *)passwordMD5
                           andAPIKey:(NSString *)APIKey {

    BSRequest *request = [BSRequest new];

    request.APIKey = APIKey;
    request.category = BSRequestCategoryMembers;
    request.method = BSRequestMethodAuth;
    request.asynchronous = NO;
    
    [request.options setObject:username forKey:@"login"];
    [request.options setObject:passwordMD5 forKey:@"password"];
    
    NSString *returnVal = nil;
    NSDictionary *response = [request send];
    
    if (response) {
        if([response objectForKey:@"member"]) {
            if ([[response objectForKey:@"member"] objectForKey:@"token"]) {
                 returnVal = [NSString stringWithString:[[[response objectForKey:@"member"] objectForKey:@"token"] retain]];
            }
        }
    }
    
    [response release];
    [request release];
    
    if (returnVal) {
        return returnVal;
    }
    
    return nil;
}

+(BOOL)isActiveToken:(NSString *)token withAPIKey:(NSString *)APIKey {

    BSRequest *request = [BSRequest new];
    
    request.APIKey = APIKey;
    request.token = token;
    request.category = BSRequestCategoryMembers;
    request.method = BSRequestMethodIsActive;
    request.asynchronous = NO;
        
    BOOL returnVal = NO;
    NSDictionary *response = [request send];
    
    NSLog(@"resp : %@", response);
    
    if (response) {
        if([response objectForKey:@"token"]) {
            if ([[response objectForKey:@"token"] isEqual:token]) {
                returnVal = YES;
            }
        }
    }
    
    [response release];
    [request release];
    
    return returnVal;
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

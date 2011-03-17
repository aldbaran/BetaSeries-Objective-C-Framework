//
//  BSRequest.m
//  BetaSeries
//
//  Created by Giovanni Olivera on 17/03/11.
//  Copyright 2011 PofMagicfingers. All rights reserved.
//

#import "BSRequest.h"

@interface BSRequest (private)

-(NSString *)_pathForCategory:(BSRequestCategory)aCategory 
                       method:(BSRequestMethod)aMethod 
                       object:(BSRequestObject*)anObject 
                      options:(BSRequestOptions*)someOptions
                   withAPIKey:(NSString *)anAPIKey 
                     andToken:(NSString *)aToken;

-(NSString *)_URLStringForRequest;

-(NSDictionary *)_parseDatas;

@end


@implementation BSRequest

//BetaSeries keys
@synthesize APIKey;
@synthesize token;

//Request parameters
@synthesize userAgent;
@synthesize timeout;

//Request
@synthesize category;
@synthesize method;
@synthesize object;
@synthesize options;

//Delegate for async requests
@synthesize delegate;
@synthesize asynchronous;

#pragma mark -
#pragma mark init

-(id)init {
    
    if ((self = [super init])) {
        APIKey = @"";
        token = @"";
        userAgent = BETASERIES_FRAMEWORK_USER_AGENT;
        timeout = 20;
        category = BSRequestCategoryTimeline;
        method = BSRequestMethodHome;
        object = nil;
        options = [NSDictionary new];
        asynchronous = NO;
        delegate = nil;
    }
    
    return self;
}

#pragma mark -
#pragma mark send

-(NSDictionary *)send:(BOOL)asynchronousRequest {
    asynchronous = asynchronousRequest;
    return [self send];
}

-(NSDictionary *)send {
    _request = [NSMutableURLRequest new];
    _datas = [NSMutableData new];

    [_request setURL:[NSURL URLWithString:[self _URLStringForRequest]]];
    
    [_request setTimeoutInterval:timeout];
    [_request setValue:userAgent forHTTPHeaderField:@"User-Agent"];
    
    if (asynchronous) {
         _connection = [[NSURLConnection alloc] initWithRequest:_request 
                                                       delegate:self];
        
        [_connection performSelectorOnMainThread:@selector(start) 
                                      withObject:nil 
                                   waitUntilDone:YES];        

    } else {
        [_datas appendData:[NSURLConnection sendSynchronousRequest:_request 
                                                 returningResponse:NULL 
                                                             error:NULL]];
        return [self _parseDatas];
    }
    
    return nil;

}

#pragma mark -
#pragma mark NSURLConnection Delegate Methods

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    if (!_datas) _datas = [NSMutableData new];
    [_datas appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    @try {
        if ([delegate conformsToProtocol:@protocol(BSRequestDelegate)]) {
            [delegate performSelector:@selector(BSRequest:didFinishLoading:) 
                           withObject:self 
                           withObject:[self _parseDatas]];
        }   
    }
    @catch (NSException *exception) {
        NSLog(@"Exception : %@", exception);
    }
    @finally {
        [_connection release];
        _connection = nil;
        
        [_request release];
        _request = nil;
        
        [_datas release];
        _datas = nil;
    }
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    @try {
        if ([delegate conformsToProtocol:@protocol(BSRequestDelegate)]) {
            [delegate performSelector:@selector(BSRequest:didFailWithError::) 
                           withObject:self 
                           withObject:error];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"Exception : %@", exception);
    }
    @finally {
        [_connection release];
        _connection = nil;
        
        [_request release];
        _request = nil;
        
        [_datas release];
        _datas = nil;
    }
}

#pragma mark -
#pragma mark Dealloc

-(void)dealloc {
    delegate = nil;
    
    [APIKey release];
    APIKey = nil;
    
    [token release];
    token = nil;
    
    [userAgent release];
    userAgent = nil;
    
    [object release];
    object = nil;
    
    [options release];
    options = nil;
    
    [_connection cancel];
    [_connection release];
    _connection = nil;
    
    [_request release];
    _request = nil;
    
    [_datas release];
    _datas = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark Private Methods

-(NSString *)_pathForCategory:(BSRequestCategory)aCategory 
                       method:(BSRequestMethod)aMethod 
                       object:(BSRequestObject*)anObject 
                      options:(BSRequestOptions*)someOptions
                   withAPIKey:(NSString *)anAPIKey 
                     andToken:(NSString *)aToken
{
    
    NSMutableString *string = [NSMutableString new];
    
    [string appendString:BETASERIES_API_BASE_URL];
    [string appendString:BSRequestCategories[aCategory]];
    [string appendString:@"/"];
    [string appendString:BSRequestMethods[aMethod]];
    
    if (anObject != nil) {
        [string appendString:@"/"];
        [string appendString:anObject];
    }
    
    [string appendString:@".json?"];
    
    if (anAPIKey != nil) {
        [someOptions setObject:anAPIKey forKey:@"key"];
    }

    if (aToken != nil) {
        [someOptions setObject:aToken forKey:@"token"];
    }

    for (NSString *key in [someOptions allKeys]) {
        [string appendFormat:@"%@=%@&", key, [someOptions valueForKey:key]];
    }
    
    return [NSString stringWithString:string];
}


-(NSString *)_URLStringForRequest {
    return [self _pathForCategory:category method:method object:object options:options withAPIKey:APIKey andToken:token];
}

-(NSDictionary *)_parseDatas {
    SBJsonParser *parser = [[SBJsonParser new] autorelease];
    return [parser objectWithData:_datas];
}

@end

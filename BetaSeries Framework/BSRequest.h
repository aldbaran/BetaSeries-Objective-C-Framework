//
//  BSRequest.h
//  BetaSeries
//
//  Created by Giovanni Olivera on 17/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "JSON.h"

#import "BetaSeries_Prefix.h"

#import "BSRequest_Definitions.h"
#import "BSRequestDelegate.h"

@interface BSRequest : NSObject {

@protected
    NSURLConnection *_connection;
    NSMutableURLRequest *_request;
    NSMutableData *_datas;

@public
    //BetaSeries keys
    NSString *APIKey;
    NSString *token;
    
    //Request parameters
    NSString *userAgent;
    NSTimeInterval timeout;

    //Request
    BSRequestCategory category;
    BSRequestMethod method;
    BSRequestObject *object;
    BSRequestOptions *options;
    
    //Delegate for async requests
    id<BSRequestDelegate> delegate;
    Boolean asynchronous;
}

//BetaSeries keys
@property (nonatomic, retain) NSString *APIKey;
@property (nonatomic, retain) NSString *token;

//Request parameters
@property (nonatomic, retain) NSString *userAgent;
@property NSTimeInterval timeout;

//Request
@property BSRequestCategory category;
@property BSRequestMethod method;
@property (nonatomic, retain) BSRequestObject *object;
@property (nonatomic, retain) BSRequestOptions *options;

//Delegate for async requests
@property (assign) id<BSRequestDelegate> delegate;
@property (getter=isAsynchronous) Boolean asynchronous;

#pragma mark -
#pragma mark send

-(NSDictionary *)send:(BOOL)asynchronousRequest;
-(NSDictionary *)send;

@end
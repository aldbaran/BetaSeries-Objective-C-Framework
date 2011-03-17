//
//  BSRequestDelegate.m
//  BetaSeries
//
//  Created by Giovanni Olivera on 17/03/11.
//  Copyright 2011 PofMagicfingers. All rights reserved.
//

@class BSRequest;

@protocol BSRequestDelegate <NSObject>

@required
-(void)BSRequest:(BSRequest *)request didFailWithError:(NSError *)error;
-(void)BSRequest:(BSRequest *)request didFinishLoading:(NSDictionary *)response;

@end
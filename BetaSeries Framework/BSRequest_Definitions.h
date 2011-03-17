//
//  BSRequest_Definitions.h
//  BetaSeries
//
//  Created by Giovanni Olivera on 17/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

// BSRequest Constants

typedef enum {
    BSRequestCategoryComments = 0,
    BSRequestCategoryMembers,
    BSRequestCategoryPlanning,
    BSRequestCategoryShows,
    BSRequestCategorySubtitles,
    BSRequestCategoryTimeline
} BSRequestCategory;

NSString * const BSRequestCategories[] = {
	@"comments",
    @"members",
    @"planning",
    @"shows",
    @"subtitles",
    @"timeline"
};

typedef enum {
    BSRequestMethodAdd,
    BSRequestMethodAuth,
    BSRequestMethodBadges,
    BSRequestMethodDelete,
    BSRequestMethodDestroy,
    BSRequestMethodDisplay,
    BSRequestMethodDownloaded,
    BSRequestMethodEpisode,
    BSRequestMethodEpisodes,
    BSRequestMethodFriends,
    BSRequestMethodGeneral,
    BSRequestMethodHome,
    BSRequestMethodInfos,
    BSRequestMethodIsActive,
    BSRequestMethodLast,
    BSRequestMethodMember,
    BSRequestMethodNote,
    BSRequestMethodNotifications,
    BSRequestMethodPostEpisode,
    BSRequestMethodPostMember,
    BSRequestMethodPostShow,
    BSRequestMethodRecommend,
    BSRequestMethodRemove,
    BSRequestMethodSearch,
    BSRequestMethodShow,
    BSRequestMethodSignUp,
    BSRequestMethodWatched
} BSRequestMethod;

NSString * const BSRequestMethods[] = {
	@"add",
	@"auth",
    @"badges",
    @"delete",
    @"destroy",
    @"display",
    @"downloaded",
    @"episode",
    @"episodes",
    @"friends",
    @"general",
    @"home",
    @"infos",
    @"is_active",
    @"last",
    @"member",
    @"note",
    @"notifications",
    @"post/episode",
    @"post/member",
    @"post/show",
    @"recommend",
    @"remove",
    @"search",
    @"show",
    @"signup",
    @"watched"
};

typedef NSString BSRequestObject;
typedef NSMutableDictionary BSRequestOptions;

NSString * const BETASERIES_API_BASE_URL = @"http://api.betaseries.com/";
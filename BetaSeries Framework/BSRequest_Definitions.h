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

typedef NSString BSRequestObject;
typedef NSMutableDictionary BSRequestOptions;
//
//  APIClient.h
//  FilmsObjcRestrospective
//
//  Created by Carlos on 10/02/2019.
//  Copyright © 2019 Carlos García Nieto. All rights reserved.
//

#ifndef APIClient_h
#define APIClient_h

#include "DiscoverResponse.h"

enum {
    APIClientBackdropSize300,
    APIClientBackdropSize780,
    APIClientBackdropSize1280,
    APIClientBackdropSizeOriginal
};
typedef NSInteger APIClientBackdropSize;


enum {
    APIClientLogoSize45,
    APIClientLogoSize92,
    APIClientLogoSize154,
    APIClientLogoSize185,
    APIClientLogoSize300,
    APIClientLogoSize500,
    APIClientLogoSizeOriginal
};
typedef NSInteger APIClientLogoSize;


enum {
    APIClientPosterSize92,
    APIClientPosterSize154,
    APIClientPosterSize185,
    APIClientPosterSize342,
    APIClientPosterSize500,
    APIClientPosterSize780,
    APIClientPosterSizeOriginal
};
typedef NSInteger APIClientPosterSize;


enum {
    APIClientProfileSize45,
    APIClientProfileSize185,
    APIClientProfileSize632,
    APIClientProfileSizeOriginal
};
typedef NSInteger APIClientProfileSize;


enum {
    APIClientStillSize92,
    APIClientStillSize185,
    APIClientStillSize300,
    APIClientStillSizeOriginal
};
typedef NSInteger APIClientStillSize;


@protocol APIClient

- (void)getDiscoverMoviePage:(int)page
                     success:(void (^)(DiscoverResponse *response))success
                     failure:(void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;

+ (NSURLRequest *)getURLRequestForBackdropSize:(APIClientBackdropSize)backdropSize andImagePath:(NSString *)imagePath;
+ (NSURLRequest *)getURLRequestForLogoSize: (APIClientLogoSize)logoSize andImagePath:(NSString *)imagePath;
+ (NSURLRequest *)getURLRequestForPosterSize: (APIClientPosterSize)posterSize andImagePath:(NSString *)imagePath;
+ (NSURLRequest *)getURLRequestForProfileSize: (APIClientProfileSize)profileSize andImagePath:(NSString *)imagePath;
+ (NSURLRequest *)getURLRequestForStillSize: (APIClientStillSize)stillSize andImagePath:(NSString *)imagePath;

@end

#endif /* APIClient_h */

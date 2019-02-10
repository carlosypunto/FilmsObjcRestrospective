//
//  DefaultAPIClient.m
//  FilmsObjcRestrospective
//
//  Created by Carlos on 10/02/2019.
//  Copyright © 2019 Carlos García Nieto. All rights reserved.
//

#import "DefaultAPIClient.h"
#import <AFNetworking/AFNetworking.h>

static NSString* const kBaseURL = @"https://api.themoviedb.org";
static NSString* const kImagesBaseURL = @"https://image.tmdb.org/t/p";

@interface DefaultAPIClient ()

+ (AFHTTPSessionManager *)manager;

@end

@implementation DefaultAPIClient

+ (NSString *)apiKey {
    static NSString *apiKey = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Keys" ofType:@"plist"];
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
        apiKey = (NSString *) dict[@"themoviedbAPiKey"];
    });
    return apiKey;
}

+ (NSURL *)baseURL {
    static NSURL *baseURL = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        baseURL = [NSURL URLWithString:kBaseURL];
    });
    return baseURL;
}

+ (NSURL *)baseImagesURL {
    static NSURL *baseImagesURL = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        baseImagesURL = [NSURL URLWithString:kImagesBaseURL];
    });
    return baseImagesURL;
}

+ (AFHTTPSessionManager *)manager {
    static AFHTTPSessionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[DefaultAPIClient baseURL]];
    });
    return manager;
}

- (void)getDiscoverMoviePage:(int)page success:(void (^)(DiscoverResponse *response))success failure:(void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure {

    NSString *pageParameter = [NSString stringWithFormat:@"%i", page];
    NSDictionary *parameters =  @{
                                  @"page": pageParameter,
                                  @"api_key": [DefaultAPIClient apiKey],
                                  @"language": @"es-ES",
                                  @"include_image_language": @"es"
                                  };

    [[DefaultAPIClient manager] GET:@"/3/discover/movie"
                         parameters: parameters
                           progress:nil
                            success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

                                NSError *error;
                                DiscoverResponse *resource = [MTLJSONAdapter modelOfClass:DiscoverResponse.class
                                                                       fromJSONDictionary:responseObject
                                                                                    error:&error];
                                if (error == nil) {
                                    success(resource);
                                }
                                else {
                                    failure(task, error);
                                }
                            }
                          failure:failure];

}

+ (NSURLRequest *)getURLRequestForBackdropSize:(APIClientBackdropSize)backdropSize andImagePath:(NSString *)imagePath {
    return [NSURLRequest requestWithURL:[[DefaultAPIClient getBaseURLForBackdropSize:backdropSize] URLByAppendingPathComponent:imagePath]
                            cachePolicy:NSURLRequestReturnCacheDataElseLoad
                        timeoutInterval:60];
}


+ (NSURLRequest *)getURLRequestForLogoSize:(APIClientLogoSize)logoSize andImagePath:(NSString *)imagePath {
    return [NSURLRequest requestWithURL:[[DefaultAPIClient getBaseURLForLogoSize:logoSize] URLByAppendingPathComponent:imagePath]
                            cachePolicy:NSURLRequestReturnCacheDataElseLoad
                        timeoutInterval:60];
}


+ (NSURLRequest *)getURLRequestForPosterSize:(APIClientPosterSize)posterSize andImagePath:(NSString *)imagePath {
    return [NSURLRequest requestWithURL:[[DefaultAPIClient getBaseURLForPosterSize:posterSize] URLByAppendingPathComponent:imagePath]
                            cachePolicy:NSURLRequestReturnCacheDataElseLoad
                        timeoutInterval:60];
}


+ (NSURLRequest *)getURLRequestForProfileSize:(APIClientProfileSize)profileSize andImagePath:(NSString *)imagePath {
    return [NSURLRequest requestWithURL:[[DefaultAPIClient getBaseURLForProfileSize:profileSize] URLByAppendingPathComponent:imagePath]
                            cachePolicy:NSURLRequestReturnCacheDataElseLoad
                        timeoutInterval:60];
}


+ (NSURLRequest *)getURLRequestForStillSize:(APIClientStillSize)stillSize andImagePath:(NSString *)imagePath {
    return [NSURLRequest requestWithURL:[[DefaultAPIClient getBaseURLForStillSize:stillSize] URLByAppendingPathComponent:imagePath]
                            cachePolicy:NSURLRequestReturnCacheDataElseLoad
                        timeoutInterval:60];
}


+ (NSURL *)getBaseURLForBackdropSize:(APIClientBackdropSize)backdropSize {
    switch (backdropSize) {
        case APIClientBackdropSize300:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/w300"];
        case APIClientBackdropSize780:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/w780"];
        case APIClientBackdropSize1280:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/w1280"];
        case APIClientBackdropSizeOriginal:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/original"];
        default:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/original"];
    }
}

+ (NSURL *)getBaseURLForLogoSize:(APIClientLogoSize)logoSize {
    switch (logoSize) {
        case APIClientLogoSize45:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/w45"];
        case APIClientLogoSize92:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/w92"];
        case APIClientLogoSize154:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/w154"];
        case APIClientLogoSize185:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/w185"];
        case APIClientLogoSize300:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/w300"];
        case APIClientLogoSize500:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/w500"];
        case APIClientLogoSizeOriginal:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/original"];
        default:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/original"];
    }
}

+ (NSURL *)getBaseURLForPosterSize:(APIClientPosterSize)posterSize {
    switch (posterSize) {
        case APIClientPosterSize92:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/w92"];
        case APIClientPosterSize154:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/w154"];
        case APIClientPosterSize185:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/w185"];
        case APIClientPosterSize342:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/w342"];
        case APIClientPosterSize500:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/w500"];
        case APIClientPosterSize780:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/w780"];
        case APIClientPosterSizeOriginal:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/original"];
        default:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/original"];
    }
}

+ (NSURL *)getBaseURLForProfileSize:(APIClientProfileSize)profileSize {
    switch (profileSize) {
        case APIClientProfileSize45:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/w45"];
        case APIClientProfileSize185:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/w185"];
        case APIClientProfileSize632:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/w632"];
        case APIClientProfileSizeOriginal:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/original"];
        default:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/original"];
    }
}

+ (NSURL *)getBaseURLForStillSize:(APIClientStillSize)stillSize {
    switch (stillSize) {
        case APIClientStillSize92:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/w92"];
        case APIClientStillSize185:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/w185"];
        case APIClientStillSize300:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/w300"];
        case APIClientStillSizeOriginal:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/original"];
        default:
            return [[DefaultAPIClient baseImagesURL] URLByAppendingPathComponent:@"/original"];
    }
}

@end

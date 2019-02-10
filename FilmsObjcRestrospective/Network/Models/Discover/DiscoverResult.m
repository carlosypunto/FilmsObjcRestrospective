//
//  DiscoverResult.m
//  FilmsObjcRestrospective
//
//  Created by Carlos on 10/02/2019.
//  Copyright © 2019 Carlos García Nieto. All rights reserved.
//

#import "DiscoverResult.h"
#import <Mantle/NSValueTransformer+MTLPredefinedTransformerAdditions.h>

@implementation DiscoverResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    // model_property_name : json_field_name
    return @{
             @"voteCount": @"vote_count",
             @"id": @"id",
             @"video": @"video",
             @"voteAverage": @"vote_average",
             @"title": @"title",
             @"popularity": @"popularity",
             @"posterPath": @"poster_path",
             @"originalLanguage": @"original_language",
             @"originalTitle": @"original_title",
             @"genreIds": @"genre_ids",
             @"backdropPath": @"backdrop_path",
             @"adult": @"adult",
             @"overview": @"overview",
             @"releaseDate": @"release_date"
             };
}

//+ (NSValueTransformer *)genreIdsJSONTransformer {
//    return [MTLJSONAdapter arrayTransformerWithModelClass:[NSNumber class]];
//}

@end

//
//  DiscoverResult.h
//  FilmsObjcRestrospective
//
//  Created by Carlos on 10/02/2019.
//  Copyright © 2019 Carlos García Nieto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/MTLModel.h>
#import <Mantle/MTLJSONAdapter.h>

NS_ASSUME_NONNULL_BEGIN

@interface DiscoverResult : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSNumber *voteCount;
@property (nonatomic, copy, readonly) NSNumber *id;
@property (nonatomic, assign, readonly) BOOL video;
@property (nonatomic, copy, readonly) NSNumber *voteAverage;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSNumber *popularity;
@property (nonatomic, copy, readonly) NSString *posterPath;
@property (nonatomic, copy, readonly) NSString *originalLanguage;
@property (nonatomic, copy, readonly) NSString *originalTitle;
@property (nonatomic, copy) NSArray<NSNumber *> *genreIds;
@property (nonatomic, copy, readonly) NSString *backdropPath;
@property (nonatomic, assign, readonly) BOOL adult;
@property (nonatomic, copy, readonly) NSString *overview;
@property (nonatomic, copy, readonly) NSString *releaseDate;

@end

NS_ASSUME_NONNULL_END

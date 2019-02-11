//
//  DiscoverMovie.h
//  FilmsObjcRestrospective
//
//  Created by Carlos on 11/02/2019.
//  Copyright © 2019 Carlos García Nieto. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DisplayDiscoverMovie : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSURL *posterURL;
@property (nonatomic, copy, readonly) NSString *releaseDate;
@property (nonatomic, copy, readonly) NSNumber *voteAverage;
@property (nonatomic, copy, readonly) NSNumber *popularity;

@end

NS_ASSUME_NONNULL_END

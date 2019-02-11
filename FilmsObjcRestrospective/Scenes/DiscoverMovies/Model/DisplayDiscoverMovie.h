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
@property (nonatomic, copy, readonly) NSURLRequest *posterURLRequest;
@property (nonatomic, copy, readonly) NSString *releaseDate;
@property (nonatomic, copy, readonly) NSString *voteAverage;
@property (nonatomic, copy, readonly) NSString *popularity;

- (instancetype)initWithTitle:(NSString *)title
             posterURLRequest:(NSURLRequest *)posterURLRequest
                  releaseDate:(NSString *)releaseDate
                  voteAverage:(NSString *)voteAverage
                   popularity:(NSString *)popularity;

@end

NS_ASSUME_NONNULL_END

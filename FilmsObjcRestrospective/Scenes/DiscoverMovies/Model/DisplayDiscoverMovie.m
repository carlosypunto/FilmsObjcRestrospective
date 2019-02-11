//
//  DiscoverMovie.m
//  FilmsObjcRestrospective
//
//  Created by Carlos on 11/02/2019.
//  Copyright © 2019 Carlos García Nieto. All rights reserved.
//

#import "DisplayDiscoverMovie.h"

@interface DisplayDiscoverMovie ()

@property (nonatomic, copy, readwrite) NSString *title;
@property (nonatomic, copy, readwrite) NSURL *posterURL;
@property (nonatomic, copy, readwrite) NSString *releaseDate;
@property (nonatomic, copy, readwrite) NSNumber *voteAverage;
@property (nonatomic, copy, readwrite) NSNumber *popularity;

@end

@implementation DisplayDiscoverMovie

- (instancetype)initWithTitle:(NSString *)title
                    posterURL:(NSURL *)posterURL
                  releaseDate:(NSString *)releaseDate
                  voteAverage:(NSNumber *)voteAverage
                   popularity:(NSNumber *)popularity {
    
    self.title = title;
    self.posterURL = posterURL;
    self.releaseDate = releaseDate;
    self.voteAverage = voteAverage;
    self.popularity = popularity;
    
    return self;
}

@end

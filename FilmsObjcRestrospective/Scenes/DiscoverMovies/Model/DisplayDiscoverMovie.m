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
@property (nonatomic, copy, readwrite) NSURLRequest *posterURLRequest;
@property (nonatomic, copy, readwrite) NSString *releaseDate;
@property (nonatomic, copy, readwrite) NSString *voteAverage;
@property (nonatomic, copy, readwrite) NSString *popularity;

@end

@implementation DisplayDiscoverMovie

- (instancetype)initWithTitle:(NSString *)title
             posterURLRequest:(NSURLRequest *)posterURLRequest
                  releaseDate:(NSString *)releaseDate
                  voteAverage:(NSString *)voteAverage
                   popularity:(NSString *)popularity {
    
    self.title = title;
    self.posterURLRequest = posterURLRequest;
    self.releaseDate = releaseDate;
    self.voteAverage = voteAverage;
    self.popularity = popularity;
    
    return self;
}

@end

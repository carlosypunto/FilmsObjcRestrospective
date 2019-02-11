//
//  DiscoverMoviesPresenter.m
//  FilmsObjcRestrospective
//
//  Created by Carlos on 10/02/2019.
//  Copyright © 2019 Carlos García Nieto. All rights reserved.
//
 
#import "DiscoverMoviesPresenter.h"
#import "NSArray+map.h"
#import "DiscoverResult.h"
#import "DisplayDiscoverMovie.h"

@implementation DiscoverMoviesPresenter


#pragma mark - DiscoverMoviesEventHandlerProtocol

- (void)retrieveData {
    [self.provider makeRequest];
}



#pragma mark - DiscoverMoviesInteractorOutputProtocol

- (void)updateMovies:(NSArray *)movies {
    __weak typeof(self) welf = self;
    NSArray *displayMovies = [movies mapObjectsUsingBlock:^id _Nonnull(id  _Nonnull obj, NSUInteger idx) {
        DiscoverResult *discoverResult = (DiscoverResult *)obj;
        NSURLRequest *posterRequest = [welf.provider getURLRequestForPosterWithPath:discoverResult.posterPath];
        
        return [[DisplayDiscoverMovie alloc] initWithTitle:discoverResult.title
                                          posterURLRequest:posterRequest
                                               releaseDate:discoverResult.releaseDate
                                               voteAverage:[NSString stringWithFormat:@"%@", discoverResult.voteAverage]
                                                popularity:[NSString stringWithFormat:@"%@", discoverResult.popularity]];
    }];
    [self.view displayDiscoverMovies:displayMovies];
}



#pragma mark - Constructor helper for DiscoverMoviesWireframe

- (instancetype)initWithView:(id<DiscoverMoviesViewProtocol>)view
                  interactor:(id<DiscoverMoviesInteractorInputProtocol>)interactor
                      router:(id<DiscoverMoviesRouterProtocol>)router {
    if (self = [super init]) {
        self.view = view;
        self.provider = interactor;
        self.router = router;
        [self.provider setOutput:self];
    }
    return self;
}

@end

//
//  DiscoverMoviesInteractor.m
//  FilmsObjcRestrospective
//
//  Created by Carlos on 10/02/2019.
//  Copyright © 2019 Carlos García Nieto. All rights reserved.
//
 
#import "DiscoverMoviesInteractor.h"
#import "APIClient.h"
#import "DefaultAPIClient.h"

@interface DiscoverMoviesInteractor ()

@property (nonatomic, assign) int currentPage;
@property (nonatomic, assign) int totalPages;
@property (nonatomic, assign, getter=isSearching) BOOL searching;
@property (nonatomic, strong) NSArray *movies;
@property (nonatomic, strong, nullable) id <APIClient> apiClient;

@end

@implementation DiscoverMoviesInteractor

- (instancetype)init {
    self = [super init];
    if (self) {
        self.apiClient = [[DefaultAPIClient alloc] init];
        self.movies = @[];
        self.searching = NO;
        self.currentPage = 1;
    }
    return self;
}


#pragma mark - InteractorProtocol

- (void)makeRequest {
    [self setSearching: YES];
    
    [self.apiClient getDiscoverMoviePage:_currentPage
                                 success:^(DiscoverResponse *response) {
                                     [self setTotalPages:[response.totalPages intValue]];
                                     
                                     NSArray *newMovies = [self.movies arrayByAddingObjectsFromArray:[response results]];
                                     self.movies = newMovies;
                                     
                                     [self.output updateMovies:self.movies];
                                     [self setSearching: NO];
                                     self.currentPage++;
                                 }
                                 failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                     NSLog(@"%@", error);
                                 }];
}



#pragma mark - Required for presenter @property
- (void)setOutput:(id<DiscoverMoviesInteractorOutputProtocol>)output { _output = output; }
- (id<DiscoverMoviesInteractorOutputProtocol>)getOutput { return self.output; }

@end

//
//  DiscoverMovies_Protocols.h
//  FilmsObjcRestrospective
//
//  Created by Carlos on 10/02/2019.
//  Copyright © 2019 Carlos García Nieto. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - PresenterProtocol

@protocol DiscoverMoviesEventHandlerProtocol <NSObject>
/** View -> Presenter */
- (void)retrieveData;
@end

@protocol DiscoverMoviesInteractorOutputProtocol <NSObject>
/** Interactor -> Presenter */
- (void)updateMovies:(NSArray *)movies;
@end

#pragma mark - InteractorProtocol

@protocol DiscoverMoviesInteractorInputProtocol <NSObject>
/** Required for presenter @property */
- (void)setOutput:(id<DiscoverMoviesInteractorOutputProtocol>)output;
- (id<DiscoverMoviesInteractorOutputProtocol>)getOutput;

/** Presenter -> Interactor */
- (void)makeRequest;
- (NSURLRequest *)getURLRequestForPosterWithPath:(NSString *)path;

@end

#pragma mark - ViewProtocol

@protocol DiscoverMoviesViewProtocol <NSObject>
/** Presenter -> ViewController */
- (void)displayDiscoverMovies:(NSArray *)movies;
@end

#pragma mark - WireFrameProtocol

@protocol DiscoverMoviesRouterProtocol <NSObject>
@end

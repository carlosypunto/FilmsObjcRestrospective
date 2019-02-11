//
//  DiscoverMoviesPresenter.h
//  FilmsObjcRestrospective
//
//  Created by Carlos on 10/02/2019.
//  Copyright © 2019 Carlos García Nieto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiscoverMovies_Protocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface DiscoverMoviesPresenter : NSObject<DiscoverMoviesInteractorOutputProtocol, DiscoverMoviesEventHandlerProtocol>

@property (nonatomic, weak, nullable) id<DiscoverMoviesViewProtocol> view;
@property (nonatomic) id<DiscoverMoviesInteractorInputProtocol> provider;
@property (nonatomic) id<DiscoverMoviesRouterProtocol> router;

- (instancetype)initWithView:(id<DiscoverMoviesViewProtocol>)view
                  interactor:(id<DiscoverMoviesInteractorInputProtocol>)interactor
                      router:(id<DiscoverMoviesRouterProtocol>)router;

@end

NS_ASSUME_NONNULL_END

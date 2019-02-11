//
//  DiscoverMoviesViewController.h
//  FilmsObjcRestrospective
//
//  Created by Carlos on 10/02/2019.
//  Copyright © 2019 Carlos García Nieto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DiscoverMovies_Protocols.h"
#import "DiscoverMoviesPresenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface DiscoverMoviesViewController : UICollectionViewController<DiscoverMoviesViewProtocol>

@property (nonatomic) id<DiscoverMoviesEventHandlerProtocol>eventHandler;

@end

NS_ASSUME_NONNULL_END

//
//  DiscoverMoviesInteractor.h
//  FilmsObjcRestrospective
//
//  Created by Carlos on 10/02/2019.
//  Copyright © 2019 Carlos García Nieto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DiscoverMovies_Protocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface DiscoverMoviesInteractor : NSObject<DiscoverMoviesInteractorInputProtocol>

@property (nonatomic, weak, nullable) id<DiscoverMoviesInteractorOutputProtocol> output;

@end

NS_ASSUME_NONNULL_END

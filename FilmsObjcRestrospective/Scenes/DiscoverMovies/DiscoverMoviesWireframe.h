//
//  DiscoverMoviesWireframe.h
//  FilmsObjcRestrospective
//
//  Created by Carlos on 10/02/2019.
//  Copyright © 2019 Carlos García Nieto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DiscoverMovies_Protocols.h"
#import "DiscoverMoviesViewController.h"

@interface DiscoverMoviesWireframe : NSObject<DiscoverMoviesRouterProtocol>

@property (nonatomic, weak) DiscoverMoviesViewController *viewController;

+ (UIViewController *)createModule;
+ (void)configureModuleWithDiscoverMoviesViewController:(DiscoverMoviesViewController *)viewController;

@end

//
//  DiscoverMoviesWireframe.m
//  FilmsObjcRestrospective
//
//  Created by Carlos on 10/02/2019.
//  Copyright © 2019 Carlos García Nieto. All rights reserved.
//
 
#import "DiscoverMoviesWireframe.h"
#import "DiscoverMoviesViewController.h"
#import "DiscoverMoviesInteractor.h"
#import "DiscoverMoviesPresenter.h"



static NSString* const kStoryboardIdentifier = @"DiscoverMoviesViewController";

@implementation DiscoverMoviesWireframe

+ (DiscoverMoviesViewController *)createModule {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DiscoverMoviesViewController *viewController = (DiscoverMoviesViewController *) [storyboard instantiateViewControllerWithIdentifier:kStoryboardIdentifier];
    DiscoverMoviesInteractor *interactor = [[DiscoverMoviesInteractor alloc] init];
    DiscoverMoviesWireframe *router = [[DiscoverMoviesWireframe alloc] init];
    DiscoverMoviesPresenter *presenter = [[DiscoverMoviesPresenter alloc] initWithView:viewController
                                                                            interactor:interactor router:router];
    viewController.eventHandler = presenter;
    router.viewController = viewController;
    return viewController;
}

+ (void)configureModuleWithDiscoverMoviesViewController:(DiscoverMoviesViewController *)viewController {
    DiscoverMoviesInteractor *interactor = [[DiscoverMoviesInteractor alloc] init];
    DiscoverMoviesWireframe *router = [[DiscoverMoviesWireframe alloc] init];
    DiscoverMoviesPresenter *presenter = [[DiscoverMoviesPresenter alloc] initWithView:viewController
                                                                            interactor:interactor router:router];
    viewController.eventHandler = presenter;
    router.viewController = viewController;
}
 
@end

//
//  DiscoverMoviesPresenter.m
//  FilmsObjcRestrospective
//
//  Created by Carlos on 10/02/2019.
//  Copyright © 2019 Carlos García Nieto. All rights reserved.
//
 
#import "DiscoverMoviesPresenter.h"

@implementation DiscoverMoviesPresenter


#pragma mark - DiscoverMoviesEventHandlerProtocol

- (void)viewDidLoad {
    //
}



#pragma mark - DiscoverMoviesInteractorOutputProtocol





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

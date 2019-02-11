//
//  DiscoverMoviesInteractor.m
//  FilmsObjcRestrospective
//
//  Created by Carlos on 10/02/2019.
//  Copyright © 2019 Carlos García Nieto. All rights reserved.
//
 
#import "DiscoverMoviesInteractor.h"

@implementation DiscoverMoviesInteractor

#pragma mark - InteractorProtocol

- (void)makeRequest {
    
}



#pragma mark - Required for presenter @property
- (void)setOutput:(id<DiscoverMoviesInteractorOutputProtocol>)output { _output = output; }
- (id<DiscoverMoviesInteractorOutputProtocol>)getOutput { return self.output; }

@end

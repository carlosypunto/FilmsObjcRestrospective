//
//  DiscoverResponse.h
//  FilmsObjcRestrospective
//
//  Created by Carlos on 10/02/2019.
//  Copyright © 2019 Carlos García Nieto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/MTLModel.h>
#import <Mantle/MTLJSONAdapter.h>
#import "DiscoverResult.h"

NS_ASSUME_NONNULL_BEGIN

@interface DiscoverResponse : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSNumber *page;
@property (nonatomic, copy, readonly) NSNumber *totalResults;
@property (nonatomic, copy, readonly) NSNumber *totalPages;
@property (nonatomic, copy) NSArray<DiscoverResult *> *results;

@end

NS_ASSUME_NONNULL_END

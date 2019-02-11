//
//  NSArray+map.h
//  FilmsObjcRestrospective
//
//  Created by Carlos on 11/02/2019.
//  Copyright © 2019 Carlos García Nieto. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Map)

- (NSArray *)mapObjectsUsingBlock:(id (^)(id obj, NSUInteger idx))block;

@end

NS_ASSUME_NONNULL_END

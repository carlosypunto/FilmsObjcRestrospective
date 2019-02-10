//
//  DiscoverResponse.m
//  FilmsObjcRestrospective
//
//  Created by Carlos on 10/02/2019.
//  Copyright © 2019 Carlos García Nieto. All rights reserved.
//

#import "DiscoverResponse.h"
#import <Mantle/NSValueTransformer+MTLPredefinedTransformerAdditions.h>

@implementation DiscoverResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    // model_property_name : json_field_name
    return @{
             @"page": @"page",
             @"totalResults": @"total_results",
             @"totalPages": @"total_pages",
             @"results": @"results"
        };
}

//+ (NSValueTransformer *)appURLSchemeJSONTransformer {
//    // use Mantle's built-in "value transformer" to convert strings to NSURL and vice-versa
//    // you can write your own transformers
//    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
//}

+ (NSValueTransformer *)resultsJSONTransformer {
    // tell Mantle to populate appActions property with an array of ChoosyAppAction objects
    return [MTLJSONAdapter arrayTransformerWithModelClass:[DiscoverResult class]];
}

+ (DiscoverResponse *)deserializeDiscoverResponseFromJSON:(NSDictionary *)discoverResponseJSON {
    NSError *error;
    DiscoverResponse *discoverResponse = [MTLJSONAdapter modelOfClass:[DiscoverResponse class]
                                                   fromJSONDictionary:discoverResponseJSON
                                                                error:&error];
    
    if (error) {
        NSLog(@"Couldn't convert discover response JSON to DiscoverResponse model: %@", error);
        return nil;
    }
    
    return discoverResponse;
}

+ (DiscoverResponse *)deserializeDiscoverResponseFromNSData:(NSData *)discoverResponseData {
    NSError *error;
    NSDictionary *discoverResponseJSON = [NSJSONSerialization JSONObjectWithData:discoverResponseData
                                                                         options:0
                                                                           error:&error];
    
    if (error) {
        NSLog(@"Couldn't convert deserealize discover response data into JSON from NSData: %@", error);
        return nil;
    }
    
    return [DiscoverResponse deserializeDiscoverResponseFromJSON:discoverResponseJSON];
}

// Use iOS framework to convert JSON to NSData
+ (NSData *)serializeDiscoverResponseToNSData:(DiscoverResponse *)discoverResponse {
    
    NSError *error;
    NSDictionary *discoverResponseJSON = [MTLJSONAdapter JSONDictionaryFromModel:discoverResponse
                                                                           error:&error];
    
    if (error) {
        NSLog(@"Couldn't turn discover response into NSDictionary. DiscoverResponse: %@, \n\n Error: %@", discoverResponse, error);
        return nil;
    }
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:discoverResponseJSON
                                                       options:0
                                                         error:&error];
    
    if (error) {
        NSLog(@"Couldn't turn discover response JSON into NSData. JSON: %@, \n\n Error: %@", discoverResponseJSON, error);
        return nil;
    }
    
    return jsonData;
}

@end

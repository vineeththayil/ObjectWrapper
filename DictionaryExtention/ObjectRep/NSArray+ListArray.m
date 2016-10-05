//
//  NSArray+ListArray.m
//  HOTT
//
//  Created by Vineeth on 1/7/15.
//  Copyright (c) 2015 Accedo TV. All rights reserved.
//

#import "NSArray+ListArray.h"
#import "NSObject+KeyList.h"
#import "NSDictionary+ObjectRepresentation.h"

@implementation NSArray (ListArray)


-(NSMutableArray*)arrayList {
    
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    for (id obj in self) {
        
        if ([obj  isKindOfClass:[NSNumber class]]) {
            [dataArray addObject:obj];
        }else if ([obj  isKindOfClass:[NSString class]]) {
            [dataArray addObject:obj];
        }else if ([obj  isKindOfClass:[NSArray class]]) {
            [dataArray addObject:[obj arrayList]];
        }else {
            [dataArray addObject:[obj dictionary]];
        }

    }
    return dataArray;
}




-(id)objectRepresentationForClass:(NSString*)className customKeys:(NSDictionary*)keyDetails{
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    for (id obj in self) {
        
        if ([obj  isKindOfClass:[NSNumber class]]) {
            [dataArray addObject:obj];
        }else if ([obj  isKindOfClass:[NSString class]]) {
            [dataArray addObject:obj];
        }else if ([obj  isKindOfClass:[NSArray class]]) {
            [dataArray addObject:obj];
        }else if ([obj  isKindOfClass:[NSDictionary class]]) {
            [dataArray addObject:[obj objectRepresentationForClass:className customKeys:keyDetails]];
        }
        
    }
    return dataArray;
}




@end

//
//  NSDictionary+ObjectRepresentation.m
//  HOTT
//
//  Created by Vineeth on 1/7/15.
//  Copyright (c) 2015 Accedo TV. All rights reserved.
//

#import "NSDictionary+ObjectRepresentation.h"
#import "NSObject+KeyList.h"
#import "NSArray+ListArray.h"

@implementation NSDictionary (ObjectRepresentation)


-(NSString*)findResponseKeyFrom:(NSDictionary*)customKeys forKey:(NSString*)key {
  

    
    id responseData = [customKeys valueForKey:key];
    
    if ([responseData isKindOfClass:[NSString class]]) {
        return responseData;
    }else{
        return [responseData valueForKey:kResponseKey];
    }
}

-(NSString*)findResponseModelClassNameFrom:(NSDictionary*)customKeys forKey:(NSString*)key {
    
    
    id responseData = [customKeys valueForKey:key];
    
    if ([responseData isKindOfClass:[NSString class]]) {
        return nil;
    }else{
        return [responseData valueForKey:kModelClassName];
    }
}

-(id)objectRepresentationForClass:(NSString*)className customKeys:(NSDictionary*)keyDetails{
  
    
    Class theClass = NSClassFromString(className);
    NSObject *myObject = [[theClass alloc] init];
    
    
    for (NSString *key in [myObject getAllKeyNames]) {
        
        
        NSString *responseKey   = [self findResponseKeyFrom:keyDetails forKey:key];
        NSString *responseModel = [self findResponseModelClassNameFrom:keyDetails forKey:key];

        if (responseKey) {
            if (![self valueForKey:responseKey]) {
                continue;
            }
        }else{
            responseKey = key;
        }
        
        
        if (![self valueForKey:responseKey]) {
            continue;
        }
        
        if ([[self valueForKey:responseKey]  isKindOfClass:[NSNumber class]]) {
            [myObject setValue:[self valueForKey:responseKey] forKey:key];
            
        }else if ([[self valueForKey:responseKey]  isKindOfClass:[NSString class]]) {
            [myObject setValue:[self valueForKey:responseKey] forKey:key];
            
        }else if ([[self valueForKey:responseKey]  isKindOfClass:[NSArray class]] || [[self valueForKey:responseKey]  isKindOfClass:[NSDictionary class]]) {
            
            if (NSClassFromString(responseModel)) {
                [myObject setValue:[[self valueForKey:responseKey] objectRepresentationForClass:responseModel
                                                                                     customKeys:keyDetails]
                            forKey:key];
            } else if (NSClassFromString(responseKey)) {
                [myObject setValue:[[self valueForKey:responseKey] objectRepresentationForClass:responseKey
                                                                                     customKeys:keyDetails]
                            forKey:key];
            }else if(NSClassFromString([responseKey capitalizedString])) {
                [myObject setValue:[[self valueForKey:responseKey] objectRepresentationForClass:[responseKey capitalizedString]
                                                                                     customKeys:keyDetails]
                            forKey:key];
            }else{
                
                [myObject setValue:[self valueForKey:responseKey]  forKey:key];
            }
            
        }
        
    }
    
    return myObject;
}



@end

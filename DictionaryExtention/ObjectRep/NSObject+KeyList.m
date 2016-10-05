//
//  NSObject+KeyList.m
//  HOTT
//
//  Created by Vineeth on 1/7/15.
//  Copyright (c) 2015 Accedo TV. All rights reserved.
//

#import "NSObject+KeyList.h"
#import "NSArray+ListArray.h"
//#import <objc/objc-runtime.h>
#import <objc/runtime.h>
#include <inttypes.h>

@implementation NSObject (KeyList)


-(NSMutableArray*)getAllKeyNames {
    
    NSMutableArray *keyNames = [[NSMutableArray alloc] init];
    unsigned int count;
    Ivar* ivars = class_copyIvarList([self class], &count);
    for(unsigned int i = 0; i < count; ++i)
    {
        const char *keyName = ivar_getName(ivars[i]);
        NSString *keyNameString = [NSString stringWithFormat:@"%s",keyName];
        keyNameString = [keyNameString stringByReplacingOccurrencesOfString:@"_" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, 1)];
       

		
        [keyNames addObject:keyNameString];
    }
    
    
    return keyNames;
}

-(NSMutableDictionary*)dictionary {
    
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc ] init];
    NSMutableArray *mappingkeys   =  [self getAllKeyNames];

    for (NSString *key in mappingkeys) {
        
        if (![self valueForKey:key]) {
            continue;
        }
        
        if ([[self valueForKey:key]  isKindOfClass:[NSNumber class]]) {
            [dataDict setObject:[self valueForKey:key] forKey:key];

        }else if ([[self valueForKey:key]  isKindOfClass:[NSString class]]) {
            [dataDict setObject:[self valueForKey:key] forKey:key];
            
        }else if ([[self valueForKey:key]  isKindOfClass:[NSArray class]]) {
            
            NSArray *detailsArray = [self valueForKey:key];
            
            [dataDict setObject:[detailsArray arrayList] forKey:key];
            
        }else if ([[self valueForKey:key]  isKindOfClass:[NSObject class]]) {
            
            NSObject *dict = [self valueForKey:key] ;
            [dataDict setObject:[dict dictionary] forKey:key];
            
        }
        
        
        else {
            [dataDict setObject:[self valueForKey:key]  forKey:key];
        }
    }
    return dataDict;
}






@end

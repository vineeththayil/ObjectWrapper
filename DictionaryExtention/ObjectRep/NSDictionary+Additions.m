//
//  NSDictionary+Additions.m
//  
//
//  Created by vineeth.thayyil on 10/03/16.
//
//

#import "NSDictionary+Additions.h"

@implementation NSDictionary (Additions)


-(void) setObject:(id) object safetlyForKey:(NSString*)key {
    
    if (object && key) {
        [self setValue:object forKey:key];
    }
}


@end

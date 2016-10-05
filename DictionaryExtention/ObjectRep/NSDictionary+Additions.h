//
//  NSDictionary+Additions.h
//  
//
//  Created by vineeth.thayyil on 10/03/16.
//
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Additions)

-(void) setObject:(id) object safetlyForKey:(NSString*)key;

@end

//
//  NSArray+ListArray.h
//  HOTT
//
//  Created by Vineeth on 1/7/15.
//  Copyright (c) 2015 Accedo TV. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  For converting array of dictionaries to array of corresponding classes and vice versa
 */
@interface NSArray (ListArray)


-(id)objectRepresentationForClass:(NSString*)className customKeys:(NSDictionary*)keyDetails ;


-(NSMutableArray*)arrayList;

@end

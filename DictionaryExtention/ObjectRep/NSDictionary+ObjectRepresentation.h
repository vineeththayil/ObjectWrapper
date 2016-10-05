//
//  NSDictionary+ObjectRepresentation.h
//  HOTT
//
//  Created by Vineeth on 1/7/15.
//  Copyright (c) 2015 Accedo TV. All rights reserved.
//

#import <Foundation/Foundation.h>


static NSString *const kResponseKey = @"responseKey";
static NSString *const kModelClassName = @"modelClassName";

@interface NSDictionary (ObjectRepresentation)

/**
 *  For converting a dictionary to corresponding dictionary model object class
 */


-(id)objectRepresentationForClass:(NSString*)className customKeys:(NSDictionary*)keyDetails;

@end

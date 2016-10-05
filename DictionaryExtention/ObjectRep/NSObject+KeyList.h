//
//  NSObject+KeyList.h
//  HOTT
//
//  Created by Vineeth on 1/7/15.
//  Copyright (c) 2015 Accedo TV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KeyList)


/**
 *  For converting a model object class to corresponding dictionary
 */

-(NSMutableDictionary*)dictionary ;


-(NSMutableArray*)getAllKeyNames;

@end

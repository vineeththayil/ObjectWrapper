//
//  User.h
//  DictionaryExtention
//
//  Created by vineeth.thayyil on 30/09/16.
//  Copyright © 2016 vineeth.thayyil. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Address.h"

@interface User : NSObject

@property (nonatomic,strong) NSString *userID;

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *age;
@property (nonatomic,strong) Address *address;
@property (nonatomic,strong) NSString *genre;
@property (nonatomic,strong) NSMutableArray *siblings;
@property (nonatomic,strong) NSMutableArray *siblingDetails;

@end

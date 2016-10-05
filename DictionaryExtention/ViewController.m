//
//  ViewController.m
//  DictionaryExtention
//
//  Created by vineeth.thayyil on 30/09/16.
//  Copyright © 2016 vineeth.thayyil. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
#import "NSDictionary+ObjectRepresentation.h"
#import "NSObject+KeyList.h"

@interface ViewController ()


@property (nonatomic,strong) NSMutableDictionary *dict;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createDictionary];
    
    NSMutableDictionary *optionsDict = [[NSMutableDictionary alloc] init];
    [optionsDict setObject:@"id" forKey:@"userID"];
    
    NSMutableDictionary *queryoptionsDict = [[NSMutableDictionary alloc] init];
    [queryoptionsDict setObject:@"addressDetails" forKey:kResponseKey];
    [queryoptionsDict setObject:@"Address" forKey:kModelClassName];
    [optionsDict setObject:queryoptionsDict forKey:@"address"];

    
    queryoptionsDict = [[NSMutableDictionary alloc] init];
    [queryoptionsDict setObject:@"siblingDetails" forKey:kResponseKey];
    [queryoptionsDict setObject:@"User" forKey:kModelClassName];
    [optionsDict setObject:queryoptionsDict forKey:@"siblings"];
    
    User *user = [_dict objectRepresentationForClass:NSStringFromClass([User class]) customKeys:nil];
    
    NSLog(@"%@",user.name);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void) createDictionary {
    
    _dict = [[NSMutableDictionary alloc] init];
    
    [_dict setObject:@"1234"    forKey:@"id"];
    [_dict setObject:@"vineeth" forKey:@"name"];
    [_dict setObject:@"29"      forKey:@"age"];
    [_dict setObject:@"Male"    forKey:@"genre"];
    
    
    NSMutableDictionary *address = [[NSMutableDictionary alloc] init];
    [address setObject:@"Thayyil"   forKey:@"houseName"];
    [address setObject:@"Alappuzha" forKey:@"Place"];

    [_dict setObject:address forKey:@"addressDetails"];
    
    NSMutableDictionary *sibling1 = [[NSMutableDictionary alloc] init];
    [sibling1 setObject:@"vibhath"   forKey:@"name"];
    [sibling1 setObject:@"27" forKey:@"age"];
    
    NSMutableDictionary *sibling2 = [[NSMutableDictionary alloc] init];
    [sibling2 setObject:@"visanth"   forKey:@"name"];
    [sibling2 setObject:@"31" forKey:@"age"];

    NSArray *siblingArray = [NSArray arrayWithObjects:sibling1,sibling2, nil];
    [_dict setObject:siblingArray forKey:@"siblingDetails"];
}

@end

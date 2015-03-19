//
//  LibraryAPI.m
//  BlueLibrary
//
//  Created by Eduardo Alvarado Díaz on 3/19/15.
//  Copyright (c) 2015 Company. All rights reserved.
//

#import "LibraryAPI.h"

@implementation LibraryAPI

+(LibraryAPI*)sharedInstance{

// 1 - static variable to hold the instance of your class
    static LibraryAPI *_sharedInstance = nil;

// 2 - static variable which ensures that the initialization code executes only once
    static dispatch_once_t oncePredicate;

// 3 - use GCD to execute a block wich initializes an instance of LibraryAPI
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[LibraryAPI alloc] init];
    });
    return _sharedInstance;
}

@end

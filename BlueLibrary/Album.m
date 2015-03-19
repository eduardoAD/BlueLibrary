//
//  Album.m
//  BlueLibrary
//
//  Created by Eduardo Alvarado Díaz on 3/18/15.
//  Copyright (c) 2015 Company. All rights reserved.
//

#import "Album.h"

@implementation Album

-(id)initWithTitle:(NSString *)title artist:(NSString *)artist coverUrl:(NSString *)coverUrl year:(NSString *)year{
    self = [super init];
    if (self){
        _tittle = title;
        _artist = artist;
        _coverUrl = coverUrl;
        _year = year;
        _genre = @"Pop";
    }
    return self;
}

@end

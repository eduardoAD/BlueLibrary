//
//  Album.h
//  BlueLibrary
//
//  Created by Eduardo Alvarado Díaz on 3/18/15.
//  Copyright (c) 2015 Company. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject

@property (nonatomic, copy, readonly) NSString *tittle, *artist, *genre, *coverUrl, *year;

-(id)initWithTitle:(NSString*)title artist:(NSString*)artist coverUrl:(NSString*)coverUrl year:(NSString*)year;

@end

//
//  LibraryAPI.h
//  BlueLibrary
//
//  Created by Eduardo Alvarado Díaz on 3/19/15.
//  Copyright (c) 2015 Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"

@interface LibraryAPI : NSObject

+ (LibraryAPI*)sharedInstance;
- (NSArray*)getAlbums;
- (void)addAlbum:(Album*)album atIndex:(int)index;
- (void)deleteAlbumAtIndex:(int)index;

@end

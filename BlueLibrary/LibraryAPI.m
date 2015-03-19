//
//  LibraryAPI.m
//  BlueLibrary
//
//  Created by Eduardo Alvarado Díaz on 3/19/15.
//  Copyright (c) 2015 Company. All rights reserved.
//

#import "LibraryAPI.h"
#import "PersistencyManager.h"
#import "HTTPClient.h"

@interface LibraryAPI (){
    PersistencyManager *persistencyManager;
    HTTPClient *httpClient;
    BOOL isOnline;
}

@end

@implementation LibraryAPI

- (id)init{
    self = [super init];
    if (self) {
        persistencyManager = [[PersistencyManager alloc]init];
        httpClient = [[HTTPClient alloc]init];
        isOnline = NO;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(downloadImage:)
                                                     name:@"BLDownloadImageNotification"
                                                   object:nil];
    }
    return self;
}

+ (LibraryAPI*)sharedInstance{

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

- (NSArray*)getAlbums{
    return [persistencyManager getAlbums];
}

- (void)addAlbum:(Album *)album atIndex:(int)index{
    [persistencyManager addAlbum:album atIndex:index];
    if (isOnline) {
        [httpClient postRequest:@"/api/addAlbum" body:[album description]];
    }
}

- (void)deleteAlbumAtIndex:(int)index{
    [persistencyManager deleteAlbumAtIndex:index];
    if (isOnline) {
        [httpClient postRequest:@"/api/deleteAlbum" body:[@(index) description]];
    }
}

- (void)downloadImage:(NSNotification*)notification{
    UIImageView *imageView = notification.userInfo[@"imageView"];
    NSString *coverUrl = notification.userInfo[@"coverUrl"];

    imageView.image = [persistencyManager getImage:[coverUrl lastPathComponent]];

    if (imageView.image == nil) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            UIImage *image = [httpClient downloadImage:coverUrl];

            dispatch_sync(dispatch_get_main_queue(), ^{
                imageView.image = image;
                [persistencyManager saveImage:image filename:[coverUrl lastPathComponent]];
            });
        });
    }
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

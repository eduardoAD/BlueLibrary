//
//  Album+TableRepresentation.h
//  BlueLibrary
//
//  Created by Eduardo Alvarado Díaz on 3/19/15.
//  Copyright (c) 2015 Company. All rights reserved.
//

#import "Album.h"

@interface Album (TableRepresentation)

- (NSDictionary*)tr_tableRepresentation;

@end

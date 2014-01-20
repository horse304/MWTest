//
//  LinkedListItem.h
//  MW3c
//
//  Created by Dato on 1/20/14.
//  Copyright (c) 2014 Dato. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LinkedListItem : NSObject

- (id)initWithValue:(int)value;

@property (nonatomic) int value;
@property (nonatomic, weak) LinkedListItem * nextItem;

@end

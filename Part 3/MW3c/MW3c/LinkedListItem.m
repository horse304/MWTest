//
//  LinkedListItem.m
//  MW3c
//
//  Created by Dato on 1/20/14.
//  Copyright (c) 2014 Dato. All rights reserved.
//

#import "LinkedListItem.h"

@implementation LinkedListItem

- (id)initWithValue:(int)value{
    if (self = [super init]) {
        self.value = value;
    }
    
    return self;
}

@end

//
//  Data.m
//  ReloadData
//
//  Created by ethanjin on 2017/6/19.
//  Copyright © 2017年 ly. All rights reserved.
//

#import "Data.h"

@implementation Data

+ (instancetype)dataWithStrings:(NSArray *)strings
{
    Data *data = [[Data alloc] init];
    data.strings = [strings mutableCopy];
    return data;
}

#pragma mark - IGListDiffable

- (id<NSObject>)diffIdentifier {
    return self;
}

- (BOOL)isEqualToDiffableObject:(id)object {
    if (![object isKindOfClass:[self class]]) {
        return NO;
    }
    
    Data *otherData = (Data *)object;
    return [self.strings isEqualToArray:otherData.strings];
}

@end

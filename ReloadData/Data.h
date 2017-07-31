//
//  Data.h
//  ReloadData
//
//  Created by ethanjin on 2017/6/19.
//  Copyright © 2017年 ly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListKit/IGListDiffable.h>

@interface Data : NSObject <IGListDiffable>

@property (nonatomic, strong) NSMutableArray<NSString *> *strings;

+ (instancetype)dataWithStrings:(NSArray *)strings;

@end

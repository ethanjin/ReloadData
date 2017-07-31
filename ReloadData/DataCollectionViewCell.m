//
//  DataCollectionViewCell.m
//  ReloadData
//
//  Created by ethanjin on 2017/6/19.
//  Copyright © 2017年 ly. All rights reserved.
//

#import "DataCollectionViewCell.h"

@implementation DataCollectionViewCell

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.title.text = nil;
}

- (void)bindViewModel:(id)viewModel
{
    if ([viewModel isKindOfClass:[NSString class]]) {
        self.title.text = (NSString *)viewModel;
    }
}

@end

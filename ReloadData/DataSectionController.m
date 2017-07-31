//
//  DataSectionController.m
//  ReloadData
//
//  Created by ethanjin on 2017/6/19.
//  Copyright © 2017年 ly. All rights reserved.
//

#import "DataSectionController.h"
#import "DataCollectionViewCell.h"
#import "Data.h"

@interface DataSectionController () <
IGListBindingSectionControllerDataSource,
IGListBindingSectionControllerSelectionDelegate
>

@end

@implementation DataSectionController

- (instancetype)init
{
    if (self = [super init]) {
        self.dataSource = self;
        self.selectionDelegate = self;
    }
    return self;
}

#pragma mark - IGListBindingSectionController Overrides

- (NSInteger)numberOfItems
{
    return [super numberOfItems];
}

- (NSArray<id<IGListDiffable>> *)sectionController:(IGListBindingSectionController *)sectionController viewModelsForObject:(id)object
{
    return [(Data *)self.object strings];
}

- (CGSize)sectionController:(IGListBindingSectionController *)sectionController sizeForViewModel:(id)viewModel atIndex:(NSInteger)index
{
    CGFloat width = self.collectionContext.containerSize.width / 3;
    return CGSizeMake(width, 120);
}

- (UICollectionViewCell<IGListBindable> *)sectionController:(IGListBindingSectionController *)sectionController cellForViewModel:(id)viewModel atIndex:(NSInteger)index
{
    DataCollectionViewCell *cell = [self.collectionContext dequeueReusableCellFromStoryboardWithIdentifier:@"Cell" forSectionController:self atIndex:index];
    return cell;
}

- (void)sectionController:(IGListBindingSectionController *)sectionController
     didSelectItemAtIndex:(NSInteger)index
                viewModel:(id)viewModel
{
    
}

@end

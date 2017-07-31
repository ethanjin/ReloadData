//
//  ViewController.m
//  ReloadData
//
//  Created by ly on 11/23/15.
//  Copyright © 2015 ly. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
{
    NSMutableArray *_firstSectionDatas;
    NSMutableArray *_secondSectionDatas;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _firstSectionDatas = [@[@"1-1", @"1-2", @"1-3"] mutableCopy];
    _secondSectionDatas = [@[@"2-1", @"2-2", @"2-3"] mutableCopy];
    [self.collectionView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (IBAction)performUpdate:(id)sender
{
    [self performUpdateSection0];
    [self performUpdateSection1];
}


- (void)performUpdateSection0
{
    NSLog(@"add new item to section 0");
    [_firstSectionDatas insertObject:@"1-new" atIndex:0];
    
        [self.collectionView performBatchUpdates:^{
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
            [self.collectionView insertItemsAtIndexPaths:@[indexPath]];
        } completion:^(BOOL finished) {
            ;
        }];
}

- (void)performUpdateSection1
{
    NSLog(@"add new item to section 1");
    _secondSectionDatas = [@[@"2-1-new", @"2-2-new", @"2-3-new", @"2-4-new"] mutableCopy];
    [self.collectionView reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return [_firstSectionDatas count];
    }
    return [_secondSectionDatas count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
    UILabel *label = [cell.contentView viewWithTag:1234];
    if (!label) {
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        [cell.contentView addSubview:label];
        label.tag = 1234;
    }
    
    switch (indexPath.section) {
        case 0:
            label.text = _firstSectionDatas[indexPath.row];
            break;
            
        case 1:
            label.text = _secondSectionDatas[indexPath.row];
        default:
            break;
    }
    
    return cell;
}

@end

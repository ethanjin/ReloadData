//
//  ViewController.m
//  ReloadData
//
//  Created by ly on 11/23/15.
//  Copyright © 2015 ly. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ViewController
{
  NSMutableArray *_firstSectionDatas;
  NSMutableArray *_secondSectionDatas;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  _firstSectionDatas = [@[@"1-1", @"1-2", @"1-3"] mutableCopy];
  _secondSectionDatas = [@[@"2-1", @"2-2", @"2-3"] mutableCopy];

  UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
  _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
  _collectionView.backgroundColor = [UIColor whiteColor];
  _collectionView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
  [self.view addSubview:_collectionView];

  self.collectionView.delegate = self;
  self.collectionView.dataSource = self;

  [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];

  [self performUpdateSection0];
  [self performUpdateSection1];
}

- (void)performUpdateSection0
{
  NSLog(@"add new item to section 0");
  [_firstSectionDatas insertObject:@"1-new" atIndex:0];
  [self.collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
}

- (void)performUpdateSection1
{
  NSLog(@"add new item to section 1");
  [_secondSectionDatas insertObject:@"2-new" atIndex:0];
  [self.collectionView reloadData];
}

- (void)viewDidLayoutSubviews
{
  [super viewDidLayoutSubviews];
  self.collectionView.frame = self.view.bounds;
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

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
  CGFloat viewWidth = collectionView.frame.size.width;
  return CGSizeMake(viewWidth, 44);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
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

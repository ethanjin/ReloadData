//
//  IGTestViewController.m
//  ReloadData
//
//  Created by ethanjin on 2017/6/19.
//  Copyright © 2017年 ly. All rights reserved.
//

#import "IGTestViewController.h"
#import <IGListKit/IGListKit.h>
#import "Data.h"
#import "DataSectionController.h"

@interface IGTestViewController () <IGListAdapterDataSource>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) IGListAdapter *adapter;


@property (nonatomic, strong) NSArray<Data *> *datas;

@property (nonatomic, strong) NSMutableArray *firstSectionDatas;
@property (nonatomic, strong) NSMutableArray *secondSectionDatas;

@end

@implementation IGTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.datas = @[[Data dataWithStrings:@[@"1-1", @"1-2", @"1-3"]],
                   [Data dataWithStrings:@[@"2-1", @"2-2", @"2-3"]]
                   ];
    
    self.adapter = [[IGListAdapter alloc] initWithUpdater:[[IGListAdapterUpdater alloc] init]
                                           viewController:self];
    
    self.adapter.collectionView = self.collectionView;
    self.adapter.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)performUpdate:(id)sender {
    [self performUpdateSection0];
    [self performUpdateSection1];
}

- (void)performUpdateSection0
{
    NSLog(@"add new item to section 0");
    NSMutableArray *newStrings = self.datas[0].strings;
    [newStrings insertObject:@"1-new" atIndex:0];
    Data *data1 = self.datas[1];
    self.datas = @[[Data dataWithStrings:newStrings],
                   data1
                   ];
    
    [self.adapter performUpdatesAnimated:YES completion:nil];
}

- (void)performUpdateSection1
{
    NSLog(@"add new item to section 1");
    NSMutableArray *newStrings = self.datas[1].strings;
    [newStrings insertObject:@"2-new" atIndex:0];
    Data *data0 = self.datas[0];
    self.datas = @[data0,
                   [Data dataWithStrings:newStrings]
                   ];
    
    [self.adapter performUpdatesAnimated:YES completion:nil];
//    [self.adapter reloadDataWithCompletion:nil];
}

#pragma mark - IGListAdapterDataSource

- (NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter {
    return self.datas;
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object {
    return [DataSectionController new];
}

- (UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter {
    return nil;
}

@end

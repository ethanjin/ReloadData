//
//  DataCollectionViewCell.h
//  ReloadData
//
//  Created by ethanjin on 2017/6/19.
//  Copyright © 2017年 ly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IGListKit/IGListBindable.h>

@interface DataCollectionViewCell : UICollectionViewCell <IGListBindable>

@property (strong, nonatomic) IBOutlet UILabel *title;

@end

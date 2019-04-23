//
//  CircleViewController.m
//  LineLayout
//
//  Created by 智富360 on 2019/4/22.
//  Copyright © 2019 飞翔. All rights reserved.
//

#import "CircleViewController.h"
#import "CircleCollectionView.h"
#import "CircleLyout.h"

static NSString * const cellID =@"cellID";

@interface CircleViewController ()<UICollectionViewDataSource>

@property(nonatomic,strong)CircleCollectionView *collectionView;

@end

@implementation CircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell * cell =[collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    CGFloat redValue = arc4random_uniform(255)/255.f;
    CGFloat greenValue = arc4random_uniform(255)/255.f;
    CGFloat blueValue = arc4random_uniform(255)/255.f;
    cell.backgroundColor = [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1];
    return cell;
}

#pragma mark - getter
-(CircleCollectionView *)collectionView{
    if (_collectionView==nil) {
        
        CircleLyout* layout =[[CircleLyout alloc]init];
        _collectionView =[[CircleCollectionView alloc]initWithFrame:CGRectMake(0, 150,self.view.frame.size.width,300) collectionViewLayout:layout];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
        _collectionView.dataSource =self;
    }
    return _collectionView;
}
@end

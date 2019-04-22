//
//  LineViewController.m
//  LineLayout
//
//  Created by 智富360 on 2019/4/22.
//  Copyright © 2019 飞翔. All rights reserved.
//

#import "LineViewController.h"
#import "LineCollectionView.h"
#import "LineLayout.h"
static NSString * const ID =@"cellID";

@interface LineViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)LineCollectionView *collectionView;

@end

@implementation LineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.collectionView];
}

#pragma mark -<UICollectionViewDelegate,UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 20;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell * collectionViewCell =[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    CGFloat redValue = arc4random_uniform(255)/255.f;
    CGFloat greenVlaue = arc4random_uniform(255)/255.f;
    CGFloat blueValue = arc4random_uniform(255)/255.f;
    collectionViewCell.backgroundColor =[UIColor colorWithRed:redValue green:greenVlaue blue:blueValue alpha:1];
    
    return collectionViewCell;
}

#pragma mark - getter
-(LineCollectionView *)collectionView{
    if (_collectionView==nil) {
        
        LineLayout * lineLayout =[[LineLayout alloc]init];
        //水平方向滚动
        lineLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView =[[LineCollectionView alloc]initWithFrame:CGRectMake(0,200, self.view.frame.size.width,200) collectionViewLayout:lineLayout];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
        _collectionView.dataSource =self;
        _collectionView.delegate =self;
    }
    return _collectionView;
}

@end

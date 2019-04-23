//
//  CircleCollectionView.m
//  LineLayout
//
//  Created by 智富360 on 2019/4/23.
//  Copyright © 2019 飞翔. All rights reserved.
//

#import "CircleCollectionView.h"

@implementation CircleCollectionView
-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
 
    self =[super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.backgroundColor =[UIColor blackColor];
    }
    return self;
}

@end

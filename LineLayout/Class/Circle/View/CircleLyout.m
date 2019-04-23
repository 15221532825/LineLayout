//
//  CircleLyout.m
//  LineLayout
//
//  Created by 智富360 on 2019/4/23.
//  Copyright © 2019 飞翔. All rights reserved.
//

#import "CircleLyout.h"

@implementation CircleLyout

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSInteger count =[self.collectionView numberOfItemsInSection:0];
    CGFloat attributesWH = 50;
    CGFloat centerX = self.collectionView.frame.size.width * 0.5;
    CGFloat centerY = self.collectionView.frame.size.height* 0.5;
    
    CGFloat radius = centerY-40;
    
    NSMutableArray * dataAry =[NSMutableArray arrayWithCapacity:0];
    
    for (NSInteger index =0; index < count; index++) {
        NSIndexPath * indexPath =[NSIndexPath indexPathForItem:index inSection:0];
        
        UICollectionViewLayoutAttributes * attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        
        CGFloat angle =  M_PI *2/count* index;
        
        CGFloat attributesX = centerX + radius * sin(angle);
        CGFloat attributesY =centerY +radius* cos(angle);
        
        attributes.center =CGPointMake(attributesX,attributesY);
        attributes.size =CGSizeMake(attributesWH, attributesWH);
        
        [dataAry addObject:attributes];
    }

    return dataAry;
}
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    
    return YES;
}
@end

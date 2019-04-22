//
//  LineLayout.m
//  LineLayout
//
//  Created by 智富360 on 2019/4/22.
//  Copyright © 2019 飞翔. All rights reserved.
//

#import "LineLayout.h"

@implementation LineLayout
-(void)prepareLayout{
    [super prepareLayout];
    self.itemSize =CGSizeMake(150, 150);
    
    self.sectionInset = UIEdgeInsetsMake(0,50, 0, 50);
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSArray * attributesAry =[super layoutAttributesForElementsInRect:rect];
    
    for (UICollectionViewLayoutAttributes* attributes in attributesAry) {
        
        CGFloat   collectionViewCenterX =  self.collectionView.center.x + self.collectionView.contentOffset.x;
        CGFloat attributeCenterX = attributes.center.x;
        
        CGFloat delta = ABS(collectionViewCenterX-attributeCenterX);
        CGFloat scale = 1- delta/self.collectionView.frame.size.width;
        
        attributes.transform = CGAffineTransformMakeScale(scale,scale);
    }
    
    return attributesAry;
}
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    
    return YES;
}
-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    
    CGRect rect =CGRectMake(self.collectionView.contentOffset.x,0,self.collectionView.frame.size.width, self.collectionView.frame.size.height);
    
    NSLog(@"contentOffset=%@",NSStringFromCGPoint(proposedContentOffset));
    NSArray * superAry =[super layoutAttributesForElementsInRect:rect];
    
    for (UICollectionViewLayoutAttributes * attributes in superAry) {
    
        
        
        
    }
    return CGPointZero;
}

@end

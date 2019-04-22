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
    
    CGFloat margin =(self.collectionView.frame.size.width -self.itemSize.width)*0.5;
    
    self.sectionInset = UIEdgeInsetsMake(0,margin, 0, margin);
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    NSArray * attributesAry =[super layoutAttributesForElementsInRect:rect];
    
    for (UICollectionViewLayoutAttributes* attributes in attributesAry) {
        
        CGFloat   collectionViewCenterX =   self.collectionView.frame.size.width*0.5 + self.collectionView.contentOffset.x;
        CGFloat   attributeCenterX      =   attributes.center.x;
        
        CGFloat delta = ABS(collectionViewCenterX-attributeCenterX);
        CGFloat scale = 1- delta/self.collectionView.frame.size.width*0.5;
        
        attributes.transform = CGAffineTransformMakeScale(scale,scale);
    }
    
    return attributesAry;
}

-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{

    CGRect rect =CGRectMake( proposedContentOffset.x,0,self.collectionView.frame.size.width, self.collectionView.frame.size.height);
    
    NSArray * superAry =[super layoutAttributesForElementsInRect:rect];
    
    CGFloat minDeta = MAXFLOAT;
    for (UICollectionViewLayoutAttributes * attributes in superAry) {
        
        CGFloat attribiuteCenterX = attributes.center.x;
        CGFloat contentViewCenterX = self.collectionView.frame.size.width *0.5 + proposedContentOffset.x;
        
        CGFloat delta = attribiuteCenterX - contentViewCenterX;
        if (ABS(delta)< ABS(minDeta)) {
            minDeta = delta;
        }
    }
    
    //修改x的值
    proposedContentOffset.x+=minDeta;
    
    return  proposedContentOffset;
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    
    return YES;
}

@end

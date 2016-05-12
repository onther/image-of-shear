//
//  YJZoomingImageView.h
//  imageTapViews
//
//  Created by mac on 16/4/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YJZoomingImageView : UIView
@property (nonatomic ,readonly) UIScrollView *scrollView;
@property (nonatomic ,strong  ) UIImageView * imageView;
@property (nonatomic ,strong  ) UIImage *image;
@property (nonatomic ,readonly) BOOL isViewing;
@end

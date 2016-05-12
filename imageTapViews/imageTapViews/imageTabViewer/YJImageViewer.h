//
//  YJImageViewer.h
//  imageTapViews
//
//  Created by mac on 16/4/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YJImageViewer;
@protocol YJImageViewerDelegate <NSObject>

-(void)imageVeiwer:(YJImageViewer *)imageViewer  willDismissWithSelectedView:(UIImageView *)selectedView;

@end
@interface YJImageViewer : UIView
@property (nonatomic ,weak)id<YJImageViewerDelegate>delegate;

@property (nonatomic ,assign) CGFloat backgroundScale;

-(void)showWithImageViews:(NSArray *)views selectedView:(UIImageView *)SelectedView;

@end

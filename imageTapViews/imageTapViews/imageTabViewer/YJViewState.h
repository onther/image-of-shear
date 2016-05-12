//
//  YJViewState.h
//  imageTapViews
//
//  Created by mac on 16/4/7.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YJViewState : UIView
@property (nonatomic ,strong)UIView *superview;
@property (nonatomic ,assign)CGRect frame;
@property (nonatomic ,assign)BOOL userInteratctionEnabled;
@property (nonatomic ,assign)CGAffineTransform transform;

+(YJViewState *)viewStateForView:(UIView *)view;
-(void)setStateWithView:(UIView *)view;
@end

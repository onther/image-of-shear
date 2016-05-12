//
//  YJImageViewer.m
//  imageTapViews
//
//  Created by mac on 16/4/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "YJImageViewer.h"
#import "YJZoomingImageView.h"
#import "YJViewState.h"

 
@interface YJImageViewer ( )//注意interface 后面带着（parentheses）小括号（）

@property (nonatomic ,strong) UIScrollView *scrollView;
@property (nonatomic ,strong) NSArray *imageViews;
@end
@implementation YJImageViewer
-(id)init{
    self  = [self initWithFrame:CGRectZero];
    if (self) {
        [self _setup];
    }
    return self;
}
-(void)_setup{
    self.backgroundColor = [UIColor colorWithWhite:0.1 alpha:1];
    self.backgroundScale = 0.95;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(didPan:)];
    pan.maximumNumberOfTouches = 1;
    [self addGestureRecognizer:pan];
}
-(id) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        [self _setup];
    }
    return self;
}
-(void)didPan:(UIPanGestureRecognizer *)sender{
// 静态  static   手势 Gesture  识别 recognizer 当前的 current
    static UIImageView *currentView = nil;
    if (sender.state ==UIGestureRecognizerStateBegan) {
        currentView = [self currentView];
        UIView *targetView = currentView.superview;
        while (![targetView isKindOfClass:[YJZoomingImageView class]]) {
            targetView = targetView.superview;
        }
        if (((YJZoomingImageView *)targetView).isViewing) {
            currentView = nil;
        }else{
            UIWindow *windeow = [[[UIApplication sharedApplication]delegate] window];
            currentView.frame = [windeow convertRect:currentView.frame fromView:currentView.superview];
            [windeow addSubview:currentView];
            
            [self prepareTODismiss];
        }
    }
    
    
}
-(void)prepareTODismiss{
    UIImageView *currentView = [self currentView];
    if ([self.delegate respondsToSelector:@selector(imageVeiwer:willDismissWithSelectedView:)]) {
        [self.delegate imageVeiwer:self willDismissWithSelectedView:currentView];
    }
    for (UIImageView *View in _imageViews) {
        if (View != currentView) {
            YJViewState *stat = [YJViewState viewStateForView:View];
            View.transform = CGAffineTransformIdentity;
            View.frame = stat.frame;
            View.transform = stat.transform;
            [stat.superview addSubview:View];
        }
    }

}
-(NSInteger)pageIndex{
    return (_scrollView.contentOffset.x/_scrollView.frame.size.width+0.5);
}
-(UIImageView *)currentView{
    return [_imageViews objectAtIndex:self.pageIndex];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

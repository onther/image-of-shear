//
//  YJZoomingImageView.m
//  imageTapViews
//
//  Created by mac on 16/4/6.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "YJZoomingImageView.h"
@interface YJZoomingImageView ()<UIScrollViewDelegate>
@property (nonatomic ,readwrite ,strong) UIScrollView *scrollView;
@property (nonatomic ,strong)UIView *containerView;
@end
@implementation YJZoomingImageView

-(void)awakeFromNib{
    [self _setup];
}
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self _setup];
    }
    return self;
}
-(void)_setup{
    self.clipsToBounds = YES;
    self.contentMode = UIViewContentModeScaleAspectFill;
    _scrollView  = [[UIScrollView alloc]initWithFrame:self.bounds];
    _scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    _scrollView.showsHorizontalScrollIndicator  = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self;
    _containerView = [[UIView alloc]initWithFrame:self.bounds];
    [_scrollView addSubview:_containerView];
 
}
// image 的get  和set 方法，
-(UIImage *)image {
    return _imageView.image;
}
-(void)setImage:(UIImage *)image{
    if (self.imageView == nil) {
        self.imageView = [UIImageView new];
        self.imageView.clipsToBounds = YES;
        
    }
    self.imageView.image = image;
}
-(void)setImageView:(UIImageView *)imageView{
    if (imageView != _imageView) {
        [_imageView removeObserver:self forKeyPath:@"image"];
        [_imageView removeFromSuperview];
        _imageView = imageView;
        _imageView.frame = _imageView.bounds;
        [_imageView addObserver:self forKeyPath:@"image" options:0 context:nil];
        [_containerView addSubview:_imageView];
        [self resetZoomscale];
        _scrollView.zoomScale = _scrollView.minimumZoomScale;
        [self scrollViewDidZoom:_scrollView];
    }
}
-(void)resetZoomscale{
    CGFloat Rw = _scrollView.frame.size.width /self.imageView.frame.size.width;
    CGFloat Rh = _scrollView.frame.size.height/self.imageView.frame.size.height;
    CGFloat scale = 1;
    Rw = MAX(Rw , _imageView.image.size.width / (scale * _scrollView.frame. size.width));
    Rh =MAX(Rh, _imageView.image.size.height / (scale * _scrollView.frame.size.height));
    _scrollView.contentSize = _imageView.frame.size;
    _scrollView.minimumZoomScale = 1;
    _scrollView.maximumZoomScale = MAX( MAX(Rw, Rh),1);

}
#pragma mark --ScrollView delegate  缩放图片的地方注意ScrollView 的代理方法缩放的实现方法
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return  _containerView;
}
-(void)scrollViewDidZoom:(UIScrollView *)scrollView{
    CGFloat Ws = _scrollView.frame.size.width - _scrollView.contentInset.left- _scrollView.contentInset.right;
    CGFloat Hs = _scrollView.frame.size.height - _scrollView.contentInset.top-_scrollView.contentInset.bottom;
    CGFloat W = _containerView.frame.size.width;
    CGFloat H = _containerView.frame.size.height;
    CGRect rct = _containerView.frame;
    rct.origin.x = MAX((Ws -W)/2, 0);
    rct.origin.y = MAX((Hs -H)/2, 0);
    _containerView.frame = rct;
}
-(void)resetZoomScale{
    CGFloat Rw = _scrollView.frame.size.width / self.imageView.frame.size.width;
    CGFloat Hw = _scrollView.frame.size.height/ self.imageView.frame.size.height;
    CGFloat scale =1;
    Rw = MAX(Rw , _imageView.image.size.width / (scale * _scrollView.frame.size.width));
    Hw = MAX(Hw, _imageView.image.size.height / (scale *_scrollView.frame.size.height));

    _scrollView.contentSize = _imageView.frame.size;
    _scrollView.minimumZoomScale = 1;
    _scrollView.maximumZoomScale = MAX(MAX(Rw, Hw), 0);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  YJViewState.m
//  imageTapViews
//
//  Created by mac on 16/4/7.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "YJViewState.h"

@implementation YJViewState

+(YJViewState *)viewStateForView:(UIView *)view{
    static NSMutableDictionary *dict = nil;
    if (dict ==nil) {
        dict = [NSMutableDictionary dictionary];
    }
        YJViewState *state = dict[@(view.hash)];
        if (state == nil) {
            state = [[self alloc]init];
            dict[@(view.hash)] =state;
            
        }
    
    return state;
}
-(void)setStateWithView:(UIView *)view{

    CGAffineTransform trans = view.transform;
    view.transform = CGAffineTransformIdentity;
    self.superview = view.superview;
    self.frame = view.frame;
    self.transform = trans;
    self.userInteratctionEnabled = view.userInteractionEnabled;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

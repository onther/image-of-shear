//
//  UIImage+UIimage.h
//  imageTapViews
//
//  Created by mac on 16/4/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UIimage)
+(UIImage *)fastImageWithData:(NSData *)data;
+(UIImage *)fastImageWithContentsofFile:(NSString *)path;
-(UIImage *)imageByScalingToSize:(CGSize)targetSize;
@end

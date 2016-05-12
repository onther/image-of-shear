//
//  UIImage+UIimage.m
//  imageTapViews
//
//  Created by mac on 16/4/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "UIImage+UIimage.h"

@implementation UIImage (UIimage)
+(UIImage *)decode:(UIImage *)image{
    if (image ==nil) {
        return nil;
    }
    UIGraphicsBeginImageContext(image.size);
    {
        [image drawAtPoint:CGPointMake(0, 0)];
        image = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    return image;
}
+(UIImage *)fastImageWithData:(NSData *)data{
    UIImage *image = [UIImage imageWithData:data];
    return [self decode: image];
}
-(UIImage *)imageByScalingToSize:(CGSize)targetSize{
    UIImage *sourceImage = self;
    UIImage *newImage = nil;
    CGSize ImageSize = sourceImage.size;
    CGFloat width =ImageSize.width;
    CGFloat height = ImageSize.height;
    CGFloat targetWith =   targetSize.width;
    CGFloat taygetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWith;
    CGFloat scaledHeight = taygetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0, 0.0);
    if (CGSizeEqualToSize(ImageSize, targetSize) == NO) {
        CGFloat widthFactor = targetWith /width;
        CGFloat hisghtFavtor = height*scaleFactor;
        if (widthFactor <hisghtFavtor  ) {
            scaleFactor = widthFactor;
        }else{
            scaleFactor = hisghtFavtor;
        }
            
        scaledWidth = width*scaleFactor;
        scaledHeight = height*scaleFactor;
        if (widthFactor < hisghtFavtor) {
            thumbnailPoint.y = (taygetHeight - scaledHeight*0.5);
        }else if(widthFactor>hisghtFavtor){
        
            thumbnailPoint.x = (targetWith - scaledHeight*0.5);
        }
        
    }
    UIGraphicsBeginImageContext(targetSize);
    CGRect thunbnail = CGRectZero;
    thunbnail.origin = thumbnailPoint;
    thunbnail.size.width = scaledWidth;
    thunbnail.size.height = scaledHeight;
    [sourceImage drawInRect:thunbnail];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndPDFContext();
    if (newImage ==nil) {
        
        NSLog(@"could not scale image");
    }
        return newImage;
    

}
@end

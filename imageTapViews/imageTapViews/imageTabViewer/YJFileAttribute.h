//
//  YJFileAttribute.h
//  imageTapViews
//
//  Created by mac on 16/4/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YJFileAttribute : NSObject
@property(nonatomic ,strong) NSString *filePath;
@property(nonatomic ,strong) NSDictionary*fileAttributes;
@property(nonatomic ,readonly) NSDate *fileModificationDate;
-(id)initWithPath:(NSString *)filePath attribues:(NSDictionary *)attributes;
@end

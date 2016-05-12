//
//  YJFileAttribute.m
//  imageTapViews
//
//  Created by mac on 16/4/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "YJFileAttribute.h"

@implementation YJFileAttribute
-(id)initWithPath:(NSString *)filePath attribues:(NSDictionary *)attributes{
    if ([super init]) {
        self.filePath = filePath;
        self.fileAttributes= attributes;
    }
    return self;
}
-(NSDate *)fileModificationDate{
    return [_fileAttributes fileModificationDate];
}
-(NSString *)description{
    return self.filePath;
}
@end

//
//  YJCacheManager.h
//  imageTapViews
//
//  Created by mac on 16/4/11.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIImage+UIimage.h"
#import "YJFileAttribute.h"
#import "NSString+YJMD5.h"
@interface YJCacheManager : NSObject
// instancetype
+ (instancetype)shareCacheManager;
+ (instancetype)cacheManagerWithIdentifier:(NSString *)identifier;

// file/url to uer
+ (void)limitNumberOfCacheFiles:(NSInteger)numberOfCacheFiles;
- (void)limitNumberOfCacheFiles:(NSInteger)numberOfCacheFiles;

+ (void)removeCacheForURL:(NSURL *)url;
- (void)removeCacheForURL:(NSURL *)url;

+ (void)removeCacheDirectory;
- (void)removeCacheDirectory;

// NSData caching
+ (void)storeData:(NSData *)data forURL:(NSURL *)url storeMemoryCache:(BOOL)storeMemoryCache;
- (void)storeData:(NSData *)data forURL:(NSURL *)url storeMemoryCache:(BOOL)storeMemoryCache;

+ (NSData *)localCachedDataWithURL:(NSURL *)url;
- (NSData *)localCachedDataWithURL:(NSURL *)url;

+ (NSData *)dataWithURL:(NSURL *)url storeMemoryCache:(BOOL)storeMemoryCache;
- (NSData *)dataWithURL:(NSURL *)url storeMemoryCache:(BOOL)storeMemoryCache;

+ (BOOL)existsDataForURL:(NSURL *)url;
- (BOOL)existsDataForURL:(NSURL *)url;

// UIImage caching
+ (void)storeMemoryCacheWithImage:(UIImage *)image forURL:(NSURL *)url;
- (void)storeMemoryCacheWithImage:(UIImage *)image forURL:(NSURL *)url;

+ (UIImage *)imageWithURL:(NSURL *)url storeMemoryCache:(BOOL)storeMemoryCache;
- (UIImage *)imageWithURL:(NSURL *)url storeMemoryCache:(BOOL)storeMemoryCache;

@end

//
//  YJFImageRotatorProtocol.h
//  YJFImageRotator
//
//  Created by 孙春磊 on 2017/10/7.
//  Copyright © 2017年 scl. All rights reserved.
//

@protocol YJFImageLooperProtocol <NSObject>

/**
 *  广告图片URL
 */
- (NSURL *)adImgURL;

/**
 *  点击执行的代码块
 */
@property (nonatomic, copy) void(^clickBlock)();

@end

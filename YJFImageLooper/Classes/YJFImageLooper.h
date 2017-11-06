//
//  YJFImageRotator.h
//  YJFImageRotator
//
//  Created by 孙春磊 on 2017/10/7.
//  Copyright © 2017年 scl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YJFImageLooperProtocol.h"

typedef void(^YJFLoadImageBlock)(UIImageView *imageView, NSURL *url);

@protocol YJFImageRotatorDelegate <NSObject>

- (void)imageRototaDidSelectedPicModel: (id <YJFImageLooperProtocol>)picM;

@end

@interface YJFImageLooper : UIView

+ (instancetype)imageRototarWithLoadImageBlock: (YJFLoadImageBlock)loadBlock;
/**
 *  用于加载图片的代码块, 必须赋值
 */
@property (nonatomic, copy) YJFLoadImageBlock loadBlock;

/**
 *  用于告知外界, 当前滚动到的是哪个广告数据模型
 */
@property (nonatomic, strong) id<YJFImageRotatorDelegate> delegate;

/**
 *  用来展示图片的数据源
 */
@property (nonatomic, strong) NSArray <id <YJFImageLooperProtocol>>*picModels;



@end

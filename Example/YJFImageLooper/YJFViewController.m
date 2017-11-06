//
//  YJFViewController.m
//  YJFImageLooper
//
//  Created by acct<blob>=<NULL> on 11/03/2017.
//  Copyright (c) 2017 acct<blob>=<NULL>. All rights reserved.
//

#import "YJFViewController.h"
#import <YJFImageLooper/YJFImageLooper.h>

#import "UIImageView+WebCache.h"

@interface YJFAdModel : NSObject

@property (nonatomic, copy) NSString *imagePath;

@property (nonatomic, copy) void(^clickBlock)();

@end

@interface YJFViewController ()

@property (weak, nonatomic) IBOutlet YJFImageLooper *imageLooper;

@property(nonatomic,strong) NSArray *pathArray;


@end

@implementation YJFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.pathArray = @[ @"http://uploadfile.bizhizu.cn/2014/0329/20140329052106536.jpg",
                        @"http://h.hiphotos.baidu.com/baike/c0%3Dbaike60%2C5%2C5%2C60%2C20/sign=44ed1034f503918fc3dc359830544df2/e1fe9925bc315c6013622c3b8fb1cb134854776a.jpg",
                        @"http://img3.duitang.com/uploads/item/201503/01/20150301153310_nanAu.thumb.700_0.jpeg",
                        @"http://it.people.com.cn/mediafile/200807/14/F200807141601411997730019.jpg",
                        @"http://img3x1.ddimg.cn/81/6/1046039031-1_u.jpg"];
    
    NSMutableArray *adModelarray = [NSMutableArray new];
    
    for (NSString *path in self.pathArray) {
        
        YJFAdModel *ad = [[YJFAdModel alloc] init];
        ad.imagePath = path;
        ad.clickBlock = ^{
            NSLog(@"%@",path);
        };
        
        [adModelarray addObject:ad];
    }
    
    self.imageLooper.loadBlock = ^(UIImageView *imageView, NSURL *url) {
        
        //        imageView.image = [UIImage imageNamed:@"beyond"];
        [imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"beyond"] options:SDWebImageCacheMemoryOnly];
    };
    
    self.imageLooper.picModels = adModelarray;
    
}

@end


@interface YJFAdModel()<YJFImageLooperProtocol>


@end

@implementation YJFAdModel

- (NSURL *)adImgURL{
    return [NSURL URLWithString:_imagePath];
}

@end

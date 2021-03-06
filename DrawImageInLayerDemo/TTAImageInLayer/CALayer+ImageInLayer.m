//
//  CALayer+ImageInLayer.m
//  图像绘制Demo
//
//  Created by TobyoTenma on 7/11/16.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "CALayer+ImageInLayer.h"

@implementation CALayer (ImageInLayer)

/**
 *  将获取到的图片直接绘制在 layer 上
 *
 *  @param getImage 获取图片的 block
 */
- (void)drawImageGetImage:(UIImage * (^) ())getImage {
    dispatch_async (dispatch_get_global_queue (0, 0), ^{
        // 异步获取图片
        UIImage *image     = getImage ();
        self.contentsScale = image.scale;

        dispatch_async (dispatch_get_main_queue (), ^{
            // 回到主视图绘制图片
            self.contents = (__bridge id _Nullable) (image.CGImage);
        });
    });
}

/**
 *  在 layer 的指定区域绘制获取的图片
 *
 *  @param rect           指定的绘制区域
 *  @param contentMode    图片填充模式, 参照 CALayer 的contentsGravity属性
 *  @param getImage       获取图片的 block
 */
- (void)drawImageInRect:(CGRect)rect
            contentMode:(NSString *)contentsGravity
               getImage:(UIImage * (^) ())getImage {
    dispatch_async (dispatch_get_global_queue (0, 0), ^{
        // 异步获取图片
        UIImage *image = getImage ();
        // 将图片绘制到上下文中
        UIGraphicsBeginImageContext (image.size);

        self.contentsGravity = contentsGravity;
        self.contentsScale   = image.scale;
        [image drawInRect:rect];

        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext ();
        UIGraphicsEndImageContext ();
        dispatch_async (dispatch_get_main_queue (), ^{
            // 回到主视图绘制图片
            self.contents = (__bridge id _Nullable) (newImage.CGImage);
        });
    });
}

/**
 *  在 layer 上从指定点开始绘制获取的图片
 *
 *  @param point    从指定点开始绘制图片
 *  @param getImage 获取图片的 block
 */
- (void)drawImageAtPoint:(CGPoint)point getImage:(UIImage * (^) ())getImage {
    dispatch_async (dispatch_get_global_queue (0, 0), ^{
        // 异步获取图片
        UIImage *image = getImage ();
        // 将图片绘制到上下文中
        UIGraphicsBeginImageContext (image.size);

        // 从指定点开始绘制图片
        [image drawAtPoint:point];
        self.contentsScale = image.scale;

        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext ();
        UIGraphicsEndImageContext ();
        dispatch_async (dispatch_get_main_queue (), ^{
            // 回到主视图绘制图片
            self.contents = (__bridge id _Nullable) (newImage.CGImage);
        });
    });
}

@end

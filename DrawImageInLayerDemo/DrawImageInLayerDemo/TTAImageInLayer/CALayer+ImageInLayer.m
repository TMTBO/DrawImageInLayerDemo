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
        UIImage *image = getImage ();

        dispatch_async (dispatch_get_main_queue (), ^{
            // 回到主视图绘制图片
            self.contents = (__bridge id _Nullable) (image.CGImage);
        });
    });
}

/**
 *  在 layer 的指定区域绘制获取的图片
 *
 *  @param rect     指定的绘制区域
 *  @param state    Rect的绘制状态
 *  @param getImage 获取图片的 block
 */
- (void)drawImageInRect:(CGRect)rect
                     rectState:(TTAImageInLayerRectState)state
                      getImage:(UIImage * (^) ())getImage {
    dispatch_async (dispatch_get_global_queue (0, 0), ^{
        // 异步获取图片
        UIImage *image = getImage ();
        // 将图片绘制到上下文中
        UIGraphicsBeginImageContext (image.size);

        // 根据不同状态绘制图片
        if (state) {
            [image drawInRect:rect];
        } else {
            // 计图片比例
            CGFloat width  = image.size.width;
            CGFloat height = image.size.height;
            [image drawInRect:CGRectMake (rect.origin.x, rect.origin.y, width, height)];
        }

        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext ();
        UIGraphicsEndImageContext ();
        dispatch_async (dispatch_get_main_queue (), ^{
            // 回到主视图绘制图片
            self.contents = (__bridge id _Nullable) ([newImage CGImage]);
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

        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext ();
        UIGraphicsEndImageContext ();
        dispatch_async (dispatch_get_main_queue (), ^{
            // 回到主视图绘制图片
            self.contents = (__bridge id _Nullable) ([newImage CGImage]);
        });
    });
}

@end

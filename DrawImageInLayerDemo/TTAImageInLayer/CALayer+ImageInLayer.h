//
//  CALayer+ImageInLayer.h
//  图像绘制Demo
//
//  Created by TobyoTenma on 7/11/16.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

// 这个 CALayer 的分类是用来将获取到的图片绘制在 layer 上的
// 传入的 block 获取图片都是异步获取,不会占用主线程,所以在传入 block 时不用添加异步操作

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CALayer (ImageInLayer)
/**
 *  将获取到的图片直接绘制在 layer 上
 *
 *  @param getImage 获取图片的 block
 */
- (void)drawImageGetImage:(UIImage * (^) ())getImage;

/**
 *  在 layer 的指定区域绘制获取的图片
 *
 *  @param rect           指定的绘制区域
 *  @param contentMode    图片填充模式, 参照 CALayer 的 contentsGravity 属性
 *  @param getImage       获取图片的 block
 */
- (void)drawImageInRect:(CGRect)rect
            contentMode:(NSString *)contentsGravity
               getImage:(UIImage * (^) ())getImage;

/**
 *  在 layer 上从指定点开始绘制获取的图片
 *
 *  @param point    从指定点开始绘制图片
 *  @param getImage 获取图片的 block
 */
- (void)drawImageAtPoint:(CGPoint)point getImage:(UIImage * (^) ())getImage;
@end

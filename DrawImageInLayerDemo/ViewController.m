//
//  ViewController.m
//  DrawImageInLayerDemo
//
//  Created by TobyoTenma on 7/11/16.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "ViewController.h"
#import "TTAImageInLayer/CALayer+ImageInLayer.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
    /*====================在指定的 layer 早绘制图片========================*/
    //    [self.view.layer drawImageGetImage:^UIImage *{
    ////        UIImage *image = [UIImage imageNamed:@"QQ图片20150722212734.jpg"];
    //        NSData *data = [NSData dataWithContentsOfURL:[NSURL
    //        URLWithString:@"https://zsisme.gitbooks.io/ios-/content/chapter2/2.1.png"]];
    //        UIImage *image = [UIImage imageWithData:data];
    //
    //
    //        return image;
    //    }];
    
    
    /*====================在指定layer 上的指定区域绘制图片========================*/
        [self.view.layer
        drawImageInRect:CGRectMake(0, 0, 100, 100) contentMode:kCAGravityCenter getImage:^UIImage *{
            //                      getImage:^UIImage * {
            //                          NSData *data = [NSData
            //                          dataWithContentsOfURL:[NSURL
            //                          URLWithString:@"https://zsisme.gitbooks.io/ios-/"
            //                                                                     @"content/chapter2/2.1.png"]];
            //                          UIImage *image = [UIImage imageWithData:data];
            UIImage *image = [UIImage imageNamed:@"QQ图片20150722212734.jpg"];
            return image;
        }];
    
    /*====================从指定 layer 上的指定点上开始绘制图片========================*/
        
//        [self.view.layer drawImageAtPoint:CGPointMake(0, 0) getImage:^UIImage *{
//            NSData *data =
//            [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://zsisme.gitbooks.io/ios-/"
//                                           @"content/chapter2/2.1.png"]];
//            UIImage *image = [UIImage imageWithData:data];
//                    UIImage *image = [UIImage imageNamed:@"QQ图片20150722212734.jpg"];
//            return image;
//        }];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

# DrawImageInLayerDemo
这个 demo 中的 TTADrawImageInLayer.h 和.m 两个文件中封装的几个方法的主要作用是在任意的 layer 上绘制图片
将获取到的图片绘制在 layer 上的

这里传入的 block 获取图片都是异步获取,不会占用主线程,所以在传入 block 时不用添加异步操作

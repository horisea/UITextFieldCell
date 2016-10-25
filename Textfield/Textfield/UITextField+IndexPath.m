//
//  UITextField+IndexPath.m
//  Textfield
//
//  Created by 朱同海 on 16/7/10.
//  Copyright © 2016年 朱同海. All rights reserved.
//  核心类

#import "UITextField+IndexPath.h"
#import <objc/runtime.h>


@implementation UITextField (IndexPath)
static char indexPathKey;
- (NSIndexPath *)indexPath{
    return objc_getAssociatedObject(self, &indexPathKey);
}

- (void)setIndexPath:(NSIndexPath *)indexPath{
    objc_setAssociatedObject(self, &indexPathKey, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end

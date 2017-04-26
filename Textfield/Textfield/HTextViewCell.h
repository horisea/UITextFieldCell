//
//  HTextViewCell.h
//  Textfield
//
//  Created by 朱同海 on 16/7/6.
//  Copyright © 2016年 朱同海. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTextViewCell : UITableViewCell

/**
 *  设置cell、数据
 *  @param string        左边的标题
 *  @param dataString    textfield输入内容
 *  @param indexPath     indexPath。唯一绑定当前textfield
 */
- (void)setTitleString:(NSString *)string
         andDataString:(NSString *)dataString
          andIndexPath:(NSIndexPath *)indexPath;
@end

//
//  HTextViewCell.m
//  Textfield
//
//  Created by 朱同海 on 16/7/6.
//  Copyright © 2016年 朱同海. All rights reserved.
//

#import "HTextViewCell.h"
#import "UITextField+IndexPath.h"

@interface HTextViewCell ()

@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation HTextViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.textField];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

- (void)setTitleString:(NSString *)string andDataString:(NSString *)dataString andIndexPath:(NSIndexPath *)indexPath{
    // 核心代码
    self.textField.indexPath = indexPath;
    self.textField.text = dataString;
    self.titleLabel.text = string;
}


- (UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(120, 5, 160, 30)];// 这些坐标我随便写死了，可在layoutsubViews自己改
        _textField.layer.borderColor = [UIColor cyanColor].CGColor;
        _textField.layer.borderWidth = 0.5;
    }
    return _textField;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 100, 40)];
    }
    return _titleLabel;
}
@end

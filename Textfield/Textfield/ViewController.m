//
//  ViewController.m
//  Textfield
//
//  Created by 曹 培 on 16/7/6.
//  Copyright © 2016年 朱同海. All rights reserved.
//

#import "ViewController.h"
#import "HTextViewCell.h"
#import "UITextField+IndexPath.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong)UITableView *tableView;

@property (nonatomic , strong)NSArray *titleArray;
@property (nonatomic , strong)NSMutableArray *arrayDataSouce;

@end

@implementation ViewController

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [UIView new];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldDidChanged:) name:UITextFieldTextDidChangeNotification object:nil];

}
- (void)textFieldDidChanged:(NSNotification *)noti{
    UITextField *textField=noti.object;
    NSIndexPath *indexPath = textField.indexPath;
    [self.arrayDataSouce replaceObjectAtIndex:indexPath.row withObject:textField.text];
}
#pragma marks - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayDataSouce.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *Id = @"HTextViewCell";
    HTextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Id];
    if (!cell) {
        cell = [[HTextViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Id];
//        cell.backgroundColor = [UIColor lightGrayColor];
    }
    [cell setTitleString:self.titleArray[indexPath.row] andDataString:self.arrayDataSouce[indexPath.row] andIndexPath:indexPath];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"要隐藏键盘了.......22222222222");

}
#pragma mark - private
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"点击结束了");
}

- (void)hiddenKeyBord{
    NSLog(@"要隐藏键盘了........1111111111111");
    [self.view endEditing:YES];
}
#pragma marks- lazy
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,80, self.view.frame.size.width, self.view.frame.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor lightGrayColor];
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenKeyBord)];
        [_tableView addGestureRecognizer:gesture];
    }
    return _tableView;
}

- (NSMutableArray *)arrayDataSouce{
    if (!_arrayDataSouce) {
        _arrayDataSouce = [NSMutableArray array];
        [_arrayDataSouce addObject:@""];
        [_arrayDataSouce addObject:@""];
        [_arrayDataSouce addObject:@""];

    }
    return _arrayDataSouce;
}

- (NSArray *)titleArray{
    if (!_titleArray) {
        _titleArray = @[@"姓名：", @"年龄：", @"工作地点："];
    }
    return _titleArray;
}
@end





















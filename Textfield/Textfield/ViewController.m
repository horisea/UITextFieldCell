//
//  ViewController.m
//  Textfield
//
//  Created by zth on 16/7/6.
//  Copyright © 2016年 朱同海. All rights reserved.
//

#import "ViewController.h"
#import "HTextViewCell.h"
#import "UITextField+IndexPath.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic , strong)NSArray *titleArray;
@property (nonatomic , strong)NSMutableArray *arrayDataSouce;

@property (nonatomic , strong)UITableView *tableView;
@property (nonatomic, strong) UIButton *completeBtn;

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
    [self.tableView addSubview:self.completeBtn];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldDidChanged:) name:UITextFieldTextDidChangeNotification object:nil]; 
    
}

#pragma mark - notification

- (void)textFieldDidChanged:(NSNotification *)noti{
    // 数据源赋值
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
    }
    // 核心方法
    [cell setTitleString:self.titleArray[indexPath.row] andDataString:self.arrayDataSouce[indexPath.row] andIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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

- (void)btnClick{
    // 打印数据源
    [self.arrayDataSouce enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *string = (NSString *)obj;
        if (string.length == 0) {
            NSLog(@"第%lu个位置元素为空", (unsigned long)idx);
        }else{
            NSLog(@"%@", obj);
        }
    }];
}

#pragma marks- lazy

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,64, self.view.frame.size.width, self.view.frame.size.height)];
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
        _arrayDataSouce = [NSMutableArray array]; // 注意：初始化时，一定要注意占位，否则第一次去的时候为nil，奔溃
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

- (UIButton *)completeBtn{
    if (!_completeBtn) {
        _completeBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 260, (SCREEN_WIDTH - 200), 44)];
        [_completeBtn setTitle:@"打印数据源" forState:UIControlStateNormal];
        _completeBtn.backgroundColor = [UIColor cyanColor];
        [_completeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_completeBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _completeBtn;
}

@end







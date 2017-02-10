//
//  ViewController.m
//  RandomDraw
//
//  Created by 李昆 on 16/6/8.
//  Copyright © 2016年 Aries. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/**
 *  背景
 */
@property (strong, nonatomic) IBOutlet UILabel *bigLabel;

/**
 *  按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *button;


/**
 *  姓名的数组
 */
@property (nonatomic, strong) NSMutableArray *nameArray;
/**
 *  开始抽签的状态
 */
@property (nonatomic, assign) BOOL isStart;

/**
 *  计时器
 */
@property (nonatomic, strong) NSTimer *timer;

/**
 *  记录的下标
 */
@property (nonatomic, assign) NSInteger index;

@end

@implementation ViewController
- (IBAction)changeName:(UIButton *)sender {
    //记录按钮的点击状态
    _isStart = !_isStart;
    //强转类型
    UIButton *btn = (UIButton *)sender;
    //判断当前按钮有没有被点击
    if (_isStart) {
        [btn setTitle:@"开始" forState:UIControlStateNormal];
        //定义计时器的对象
        //参数1:时间间隔
        //参数2:目标self
        //参数3:调用方法
        //参数4:用户信息
        //参数5:是否重复执行
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(randomName) userInfo:nil repeats:YES];
    }else {
        //停止计时器
        [self.timer invalidate];
        [btn setTitle:@"停止" forState:UIControlStateNormal];
        //剩下一个人的时候,不进行任何操作
        if (self.nameArray.count > 1) {
            //移除点过的姓名
            [self.nameArray removeObjectAtIndex:self.index];
        }
        NSLog(@"剩余姓名个数:%ld", self.nameArray.count);
//        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"计算结果" message:[NSString stringWithFormat:@"还剩%lu个名额",(unsigned long)self.nameArray.count] preferredStyle:(UIAlertControllerStyleActionSheet)];
//        
//        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"继续进行" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
//            return ;
//        }];
//        
//        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"不玩了" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
//            self.bigLabel.text = @"O(∩_∩)O";
//            [self.nameArray removeAllObjects];
//            self.nameArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil];
//        }];
//
//        [alertC addAction:action1];
//        [alertC addAction:action2];
//        
//        [self presentViewController:alertC animated:YES completion:nil];
    }
}

- (void)randomName
{
    //随机下标
    //    arc4random() % (b - a +1) +a
    self.index = arc4random() % self.nameArray.count;
    //找到数组中的对象
    NSString *tempName = [self.nameArray objectAtIndex:self.index];
    
    self.bigLabel.text = tempName;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.nameArray = [NSMutableArray arrayWithObjects:@"周杰伦",@"范冰冰",@"林俊杰",@"周润发",@"成龙",@"赵丽颖",@"杜拉拉",@"鹿晗",@"丁丁",@"赵薇", nil];
    self.bigLabel.layer.masksToBounds = YES;
    self.bigLabel.layer.cornerRadius = self.bigLabel.frame.size.width/2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

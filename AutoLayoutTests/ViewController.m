//
//  ViewController.m
//  AutoLayoutTests
//
//  Created by 224 on 15/3/21.
//  Copyright (c) 2015年 zoomlgd. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()

@end

@implementation ViewController{
    UIButton *btn;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //对于AutoLayout的按比例缩放，是在Interface Builder中无法设置的
    
//    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btn setTitle:@"yadong" forState:UIControlStateNormal];
//    btn.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:btn];
    
    //禁止自动转换AutoresizingMask
//    btn.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    //居中
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btn
//                                                          attribute:NSLayoutAttributeCenterX
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeCenterX
//                                                         multiplier:1
//                                                           constant:0]];
    
    //距离底部20单位
    //注意NSLayoutConstraint创建的constraint是加在toItem参数的，所以需要-20.
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btn
//                                                          attribute:NSLayoutAttributeBottom
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeBottom
//                                                         multiplier:1
//                                                           constant:-20]];
    
    //定义高度是父view的三分之一
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btn
//                                                          attribute:NSLayoutAttributeHeight
//                                                          relatedBy:NSLayoutRelationEqual
//                                                             toItem:self.view
//                                                          attribute:NSLayoutAttributeHeight
//                                                         multiplier:0.3
//                                                           constant:0]];
    //设置优先级低于UILAoutPriorityRequired(1000)，UILayoutPriorityDefaultHigh是750
//    NSLayoutConstraint *con = [NSLayoutConstraint constraintWithItem:btn
//                                                           attribute:NSLayoutAttributeHeight
//                                                           relatedBy:NSLayoutRelationEqual
//                                                              toItem:self.view
//                                                           attribute:NSLayoutAttributeHeight
//                                                          multiplier:0.3
//                                                            constant:0];
//    con.priority = UILayoutPriorityDefaultHigh;
//    [self.view addConstraint:con];
    
    //设置btn最小高度为150
//    [btn addConstraint:[NSLayoutConstraint constraintWithItem:btn
//                                                    attribute:NSLayoutAttributeHeight
//                                                    relatedBy:NSLayoutRelationGreaterThanOrEqual
//                                                       toItem:nil
//                                                    attribute:NSLayoutAttributeNotAnAttribute
//                                                   multiplier:1
//                                                     constant:150]];
    
    //注册KVO
//    [btn addObserver:self forKeyPath:@"bounds"
//             options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial
//             context:nil];
    
    //view1
    MyView *view1 = [MyView new];
    view1.backgroundColor = [UIColor yellowColor];
    //禁止AutoresizingMask转换成Autolayout
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:view1];
    //设置左右上边距为20
    [self setEdge:self.view view:view1 attr:NSLayoutAttributeLeft constant:20];
    [self setEdge:self.view view:view1 attr:NSLayoutAttributeTop constant:20];
    [self setEdge:self.view view:view1 attr:NSLayoutAttributeRight constant:-20];
    
    //view2
    
    MyView *view2 = [MyView new];
    view2.backgroundColor = [UIColor yellowColor];
    //禁止AutoresizingMask转换成Autolayout
    view2.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:view2];
    //设置左右下边距为20
    [self setEdge:self.view view:view2 attr:NSLayoutAttributeLeft constant:20];
    [self setEdge:self.view view:view2 attr:NSLayoutAttributeBottom constant:-20];
    [self setEdge:self.view view:view2 attr:NSLayoutAttributeRight constant:-20];
    
    //设置两个view上下间距为20
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:view2
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:view1
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:20]];
    //Content Hugging Priority代表控件拒绝拉伸的优先级。优先级越高，控件越不容易被拉伸
    //Content Compression Resistance Priority代表控件拒绝压缩内置空间(intrinsicContentSize)的优先级，优先级越高，控件的内置控件越不容易被压缩
    
    //提高view1的Content Hugging Priority
    [view1 setContentHuggingPriority:UILayoutPriorityDefaultHigh
                             forAxis:UILayoutConstraintAxisVertical];
    
    
}

//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
//{
//    if (object == btn && [keyPath isEqualToString:@"bounds"]) {
//        [btn setTitle:NSStringFromCGSize(btn.bounds.size) forState:UIControlStateNormal];
//    }
//}

//设置AutoLayout中的边距辅助方法
- (void)setEdge:(UIView *)superview view:(UIView *)view attr:(NSLayoutAttribute)attr constant:(CGFloat)constant
{
    [superview addConstraint:[NSLayoutConstraint constraintWithItem:view
                                                          attribute:attr
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:superview
                                                          attribute:attr
                                                         multiplier:1.0
                                                           constant:constant]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

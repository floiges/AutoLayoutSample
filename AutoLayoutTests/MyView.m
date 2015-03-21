//
//  MyView.m
//  AutoLayoutTests
//
//  Created by 224 on 15/3/21.
//  Copyright (c) 2015年 zoomlgd. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

//改写UIView的intrinsicContentSize
//控件的内置大小
- (CGSize)intrinsicContentSize
{
    return CGSizeMake(70, 40);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

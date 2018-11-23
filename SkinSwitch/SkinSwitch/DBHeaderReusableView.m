//
//  DBHeaderReusableView.m
//  SkinSwitch
//
//  Created by 崔曦 on 2018/11/7.
//  Copyright © 2018 崔曦. All rights reserved.
//

#import "DBHeaderReusableView.h"
#import "Masonry.h"

@implementation DBHeaderReusableView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame: frame];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
        [self omotUI];
    }
    return self;
}
-(void)omotUI{
    
    [self addSubview:self.headerView];
    [self addSubview:self.headerTitle];
    
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0);
        make.height.equalTo(@110);
    }];
    
    [self.headerTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.right.equalTo(self).offset(-15);
        make.top.equalTo(self.headerView.mas_bottom).offset(0);
        make.height.equalTo(@30);
    }];
}

-(UIView*)headerView{
    if (!_headerView) {
        _headerView=[[UIImageView alloc]init];
        _headerView.backgroundColor=[UIColor grayColor];
    }
    return _headerView;
}
-(UILabel*)headerTitle{
    if (!_headerTitle) {
        _headerTitle=[UILabel new];
        _headerTitle.font=[UIFont systemFontOfSize:16];
        _headerTitle.text=@"感谢你";
    }
    return _headerTitle;
}

@end

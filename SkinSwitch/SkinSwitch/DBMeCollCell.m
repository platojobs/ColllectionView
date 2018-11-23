//
//  DBMeCollCell.m
//  SkinSwitch
//
//  Created by 崔曦 on 2018/11/12.
//  Copyright © 2018 崔曦. All rights reserved.
//

#import "DBMeCollCell.h"

@implementation DBMeCollCell

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    
    if (self) {
        [self createSubViews];
    }
    return self;
}

-(void)createSubViews{
    [self.contentView addSubview:self.imageV];
    [self.contentView addSubview:self.titleTT];
    
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
        make.height.width.equalTo(@35);
    }];
    
    [self.titleTT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.imageV.mas_bottom).offset(5);
        make.left.right.equalTo(self.contentView);
    }];
    
}
-(UIImageView*)imageV{
    if (!_imageV) {
        _imageV=[[UIImageView alloc]init];
        _imageV.backgroundColor=[UIColor redColor];
    }
    return _imageV;
}
-(UILabel*)titleTT{
    if (!_titleTT) {
        _titleTT=[[UILabel alloc]init];
        _titleTT.font=[UIFont systemFontOfSize:14];
        _titleTT.text=@"FGHJ";
        _titleTT.textAlignment=NSTextAlignmentCenter;
    }
    return _titleTT;
}

@end

//
//  DBItemPayDetailView.m
//  SkinSwitch
//
//  Created by 崔曦 on 2018/11/19.
//  Copyright © 2018 崔曦. All rights reserved.
//

#import "DBItemPayDetailView.h"
#import "Masonry.h"
@implementation DBItemPayDetailView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self designUI];
    }
    return self;
}

-(void)designUI{
    
    [self addSubview:self.itemLb];
    [self addSubview:self.itemContentLb];
    [self addSubview:self.itemCopyBt];
    
    [self.itemLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.centerY.equalTo(self);
    }];
    
    [self.itemContentLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.greaterThanOrEqualTo(self.itemLb.mas_right).offset(5);
        make.centerY.equalTo(self);
        make.right.equalTo(self.itemCopyBt.mas_left).offset(-5);
    }];
    
    [self.itemCopyBt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(self);
        make.width.equalTo(@40);
        make.height.equalTo(self.mas_height);
    }];
    
    
}

-(UILabel*)itemLb{
    if (!_itemLb) {
        _itemLb=[UILabel new];
        _itemLb.font=[UIFont systemFontOfSize:14];
        _itemLb.text=@"HHHH:";
    }
    return _itemLb;
}
-(UILabel*)itemContentLb{
    if (!_itemContentLb) {
        _itemContentLb=[UILabel new];
        _itemContentLb.font=[UIFont systemFontOfSize:14];
        _itemContentLb.text=@"HHHHHHHHHHHHHkjjkj";
    }
    return _itemContentLb;
}
-(UIButton*)itemCopyBt{
    if (!_itemCopyBt) {
        _itemCopyBt=[UIButton buttonWithType:UIButtonTypeCustom];
        [_itemCopyBt setTitle:@"koko" forState:UIControlStateNormal];
       // [_itemCopyBt setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
    return _itemCopyBt;
}

@end

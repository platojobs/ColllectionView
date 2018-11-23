//
//  ViewController.m
//  SkinSwitch
//
//  Created by 崔曦 on 2018/11/6.
//  Copyright © 2018 崔曦. All rights reserved.
//

#import "ViewController.h"
#import <DKNightVersion/DKNightVersion.h>
#import "DBMeController.h"
#import "YYText.h"
#import "DBItemPayDetailView.h"
@interface ViewController ()
{
    
    __weak IBOutlet UITextField *pas;
     YYLabel *labe;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DBItemPayDetailView*vi=[[DBItemPayDetailView alloc]initWithFrame:CGRectMake(0, 400, self.view.bounds.size.width, 50)];
    vi.backgroundColor=[UIColor grayColor];
    [self.view addSubview:vi];
    
//  [self link];
    //self.view.backgroundColor=[UIColor blueColor];
//
//    UILabel *navigationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 375, 44)];
//    navigationLabel.text = @"DKNightVersion";
//    navigationLabel.textAlignment = NSTextAlignmentCenter;
//    self.navigationItem.titleView = navigationLabel;
//
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Present" style:UIBarButtonItemStylePlain target:self action:@selector(present)];
//    self.navigationItem.leftBarButtonItem = item;
//
//    UIBarButtonItem *normalItem = [[UIBarButtonItem alloc] initWithTitle:@"Normal" style:UIBarButtonItemStylePlain target:self action:@selector(normal)];
//    normalItem.dk_tintColorPicker = DKColorPickerWithKey(TINT);
//    UIBarButtonItem *nightItem = [[UIBarButtonItem alloc] initWithTitle:@"Night" style:UIBarButtonItemStylePlain target:self action:@selector(night)];
//    nightItem.dk_tintColorPicker = DKColorPickerWithKey(TINT);
//    UIBarButtonItem *redItem = [[UIBarButtonItem alloc] initWithTitle:@"Red" style:UIBarButtonItemStylePlain target:self action:@selector(red)];
//    redItem.dk_tintColorPicker = DKColorPickerWithKey(TINT);
//
//    self.navigationItem.rightBarButtonItems = @[normalItem, nightItem, redItem];
//
//    navigationLabel.dk_textColorPicker = DKColorPickerWithKey(TEXT);
//    self.navigationController.navigationBar.dk_barTintColorPicker = DKColorPickerWithKey(BAR);
//    self.navigationItem.leftBarButtonItem.dk_tintColorPicker = DKColorPickerWithKey(TINT);
//
//    [pas addTarget:self action:@selector(chech:) forControlEvents:UIControlEventEditingDidEnd];
//
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)link{
    labe=[YYLabel new];
    labe.frame=CGRectMake(15, 100, 100, 30);
    //NSMutableAttributedString *text = [NSMutableAttributedString new];
    NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"LinkLinkLink"];
    one.yy_font = [UIFont boldSystemFontOfSize:10];
    one.yy_underlineStyle = NSUnderlineStyleSingle;
    
    /// 1. you can set a highlight with these code
    /*
     one.yy_color = [UIColor colorWithRed:0.093 green:0.492 blue:1.000 alpha:1.000];
     
     YYTextBorder *border = [YYTextBorder new];
     border.cornerRadius = 3;
     border.insets = UIEdgeInsetsMake(-2, -1, -2, -1);
     border.fillColor = [UIColor colorWithWhite:0.000 alpha:0.220];
    
     YYTextHighlight *highlight = [YYTextHighlight new];
    
     highlight.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
      NSLog(@"++++++++?????");
     };
     [one yy_setTextHighlight:highlight range:one.yy_rangeOfAll];
      */
    
    //2. or you can use the convenience method
    [one yy_setTextHighlightRange:one.yy_rangeOfAll
                            color:[UIColor colorWithRed:0.093 green:0.492 blue:1.000 alpha:1.000]
                  backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]
                        tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect){
                            NSLog(@"++++++++?????");

                        }];
    
    
    labe.attributedText=one;
    labe.textAlignment = NSTextAlignmentCenter;
    labe.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    labe.numberOfLines = 0;
    [self.view addSubview:labe];
}

#pragma mark - Object Private Function

- (NSAttributedString *)padding
{
    NSMutableAttributedString *pad = [[NSMutableAttributedString alloc] initWithString:@"\n\n"];
    pad.yy_font = [UIFont systemFontOfSize:4];
    return pad;
}




-(void)chech:(UITextField*)tf{
    if ([self checkPassword:tf.text]) {
        tf.text=@"s";
    }else{
        tf.text=@"F";
    }
}
-(BOOL)checkPassword:(NSString *) password
{
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{8,20}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
}

- (void)night {
    self.dk_manager.themeVersion = DKThemeVersionNight;
}

- (void)normal {
    self.dk_manager.themeVersion = DKThemeVersionNormal;
}

- (void)red {
    self.dk_manager.themeVersion = @"RED";
}

- (IBAction)change {
    
//    if ([self.dk_manager.themeVersion isEqualToString:DKThemeVersionNight]) {
//        [self.dk_manager dawnComing];
//    } else {
//        [self.dk_manager nightFalling];
//    }
//    [self.view endEditing:YES];
    
    [self.navigationController pushViewController:[[DBMeController alloc] init] animated:YES];
    
    
}

- (void)push {
    [self.navigationController pushViewController:[[DBMeController alloc] init] animated:YES];
}

- (void)present {
    [self presentViewController:[[UIViewController alloc] init] animated:YES completion:nil];
}


@end

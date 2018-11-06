//
//  ViewController.m
//  SkinSwitch
//
//  Created by 崔曦 on 2018/11/6.
//  Copyright © 2018 崔曦. All rights reserved.
//

#import "ViewController.h"
#import <DKNightVersion/DKNightVersion.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.view.backgroundColor=[UIColor blueColor];
    
    UILabel *navigationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 375, 44)];
    navigationLabel.text = @"DKNightVersion";
    navigationLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = navigationLabel;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Present" style:UIBarButtonItemStylePlain target:self action:@selector(present)];
    self.navigationItem.leftBarButtonItem = item;
    
    UIBarButtonItem *normalItem = [[UIBarButtonItem alloc] initWithTitle:@"Normal" style:UIBarButtonItemStylePlain target:self action:@selector(normal)];
    normalItem.dk_tintColorPicker = DKColorPickerWithKey(TINT);
    UIBarButtonItem *nightItem = [[UIBarButtonItem alloc] initWithTitle:@"Night" style:UIBarButtonItemStylePlain target:self action:@selector(night)];
    nightItem.dk_tintColorPicker = DKColorPickerWithKey(TINT);
    UIBarButtonItem *redItem = [[UIBarButtonItem alloc] initWithTitle:@"Red" style:UIBarButtonItemStylePlain target:self action:@selector(red)];
    redItem.dk_tintColorPicker = DKColorPickerWithKey(TINT);
    
    self.navigationItem.rightBarButtonItems = @[normalItem, nightItem, redItem];
    
    navigationLabel.dk_textColorPicker = DKColorPickerWithKey(TEXT);
    self.navigationController.navigationBar.dk_barTintColorPicker = DKColorPickerWithKey(BAR);
    self.navigationItem.leftBarButtonItem.dk_tintColorPicker = DKColorPickerWithKey(TINT);
    
    // Do any additional setup after loading the view, typically from a nib.
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
    
    if ([self.dk_manager.themeVersion isEqualToString:DKThemeVersionNight]) {
        [self.dk_manager dawnComing];
    } else {
        [self.dk_manager nightFalling];
    }
}

- (void)push {
    [self.navigationController pushViewController:[[UIViewController alloc] init] animated:YES];
}

- (void)present {
    [self presentViewController:[[UIViewController alloc] init] animated:YES completion:nil];
}


@end

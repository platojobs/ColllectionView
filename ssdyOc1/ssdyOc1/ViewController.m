//
//  ViewController.m
//  ssdyOc1
//
//  Created by 崔曦 on 2018/11/16.
//  Copyright © 2018 崔曦. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    //绝对路径
//    NSString*directPath=@"/Users/cuixi/desktop";
//    //通过函数获取路径
//    NSArray*paths=NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
//    NSString*deskPath=paths[0];
//    //文件路径
//    NSString*filePath1=[directPath stringByAppendingString:@"myfile.txt"];
//    NSLog(@"direc==%@",directPath);
//    NSString*filePath2=[deskPath stringByAppendingPathComponent:@"myfile.txt"];
//    NSLog(@"desk==%@",deskPath);
//    NSFileManager*manager=[NSFileManager defaultManager];
//
//    if ([manager fileExistsAtPath:filePath1]) {
//        NSLog(@"myfile.txt exist in filePath1");
//
//    }else if([manager fileExistsAtPath:filePath2]){
//        NSLog(@"myfile.txt exist in filePath2");
//    }else{
//        NSLog(@"not exist in all");
//    }
    UITextView*text=[[UITextView alloc]init];
    text.frame=CGRectMake(0, 0, self.view.bounds.size.width, 100);
    text.text=@"大概意思是UILayoutGuide用于提供一个矩形区域可以用Auto Layout来定制一些约束特性，作为一个虚拟的view使用.我想大概是苹果的工程师觉得以前的topLayoutGuide/bottomLayoutGuide提供虚拟占坑view，隔离导航栏/tabber的思想不错，进而有了启发，能不能让整个LayoutGuide变得更灵活，让开发者能够自由定制，于是这个UILayoutGuide类就设计出来了。。那么如何自由定制一个UILayoutGuide，我们看看这个类的几个属大概意思是UILayoutGuide用于提供一个矩形区域可以用Auto Layout来定制一些约束特性，作为一个虚拟的view使用.我想大概是苹果的工程师觉得以前的topLayoutGuide/bottomLayoutGuide提供虚拟占坑view，隔离导航栏/tabber的思想不错，进而有了启发，能不能让整个LayoutGuide变得更灵活，让开发者能够自由定制，于是这个UILayoutGuide类就设计出来了。。那么如何自由定制一个UILayoutGuide，我们看看这个类的几个属大概意思是UILayoutGuide用于提供一个矩形区域可以用Auto Layout来定制一些约束特性，作为一个虚拟的view使用.我想大概是苹果的工程师觉得以前的topLayoutGuide/bottomLayoutGuide提供虚拟占坑view，隔离导航栏/tabber的思想不错，进而有了启发，能不能让整个LayoutGuide变得更灵活，让开发者能够自由定制，于是这个UILayoutGuide类就设计出来了。。那么如何自由定制一个UILayoutGuide，我们看看这个类的几个属大概意思是UILayoutGuide用于提供一个矩形区域可以用Auto Layout来定制一些约束特性，作为一个虚拟的view使用.我想大概是苹果的工程师觉得以前的topLayoutGuide/bottomLayoutGuide提供虚拟占坑view，隔离导航栏/tabber的思想不错，进而有了启发，能不能让整个LayoutGuide变得更灵活，让开发者能够自由定制，于是这个UILayoutGuide类就设计出来了。。那么如何自由定制一个UILayoutGuide，我们看看这个类的几个属性：";
    
    text.editable=NO;
    [self.view addSubview:text];
    
    // Do any additional setup after loading the view, typically from a nib.
}


@end

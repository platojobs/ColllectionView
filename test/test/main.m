//
//  main.m
//  test
//
//  Created by 崔曦 on 2018/11/16.
//  Copyright © 2018 崔曦. All rights reserved.
//

#import <Foundation/Foundation.h>



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /*
         两种获取文件路径的方式
         */
        
        //绝对路径
        NSString*directPath=@"/Users/cuixi/desktop";  //目录路径，直接通过路径获取
        //通过函数获取路径
        NSArray*paths=NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
        NSString*deskPath=paths[0];
        //文件路径
        NSString*filePath1=[directPath stringByAppendingPathComponent:@"myfile.txt"];
        NSLog(@"direc==%@",directPath);
        NSString*filePath2=[deskPath stringByAppendingPathComponent:@"myfile.txt"];
        NSLog(@"desk==%@",deskPath);
        NSFileManager*manager=[NSFileManager defaultManager];
        
        NSLog(@"f1=%@,f2=%@",filePath1,filePath2);
        
        if ([manager fileExistsAtPath:filePath1]) {
            NSLog(@"myfile.txt exist in filePath1");
            
        }
        if([manager fileExistsAtPath:filePath2]){
            NSLog(@"myfile.txt exist in filePath2");
        }
        
//        //赋值、移动、删除
//        // 仅仅是移动
//        if ([manager copyItemAtPath:@"/Users/cuixi/desktop/myfile.txt" toPath:@"/Users/cuixi/desktop/python学习/myfile.txt" error:nil]) {
//            NSLog(@"移动文件success");
//        }
//        // 移动和改名，原来位置的文件不在了，在新的位置。
//        if ([manager moveItemAtPath:@"/Users/cuixi/desktop/myfile.txt" toPath:@"/Users/cuixi/desktop/python学习/moveItem.txt" error:nil]) {
//            NSLog(@"移动文件，修改文件名称success");
//        }
//        //删除文件
//        if ([manager removeItemAtPath:@"/Users/cuixi/desktop/python学习/moveItem.txt" error:nil]&&[manager removeItemAtPath:@"/Users/cuixi/desktop/python学习/myfile.txt" error:nil]) {
//            NSLog(@"删除文件success");
//        }
        
        NSDictionary*fileArr=[manager attributesOfItemAtPath:filePath1 error:nil];
        
        NSLog(@"文件属性==%@",fileArr);
        
        /*
         
         NSFileCreationDate = "2018-11-16 03:45:31 +0000";
         NSFileExtensionHidden = 0;
         NSFileGroupOwnerAccountID = 20;
         NSFileGroupOwnerAccountName = staff;
         NSFileHFSCreatorCode = 0;
         NSFileHFSTypeCode = 0;
         NSFileModificationDate = "2018-11-16 03:45:31 +0000";
         NSFileOwnerAccountID = 501;
         NSFileOwnerAccountName = cuixi;
         NSFilePosixPermissions = 420;
         NSFileReferenceCount = 1;
         NSFileSize = 0;
         NSFileSystemFileNumber = 3456785;
         NSFileSystemNumber = 16777220;
         NSFileType = NSFileTypeRegular;
         
         */
        NSDictionary*nwFilleArr=[NSDictionary dictionaryWithObjectsAndKeys:[NSDate distantFuture],NSFileCreationDate, nil];
        [manager setAttributes:nwFilleArr ofItemAtPath:filePath1 error:nil];
        NSDictionary*nwFilarr=[manager attributesOfItemAtPath:filePath1 error:nil];
        //修改了文件的属性，创建时间
        NSLog(@"createDate=%@,当前目录=%@",nwFilarr[NSFileCreationDate],manager.currentDirectoryPath);
        
        [manager changeCurrentDirectoryPath:deskPath];
        NSLog(@"变更后的目录=%@",manager.currentDirectoryPath);
        
        //枚举目录中的内容
        
        NSDirectoryEnumerator*deskEnum=[manager enumeratorAtPath:deskPath];
        NSString *path;
        while (path=[deskEnum nextObject]) {
         //   NSLog(@"枚举出来的目录文件===%@",path); //子目录就会被列举出来，子文件夹的内容也会列出来
        }
        NSArray*deskAtt=[manager contentsOfDirectoryAtPath:deskPath error:nil];
        //遍历打印目录
        NSString *npath;
        for (npath in deskAtt) {
          //  NSLog(@"遍历方式打印的目录=%@",npath);// 列出 当前 目录 中的 文件 和 文件夹 名称， 但 子 文件夹 中的 内容 并不 显示。这个和s上述的枚举列出不一样的。
        }
        
        //文件的读去取操作
        NSData*fileData=[manager contentsAtPath:filePath2];
        NSString*fileContent=[[NSString alloc] initWithData:fileData encoding:NSUTF8StringEncoding];
        NSLog(@"e文件内容=%@",fileContent);
        
        NSData*writeContent=[@"利息" dataUsingEncoding:NSUTF8StringEncoding];
        if ([writeContent writeToFile:filePath2 atomically:YES]) {
            NSLog(@"这是用写文件方式");
        }
        if ([manager createFileAtPath:filePath2 contents:writeContent attributes:nil]) {
            NSLog(@"这是用文件管理器方法");
        }
        //上面是覆盖式的写入文件
        //下面是追加文本写入
        NSFileHandle*fileHanle=[NSFileHandle fileHandleForWritingAtPath:filePath2];
        if (!fileHanle) {
            NSLog(@"失败了");
        }
        [fileHanle seekToEndOfFile];
        [fileHanle writeData:[@"我是新增加的文本呀，真的是呀" dataUsingEncoding:NSUTF8StringEncoding]];
        [fileHanle closeFile];
        
        NSBundle*mainB=[NSBundle mainBundle];
        // 第一个参数为文件名
        // 第二个参数为文件类型
        NSString*file=[mainB pathForResource:@"myfile" ofType:@"txt"];
        NSLog(@"文件=%@",file);
        //block就是封装了一组代码语句的对象，任何时候都可以执行，并且可以作为参数，而且可以也有返回值
        
     
       
        
        
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}

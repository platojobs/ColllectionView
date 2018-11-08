//
//  DBMeController.m
//  SkinSwitch
//
//  Created by 崔曦 on 2018/11/7.
//  Copyright © 2018 崔曦. All rights reserved.
//

#import "DBMeController.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "DBHeaderReusableView.h"
@interface DBMeController ()<UICollectionViewDelegate,UICollectionViewDataSource,CHTCollectionViewDelegateWaterfallLayout>
@property(nonatomic,strong)UICollectionView*collectionView;
@property(nonatomic,assign)BOOL isRT;
@end

@implementation DBMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CHTCollectionViewWaterfallLayout*layout=[CHTCollectionViewWaterfallLayout new];
    layout.sectionInset=UIEdgeInsetsMake(5, 5, 5, 5 );
   // layout.headerHeight=300;
   // layout.footerHeight=10;
    layout.columnCount=3;
    layout.minimumColumnSpacing=10;
    layout.minimumInteritemSpacing=5;
    
    self.collectionView=[[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[DBHeaderReusableView class] forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader withReuseIdentifier:@"head"];
  //  [self.collectionView registerClass:[UIView class] forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    
    [self.view addSubview:self.collectionView];
    
    
    // Do any additional setup after loading the view.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell*cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
     UIColor * randomColor= [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    cell.contentView.backgroundColor=randomColor;
    return cell;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    self.isRT=YES;
    [self.collectionView reloadData];
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return  CGSizeMake((self.view.bounds.size.width-40)/3,100);
}
- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionReusableView *reusableview = nil;
    if (kind == CHTCollectionElementKindSectionHeader){
        
        switch (indexPath.section) {
            case 0:
            {
                DBHeaderReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
                if (self.isRT) {
                    headerView.headerView.backgroundColor=[UIColor redColor];
                }else{
                    headerView.headerView.backgroundColor=[UIColor orangeColor];
                }
                reusableview = headerView;
            }
                break;
            case 1:
            {
                UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"head" forIndexPath:indexPath];
                [headerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, self.view.bounds.size.width, 30)];
                label.text = @"项目管理";
                label.textColor = [UIColor redColor];
                label.font = [UIFont systemFontOfSize:16];
                [headerView addSubview:label];
                reusableview = headerView;
            }
                break;
            default:
                break;
        }
    }
    return reusableview;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return 363;
    }else {
        return 30;
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.isRT=YES;
    [self.collectionView reloadData];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

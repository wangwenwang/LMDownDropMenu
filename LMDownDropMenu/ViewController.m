//
//  ViewController.m
//  LMDownDropMenu
//
//  Created by 凯东源 on 17/6/27.
//  Copyright © 2017年 LM. All rights reserved.
//

#import "ViewController.h"
#import "LMDropMenu.h"
#import "DataItemModel.h"

@interface ViewController ()<LMDropDownMenuDataSource, LMDropDownMenuDelegate>

@property (strong, nonatomic) NSDictionary *MultiArrList;

@end

@implementation ViewController

- (instancetype)init {
    
    if(self = [super init]) {
        
        _MultiArrList = [[NSDictionary alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    
    NSArray *arr1 = @[@"a", @"b", @"c"];
    NSArray *arr2 = @[@"1", @"2", @"3", @"4"];
    NSArray *arr3 = @[@"a", @"r", @"c", @"h", @"i", @"v", @"e"];
    
    NSMutableArray *array1 = [[NSMutableArray alloc] init];
    for (int i = 0; i < arr1.count; i++) {
        
        DataItemModel *m = [[DataItemModel alloc] init];
        m.title = arr1[i];
        m.selected = NO;
        
        [array1 addObject:m];
    }
    
    NSMutableArray *array2 = [[NSMutableArray alloc] init];
    for (int i = 0; i < arr2.count; i++) {
        
        DataItemModel *m = [[DataItemModel alloc] init];
        m.title = arr2[i];
        m.selected = NO;
        
        [array2 addObject:m];
    }
    
    NSMutableArray *array3 = [[NSMutableArray alloc] init];
    for (int i = 0; i < arr3.count; i++) {
        
        DataItemModel *m = [[DataItemModel alloc] init];
        m.title = arr3[i];
        m.selected = NO;
        
        [array3 addObject:m];
    }
    
    _MultiArrList = @{@(0) : [array1 copy], @(1) : [array2 copy], @(2) : [array3 copy]};
    
    
    
    LMDropMenu *menu = [[LMDropMenu alloc] initWithOrigin:CGPointMake(0, 20) andHeight:45];
    menu.indicatorColor = [UIColor colorWithRed:175.0f/255.0f green:175.0f/255.0f blue:175.0f/255.0f alpha:1.0];
    menu.separatorColor = [UIColor colorWithRed:210.0f/255.0f green:210.0f/255.0f blue:210.0f/255.0f alpha:1.0];
    menu.textColor = [UIColor colorWithRed:83.f/255.0f green:83.f/255.0f blue:83.f/255.0f alpha:1.0f];
    menu.dataSource = self;
    menu.delegate = self;
    
    [self.view addSubview:menu];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - LMDropDownMenuDelegate

- (NSUInteger)menu:(LMDropMenu *)menu numberOfRowsInColumn:(NSUInteger)column {
    
    NSArray *array = _MultiArrList[@(column)];
    
    return array.count;
}


- (DataItemModel *)menu:(LMDropMenu *)menu titleForRowAtIndexPath:(LMIndexPath *)indexPath {
    
    NSArray *array = _MultiArrList[@(indexPath.column)];
    
    DataItemModel *item = array[indexPath.row];
    
    return item;
}


- (void)menu:(LMDropMenu *)menu didSelectRowAtIndexPath:(LMIndexPath *)indexPath {
    
    NSLog(@"column:%ld  row:%ld", (long)indexPath.column, (long)indexPath.row);
    
    DataItemModel *item = _MultiArrList[@(indexPath.column)][indexPath.row];
    
    item.selected = !item.selected;
}


- (NSInteger)numberOfColumnsInMenu:(LMDropMenu *)menu {
    
    return _MultiArrList.count;
}


- (NSString *)menu:(LMDropMenu *)menu titleForColumn:(NSInteger)column {
    
    if(column == 0) {
        
        return @"城市筛选";
    } else if(column == 1) {
        
        return @"车尺寸筛选";
    } else if(column == 2) {
        
        return @"车类型筛选";
    } else {
        
        return @"";
    }
}

@end

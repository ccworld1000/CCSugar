//
//  ViewController.m
//  CCSugariOS
//
//  Created by dengyouhua on 17/4/1 - now.
//  Copyright © 2017年 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCSugar

#import "ViewController.h"
#import <CCSugar.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *list;
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UILabel *resultList;


@property (nonatomic) NSInteger index;
@property (nonatomic) NSInteger elementCount;


@property (nonatomic, strong) NSMutableArray *elementList;
@property (nonatomic, strong) NSMutableArray *array;


@end

@implementation ViewController

- (NSMutableArray *)elementList {
    if (!_elementList) {
        _elementList = [NSMutableArray arrayWithCapacity:self.elementCount];
    }
    
    return _elementList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.elementCount = 5;
    
    NSInteger count = 18;
    
    _array = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; i++) {
        [_array addObject: [NSString stringWithFormat:@"%i", i]];
        
    }
    
    _list.text =  [_array componentsJoinedByString:@" | "];
    _list.adjustsFontSizeToFitWidth = YES;
    _resultList.adjustsFontSizeToFitWidth = YES;
    
    [self elemHandle:nil];
    
    [self.button setTitle:[NSString stringWithFormat:@"get %ld element list", self.elementCount] forState:UIControlStateNormal];
    
}

- (IBAction) elemHandle :(id)sender {
    _indexLabel.text = [NSString stringWithFormat:@"    %ld", self.index];
    
    if (self.elementList.count) {
        [self.elementList removeAllObjects];
    }

    NSArray *list = [self.array getOneGroup:self.elementCount position:self.index];
    
    [self.elementList concat:list];
    
    if (self.elementList.count) {
         _resultList.text =  [_elementList componentsJoinedByString:@" | "];
    }
    
    self.index++;
    
    
}


@end

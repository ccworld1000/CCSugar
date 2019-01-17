//
//  ViewController.m
//  CCSugariOS
//
//  Created by dengyouhua on 17/4/1 - now.
//  Copyright © 2017年 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCSugar

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *list;
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;

@property (nonatomic) NSInteger index;
@property (nonatomic) NSInteger elementCount;
@property (weak, nonatomic) IBOutlet UIButton *button;

@property (nonatomic, strong) NSMutableArray *elementList;

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
    
//    if (<#condition#>) {
//        <#statements#>
//    }
    
    NSInteger count = 18;
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; i++) {
        [array addObject: [NSString stringWithFormat:@"%i", i]];
        
    }
    
    _list.text =  [array componentsJoinedByString:@" | "];
    
    [self elemHandle:nil];
    
    [self.button setTitle:[NSString stringWithFormat:@"get %ld element list", self.elementCount] forState:UIControlStateNormal];
    
}


- (IBAction) elemHandle :(id)sender {
    _indexLabel.text = [NSString stringWithFormat:@"    %ld", self.index];
    
    self.index++;
    
    
}


@end

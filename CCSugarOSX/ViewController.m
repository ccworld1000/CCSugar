//
//  ViewController.m
//  CCSugarOSX
//
//  Created by dengyouhua on 17/4/1 - now.
//  Copyright © 2017年 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCSugar

#import "ViewController.h"
#import <CCSugar.h>

@interface ViewController ()

@property (weak) IBOutlet NSTextField *list;
@property (weak) IBOutlet NSTextField *indexLabel;
@property (weak) IBOutlet NSTextField *resultList;

@property (weak) IBOutlet NSButton *button;

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

    // Do any additional setup after loading the view.
    
    self.elementCount = 5;
    
    NSInteger count = 18;
    
    _array = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; i++) {
        [_array addObject: [NSString stringWithFormat:@"%i", i]];
        
    }
    
    _list.stringValue =  [_array componentsJoinedByString:@" | "];
    [_list sizeToFit];
    [_resultList sizeToFit];
    
    [self elemHandle:nil];
    
    [self.button setTitle:[NSString stringWithFormat:@"get %ld element list", self.elementCount]];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)elemHandle:(NSButton *)sender {
    
    _indexLabel.stringValue = [NSString stringWithFormat:@"    %ld", self.index];
    
    if (self.elementList.count) {
        [self.elementList removeAllObjects];
    }
    
    NSArray *list = [self.array getOneGroup:self.elementCount position:self.index];

    [self.elementList concat:list];

    if (self.elementList.count) {
        _resultList.stringValue =  [_elementList componentsJoinedByString:@" | "];
    }
    
    self.index++;
}

@end

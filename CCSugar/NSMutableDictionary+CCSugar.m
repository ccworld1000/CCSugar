//
//  NSMutableDictionary+CCSugar.m
//  CCSugar
//
//  Created by dengyouhua on 17/4/1.
//  Copyright © 2017年 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "NSMutableDictionary+CCSugar.h"

@implementation NSMutableDictionary (CCSugar)

- (void) push : (id)object forKey: (NSString *)key {
    if (!key) {
        NSLog(@"ill key");
        return;
    }
    
    [self setObject:object forKey:key];
}

- (id) pop : (NSString *)key {
    if (!key) {
        NSLog(@"ill key");
        return nil;
    }
    
    return [self objectForKey: key];
}

@end

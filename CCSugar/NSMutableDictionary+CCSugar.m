//
//  NSMutableDictionary+CCSugar.m
//  CCSugar
//
//  Created by dengyouhua on 17/4/1 - now.
//  Copyright © 2017年 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCSugar

#import "NSMutableDictionary+CCSugar.h"

@implementation NSMutableDictionary (CCSugar)

- (void) push:(id)object forKey:(NSString *)key {
    if (!key) {
        NSLog(@"ill key");
        return;
    }

    [self setObject:object forKey:key];
}

- (id) pop:(NSString *)key {
    if (!key) {
        NSLog(@"ill key");
        return nil;
    }

    return [self objectForKey:key];
}

@end

//
//  NSDictionary+CCSugar.h
//  CCSugar
//
//  Created by dengyouhua on 17/4/1 - now.
//  Copyright © 2017年 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCSugar

#import <Foundation/Foundation.h>

@interface NSDictionary (CCSugar)

- (void)each:(void (^)(id key, id value))block;
- (void)eachKey:(void (^)(id key))block;
- (void)eachValue:(void (^)(id value))block;
- (NSArray *)map:(id (^)(id key, id value))block;
- (BOOL)hasKey:(id)key;
- (NSDictionary *)pick:(NSArray *)keys;
- (NSDictionary *)omit:(NSArray *)keys;
- (NSDictionary *)merge:(NSDictionary *)dictionary;
- (NSDictionary *)merge:(NSDictionary *)dictionary block:(id(^)(id key, id oldVal, id newVal))block;
- (NSDictionary *)invert;

@end

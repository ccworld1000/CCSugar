//
//  NSNumber+CCSugar.h
//  CCSugar
//
//  Created by dengyouhua on 17/4/1 - now.
//  Copyright © 2017年 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCSugar

#import <Foundation/Foundation.h>

@interface NSNumber (CCSugar)

- (void)times:(void(^)(void))block;
- (void)timesWithIndex:(void(^)(NSUInteger index))block;

- (void)upto:(int)number do:(void(^)(NSInteger number))block;
- (void)downto:(int)number do:(void(^)(NSInteger number))block;

// Numeric inflections
- (NSNumber *)seconds;
- (NSNumber *)minutes;
- (NSNumber *)hours;
- (NSNumber *)days;
- (NSNumber *)weeks;
- (NSNumber *)fortnights;
- (NSNumber *)months;
- (NSNumber *)years;

// There are singular aliases for the above methods
- (NSNumber *)second;
- (NSNumber *)minute;
- (NSNumber *)hour;
- (NSNumber *)day;
- (NSNumber *)week;
- (NSNumber *)fortnight;
- (NSNumber *)month;
- (NSNumber *)year;

- (NSDate *)ago;
- (NSDate *)ago:(NSDate *)time;
- (NSDate *)since:(NSDate *)time;
- (NSDate *)until:(NSDate *)time;
- (NSDate *)fromNow;

@end

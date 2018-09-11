//
//  CCSugar.h
//  CCSugar
//
//  Created by dengyouhua on 17/4/1 - now.
//  Copyright © 2017年 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCSugar

#import <Foundation/Foundation.h>

#undef unless
#undef until

// C SUGAR
#define unless(condition...) if(!(condition))
#define until(condition...) while(!(condition))

// OBJC SUGAR
#import "NSNumber+CCSugar.h"
#import "NSArray+CCSugar.h"
#import "NSMutableArray+CCSugar.h"
#import "NSDictionary+CCSugar.h"
#import "NSMutableDictionary+CCSugar.h"
#import "NSSet+CCSugar.h"
#import "NSString+CCSugar.h"

@interface CCSugar : NSObject

@end

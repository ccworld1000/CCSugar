//
//  NSMutableDictionary+CCSugar.h
//  CCSugar
//
//  Created by dengyouhua on 17/4/1.
//  Copyright © 2017年 cc | ccworld1000@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (CCSugar)


- (void) push : (id)object forKey: (NSString *)key;
- (id) pop : (NSString *)key;

@end

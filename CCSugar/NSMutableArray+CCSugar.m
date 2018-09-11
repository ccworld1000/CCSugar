//
//  NSMutableArray+CCSugar.m
//  CCSugar
//
//  Created by dengyouhua on 17/4/1 - now.
//  Copyright © 2017年 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCSugar

#import "NSMutableArray+CCSugar.h"

@implementation NSMutableArray (CCSugar)

- (void) push:(id)object {
    [self addObject:object];
}

- (id) pop {
    id object = [self lastObject];

    [self removeLastObject];

    return object;
}

- (NSArray *) pop:(NSUInteger)numberOfElements {
    NSMutableArray * array = [NSMutableArray arrayWithCapacity:numberOfElements];

    for (NSUInteger i = 0; i < numberOfElements; i++) {
        [array insertObject:[self pop] atIndex:0];
    }

    return array;
}

- (void) concat:(NSArray *)array {
    [self addObjectsFromArray:array];
}

- (id) shift {
    NSArray * result = [self shift:1];

    return [result firstObject];
}

- (NSArray *) shift:(NSUInteger)numberOfElements {
    NSUInteger shiftLength = MIN(numberOfElements, [self count]);

    NSRange range = NSMakeRange(0, shiftLength);
    NSArray * result = [self subarrayWithRange:range];

    [self removeObjectsInRange:range];

    return result;
}

- (NSArray *) keepIf:(BOOL (^)(id object))block {
    [self filterUsingPredicate:[NSPredicate predicateWithBlock:^BOOL (id evaluatedObject, NSDictionary * bindings) {
                                    return block(evaluatedObject);
                                }]];
    return self;
}

@end

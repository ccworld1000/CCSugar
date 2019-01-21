//
//  NSMutableArray+CCSugar.h
//  CCSugar
//
//  Created by dengyouhua on 17/4/1 - now.
//  Copyright © 2017年 cc | ccworld1000@gmail.com. All rights reserved.
//  https://github.com/ccworld1000/CCSugar

#import <Foundation/Foundation.h>

@interface NSMutableArray (CCSugar)

/// Alias for -addObject. Appends the given object at the end
- (void)push:(id)object;

/**
 Removes the last item of the array, and returns that item
 Note: This method changes the length of the array!
 
 @return First array item or nil.
 */
- (id)pop;


/**
 Removes the last n items of the array, and returns that item
 Note: This method changes the length of the array!
 
 @return First array item or nil.
 */
- (NSArray *)pop:(NSUInteger)numberOfElements;
- (void)concat:(NSArray *)array;


/**
 Removes the first item of the array, and returns that item
 Note: This method changes the length of the array!
 
 @return First array item or nil.
 */
- (id)shift;


/**
 Removes N first items of the array, and returns that items
 Note: This method changes the length of the array!
 
 @return Array of first N items or empty array.
 */
- (NSArray *)shift:(NSUInteger)numberOfElements;


/**
 Deletes every element of the array for which the given block evaluates to NO.
 
 @param block block that returns YES/NO
 @return An array of elements
 */
- (NSArray *)keepIf:(BOOL (^)(id object))block;

/**
 Get a set of elements from an array
 
 @param count count
 @param from position from
 @return return value description
 */
- (NSArray *) getOneGroup : (NSUInteger) count position : (NSUInteger) from;

@end

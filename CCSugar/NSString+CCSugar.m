//
//  NSString+CCSugar.m
//  CCSugar
//
//  Created by dengyouhua on 17/4/1.
//  Copyright © 2017年 cc | ccworld1000@gmail.com. All rights reserved.
//

#import "NSString+CCSugar.h"
#import "NSArray+CCSugar.h"

static NSString * const UNDERSCORE = @"_";
static NSString * const SPACE = @" ";
static NSString * const EMPTY_STRING = @"";

NSString * NSStringWithFormat(NSString * formatString, ...) {
    va_list args;

    va_start(args, formatString);

    NSString * string = [[NSString alloc] initWithFormat:formatString arguments:args];

    va_end(args);

#if defined(__has_feature) && __has_feature(objc_arc)
    return string;
#else
    return [string autorelease];
#endif
}

@implementation NSString (CCSugar)

- (NSArray *) split {
    NSArray * result = [self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    return [result select:^BOOL (NSString * string) {
                return string.length > 0;
            }];
}

- (NSArray *) split:(NSString *)delimiter {
    return [self componentsSeparatedByString:delimiter];
}

- (NSString *) camelCase {
    NSString * spaced = [self stringByReplacingOccurrencesOfString:UNDERSCORE withString:SPACE];
    NSString * capitalized = [spaced capitalizedString];

    return [capitalized stringByReplacingOccurrencesOfString:SPACE withString:EMPTY_STRING];
}

- (NSString *) lowerCamelCase {
    NSString * upperCamelCase = [self camelCase];
    NSString * firstLetter = [upperCamelCase substringToIndex:1];

    return [upperCamelCase stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:firstLetter.lowercaseString];
}

- (BOOL) containsString:(NSString *)string {
    NSRange range = [self rangeOfString:string options:NSCaseInsensitiveSearch];

    return range.location != NSNotFound;
}

- (NSString *) strip {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *) match:(NSString *)pattern {
    NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:nil];
    NSTextCheckingResult * match = [regex firstMatchInString:self options:0 range:NSMakeRange(0, self.length)];

    return (match != nil) ? [self substringWithRange:[match range]] : nil;
}


@end

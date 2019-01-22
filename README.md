
> Write Objective C _like a boss_.<br/>

A set of functional additions for Foundation you wish you'd had in the first place.

## Screenshots

iPhone

![CCSugar iPhone Screenshot](https://github.com/ccworld1000/CCSugar/blob/master/Screenshots/iPhoneDemo.gif?raw=true)



osx

![CCSugar osx Screenshot](https://github.com/ccworld1000/CCSugar/blob/master/Screenshots/osxDemo.gif?raw=true)

## Support MAC OSX and iOS

start from ObjectiveSugar 1.1.1

## Usage

1. Install via [CocoaPods](http://cocoapods.org/)

	```
	pod 'CCSugar'
	```
2. Import the public header

	```objc
	#import <CCSugar.h>
	```
or

	```objc
	#import "CCSugar.h"

	```
### Documentation [more detail see CCSugarTest or source]


__NSNumber__ additions
``` objc
    [@3 times:^{
        NSLog(@"Hello!");
    }];
    // Hello!
    // Hello!
    // Hello!

    [@3 timesWithIndex:^(NSUInteger index) {
        NSLog(@"Another version with number: %lu", (unsigned long)index);
    }];
    // Another version with number: 0
    // Another version with number: 1
    // Another version with number: 2


    [@1 upto:4 do:^(NSInteger numbah) {
        NSLog(@"Current number.. %ld", (long)numbah);
    }];
    // Current number.. 1
    // Current number.. 2
    // Current number.. 3
    // Current number.. 4

    [@7 downto:4 do:^(NSInteger numbah) {
        NSLog(@"Current number.. %ld", (long)numbah);
    }];
    // Current number.. 7
    // Current number.. 6
    // Current number.. 5
    // Current number.. 4

    NSDate *firstOfDecember = [NSDate date]; // let's pretend it's 1st of December

    NSDate *firstOfNovember = [(@30).days since:firstOfDecember];
    NSLog(@"firstOfNovember : %@", firstOfNovember);

    NSDate *future = (@24).days.fromNow;
    NSLog(@"future : %@", future);

    NSDate *past = @(1).month.ago;
    NSLog(@"past : %@", past);
```

--

__NSArray__ / __NSSet__ additions
``` objc
// All of these methods return a modified copy of the array.
// They're not modifying the source array.

NSArray *cars = @[@"Testarossa", @"F50", @"F458 Italia"]; // or NSSet

[cars each:^(id object) {
    NSLog(@"Car: %@", object);
}];
// Car: Testarossa
// Car: F50
// Car: F458 Italia

[cars eachWithIndex:^(id object, NSUInteger index) {
    NSLog(@"Car: %@ index: %i", object, index);
}];
// Car: Testarossa index: 0
// Car: F50 index: 1
// Car: F458 Italia index: 2

[cars each:^(id object) {
    NSLog(@"Car: %@", object);
} options:NSEnumerationReverse];
// Car: F458 Italia
// Car: F50
// Car: Testarossa

[cars eachWithIndex:^(id object, NSUInteger index) {
    NSLog(@"Car: %@ index: %i", object, index);
} options:NSEnumerationReverse];
// Car: F458 Italia index: 2
// Car: F50 index: 1
// Car: Testarossa index: 0

[cars map:^(NSString* car) {
    return car.lowercaseString;
}];
// testarossa, f50, f458 italia

// Or, a more common example:
[cars map:^(NSString* carName) {
    return [[Car alloc] initWithName:carName];
}];
// array of Car objects

NSArray *mixedData = @[ @1, @"Objective Sugar!", @"Github", @4, @"5"];

[mixedData select:^BOOL(id object) {
  return ([object class] == [NSString class]);
}];
// Objective Sugar, Github, 5

[mixedData reject:^BOOL(id object) {
    return ([object class] == [NSString class]);
}];
// 1, 4

NSArray *numbers = @[ @5, @2, @7, @1 ];
[numbers sort];
// 1, 2, 5, 7

cars.sample
// 458 Italia
cars.sample
// F50

```
--
__NSArray__ only
``` objc

NSArray *numbers = @[@1, @2, @3, @4, @5, @6];

// index from 2 to 4
numbers[@"2..4"];
// [@3, @4, @5]

// index from 2 to 4 (excluded)
numbers[@"2...4"];
// [@3, @4]

// With NSRange location: 2, length: 4
numbers[@"2,4"];
// [@3, @4, @5, @6]

NSValue *range = [NSValue valueWithRange:NSMakeRange(2, 4)];
numbers[range];
// [@3, @4, @5, @6]

[numbers reverse];
// [@6, @5, @4, @3, @2, @1]


NSArray *fruits = @[ @"banana", @"mango", @"apple", @"pear" ];

[fruits includes:@"apple"];
// YES

[fruits take:3];
// banana, mango, apple

[fruits takeWhile:^BOOL(id fruit) {
    return ![fruit isEqualToString:@"apple"];
}];
// banana, mango

NSArray *nestedArray = @[ @[ @1, @2, @3 ], @[ @4, @5, @6, @[ @7, @8 ] ], @9, @10 ];
[nestedArray flatten];
// 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

NSArray *abc = @[ @"a", @"b", @"c" ];
[abc join];
// abc

[abc join:@"-"];
// a-b-c

NSArray *mixedData = @[ @1, @"Objective Sugar!", @"Github", @4, @"5"];

[mixedData detect:^BOOL(id object) {
    return ([object class] == [NSString class]);
}];
// Objective Sugar



// TODO: Make a better / simpler example of this
NSArray *landlockedCountries = @[ @"Bolivia", @"Paraguay", @"Austria", @"Switzerland", @"Hungary" ];
NSArray *europeanCountries = @[ @"France", @"Germany", @"Austria", @"Spain", @"Hungary", @"Poland", @"Switzerland" ];


[landlockedCountries intersectionWithArray:europeanCountries];
// landlockedEuropeanCountries = Austria, Switzerland, Hungary

[landlockedCountries unionWithArray:europeanCountries];
// landlockedOrEuropean = Bolivia, Paraguay, Austria, Switzerland, Hungary, France, Germany, Spain, Poland

[landlockedCountries relativeComplement:europeanCountries];
// nonEuropeanLandlockedCountries = Bolivia, Paraguay

[europeanCountries relativeComplement:landlockedCountries];
// notLandlockedEuropeanCountries = France, Germany, Spain, Poland

[landlockedCountries symmetricDifference:europeanCountries];
// uniqueCountries = Bolivia, Paraguay, France, Germany, Spain, Poland
```
--
__NSMutableArray__ additions
``` objc
NSMutableArray *people = [NSMutableArray arrayWithArray:@[ @"Alice", @"Benjamin", @"Christopher" ]];

[people push:@"Daniel"]; // Alice, Benjamin, Christopher, Daniel

[people pop]; // Daniel
// people = Alice, Benjamin, Christopher

[people pop:2]; // Benjamin, Christopher
// people = Alice

[people concat:@[ @"Evan", @"Frank", @"Gavin" ]];
// people = Alice, Evan, Frank, Gavin

[people keepIf:^BOOL(id object) {
    return [object characterAtIndex:0] == 'E';
}];
// people = Evan

```
--
__NSDictionary__ additions
``` objc
NSDictionary *dict = @{ @"one" : @1, @"two" : @2, @"three" : @3 };

[dict each:^(id key, id value){
    NSLog(@"Key: %@, Value: %@", key, value);
}];
// Key: one, Value: 1
// Key: two, Value: 2
// Key: three, Value: 3

[dict eachKey:^(id key) {
    NSLog(@"Key: %@", key);
}];
// Key: one
// Key: two
// Key: three

[dict eachValue:^(id value) {
    NSLog(@"Value: %@", value);
}];
// Value: 1
// Value: 2
// Value: 3

[dict invert];
// { 1 = one, 2 = two, 3 = three}

NSDictionary *errors = @{
    @"username" : @[ @"already taken" ],
    @"password" : @[ @"is too short (minimum is 8 characters)", @"not complex enough" ],
    @"email" : @[ @"can't be blank" ];
};

[errors map:^(id attribute, id reasons) {
    return NSStringWithFormat(@"%@ %@", attribute, [reasons join:@", "]);
}];
// username already taken
// password is too short (minimum is 8 characters), not complex enough
// email can't be blank

[errors hasKey:@"email"]
// true
[errors hasKey:@"Alcatraz"]
// false
```
--
__NSString__ additions
``` objc
NSString *sentence = NSStringWithFormat(@"This is a text-with-argument %@", @1234);
// This is a text-with-argument 1234

[sentence split];
// array = this, is, a, text-with-argument, 1234

[sentence split:@"-"]
// array = this is a text, with, argument 1234

[sentence containsString:@"this is a"];
// YES

[sentence match:@"-[a-z]+-"]
// -with-
```
--
__C__ additions
``` objc
unless(_messages) {
    // The body is only executed if the condition is false
    _messages = [self initializeMessages];
}

int iterations = 10;
until(iterations == 0) {
    // The body is executed until the condition is false
    // 10 9 8 7 6 5 4 3 2 1
    printf("%d ", iterations);
    iterations--;
}
printf("\n");

iterations = 10;
do {
    // The body is executed at least once until the condition is false
    // Will print: Executed!
    printf("Executed!\n");
} until(true);
```

***
# Other LICENSE
***

[CCSugar LICENSE](LICENSE/LICENSE.CCSugar.txt)

[ObjectiveSugar LICENSE](LICENSE/LICENSE.ObjectiveSugar.txt)
## Team

- CC [@ccworld1000](https://github.com/ccworld1000)

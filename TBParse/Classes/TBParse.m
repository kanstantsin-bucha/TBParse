//
//  TBParse.m
//  QromaScan
//
//  Created by Kanstantsin Bucha on 8/1/18.
//  Copyright © 2018 Qroma. All rights reserved.
//

#import "TBParse.h"
#import <Parse/Parse.h>

#define TB_Parse_Strings_ComponentsSeparators_Characters @";"
#define TB_Parse_Strings_PairDivider_Characters @":"


@implementation TBParse
 
    
/// MARK: base conversion
    
    
+ (NSDictionary<NSString *,NSObject *> *)dictionaryUsingParseObject:(PFObject *)object {
    
    NSDictionary<NSString *,NSObject *> * result =
        [object dictionaryWithValuesForKeys: [object allKeys]];
    
    return result;
}


/// MARK: string list conversin conversion


+ (NSArray<NSNumber *> *) numbersUsingStringsList: (NSString *) list {
    
    NSArray<NSString *> * wordsList = [self wordsUsingStringsList: list];
    NSMutableArray * result = [NSMutableArray array];
    for (NSString * word in wordsList) {
        NSInteger number = word.integerValue;
        if (number == 0) {
            continue;
        }
        
        [result addObject: @(number)];
    }
    
    if (result.count == 0) {
        return nil;
    }
    
    return result;
}
    
+ (NSArray<NSString *> *) wordsUsingStringsList: (NSString *) list {
    NSCharacterSet * dividers = [NSCharacterSet characterSetWithCharactersInString: TB_Parse_Strings_ComponentsSeparators_Characters];
    NSArray<NSString *> * result = [list componentsSeparatedByCharactersInSet: dividers];
    return result;
}
    
+ (NSDictionary<NSString *, NSNumber *> *) pairsUsingStrings: (NSString *) strings {
    NSCharacterSet * set = [NSCharacterSet characterSetWithCharactersInString: TB_Parse_Strings_ComponentsSeparators_Characters];
    NSArray<NSString *> * pairs = [strings componentsSeparatedByCharactersInSet: set];
    
    NSCharacterSet * divider = [NSCharacterSet characterSetWithCharactersInString: TB_Parse_Strings_PairDivider_Characters];
    NSMutableDictionary<NSString *, NSObject *> * result = [NSMutableDictionary dictionary];
    
    for (NSString * pair in pairs) {
        NSArray<NSString *> * elements = [pair componentsSeparatedByCharactersInSet: divider];
        if (elements.count != 2) {
            continue;
        }
        NSString * key = elements.firstObject;
        NSInteger number = elements.lastObject.integerValue;
        NSNumber * value = number != 0 ? @(number)
        : nil;
        if ([elements.lastObject isEqualToString: @"0"]) {
            value = @(0);
        }
        
        if (key == nil
            || value == nil) {
            NSLog(@"Failed to get object pair for string %@", pair);
            continue;
        }
        
        result[key] = value;
    }
    
    return [result copy];
}


/// MARK: object conversion logic


+ (id)objectOfClass:(Class)class
    fromParseObject:(PFObject *)object
           usingKey:(NSString *)key {
    NSObject * result = [self objectOfClass:class
                             fromDictionary:(NSDictionary<NSString *, NSObject *> *)object
                                   usingKey:key];
    return result;
}
    
+ (id)objectOfClass:(Class)class
     fromDictionary:(NSDictionary *)dict
           usingKey:(NSString *)key {
    NSObject * value = dict[key];
    NSObject * result = [value isKindOfClass:class] ? value
    : nil;
    
    if (result == nil) {
        NSLog(@"Failed to get object for key %@\
              \r\n should be %@, got %@\
              \r\n using parse dictionary %@",
              key, NSStringFromClass(class), NSStringFromClass([value class]), dict);
    }
    
    return result;
}
    
+ (BOOL)object:(PFObject *)object
 isKindOfClass:(NSString *)class {
    BOOL result = [object.parseClassName isEqualToString: class];
    return result;
}

@end

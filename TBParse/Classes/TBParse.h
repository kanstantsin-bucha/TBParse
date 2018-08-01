//
//  TBParse.h
//  QromaScan
//
//  Created by Kanstantsin Bucha on 8/1/18.
//  Copyright © 2018 Qroma. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PFObject;

@interface TBParse : NSObject
    
+ (NSDictionary<NSString *, NSObject *> *) dictionaryUsingParseObject: (PFObject *) object;
    
+ (NSArray<NSNumber *> *) numbersUsingStringsList: (NSString *) list;
+ (NSArray<NSString *> *) wordsUsingStringsList: (NSString *) list;
+ (NSDictionary<NSString *, NSNumber *> *) pairsUsingStrings: (NSString *) strings;
    
+ (BOOL) object: (PFObject *) object
  isKindOfClass: (NSString *) class;
    
+ (id) objectOfClass: (Class) class
      fromDictionary: (NSDictionary *)  dict
            usingKey: (NSString *) key;
    
+ (id) objectOfClass: (Class) class
     fromParseObject: (PFObject *) object
            usingKey: (NSString *) key;

@end

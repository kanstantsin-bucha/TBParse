//
//  TBViewController.m
//  TBParse
//
//  Created by truebucha on 08/01/2018.
//  Copyright (c) 2018 truebucha. All rights reserved.
//

#import "TBViewController.h"
#import <Parse/Parse.h>
#import <TBParse/TBParse.h>

@interface TBViewController ()

@end

@implementation TBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    PFObject * object = [PFObject objectWithClassName: @"Test"
                                           dictionary: @{ @"testString": @"string", @"testNumber": @1, @"failedTest": [NSDate date]}];
    
    NSLog(@"printing Test ?: %@", [TBParse object: object isKindOfClass: @"Test"] == YES ? @"YES" : @"NO");
    
    NSLog(@"printing dict: %@", [TBParse dictionaryUsingParseObject: object]);
    
    NSLog(@"printing string: %@", [TBParse objectOfClass: [NSString class]
                                         fromParseObject: object
                                                usingKey: @"testString"]);
    
    NSLog(@"printing number: %@", [TBParse objectOfClass: [NSNumber class]
                                         fromParseObject: object
                                                usingKey: @"testNumber"]);
    
    NSLog(@"printing failed: %@", [TBParse objectOfClass: [NSString class]
                                         fromParseObject: object
                                                usingKey: @"failedTest"]);
}

@end

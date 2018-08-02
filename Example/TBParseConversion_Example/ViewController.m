//
//  ViewController.m
//  TBParseConversion_Example
//
//  Created by Kanstantsin Bucha on 8/2/18.
//  Copyright © 2018 truebucha. All rights reserved.
//

#import "ViewController.h"
#import <TBParse/TBParseConversion.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray * numbers = [TBParseConversion numbersUsingStringsList: @"1;2;3"];
    NSLog(@"converted numbers: %@", numbers);
    
    NSArray * words = [TBParseConversion wordsUsingStringsList: @"my;her;his"];
    NSLog(@"converted words: %@", words);
    
    NSDictionary * pairs = [TBParseConversion pairsUsingStrings: @"1:2;key:12;gravity: 9.8"];
    NSLog(@"converted pairs: %@", pairs);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

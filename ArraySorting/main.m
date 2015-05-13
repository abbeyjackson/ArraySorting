//
//  main.m
//  ArraySorting
//
//  Created by Abegael Jackson on 2015-05-12.
//  Copyright (c) 2015 Abegael Jackson. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
     
        
    // Sort array alphabetically
        NSArray *myArray = @[@"eeeeeAAbfdf", @"Everything", @"news to me", @"timepiece", @"egg", @"eggs", @"paper", @"e", @"facebook", @"painting", @"231 thurlow st", @"99 bottles"];
        
        NSArray *sortAlphabetically = [myArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            
            NSComparisonResult result = [obj1 caseInsensitiveCompare:obj2];
            return result;
            
        }];
        
        NSLog(@"Array sorted alphabetically: %@", sortAlphabetically);
        
        
        
    // Sort array by string length
        NSArray *sortByLength = [myArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            
            if ([obj1 length] > [obj2 length]){
                NSComparisonResult result = (NSComparisonResult)NSOrderedAscending;
                return result;
            }
            if ([obj1 length] < [obj2 length]) {
                NSComparisonResult result = (NSComparisonResult)NSOrderedDescending;
                return result;
            }
            return (NSComparisonResult)NSOrderedSame;
            
        }];
        
        NSLog(@"Array sorted by string length: %@", sortByLength);
       
        
        
    // Sort array by last character of string
        NSArray *sortByLastCharacter = [myArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            
            NSString *object1 = [obj1 substringFromIndex:[obj1 length] - 1];
            NSString *object2 = [obj2 substringFromIndex:[obj2 length] - 1];
            
            NSComparisonResult result = [object1 caseInsensitiveCompare:object2];
            return result;
            
        }];
        
        NSLog(@"Array sorted by last character: %@", sortByLastCharacter);
        
        
        
    // Sort array by number of occurrences of the letter "e"
        NSArray *sortByNumberOfOccurrences = [myArray sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
            obj1 = [obj1 uppercaseString];
            obj2 = [obj2 uppercaseString];
            __block int count1 = 0;
            __block int count2 = 0;
            
            [obj1 enumerateSubstringsInRange:NSMakeRange(0, [obj1 length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *character, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                if ([character isEqualToString:@"E"]) {
                    count1 ++;
                }
            }];
            
            [obj2 enumerateSubstringsInRange:NSMakeRange(0, [obj2 length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *character, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                if ([character isEqualToString:@"E"]) {
                    count2 ++;
                }
            }];

            if (count1 < count2) {
                return NSOrderedAscending;
            } else if (count1 > count2) {
                return NSOrderedDescending;
            }
            return NSOrderedSame;
            
        }];
        
        NSLog(@"Array sorted by e's: %@", sortByNumberOfOccurrences);
                                       
    }
    return 0;
}

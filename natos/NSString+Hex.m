//
//  NSString+Hex.m
//  natos
//
//  Created by Nolan O'Brien on 9/29/12.
//  Copyright (c) 2012 Nolan O'Brien. All rights reserved.
//

#import "NSString+Hex.h"

@implementation NSString (Hex)
- (unsigned long long) hexValue
{
    unsigned long long value   = 0;
    NSScanner*   scanner = [NSScanner scannerWithString:self];
    [scanner scanHexLongLong:&value];
    return value;
}
@end

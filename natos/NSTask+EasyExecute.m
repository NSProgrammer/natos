//
//  NSTask+EasyExecute.m
//  natos
//
//  Created by Nolan O'Brien on 9/29/12.
//  Copyright (c) 2012 Nolan O'Brien. All rights reserved.
//

#import "NSTask+EasyExecute.h"

@implementation NSTask (EasyExecute)

+ (NSString*) executeAndReturnStdOut:(NSString *)taskPath arguments:(NSArray *)args
{
    return [self executeAndReturnStdOut:taskPath arguments:args withMaxStringLength:-1];
}

+ (NSString*) executeAndReturnStdOut:(NSString *)taskPath arguments:(NSArray *)args withMaxStringLength:(NSUInteger)strLen
{
    @autoreleasepool {
        NSTask* otool = [[NSTask alloc] init];
        otool.launchPath = taskPath;
        otool.arguments = args;
        otool.standardOutput = [NSPipe pipe];
        
        [otool launch];
        
        NSData* dataOut = nil;
        if (-1 == strLen)
        {
            dataOut = [[otool.standardOutput fileHandleForReading] readDataToEndOfFile];
        }
        else
        {
            NSMutableData* data = [NSMutableData data];
            
            while (data.length < strLen && otool.isRunning)
            {
                [data appendData:[[otool.standardOutput fileHandleForReading] readDataOfLength:strLen - data.length]];
            }
            
            if (otool.isRunning)
            {
                [otool terminate];
            }
            
            char z = '\0';
            [data appendBytes:&z length:1];
            dataOut = data;
        }
        NSString* output = [NSString stringWithUTF8String:(const char*)dataOut.bytes];
        return output;
    }
}

@end

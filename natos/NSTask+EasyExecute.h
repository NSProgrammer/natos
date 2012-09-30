//
//  NSTask+EasyExecute.h
//  natos
//
//  Created by Nolan O'Brien on 9/29/12.
//  Copyright (c) 2012 Nolan O'Brien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTask (EasyExecute)
+ (NSString*) executeAndReturnStdOut:(NSString*)taskPath arguments:(NSArray*)args;
+ (NSString*) executeAndReturnStdOut:(NSString*)taskPath arguments:(NSArray*)args withMaxStringLength:(NSUInteger)strLen; // not guaranteed
@end

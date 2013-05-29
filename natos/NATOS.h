//
//  NATOS.m
//  natos
//
//  Created by Nolan O'Brien on 9/29/12.
//  Copyright (c) 2012 Nolan O'Brien. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NATOS : NSObject
- (id) initWithArgc:(int)argc argv:(const char**)argv;

@property (nonatomic, copy, readwrite) NSString* executionPath; // argv[0]
@property (nonatomic, copy, readwrite) NSString* XCArchivePath;
@property (nonatomic, copy, readwrite) NSString* dSYMPath;      // if not present, derived from XCArchivePath
@property (nonatomic, copy, readwrite) NSString* CPUArchitecture;
@property (nonatomic, assign, readwrite) unsigned int mainFunctionStackAddress;
@property (nonatomic, assign, readwrite) unsigned int loadAddress;
@property (nonatomic, assign, readwrite) unsigned int targetStackAddress;

- (void) printUsage;

- (int) run; // 0 indicates target symbol was extracted
@property (nonatomic, readonly) NSString* targetSymbol;

@end
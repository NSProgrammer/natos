//
//  main.m
//  natos
//
//  Created by Nolan O'Brien on 9/29/12.
//  Copyright (c) 2012 Nolan O'Brien. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NATOS.h"

int main(int argc, const char * argv[])
{
    int retVal = 0;
    @autoreleasepool {
        
        NATOS* natos = [[NATOS alloc] initWithArgc:argc argv:argv];
        
        retVal = [natos run];
        
    }
    return retVal;
}


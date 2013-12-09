//
//  OSPathTests.m
//  OSPathTests
//
//  Created by Sergio Vieira on 06/12/13.
//  Copyright (c) 2013 Sergio Vieira. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "OSPath.h"


@interface OSPathTests : XCTestCase

@end

@implementation OSPathTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAbspath
{
    NSString * string1 = [OSPath abspath:@""];
    NSString * string2 = [[NSBundle mainBundle] bundlePath];
    
    XCTAssert([string1 isEqualToString:string2], @"Error");
    
    string1 = [OSPath abspath:@"/"];
    string2 = @"/";
    
    XCTAssert([string1 isEqualToString:string2], @"Error");
    
    string1 = [OSPath abspath:@"/foo"];
    string2 = @"/foo";
    
    XCTAssert([string1 isEqualToString:string2], @"Error");
    
    string1 = [OSPath abspath:@"/bar/"];
    string2 = @"/bar";
    
    XCTAssert([string1 isEqualToString:string2], @"Error");
}

- (void)testBasename
{
    NSString * string1 = [OSPath basename:@""];
    NSString * string2 = @"";
    
    XCTAssert([string1 isEqualToString:string2], @"Error");

    string1 = [OSPath basename:@"/"];
    string2 = @"";
    
    XCTAssert([string1 isEqualToString:string2], @"Error");

    string1 = [OSPath basename:@"/base"];
    string2 = @"base";
    
    XCTAssert([string1 isEqualToString:string2], @"Error");

    string1 = [OSPath basename:@"/base/"];
    string2 = @"";
    
    XCTAssert([string1 isEqualToString:string2], @"Error");

    string1 = [OSPath basename:@"/base/name"];
    string2 = @"name";
    
    XCTAssert([string1 isEqualToString:string2], @"Error");
}

- (void)testCommonprefix
{
    NSString * string1 = [OSPath commonprefix:@[@""]];
    NSString * string2 = @"";
    
    XCTAssert([string1 isEqualToString:string2], @"Error");

    string1 = [OSPath commonprefix:@[@"/"]];
    string2 = @"/";
    
    XCTAssert([string1 isEqualToString:string2], @"Error");

    string1 = [OSPath commonprefix:@[@"/var", @"/varia"]];
    string2 = @"/var";
    
    XCTAssert([string1 isEqualToString:string2], @"Error");

    string1 = [OSPath commonprefix:@[@"/varia", @"/varia", @"/varca"]];
    string2 = @"/var";
    
    XCTAssert([string1 isEqualToString:string2], @"Error");
}

@end

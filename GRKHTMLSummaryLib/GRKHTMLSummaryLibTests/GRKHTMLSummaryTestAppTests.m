//
//  GRKHTMLSummaryTestAppTests.m
//  GRKHTMLSummaryTestAppTests
//
//  Created by Levi Brown on 10/2/15.
//  Copyright (c) 2015 Levi Brown. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "GRKHTMLSummary.h"

@interface GRKHTMLSummaryTestAppTests : XCTestCase

@property (nonatomic,copy) NSString *testData1;

@property (nonatomic,strong) GRKHTMLSummary *summary;

@end

@implementation GRKHTMLSummaryTestAppTests

- (instancetype)initWithInvocation:(NSInvocation *)invocation
{
    if ((self = [super initWithInvocation:invocation]))
    {
        NSURL *testData1URL = [[NSBundle bundleForClass:self.class] URLForResource:@"test1" withExtension:@"html"];
        __autoreleasing NSError *error = nil;
        _testData1 = [NSString stringWithContentsOfURL:testData1URL encoding:NSUTF8StringEncoding error:&error];
        if (!_testData1)
        {
            NSLog(@"Error loading testData1: %@", error);
        }
    }
    
    return self;
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.summary = [[GRKHTMLSummary alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    
    self.summary = nil;
    
    [super tearDown];
}

- (void)testTestData1 {
    // This is an example of a functional test case.
    XCTAssert(self.testData1 != nil, @"Pass");
}

- (void)test100 {
    
    NSString *resContent = [self.summary stripTagsFromString:self.testData1 characterCount:500];
    
    XCTAssert(resContent != nil, @"Content unexpectedly nil");
    XCTAssert(resContent.length > 0, @"Content unexpectedly empty");
}

- (void)test2000 {
    
    NSString *testContent = [self.summary stripTagsFromString:self.testData1 characterCount:500];
    NSString *resContent = [self.summary condenseWhitespaceFromString:testContent];
    
    XCTAssert(resContent != nil, @"Content unexpectedly nil");
    XCTAssert(resContent.length > 0, @"Content unexpectedly empty");
}

@end

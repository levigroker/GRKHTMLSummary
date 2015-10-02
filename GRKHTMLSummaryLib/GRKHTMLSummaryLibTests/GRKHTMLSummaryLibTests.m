//
//  GRKHTMLSummaryLibTests.m
//  GRKHTMLSummaryLibTests
//
//  Created by Levi Brown on 10/2/15.
//  Copyright (c) 2015 Levi Brown. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "GRKHTMLSummary.h"

@interface GRKHTMLSummaryLibTests : XCTestCase

@property (nonatomic,copy) NSString *testData1;

@property (nonatomic,strong) GRKHTMLSummary *summary;

@end

@implementation GRKHTMLSummaryLibTests

- (instancetype)initWithInvocation:(NSInvocation *)invocation
{
    if ((self = [super initWithInvocation:invocation]))
    {
        _testData1 = [self fetchFile:@"test1.html"];
    }
    
    return self;
}

- (NSString *)fetchFile:(NSString *)file
{
    NSURL *testData1URL = [[NSBundle bundleForClass:self.class] URLForResource:file withExtension:nil];
    __autoreleasing NSError *error = nil;
    NSString *retVal = [NSString stringWithContentsOfURL:testData1URL encoding:NSUTF8StringEncoding error:&error];
    if (!retVal)
    {
        NSLog(@"Error loading file '%@' from bundle. Error: %@", file, error);
    }
    
    return retVal;
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

- (void)test1000 {
    
    NSString *resContent = [self.summary stripTagsFromString:self.testData1 characterCount:-1];
    
    XCTAssert(resContent != nil, @"Content unexpectedly nil");
    XCTAssert(resContent.length > 0, @"Content unexpectedly empty");
    
    NSString *expected = [self fetchFile:@"test1_stripped_tags.txt"];
    
    XCTAssert(expected != nil, @"Expected results file unexpectedly nil");
    XCTAssert([expected isEqualToString:resContent], @"Expected results do not match received results.");
}

- (void)test2000 {
    
    NSString *testContent = [self.summary stripTagsFromString:self.testData1 characterCount:-1];
    NSString *resContent = [self.summary condenseWhitespaceFromString:testContent];
    
    XCTAssert(resContent != nil, @"Content unexpectedly nil");
    XCTAssert(resContent.length > 0, @"Content unexpectedly empty");
    
    NSString *expected = [self fetchFile:@"test1_condensed.txt"];
    
    XCTAssert(expected != nil, @"Expected results file unexpectedly nil");
    XCTAssert([expected isEqualToString:resContent], @"Expected results do not match received results.");
}

- (void)test3000 {
    
    NSString *resContent = [self.summary summaryOfHTMLString:self.testData1 characterCount:-1];
    
    XCTAssert(resContent != nil, @"Content unexpectedly nil");
    XCTAssert(resContent.length > 0, @"Content unexpectedly empty");
    
    NSString *expected = [self fetchFile:@"test1_summary.txt"];
    
    XCTAssert(expected != nil, @"Expected results file unexpectedly nil");
    XCTAssert([expected isEqualToString:resContent], @"Expected results do not match received results.");
}

@end

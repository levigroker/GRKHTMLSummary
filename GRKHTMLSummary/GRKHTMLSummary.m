//
//  GRKHTMLSummary.m
//  
//
//  Created by Levi Brown on October 2, 2015.
//  Copyright (c) 2015 Levi Brown <mailto:levigroker@gmail.com>
//  This work is licensed under the Creative Commons Attribution 3.0
//  Unported License. To view a copy of this license, visit
//  http://creativecommons.org/licenses/by/3.0/ or send a letter to Creative
//  Commons, 444 Castro Street, Suite 900, Mountain View, California, 94041,
//  USA.
//
//  The above attribution and the included license must accompany any version
//  of the source code. Visible attribution in any binary distributable
//  including this work (or derivatives) is not required, but would be
//  appreciated.
//

#import "GRKHTMLSummary.h"
#import "GRKGTMNSString+HTML.h"

static NSString * const kHTMLTagOpenBody = @"<body>";
static NSString * const kHTMLTagCloseBody = @"</body>";
static NSString * const kHTMLTagOpen = @"<";
static NSString * const kHTMLTagClose = @">";

@implementation GRKHTMLSummary

- (NSString *)summaryOfHTMLString:(NSString *)html characterCount:(NSInteger)count
{
    NSString *stripped = [self stripTagsFromString:html characterCount:count];
    NSString *condensed = [self condenseWhitespaceFromString:stripped];
    NSString *unescaped = [condensed grk_gtm_stringByUnescapingFromHTML];
    
    return unescaped;
}

- (NSString *)stripTagsFromString:(NSString *)html characterCount:(NSInteger)count
{
    NSMutableString *retVal = nil;
    
    NSScanner *scanner = [NSScanner scannerWithString:html];
    scanner.charactersToBeSkipped = nil;
    //Scan up to and over the opening body tag
    if ([scanner scanUpToString:kHTMLTagOpenBody intoString:nil] && [scanner scanString:kHTMLTagOpenBody intoString:nil])
    {
        retVal = [NSMutableString string];
        BOOL keepScanning = YES;
        
        while (keepScanning)
        {
            //Scan up to a tag open and save what we find
            __autoreleasing NSString *scan = nil;
            [scanner scanUpToString:kHTMLTagOpen intoString:&scan];
            if (scan.length > 0)
            {
                [retVal appendString:scan];
            }
            
            //Stop if we find the closing body tag
            __autoreleasing NSString *debugScan = nil;
            keepScanning = ![scanner scanString:kHTMLTagCloseBody intoString:&debugScan];
            
            if (keepScanning)
            {
                //Scan up to and over the tag close and disgard
                debugScan = nil;
                [scanner scanUpToString:kHTMLTagClose intoString:&debugScan];
                debugScan = nil;
                [scanner scanString:kHTMLTagClose intoString:&debugScan];
                //Bail out if we are at the end of the content or have enough characters already
                keepScanning = !scanner.atEnd && (count < 0 || retVal.length < count);
            }
        }
    }
    
    return retVal;
}

- (NSString *)condenseWhitespaceFromString:(NSString *)input
{
    NSMutableString *collector = [NSMutableString string];
    
    NSScanner *scanner = [NSScanner scannerWithString:input];
    scanner.charactersToBeSkipped = nil;

    while (!scanner.isAtEnd)
    {
        //Eat whitespace and condense it to one space character
        __autoreleasing NSString *scan = nil;
        [scanner scanCharactersFromSet:[NSCharacterSet whitespaceAndNewlineCharacterSet] intoString:&scan];
        if (scan.length > 0)
        {
            [collector appendString:@" "];
        }

        //Capture everything else
        scan = nil;
        [scanner scanUpToCharactersFromSet:[NSCharacterSet whitespaceAndNewlineCharacterSet] intoString:&scan];
        if (scan.length > 0)
        {
            [collector appendString:scan];
        }
    }
    
    NSString *retVal = [collector stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return retVal;
}

@end

//
//  GRKHTMLSummary.h
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

#import <Foundation/Foundation.h>

@interface GRKHTMLSummary : NSObject

/**
 * Renderes a plaintext version of the given HTML body content suitable for a small preview view of the content.
 *
 * @param html  The input HTML content whose body will be extracted and changed to plaintext.
 * @param count The character count of the extracted body. This is an attempted character count, since the extracted content may be shorter or longer depending on the tag boundaries encountered. If this is a negative number, all content will be returned regardless of length.
 *
 * @return A plaintext string representing the given HTML body content, with all tags removed, escapes expanded, and whitespace/newlines condensed to a single space.
 */
- (NSString *)summaryOfHTMLString:(NSString *)html characterCount:(NSInteger)count;

/**
 * Extracts the content from the HTML body, and strips it of all HTML tags, leaving whitespace intact.
 *
 * @param html  The HTML content to extract the plaintext body from.
 * @param count The character count of the extracted body. This is an attempted character count, since the extracted content may be shorter or longer depending on the tag boundaries encountered. If this is a negative number, all content will be returned regardless of length.
 *
 * @return The plaintext body of the given HTML, truncated near the given character count.
 */
- (NSString *)stripTagsFromString:(NSString *)html characterCount:(NSInteger)count;

/**
 * Collapses whitespace and newlines into a single space.
 *
 * @param input The input string which will have its whitespace condensed.
 *
 * @return A new string from the input string with all whitespace and newlines collapsed to one space character.
 */
- (NSString *)condenseWhitespaceFromString:(NSString *)input;

@end

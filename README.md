GRKHTMLSummary
===========
[![Build Status](https://travis-ci.org/levigroker/GRKHTMLSummary.svg)](https://travis-ci.org/levigroker/GRKHTMLSummary)
[![Version](http://img.shields.io/cocoapods/v/GRKHTMLSummary.svg)](http://cocoapods.org/?q=GRKHTMLSummary)
[![Platform](http://img.shields.io/cocoapods/p/GRKHTMLSummary.svg)]()
[![License](http://img.shields.io/cocoapods/l/GRKHTMLSummary.svg)](https://github.com/levigroker/GRKHTMLSummary/blob/master/LICENSE.txt)

A simple utility, which when given the content of an HTML file, will extract the text
content from the body, stripping HTML tags, and format the plaintext in such a way as to
be used as a "preview" of the body content.

### Installing

If you're using [CocoPods](http://cocopods.org) it's as simple as adding this to your
`Podfile`:

	pod 'GRKHTMLSummary'

otherwise, simply add the contents of the `GRKHTMLSummary` subdirectory to your
project, and follow the installation directions for [GTMNSStringAdditions](https://github.com/gjeck/GTMNSStringAdditions).

NOTE: At this time, the dependent pod `GTMNSStringHTMLAdditions` does not support OSX, so
`GRKHTMLSummary.podspec` can not support OSX either. There is an open [pull request](https://github.com/gjeck/GTMNSStringAdditions/pull/3)
to correct this.

### Documentation

In the simplest usage, you'll simply want to create a `GRKHTMLSummary` and then call the 
`summaryOfHTMLString:characterCount:` method which will return the fully "summarized" body
content.

    NSString *html = <your html content>
    GRKHTMLSummary *summarizer = [[GRKHTMLSummary alloc] init];
    NSString *summary = [summarizer summaryOfHTMLString:html characterCount:-1];

NOTE: in practice, it is best to use this on a background queue as, depending on your
content, it could block for a perceptible time.

#### Disclaimer and Licence

* This work is licensed under the [Creative Commons Attribution 3.0 Unported License](http://creativecommons.org/licenses/by/3.0/).
  Please see the included LICENSE.txt for complete details.

#### About
A professional iOS engineer by day, my name is Levi Brown. Authoring a blog
[grokin.gs](http://grokin.gs), I am reachable via:

Twitter [@levigroker](https://twitter.com/levigroker)  
Email [levigroker@gmail.com](mailto:levigroker@gmail.com)  

Your constructive comments and feedback are always welcome.

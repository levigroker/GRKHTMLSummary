GRKHTMLSummary
===========
A simple utility, which when given the content of an HTML file, will extract the text
content from the body, stripping HTML tags, and format the plaintext in such a way as to
be used as a "preview" of the body content.

### Installing

If you're using [CocoPods](http://cocopods.org) it's as simple as adding this to your
`Podfile`:

	pod 'GRKHTMLSummary'

otherwise, simply add the contents of the `GRKHTMLSummary` subdirectory to your
project.

### Documentation

In the simplest usage, you'll simply want to create a `GRKHTMLSummary` and then call the 
`summaryOfHTMLString:characterCount:` method which will return the fully "summarized" body
content.

    NSString *html = <your html content>
    GRKHTMLSummary *summary = [[GRKHTMLSummary alloc] init];
    NSString *summarizedBody = [summary summaryOfHTMLString:html characterCount:-1];

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

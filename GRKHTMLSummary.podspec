Pod::Spec.new do |s|
  s.name         = "GRKHTMLSummary"
  s.version      = "1.0"
  s.summary      = "Creates a plaintext rendering of HTML body content."
  s.description  = <<-DESC
		A simple utility, which when given the content of an HTML file, will extract the text content from the body, stripping HTML tags, and format the plaintext in such a way as to be used as a "preview" of the body content.
    DESC
  s.homepage     = "https://github.com/levigroker/GRKHTMLSummary"
  s.license      = 'Creative Commons Attribution 3.0 Unported License'
  s.author       = { "Levi Brown" => "levigroker@gmail.com" }
  s.social_media_url = 'https://twitter.com/levigroker'
  s.source       = { :git => "https://github.com/levigroker/GRKHTMLSummary.git", :tag => s.version.to_s }
  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'
  s.source_files = 'GRKHTMLSummary/**/*.{h,m}'
  s.frameworks = 'Foundation'
  s.dependency 'GTMNSStringHTMLAdditions', '~> 0.2.1'
end

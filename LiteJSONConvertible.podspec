Pod::Spec.new do |s|
  s.name             = "LiteJSONConvertible"
  s.version          = "0.0.4"
  s.summary          = "A minimalistic approach to JSON parsing"
  s.homepage         = "https://github.com/andrea-prearo/LiteJSONConvertible"
  s.license          = "MIT"
  s.author           = { "andrea-prearo" => "andrea.prearo@gmail.com" }
  s.source           = { :git => "https://github.com/andrea-prearo/LiteJSONConvertible.git", :tag => s.version }
  
  s.ios.deployment_target = "8.0"

  s.source_files = "LiteJSONConvertible/*.swift"
end

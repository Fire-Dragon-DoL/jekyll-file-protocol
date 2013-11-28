# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll-file-protocol/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-file-protocol"
  spec.version       = JekyllFileProtocol::VERSION
  spec.authors       = ["Fire-Dragon-DoL"]
  spec.email         = ["francesco.belladonna@gmail.com"]
  spec.description   = %q{Small set of helpers to generate a static website that works on file protocol using relative paths instead of absolute}
  spec.summary       = %q{Small set of helpers to generate a static website that works on file protocol}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "jekyll", "~> 1.2.1"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
end

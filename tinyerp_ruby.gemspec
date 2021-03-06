# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tinyerp_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "tinyerp_ruby"
  spec.version       = TinyerpRuby::VERSION
  spec.authors       = ["Denis Tierno"]
  spec.email         = ["denis@locomotiva.pro"]
  spec.description   = %q{Gem for integration with TinyERP service}
  spec.summary       = %q{Gem for integration with TinyERP service}
  spec.homepage      = "http://locomotiva.pro"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"

  spec.add_dependency "savon", "~> 2.0"
  spec.add_dependency "json"
end

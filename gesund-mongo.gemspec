# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gesund/mongo/version'

Gem::Specification.new do |spec|
  spec.name          = "gesund-mongo"
  spec.version       = Gesund::Mongo::VERSION
  spec.authors       = ["Evgeny Zislis"]
  spec.email         = ["evgeny@devops.co.il"]
  spec.description   = %q{Plugin for Gesund health checker to check MongoDB health}
  spec.summary       = %q{MongoDB health checks for Gesund}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_runtime_dependency "gesund"
  spec.add_runtime_dependency "mongo"
  spec.add_runtime_dependency "bson_ext"
end

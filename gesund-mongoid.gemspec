# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gesund/mongoid/version'

Gem::Specification.new do |spec|
  spec.name          = "gesund-mongoid"
  spec.version       = Gesund::Mongoid::VERSION
  spec.authors       = ["Evgeny Zislis", "Kirill Maksimov"]
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

  spec.add_runtime_dependency "gesund", "~> 0.0.3"
  spec.add_runtime_dependency "mongoid"
  spec.add_runtime_dependency "bson_ext"
end

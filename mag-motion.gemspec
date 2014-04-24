# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mag-motion/version'

Gem::Specification.new do |spec|
  spec.name          = "mag-motion"
  spec.version       = MagMotion::VERSION
  spec.authors       = ["Jordan Maguire"]
  spec.email         = ["jmaguire@thefrontiergroup.com.au"]
  spec.description   = "A collection of ruby-ish monkey patches to Cocoa Touch classes"
  spec.summary       = "A collection of ruby-ish monkey patches to Cocoa Touch classes"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

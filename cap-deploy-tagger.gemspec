# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cap-deploy-tagger/version'

Gem::Specification.new do |spec|
  spec.name          = "cap-deploy-tagger"
  spec.version       = CapDeployTagger::VERSION
  spec.authors       = ["Andy Sykes"]
  spec.email         = ["github@tinycat.co.uk"]
  spec.description   = %q{Automatically tag Git commits when deploying with Capistrano}
  spec.summary       = %q{Automatically tag Git commits when deploying with Capistrano}
  spec.homepage      = "https://github.com/forward3d/cap-deploy-tagger"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

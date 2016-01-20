# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'centerstage/version'

Gem::Specification.new do |spec|
  spec.name          = "centerstage"
  spec.version       = Centerstage::VERSION
  spec.authors       = ["Wess Cope"]
  spec.email         = ["wcope@me.com"]

  spec.summary       = %q{Sinatra setup and generator.}
  spec.description   = %q{Centerstage is a command line script to generate Sinatra based applications with data mapper, including an extendable Rakefile for generating new routes and models.}
  spec.homepage      = "https://github.com/wess/center-stage"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "thor", "~> 0.19.1"
  spec.add_development_dependency "rubyzip", "~> 1.1.7"
end

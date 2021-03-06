# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scalper/version'

Gem::Specification.new do |gem|
  gem.name          = "scalper"
  gem.version       = Scalper::VERSION
  gem.authors       = ["Abhi Yerra"]
  gem.email         = ["abhi@berkeley.edu"]
  gem.description   = %q{Parse Ticket information and parse relavent information}
  gem.summary       = %q{Parse Ticket information and parse relavent information}
  gem.homepage      = ""

  gem.add_dependency "typhoeus"
  gem.add_dependency "github_api"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rake"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end

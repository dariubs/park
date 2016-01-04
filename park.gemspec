# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'park/version'

Gem::Specification.new do |s|
  s.name        = 'park'
  s.version     = Park::VERSION
  s.date        = '2016-01-04'
  s.summary     = "Park"
  s.description = "git config manager"
  s.authors     = ["Dariush Abbasi"]
  s.email       = 'poshtehani@gmail.com'
  s.files       = ['bin/park', 'lib/park.rb',  'lib/park/version.rb']
  s.executables   = ["park"]
  s.require_paths = ["lib"]
  s.homepage    =
    'https://github.com/dariubs/park'
  s.license       = 'MIT'

  s.add_runtime_dependency "thor", '~> 0'
  s.add_development_dependency "rake", '~> 0'

end

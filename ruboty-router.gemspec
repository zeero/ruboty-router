lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/router/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruboty-router'
  spec.version       = Ruboty::Router::VERSION
  spec.authors       = ['zeero']
  spec.email         = ['zeero26@gmail.com']
  spec.summary       = 'Routing with Ruboty.'
  spec.description   = 'Enable Routing function to Ruboty.'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activesupport'
  spec.add_runtime_dependency 'i18n'
  spec.add_runtime_dependency 'mem'
  spec.add_runtime_dependency 'rack'
  spec.add_runtime_dependency 'ruboty'
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 1.0.0'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-ctags-bundler'
  spec.add_development_dependency 'guard-minitest'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'minitest-reporters'
  spec.add_development_dependency 'mocha'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'pry-theme'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rb-fsevent'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'terminal-notifier-guard'
end

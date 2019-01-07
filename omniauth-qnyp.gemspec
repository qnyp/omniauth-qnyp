# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-qnyp/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-qnyp'
  spec.version       = OmniAuth::Qnyp::VERSION
  spec.authors       = ['Junya Ogura']
  spec.email         = ['junyaogura@gmail.com']

  spec.summary       = 'OmniAuth Strategy for the qnyp OAuth2 API'
  spec.description   = 'OmniAuth Strategy for the qnyp OAuth2 API'
  spec.homepage      = 'https://github.com/qnyp/omniauth-qnyp'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.5'

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.5'
end

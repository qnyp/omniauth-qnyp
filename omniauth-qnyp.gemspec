# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-qnyp/version'

Gem::Specification.new do |spec|
  spec.metadata      = { 'rubygems_mfa_required' => 'true' }

  spec.name          = 'omniauth-qnyp'
  spec.version       = OmniAuth::Qnyp::VERSION
  spec.authors       = ['Junya Ogura']
  spec.email         = ['junya@qnyp.com']

  spec.summary       = 'OmniAuth Strategy for the qnyp OAuth2 API'
  spec.description   = 'OmniAuth Strategy for the qnyp OAuth2 API'
  spec.homepage      = 'https://github.com/qnyp/omniauth-qnyp'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.7.5'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'solargraph', '~> 0.44'

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.6'
end

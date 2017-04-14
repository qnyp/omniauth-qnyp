$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rspec'
require 'omniauth-qnyp'

RSpec.configure do |config|
  config.extend OmniAuth::Test::StrategyMacros, type: :strategy
end

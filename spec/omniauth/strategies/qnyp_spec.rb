require 'spec_helper'

RSpec.describe OmniAuth::Strategies::Qnyp do
  before do
    OmniAuth.config.test_mode = true
  end

  after do
    OmniAuth.config.test_mode = false
  end

  subject { OmniAuth::Strategies::Qnyp.new({}) }

  describe 'client options' do
    it 'should have correct name' do
      expect(subject.options.name).to eq('qnyp')
    end

    it 'should have correct site' do
      expect(subject.options.client_options.site).to eq('https://api.qnyp.com')
    end

    it 'should have correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq('https://qnyp.com/oauth/authorize')
    end
  end
end

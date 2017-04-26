require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    # OmniAuth strategy for qnyp.com
    class Qnyp < OmniAuth::Strategies::OAuth2
      API_URL = ENV['QNYP_API_URL'] || 'https://api.qnyp.com'
      SITE_URL = ENV['QNYP_SITE_URL'] || 'https://qnyp.com'

      option :scope, 'public'

      option(
        :client_options,
        site: API_URL,
        authorize_url: "#{SITE_URL}/oauth/authorize",
        token_url: "#{API_URL}/oauth/token"
      )

      uid { raw_info['id'] }

      info do
        {
          language: raw_info['language'],
          name: raw_info['name'],
          profile_image_url: raw_info['profile_image_url'],
          username: raw_info['username'],
        }
      end

      private

      # https://github.com/intridea/omniauth-oauth2/issues/81
      def callback_url
        full_host + script_name + callback_path
      end

      def raw_info
        @raw_info ||= access_token.get('/me.json').parsed
      end
    end
  end
end

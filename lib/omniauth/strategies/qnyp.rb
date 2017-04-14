require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Qnyp < OmniAuth::Strategies::OAuth2
      option :name, 'qnyp'
      option :scope, ''

      option :client_options, {
        site: 'https://api.qnyp.com',
        authorize_url: 'https://qnyp.com/oauth/authorize',
      }

      uid { raw_info['id'] }

      info do
        {
          language: raw_info['language'],
          name: raw_info['name'],
          profile_image_url: raw_info['profile_image_url'],
          username: raw_info['username'],
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/me.json').parsed
      end

      # https://github.com/intridea/omniauth-oauth2/issues/81
      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end

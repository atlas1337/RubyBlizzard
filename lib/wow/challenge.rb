module RubyBlizzard
  module Wow
    class Challenge
      def self.find_realm(realm:)
        uri = RubyBlizzard.base_uri("wow/challenge/#{realm}#{RubyBlizzard.queries}")
        response = RestClient.get(uri){|response, request, result| response }
        return {'error_code' => response.code, 'error' => ERRORS[response.code]} if ERRORS.key?(response.code)
        JSON.parse(response.body)
      end

      def self.find_region
        uri = RubyBlizzard.base_uri("wow/challenge/region#{RubyBlizzard.queries}")
        response = RestClient.get(uri){|response, request, result| response }
        return {'error_code' => response.code, 'error' => ERRORS[response.code]} if ERRORS.key?(response.code)
        JSON.parse(response.body)
      end
    end
  end
end

module RubyBlizzard
  module Wow
    class Pvp
      def self.find_bracket(bracket:)
        uri = RubyBlizzard.base_uri("wow/leaderboard/#{bracket}#{RubyBlizzard.queries}")
        response = RestClient.get(uri){|response, request, result| response }
        return {'error_code' => response.code, 'error' => ERRORS[response.code]} if ERRORS.key?(response.code)
        JSON.parse(response.body)
      end
    end
  end
end

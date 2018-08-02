module RubyBlizzard
  module Wow
    class Pvp
      def self.find_bracket(bracket:)
        uri = RubyBlizzard.base_uri("wow/leaderboard/#{bracket}#{RubyBlizzard.queries}")
        bracket = RestClient.get(uri){|response, request, result| response }
        RubyBlizzard.error_check(bracket)
      end
    end
  end
end
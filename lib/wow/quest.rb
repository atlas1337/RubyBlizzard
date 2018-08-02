
module RubyBlizzard
  module Wow
    class Quest
      def self.find(id:)
        uri = RubyBlizzard.base_uri("wow/quest/id#{RubyBlizzard.queries}")
        quest = RestClient.get(uri){|response, request, result| response }
		RubyBlizzard.error_check(quest)
      end
    end
  end
end
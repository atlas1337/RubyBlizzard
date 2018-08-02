module RubyBlizzard
  module Wow
    class Spell
      def self.find(id:)
        uri = RubyBlizzard.base_uri("wow/spell/id#{RubyBlizzard.queries}")
        spell = RestClient.get(uri){|response, request, result| response }
		RubyBlizzard.error_check(spell)
      end
    end
  end
end
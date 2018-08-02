module RubyBlizzard
  module Wow
    class Recipe
      def self.find(id:)
        uri = RubyBlizzard.base_uri("wow/recipe/id#{RubyBlizzard.queries}")
        recipe = RestClient.get(uri){|response, request, result| response }
		RubyBlizzard.error_check(recipe)
      end
    end
  end
end
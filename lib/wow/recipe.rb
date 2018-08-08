module RubyBlizzard
  module Wow
    class Recipe
      def self.find(id:)
        uri = RubyBlizzard.base_uri("wow/recipe/id#{RubyBlizzard.queries}")
        response = RestClient.get(uri){|response, request, result| response }
        return {'error_code' => response.code, 'error' => ERRORS[response.code]} if ERRORS.key?(response.code)
        JSON.parse(response.body)
      end
    end
  end
end

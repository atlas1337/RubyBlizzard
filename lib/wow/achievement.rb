module RubyBlizzard
  module Wow
    class Achievement
      def self.find(id:)
        uri = RubyBlizzard.base_uri("wow/achievement/#{id}#{RubyBlizzard.queries}")
        response = RestClient.get(uri){|response, request, result| response }
        return {'error_code' => response.code, 'error' => ERRORS[response.code]} if ERRORS.key?(response.code)
        JSON.parse(response.body)
      end
    end
  end
end

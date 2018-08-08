module RubyBlizzard
  module Wow
    class Guild
      def self.find(guild_name:, realm:, fields: '')
        queries = RubyBlizzard.merge_queries(fields)
        uri = RubyBlizzard.base_uri("wow/guild/#{realm}/#{guild_name}#{queries}")
        response = RestClient.get(uri){|response, request, result| response }
        return {'error_code' => response.code, 'error' => ERRORS[response.code]} if ERRORS.key?(response.code)
        JSON.parse(response.body)
      end
    end
  end
end
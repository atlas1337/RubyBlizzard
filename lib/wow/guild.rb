module RubyBlizzard
  module Wow
    class Guild
      def self.find(guild_name:, realm:, fields: '')
        queries = RubyBlizzard.merge_queries(fields)
        uri = RubyBlizzard.base_uri("wow/guild/#{realm}/#{guild_name}#{queries}")
        guild = RestClient.get(uri){|response, request, result| response }
        RubyBlizzard.error_check(guild)
      end
    end
  end
end
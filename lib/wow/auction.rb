module RubyBlizzard
  module Wow
    class Auction
      def self.find(realm:)
        uri = RubyBlizzard.base_uri("wow/auction/data/#{realm}#{RubyBlizzard.queries}")
        response = RestClient.get(uri){|response, request, result| response }
        return {'error_code' => response.code, 'error' => ERRORS[response.code]} if ERRORS.key?(response.code)
        auction_url = JSON.parse(response.body)['files'][0]['url']
        JSON.parse(RestClient.get(auction_url).body)
      end
    end
  end
end

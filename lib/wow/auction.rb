module RubyBlizzard
  module Wow
    class Auction
      def self.find(realm:)
        uri = RubyBlizzard.base_uri("wow/auction/data/#{realm}#{RubyBlizzard.queries}")
        auctions_file = RestClient.get(uri){|response, request, result| response }
        return {auctions_file.code => ERRORS[auctions_file.code]} if ERRORS.key?(auctions_file.code)
        auction_url = JSON.parse(auctions_file)['files'][0]['url']
        JSON.parse(RestClient.get(auction_url).body)
      end
    end
  end
end
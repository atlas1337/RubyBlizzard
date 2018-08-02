
module RubyBlizzard
  module Wow
    class Realm
      def self.find(realm:)
        uri = RubyBlizzard.base_uri("wow/realm/status#{RubyBlizzard.queries}")
        realms = RestClient.get(uri){|response, request, result| response }
        realms = JSON.parse(realms)['realms']
      	realm = realms.find { |x| x['name'] == realm.downcase.capitalize }
      	return 'Realm does not exist' unless !realm.nil?
      	return realm
      end
    end
  end
end
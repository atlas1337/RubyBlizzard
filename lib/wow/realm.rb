
module RubyBlizzard
  module Wow
    class Realm
      def self.find(realm:)
        uri = RubyBlizzard.base_uri("wow/realm/status#{RubyBlizzard.queries}")
        response = RestClient.get(uri){|response, request, result| response }
        return {'error_code' => response.code, 'error' => ERRORS[response.code]} if ERRORS.key?(response.code)
        realms = JSON.parse(response.body)['realms']
        realm = realms.find { |x| x['name'] == realm.downcase.capitalize }
        return {'error_code' => 404, 'error' => ERRORS[input.code]} unless !realm.nil?
        return realm
      end
    end
  end
end

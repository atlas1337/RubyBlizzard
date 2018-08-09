module RubyBlizzard
  module Wow
    class Character
      def self.find(character_name:, realm:, fields: '')
        queries = ''
        if fields.empty?
          queries = RubyBlizzard.merge_queries(fields)
        elsif !fields.empty?
          queries = RubyBlizzard.merge_queries('&fields=' + fields)
        end
        classes = RubyBlizzard::Wow::DataResources.find_classes
        races = RubyBlizzard::Wow::DataResources.find_races
        uri = RubyBlizzard.base_uri("wow/character/#{realm}/#{character_name}")
        response = RestClient.get(uri + queries){|response, request, result| response }
        return {'error_code' => response.code, 'error' => ERRORS[response.code]} if ERRORS.key?(response.code)
        character = JSON.parse(response.body)
        character['class'] = classes['classes'].find { |x| x['id'] == character['class'] }['name']
        character['race'] = races['races'].find { |x| x['id'] == character['race'] }['name']
        character['gender'] = RubyBlizzard.genders['genders'].find { |x| x['id'] == character['gender'] }['gender']
        character['faction'] = RubyBlizzard.factions['factions'].find { |x| x['id'] == character['faction'] }['faction']
        character['thumbnail'] = "https://render-#{RubyBlizzard.region}.worldofwarcraft.com/character/#{character['thumbnail']}"
        return character
      end
    end
  end
end

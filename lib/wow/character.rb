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
		      character = RestClient.get(uri + queries){|response, request, result| response }
        	  result = RubyBlizzard.error_check(character)
        	  return result if result.key? 'error_code'
		      character = JSON.parse(character)
		      character['class'] = classes['classes'].find { |x| x['id'] == character['class'] }['name']
		      character['race'] = races['races'].find { |x| x['id'] == character['race'] }['name']
		      character['gender'] = RubyBlizzard.genders.find { |x| x['id'] == character['gender'] }['gender']
		      character['faction'] = RubyBlizzard.factions.find { |x| x['id'] == character['race'] }['faction']
		      return character
		    end
		end
	end
end

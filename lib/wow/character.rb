module RubyBlizzard
	module Wow
		class Character
			def self.find(name:, realm:, fields: '')
			  queries = ''
			  if fields.empty?
			  	queries = RubyBlizzard.merge_queries(fields)
			  elsif !fields.empty?
			  	queries = RubyBlizzard.merge_queries('&fields=' + fields)
			  end
		      uri = RubyBlizzard.base_uri("wow/character/#{realm}/#{name}")
		      character = RestClient.get(uri + queries){|response, request, result| response }
        	  return {character.code => ERRORS[character.code]} if ERRORS.key?(character.code)
		      character = JSON.parse(character)
		      #character['class'] = @classes.find { |x| x[:id] == character[:class] }['name']
		      #character['race'] = @races.find { |x| x[:id] == character[:race] }['name']
		    end
		end
	end
end

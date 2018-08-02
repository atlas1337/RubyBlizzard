module RubyBlizzard
	module Wow
		class Battlepet
			def self.find_abilities(ability_id:)
				uri = RubyBlizzard.base_uri("wow/pet/ability/#{ability_id}#{RubyBlizzard.queries}")
				ability = RestClient.get(uri){|response, request, result| response }
				return {ability.code => ERRORS[ability.code]} if ERRORS.key?(ability.code)
				JSON.parse(ability.body)
			end

			def self.find_species(species_id:)
				uri = RubyBlizzard.base_uri("wow/pet/species/#{species_id}#{RubyBlizzard.queries}")
				species = RestClient.get(uri){|response, request, result| response }
				return {species.code => ERRORS[species.code]} if ERRORS.key?(species.code)
				JSON.parse(species.body)
			end

			def self.find_stats(species_id:, level:, breed_id:, quality_id:)
				queries = "&level=#{level}&breedId=#{breed_id}&qualityId=#{quality_id}"
				queries = RubyBlizzard.merge_queries(queries)
				uri = RubyBlizzard.base_uri("wow/pet/stats/#{species_id}#{queries}")
				stats = RestClient.get(uri){|response, request, result| response }
				return {stats.code => ERRORS[stats.code]} if ERRORS.key?(stats.code)
				JSON.parse(stats.body)
			end
		end
	end
end
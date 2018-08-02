module RubyBlizzard
	module Wow
		class DataResources
	      def self.find_battlegroups
	        uri = RubyBlizzard.base_uri("wow/data/battlegroups/#{RubyBlizzard.queries}")
	        battlegroups = RestClient.get(uri){|response, request, result| response }
			RubyBlizzard.error_check(battlegroups)
	      end

	      def self.find_races
	        uri = RubyBlizzard.base_uri("wow/data/character/races#{RubyBlizzard.queries}")
	        races = RestClient.get(uri){|response, request, result| response }
			RubyBlizzard.error_check(races)
	      end

	      def self.find_classes
	        uri = RubyBlizzard.base_uri("wow/data/character/classes#{RubyBlizzard.queries}")
	        classes = RestClient.get(uri){|response, request, result| response }
			RubyBlizzard.error_check(classes)
	      end

	      def self.find_character_achievements
	        uri = RubyBlizzard.base_uri("wow/data/character/achievements#{RubyBlizzard.queries}")
	        character_achievements = RestClient.get(uri){|response, request, result| response }
			RubyBlizzard.error_check(character_achievements)
	      end

	      def self.find_guild_rewards
	        uri = RubyBlizzard.base_uri("wow/data/guild/rewards#{RubyBlizzard.queries}")
	        guild_rewards = RestClient.get(uri){|response, request, result| response }
			RubyBlizzard.error_check(guild_rewards)
	      end

	      def self.find_guild_perks
	        uri = RubyBlizzard.base_uri("wow/data/guild/perks#{RubyBlizzard.queries}")
	        guild_perks = RestClient.get(uri){|response, request, result| response }
			RubyBlizzard.error_check(guild_perks)
	      end

	      def self.find_guild_achievements
	        uri = RubyBlizzard.base_uri("wow/data/guild/achievements#{RubyBlizzard.queries}")
	        guild_achievements = RestClient.get(uri){|response, request, result| response }
			RubyBlizzard.error_check(guild_achievements)
	      end

	      def self.find_item_classes
	        uri = RubyBlizzard.base_uri("wow/data/item/classes#{RubyBlizzard.queries}")
	        item_classes = RestClient.get(uri){|response, request, result| response }
			RubyBlizzard.error_check(item_classes)
	      end

	      def self.find_talents
	        uri = RubyBlizzard.base_uri("wow/data/talents#{RubyBlizzard.queries}")
	        talents = RestClient.get(uri){|response, request, result| response }
			RubyBlizzard.error_check(talents)
	      end

	      def self.find_pet_types
	        uri = RubyBlizzard.base_uri("wow/data/pet/types#{RubyBlizzard.queries}")
	        pet_types = RestClient.get(uri){|response, request, result| response }
			RubyBlizzard.error_check(pet_types)
		  end
		end
	end
end
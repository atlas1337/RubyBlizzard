module RubyBlizzard
	module Wow
		class Achievement
			def self.find(id:)
				uri = RubyBlizzard.base_uri("wow/achievement/#{id}#{RubyBlizzard.queries}")
				achievement = RestClient.get(uri){|response, request, result| response }
				return {achievement.code => ERRORS[achievement.code]} if ERRORS.key?(achievement.code)
				JSON.parse(achievement.body)
			end
		end
	end
end
module RubyBlizzard
	module Wow
		class Challenge
			def self.find_realm(realm:)
				uri = RubyBlizzard.base_uri("wow/challenge/#{realm}#{RubyBlizzard.queries}")
				realm_challenge = RestClient.get(uri){|response, request, result| response }
				RubyBlizzard.error_check(realm_challenge)
			end

			def self.find_region
				uri = RubyBlizzard.base_uri("wow/challenge/region#{RubyBlizzard.queries}")
				region_challenge = RestClient.get(uri){|response, request, result| response }
				RubyBlizzard.error_check(region_challenge)
			end
		end
	end
end
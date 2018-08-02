module RubyBlizzard
	module Wow
		class Item
			def self.find(item_name:)
				url = URI.encode('http://www.wowhead.com/item=' + item_name + '&xml')
			    item_xml = Nokogiri::XML(RestClient.get(url))
			    item_json_raw =item_xml.xpath('//wowhead//json').text
			    item_id = JSON.parse('{' + item_json_raw + '}')['id']
			    uri = RubyBlizzard.base_uri("wow/item/#{item_id}#{RubyBlizzard.queries}")
				item = RestClient.get(uri){|response, request, result| response }
				RubyBlizzard.error_check(item)
			end

			def self.find_set(id:)
				uri = RubyBlizzard.base_uri("wow/item/set/#{id}#{RubyBlizzard.queries}")
				item_set = RestClient.get(uri){|response, request, result| response }
				return {item_set.code => ERRORS[item_set.code]} if ERRORS.key?(item_set.code)
				JSON.parse(item_set.body)
			end
		end
	end
end

module RubyBlizzard
  module Wow
    class Item
      def self.find(item_name:)
        url = URI.encode('http://www.wowhead.com/item=' + item_name + '&xml')
        item_xml = Nokogiri::XML(RestClient.get(url))
        item_json_raw =item_xml.xpath('//wowhead//json').text
        item_id = JSON.parse('{' + item_json_raw + '}')['id']
        uri = RubyBlizzard.base_uri("wow/item/#{item_id}#{RubyBlizzard.queries}")
        response = RestClient.get(uri){|response, request, result| response }
        return {'error_code' => response.code, 'error' => ERRORS[response.code]} if ERRORS.key?(response.code)
        item = JSON.parse(response.body)
        item['bonusStats'].each_with_index do |array, array_index|
          array.each do |key,value|
            if key == 'stat'
              item['bonusStats'][array_index][key] = RubyBlizzard.stats[value.to_s]
            end
          end
        end
        return item
      end

      def self.find_set(id:)
        uri = RubyBlizzard.base_uri("wow/item/set/#{id}#{RubyBlizzard.queries}")
        response = RestClient.get(uri){|response, request, result| response }
        return {'error_code' => response.code, 'error' => ERRORS[response.code]} if ERRORS.key?(response.code)
        JSON.parse(response.body)
      end
    end
  end
end

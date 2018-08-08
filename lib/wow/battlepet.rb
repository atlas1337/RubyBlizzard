module RubyBlizzard
  module Wow
    class Battlepet
      def self.find_abilities(ability_id:)
        uri = RubyBlizzard.base_uri("wow/pet/ability/#{ability_id}#{RubyBlizzard.queries}")
        response = RestClient.get(uri){|response, request, result| response }
        return {'error_code' => response.code, 'error' => ERRORS[response.code]} if ERRORS.key?(response.code)
        JSON.parse(response.body)
      end

      def self.find_species(species_id:)
        uri = RubyBlizzard.base_uri("wow/pet/species/#{species_id}#{RubyBlizzard.queries}")
        response = RestClient.get(uri){|response, request, result| response }
        return {'error_code' => response.code, 'error' => ERRORS[response.code]} if ERRORS.key?(response.code)
        JSON.parse(response.body)
      end

      def self.find_stats(species_id:, level:, breed_id:, quality_id:)
        queries = "&level=#{level}&breedId=#{breed_id}&qualityId=#{quality_id}"
        queries = RubyBlizzard.merge_queries(queries)
        uri = RubyBlizzard.base_uri("wow/pet/stats/#{species_id}#{queries}")
        response = RestClient.get(uri){|response, request, result| response }
        return {'error_code' => response.code, 'error' => ERRORS[response.code]} if ERRORS.key?(response.code)
        JSON.parse(response.body)
      end
    end
  end
end

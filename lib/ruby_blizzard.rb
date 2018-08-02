require 'bundler'
require 'json'
require 'nokogiri'
require 'rest-client'
require 'active_support'

#WoW
require_relative './wow/achievement.rb'
require_relative './wow/auction.rb'
require_relative './wow/battlepet.rb'
require_relative './wow/character.rb'
require_relative './wow/challenge.rb'
require_relative './wow/data_resources.rb'
require_relative './wow/guild.rb'
require_relative './wow/item.rb'
require_relative './wow/pvp.rb'
require_relative './wow/quest.rb'
require_relative './wow/realm.rb'
require_relative './wow/recipe.rb'
require_relative './wow/spell.rb'

module RubyBlizzard
  class << self
    attr_accessor :factions
    attr_accessor :genders
    attr_accessor :locale
    attr_accessor :queries
    attr_accessor :region
  end

  ERRORS = {
    404 => 'API page not found'
  }.freeze

  def self.initialize(api_key:, region: 'us', locale: 'en_us')
    #raise ArgumentError, 'Please obtain an API key and enter it' unless !options[:api_dev_key].blank?
    self.region = region
    self.locale = locale
    self.queries = "?locale=#{self.locale}&apikey=#{api_key}"
    self.genders = {
      {id: 0, gender: 'Male'},
      {id: 1, gender: 'Female'}
    }

    self.factions = {
      {id: 0, faction: 'Alliance'},
      {id: 1, faction: 'Horde'}
    }
  end

  def self.config(region: 'us')
    self.region = region
  end

  def self.merge_queries(queries)
    self.queries + queries
  end

  def self.base_uri(path)
    "https://#{self.region}.api.battle.net/#{path}"
  end

  def self.error_check(input)
    if ERRORS.key?(input.code)
      {'error_code' => input.code, 'error' => ERRORS[input.code]}
    else
      JSON.parse(input.body)
    end
  end
end

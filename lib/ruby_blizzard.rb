require 'bundler'
require 'json'
require 'nokogiri'
require 'rest-client'
require 'active_support/core_ext/object/blank'

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
    attr_accessor :queries
    attr_accessor :region
    attr_accessor :locale
  end

  ERRORS = {
    404 => 'API page not found'
  }.freeze

  def self.initialize(api_key:, region: 'us', locale: 'en_us')
    #raise ArgumentError, 'Please obtain an API key and enter it' unless !options[:api_dev_key].blank?
    self.region = region
    self.locale = locale
    self.queries = "?locale=#{self.locale}&apikey=#{api_key}"
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
      {input.code => ERRORS[input.code]}
    else
      JSON.parse(input.body)
    end
  end

  def item(options = {})
    options = {item_name: nil}.merge(options)
    raise ArgumentError, 'Please enter an item name' unless !options[:item_name].blank?
    url = URI.encode('http://www.wowhead.com/item=' + options[:item_name] + '&xml')
    item_xml = Nokogiri::XML(RestClient.get(url))
    item_json_raw =item_xml.xpath('//wowhead//json').text
    item_id = JSON.parse('{' + item_json_raw + '}')['id']
    item = RestClient.get('https://us.api.battle.net/wow/item/' + item_id.to_s + '?locale=' + @locale + '&apikey=' + @api_key)
    item = JSON.parse(item)
  end
end

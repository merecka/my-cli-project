#!/usr/local/bin/ruby -w
require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  attr_accessor  :cr_region_hash

  @@all = []

  def initialize
    @cr_region_hash = {}
    @@all << self
  end

  BASE_PATH = "https://magicseaweed.com"

  def self.all
    @@all
  end

  def run
    scrape_msw_costarica_region_page
    # scrape_magicseaweed_page(1)
    # scrape_surf_forecast_page(1)
  end

  @@msw_url = {1 => "https://magicseaweed.com/Playa-Santa-Teresa-Surf-Report/914/"}

  def scrape_msw_costarica_region_page
    html = open("https://magicseaweed.com/Central-America-South-Surf-Forecast/29/")
    doc = Nokogiri::HTML(html)
    cr_regions = doc.css(".nomargin-top")[1..5]
    cr_regions.each do |region|
      region_name = region["title"]
      region_url = region["href"]
      self.cr_region_hash[region_name] = BASE_PATH + region_url
    end
    # region name = doc.css(".nomargin-top")[1]["title"]
    # urls = doc.css(".nomargin-top")[1]["href"]
  end

  def scrape_msw_region_surfspot_page(url)
    html = open(url)
    doc = Nokogiri::HTML(html)

    data = doc.css("[data-collection]")[0]
    data_hash = data.to_h
    data_array = data_hash["data-collection"].split(',')
    name_array_split = []
    name_array = []
    url_array_split = []
    url_array = []
    data_array.each do |x|
      if x.include? "name"
        name_array << x.split(':').flatten[1][/\w+\s*\w+/]
      elsif x.include? "url"
        url_array_split = x.split(':')
        url_array_split = url_array_split.flatten
        url_array << BASE_PATH.chomp("") + url_array_split[1].gsub!('\\', '').gsub!("\"", '')
      end
    end

    data_hash.each do |key, value|
      binding.pry
      puts "#{key} and #{value}"
      value.split
    end
  end

  def scrape_magicseaweed_page(choice)
    html = open(@@msw_url[choice])
    doc = Nokogiri::HTML(html)
    puts doc.css(".forecast-sub-title-fluid")[0].text.strip + ":"
    puts "Weather: " + doc.css(".list-group-item .nomargin-bottom")[0].text.strip
    puts "Winds: " + doc.css(".h5.nomargin-top").text
    puts doc.css(".list-group-item-block:nth-child(1)").text.strip
    puts doc.css(".list-group-item-block+ .list-group-item-block").text.strip
    puts "Tides:  " + doc.css(".col-xs-6:nth-child(1)")[0].text.strip
  end

  def scrape_surf_forecast_page(choice)
    forecast_url = {"1" => "http://www.surf-forecast.com/breaks/Playa-Santa-Teresa"}
    html = open(forecast_url[:choice])
    doc = Nokogiri::HTML(html)
  end

end

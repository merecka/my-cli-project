require 'open-uri'
require 'nokogir'
require 'pry'

class Scraper

  def self.scrape_magicseaweed_page
    url = https://magicseaweed.com/Playa-Santa-Teresa-Surf-Report/914/
    html = open(url)
    doc = Nokogiri::HTML(html)
  end

  def self.scrape_surf_forecast_page

  end

end

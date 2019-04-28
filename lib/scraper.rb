require 'open-uri'
require 'nokogir'
require 'pry'

class Scraper

  msw_url = {"1" => "https://magicseaweed.com/Playa-Santa-Teresa-Surf-Report/914/"}

  def self.scrape_magicseaweed_page(choice)
    html = open(msw_url[:choice])
    doc = Nokogiri::HTML(html)
  end

  def self.scrape_surf_forecast_page
    forecast_urls = [http://www.surf-forecast.com/breaks/Playa-Santa-Teresa]
    html = open(url)
    doc = Nokogiri::HTML(html)
  end

end

#!/usr/local/bin/ruby -w
require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def run
    scrape_magicseaweed_page(1)
    # scrape_surf_forecast_page(1)
  end

  @@msw_url = {1 => "https://magicseaweed.com/Playa-Santa-Teresa-Surf-Report/914/"}

  def scrape_msw_costarica_page(url)

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

Scraper.new.run

require_relative "../lib/scraper.rb"
require 'nokogiri'
require 'pry'

class CommandLineInterface

  def display_options
    puts "Welcome to the Daily Surf Forecast:"
    puts "  Choose which surf spot report you would like to see by inputting the corresponding number."
    puts "  1.  Playa Santana"
    input = gets.chomp

    Scraper.scrape_magicseaweed_page(input)
  end

end

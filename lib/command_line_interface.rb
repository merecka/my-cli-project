require_relative "../lib/scraper.rb"
require 'nokogiri'
require 'pry'

class CommandLineInterface

  def display_options
    puts "Welcome to the Daily Surf Forecast:"
    puts "  Choose which surf spot report you would like to see by typing the corresponding number."
    puts "  1.  Playa Santana"
    choice_1 = gets.chomp

    case surf_spot
    when choice_1 == 1
      playa_santana
    end
  end

  def playa_santana
    puts "  Choose which option you would like to see by typing the corresponding number."
    puts "  1.  Today's surf report"
    puts "  2.  Surf spot description"
    choice_2 = gets.chomp

    Scraper.scrape_magicseaweed_page(choice_2)
  end

end

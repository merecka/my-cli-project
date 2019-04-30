#!/usr/local/bin/ruby -w
# require_relative "../lib/scraper.rb"
require 'nokogiri'
require 'pry'

class CommandLineInterface

  def run
    surf_spot_menu
  end

  def surf_spot_menu
    puts "Welcome to the Daily Surf Forecast:"
    puts "  Choose which surf spot you would like to see by typing the corresponding number."
    puts "  1.  Playa Santana"
    choice_1 = gets.chomp
    Scraper.scrape_surf_forecast_page(choice_1)
    choose_option(choice_1)
  end

  def choose_option(surf_spot)
    puts "  Choose which option you would like to see by typing the corresponding number."
    puts "  1.  Today's surf report"
    puts "  2.  Surf spot description"
    choice_2 = gets.chomp

    case surf_spot
    when choice_2 == 1
      Scraper.scrape_magicseaweed_page(choice_2)
    when choice_2 == 2
      Scraper.scrape_surf_forecast_page(surf_spot)
    else
      "Error:  Please choose an available option by typing in the corresponding number."
    end
  end

end

CommandLineInterface.new.run

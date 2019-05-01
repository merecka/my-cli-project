#!/usr/local/bin/ruby -w
require_relative "../lib/scraper.rb"
require 'nokogiri'
require 'pry'

class CommandLineInterface

  def run
    Scraper.new.run
    surf_region_menu
    # surf_spot_menu
    # choose_option
  end

  def surf_region_menu
    puts "Welcome to the Daily Surf Forecast!"
    puts "\n"

    region_list_hash = {}
    Scraper.all.each do |scrape|
      counter = 1
      scrape.cr_region_hash.each_key do |key|
        region_list_hash[counter] = key
        puts "#{counter}.  #{key}"
        counter += 1
      end

      puts "Choose which surf region you would like to see by typing the corresponding number."
      choice = gets.chomp
      if choice.to_i >= 1 && choice.to_i <= scrape.cr_region_hash.length
        region_to_scrape = region_list_hash[choice]
        scrape.scrape_msw_region_surfspot_page(scrape.cr_region_hash[region_to_scrape])
        binding.pry
      else
        puts "Please enter a number corresponding to the surf region you would like to see."
      end
    end
  end

  def surf_spot_menu
    puts "Welcome to the Daily Surf Forecast:"
    puts "  Choose which surf spot you would like to see by typing the corresponding number."
    puts "  1.  Playa Santana"
    choice_1 = gets.chomp
    # Scraper.scrape_surf_forecast_page(choice_1)
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

#!/usr/local/bin/ruby -w
require_relative "../lib/scraper.rb"
require 'nokogiri'
require 'pry'

class CommandLineInterface

  def run
    Scraper.new.run
    surf_region_menu
    surf_spot_menu
  end

  def surf_region_menu
    puts "Welcome to the Costa Rica Daily Surf Report!"
    puts "\n"
    puts "Choose which surf region you would like to see by typing the corresponding number."

    region_list_hash = {}
    Scraper.all.each do |scrape|
      counter = 1
      scrape.cr_region_hash.each_key do |key|
        region_list_hash[counter] = key
        puts "#{counter}.  #{key}"
        counter += 1
      end

      choice = gets.chomp
      choice = choice.to_i
      if choice.class == Integer && choice >= 1 && choice <= scrape.cr_region_hash.length
        region_to_scrape = region_list_hash[choice]
        scrape.scrape_cr_region_surfspot_page(scrape.cr_region_hash[region_to_scrape])
      else
        puts "Please enter a number corresponding to the surf region you would like to see."
        puts "\n"
        surf_region_menu
      end
    end
  end

    def surf_spot_menu
      puts "\n"
      puts "Choose which surf spot you would like to see by typing the corresponding number."

      surfspot_list_hash = {}
      Scraper.all.each do |scrape|
        counter = 1
        scrape.cr_surfspot_hash.each_key do |key|
          surfspot_list_hash[counter] = key
          puts "#{counter}.  #{key}"
          counter += 1
        end

        choice = gets.chomp
        choice = choice.to_i
        if choice.class == Integer && choice >= 1 && choice <= scrape.cr_surfspot_hash.length
          spot_to_scrape = surfspot_list_hash[choice]
          scrape.scrape_surfspot_page(scrape.cr_surfspot_hash[spot_to_scrape])
        else
          puts "Please enter a number corresponding to the surf region you would like to see."
          puts "\n"
          surf_spot_menu
        end
      end
    end

end

CommandLineInterface.new.run

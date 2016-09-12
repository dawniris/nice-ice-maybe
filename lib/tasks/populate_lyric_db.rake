require_relative '../mechanize/ice_ice_scraper.rb'

task :populate_lyric_db => :environment do
  scraper = IceIceScraper.new('http://lyrics.wikia.com/wiki/Vanilla_Ice')
  scraper.scrape
end
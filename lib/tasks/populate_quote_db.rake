require_relative '../mechanize/quote_scraper.rb'

task :populate_quote_db => :environment do
  scraper = QuoteScraper.new('http://www.brainyquote.com/quotes/authors/v/vanilla_ice.html')
  scraper.scrape
end
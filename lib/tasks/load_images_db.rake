require_relative '../image_grabbler/grabbler.rb'

task :load_images_db => :environment do
  grabbler = Grabbler.new
  grabbler.scrape
end
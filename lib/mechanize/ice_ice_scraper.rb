require 'rubygems'
require 'mechanize'
require 'pry'

require_relative 'page_content'
#from /nice-ice-maybe:
# be rails c
# require './lib/mechanize/ice_ice_scraper.rb'

class IceIceScraper
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def agent
    @agent ||= Mechanize.new
  end

  def homepage
    @homepage ||= agent.get(url)
  end

  def song_links
    @song_links ||= homepage.links.select do |link|
      href = link.href
      href =~ /vanilla_ice\:/i && !(href =~ /(\(\d+\))/)
    end
  end

    #make new method song_link_objects
  #song_links.map
  # SongLink.new(link)

  def call
    links = song_links
    body = []
    errors = []

    #clicks each song link and scrapes the text
    links.each_slice(5) do |link_set|
      thread_pool = []
      link_set.each do |link|
        thread_pool << Thread.new do
          begin
            page = PageContent.new(link)
            body << page.parse_song_page
          rescue => e
            errors << [e, link]
          end
        end
      end
      thread_pool.map(&:join)
    end
    binding.pry
  end

end

scraper = IceIceScraper.new('http://lyrics.wikia.com/wiki/Vanilla_Ice'); scraper.call
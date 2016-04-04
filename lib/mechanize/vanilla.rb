require 'rubygems'
require 'mechanize'
require 'pry'

#from /nice-ice-maybe:
# be rails c
# require './lib/mechanize/vanilla.rb'

class Vanilla
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

  # def homepage
  #   @homepage ||= agent.get('http://lyrics.wikia.com/wiki/Vanilla_Ice')
  # end

  def call
    links = song_links
    binding.pry

    body = []
    errors = []
    #BORN ON HALLOWEEN IS MISSING NOOO

    #clicks each song link and scrapes the text
    links.each_slice(5) do |link_set|
      thread_pool = []
      link_set.each do |link|
        thread_pool << Thread.new do
          begin
            song = link.click
            parse_song = Nokogiri::HTML(song.body)
          # selects textbox via class name
            parsed_song = parse_song.search(".lyricbox")
          # iterates over each XML node and fetches text of each child
            lyrics = parsed_song.map { |node| node.children.map(&:text) }
          # removes empty strings so db isn't FULLA HOLES
            body << lyrics.flatten.select { |v| !v.chomp.empty? } #|| !v.include?("</") }
          rescue => e
            errors << [e, link]
          end
        end
      end
      thread_pool.map(&:join)
    end
  end

  def song_links
    @song_links ||= homepage.links.select do |link|
      href = link.href
      href =~ /vanilla_ice\:/i && !(href =~ /(\(\d+\))/)
    end
  end

end

van = Vanilla.new('http://lyrics.wikia.com/wiki/Vanilla_Ice'); van.call
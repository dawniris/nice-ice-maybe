require 'rubygems'
require 'mechanize'
require 'pry'

class PageContent
  attr_reader :link

  def initialize(link)
    @link = link
  end

  def click_song
    @click_song ||= link.click
  end

  def fetch_song
    @fetch_song ||= Nokogiri::HTML(click_song.body)
  end

  def parsed_song
  # selects textbox via class name
    @parsed_song ||= fetch_song.search(".lyricbox")
  end

  def lyrics
  # iterates over each XML node and scrapes text of each child
    @lyrics ||= parsed_song.map { |node|
    # only returns value if node is a text node
      node.children.map do |inner_node|
        if inner_node.is_a?(Nokogiri::XML::Text)
          inner_node.text
        end
      end.compact
    }
  end

  def flatten_lyrics
  # removes empty strings so db isn't FULLA HOLES
    lyrics.flatten.select { |v| !v.chomp.empty? }
  end

  def song
    @song ||= Song.create(:payload => parsed_song.text)
  end

  def song_slices
    @song_slices ||= flatten_lyrics.map do |lyric|
      SongSlice.create(:chunk => lyric, :song => song)
    end
  end

  def normalize_data
    song
    song_slices
  end
end

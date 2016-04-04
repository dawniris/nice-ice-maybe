require 'rubygems'
require 'mechanize'
require 'pry'



class PageContent
  attr_reader :link

  def initialize(link)
    @link = link
  end

    # for refactoring: instantiate SongLink object (with the link)
    # call .lyric_list/lyrics_array on it
    # then all begin/end logic goes into SongLink, threadpool stays out


  #anywhere you have local variable (body =, lyrics =) is its own method

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

  def normalize_data
  # removes empty strings so db isn't FULLA HOLES
    lyrics.flatten.select { |v| !v.chomp.empty? }
  end

end

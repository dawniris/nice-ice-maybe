require 'bing-search'

class Grabbler
  def images
    @images ||= BingSearch.image("vanilla ice")
  end

  def scrape
    images.each do |i|
      Image.find_or_create_by(:url => i.media_url)
    end
  end
end
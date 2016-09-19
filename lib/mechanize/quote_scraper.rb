require 'nokogiri'
require 'open-uri'

class QuoteScraper
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def scrape
    docs.each do |doc|
      quotes(doc).each do |quote|
        Quote.find_or_create_by(quote_text: quote.inner_text)
      end
    end
    nil
  end

  private
    
  def docs
    links = []
    for i in 1..page_count do
      links << Nokogiri::HTML(open(url.sub("ice","ice_" + i.to_s)))
    end
    links
  end

  def quotes(doc)
    doc.xpath('//*[@id="quotesList"]/div//div//span/a/text()')
  end

  def page_count
    homepage = Nokogiri::HTML(open(url))

    #get the pagination links
    page_links = homepage.xpath('//*[@id="ss-controller-id"]/div[5]/div/div/div[2]/div/div[1]/div[1]/div/div/div[2]/nav/ul/li')

    #subtract 2 for prev and next links
    page_links.count - 2
  end

end
class Quote < ActiveRecord::Base
  class << self
    def grab_random
      find_by_sql("SELECT quote_text FROM quotes ORDER BY random() LIMIT 1").first
    end
  end
end
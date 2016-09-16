class Image < ActiveRecord::Base
  validates :url, presence: :true
  def self.grab_random
    image = find_by_sql "SELECT * FROM images ORDER BY random() LIMIT 1"
    pic = image.first
    return pic ? pic.url : nil
  end
end
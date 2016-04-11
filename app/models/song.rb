class Song < ActiveRecord::Base
  has_many :song_slices
end

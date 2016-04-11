class SongSlice < ActiveRecord::Base
  belongs_to :song

  class << self

    def random_set(number)
      find_by_sql "SELECT * FROM song_slices ORDER BY random() LIMIT #{number}"
    end

  end
end
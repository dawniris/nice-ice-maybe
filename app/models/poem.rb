class Poem < ActiveRecord::Base
  validates :name, presence: :true
  class << self

    def generate_random
      song_data = random_song_slices
      new(:name => random_name_from(song_data), :data => song_data)
    end

    private

    def random_name_from(string)
      string.split(" ").sample
    end

    def random_song_slices
      SongSlice.random_set(rand(3..15)).map(&:chunk).join("\n")
    end


  end
end
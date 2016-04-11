class CreateSongSlices < ActiveRecord::Migration
  def change
    create_table :song_slices do |t|
      t.text :chunk
      t.references :song

      t.timestamps null: false
    end
  end
end

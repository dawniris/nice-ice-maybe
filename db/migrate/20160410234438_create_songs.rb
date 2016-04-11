class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.text :payload

      t.timestamps null: false
    end
  end
end

class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |t|
      t.string :name
      t.text :data

      t.timestamps null: false
    end
  end
end

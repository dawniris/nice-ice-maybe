class AddUrlToPoems < ActiveRecord::Migration
  def change
    add_column :poems, :image_url, :text
  end
end

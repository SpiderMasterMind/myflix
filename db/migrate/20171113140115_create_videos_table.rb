class CreateVideosTable < ActiveRecord::Migration
  def change
    create_table :videos do |t|
			t.string :title
			t.string :description, default: "No description"
			t.string :small_cover_url
			t.string :large_cover_url
			t.timestamps null: false
    end
  end
end

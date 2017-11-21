class AddCategoryToVideos < ActiveRecord::Migration
  def change
		add_reference :videos, :category, foreign_key: true
  end
end

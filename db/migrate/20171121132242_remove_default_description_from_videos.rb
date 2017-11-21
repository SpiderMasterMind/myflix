class RemoveDefaultDescriptionFromVideos < ActiveRecord::Migration
  def change
		change_column_default :videos, :description, nil
  end
end

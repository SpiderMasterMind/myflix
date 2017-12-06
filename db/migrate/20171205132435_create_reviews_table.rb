class CreateReviewsTable < ActiveRecord::Migration
  def change
    create_table :reviews_tables do |t|
			t.integer :video_id
			t.integer :user_id
			t.text :content
			t.integer :rating
			t.timestamps
    end
  end
end

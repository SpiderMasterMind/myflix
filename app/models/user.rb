class User < ActiveRecord::Base
	validates_presence_of :email, :password, :full_name
	validates_uniqueness_of :email
	has_many :reviews
	has_many :queue_items, -> { order(:position) }

	has_secure_password

	def normalize_queue_item_positions
		queue_items.each_with_index do |queue_item_data, index|
			queue_item_data.update_attributes(position: index + 1)
		end
	end

	def has_queued_video?(video)
		queue_items.map(&:video_id).include?(video.id)
	end
end

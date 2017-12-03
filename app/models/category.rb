class Category < ActiveRecord::Base
	has_many :videos 

	def recent_videos
		# return 6 or less most recent videos, most recent first
		videos.first(6)
	end
end

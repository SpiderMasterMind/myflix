class QueueItem < ActiveRecord::Base
	belongs_to :user
	belongs_to :video

	def video_title
		self.video.title	
	end

	def rating
		review = Review.where(user: user.id, video: video.id).first
		review.rating if review
	end

	def category_name
		self.video.category.name
	end
end

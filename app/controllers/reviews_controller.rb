class ReviewsController < ApplicationController
	before_action :require_user	

	def create
		@video = Video.find(params[:video_id])
		review = @video.reviews.new(merged_review_params)
		if review.save
			redirect_to @video		
		else
			@reviews = @video.reviews.reload
			render 'videos/show'
		end
	end

	private

	def allow_review_params
		params.require(:review).permit!
	end

	def merged_review_params
		allow_review_params.merge(user: current_user)
	end
end

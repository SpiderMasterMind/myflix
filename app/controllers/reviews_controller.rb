class ReviewsController < ApplicationController

	def create
		video = Video.find(params[:video_id])
		review = video.reviews.create(merged_review_params)
		redirect_to video
	end

	private

	def allow_review_params
		params.require(:review).permit!
	end

	def merged_review_params
		allow_review_params.merge(user: current_user)
	end
end

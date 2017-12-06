require 'spec_helper'

describe ReviewsController do
	describe "POST create" do

		context "with authenticated users" do
			let(:auth_user) { Fabricate(:user) } 
			before { session[:user_id] = auth_user.id }

			context "with valid inputs" do
				it "redirects to the video show page" do
					video = Fabricate(:video)
					post :create, review: Fabricate.attributes_for(:review), video_id: video.id
					expect(response).to redirect_to video
				end

				it "creates a review" do
					video = Fabricate(:video)
					post :create, review: Fabricate.attributes_for(:review), video_id: video.id
					expect(Review.count).to eq(1)	
				end

				it "creates a review associated with the video" do
					video = Fabricate(:video)
					post :create, review: Fabricate.attributes_for(:review), video_id: video.id
					expect(Review.first.video).to eq(video)
				end

				it "creates a review associated with the sign-in user" do
					video = Fabricate(:video)
					user = Fabricate(:user)
					post :create, review: Fabricate.attributes_for(:review), video_id: video.id
					expect(Review.first.user).to eq(auth_user)
				end
			end

			context "with invalid inputs" do
				it "does not create a review" do
					video = Fabricate(:video)
					post :create, review: { rating: 4 }, video_id: video.id
				end
			end
		end

		context "with un-authenticated users" do
		end
	end
end

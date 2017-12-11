require 'spec_helper'

describe VideosController do
	describe "GET show" do
		it "sets @video for authenticated users" do
			session[:user_id] = Fabricate(:user).id
			video = Fabricate(:video)
			get :show, id: video.id 
			expect(assigns(:video)).to eq(video)
		end

		# user review section on a video show page,
		# test should fabricate review(s), and make sure they are set as instance variables
		# the reviews should be in reverse chronological order
		# average rating should be shown underneath the video title
		# number of reviews should be shown in heading

			# This is testing Rails code not our code
			# it "renders the video template" do
			# 	video = Fabricate(:video)
			# 	get :show, id: video.id 
			# 	expect(response).to render_template :show
			# end

		it "sets @reviews for authenticated users" do
			session[:user_id] = Fabricate(:user).id
			video = Fabricate(:video)
			get :show, id: video.id
			review1 = Fabricate(:review, video: video)
			review2 = Fabricate(:review, video: video)
			expect(assigns(:reviews)).to match_array([review1, review2])
		end

		it "redirects un-authenticated user to sign-in page" do
			video = Fabricate(:video)
			get :show, id: video.id 
			expect(response).to redirect_to sign_in_path
		end
	end


	describe "GET search" do
		it "sets @results for authenticated users" do
			session[:user_id] = Fabricate(:user).id
			futurama = Fabricate(:video, title: "Futurama")
			get :search, search_term: "Futu"
			expect(assigns(:results)).to eq([futurama])
		end

		it "redirects to sign-in page for unauthenticated users" do
			futurama = Fabricate(:video, title: "Futurama")
			get :search, search_term: "Futu"
			expect(response).to redirect_to sign_in_path
		end


	end
end

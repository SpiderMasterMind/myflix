require 'spec_helper'

describe VideosController do
	describe "GET show" do
		it "sets @video for authenticated users" do
			session[:user_id] = Fabricate(:user).id
			video = Fabricate(:video)
			get :show, id: video.id 
			expect(assigns(:video)).to eq(video)
		end

			# This is testing Rails code not our code
			# it "renders the video template" do
			# 	video = Fabricate(:video)
			# 	get :show, id: video.id 
			# 	expect(response).to render_template :show
			# end

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

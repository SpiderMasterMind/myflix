require 'spec_helper'

describe VideosController do
	describe "GET show" do
		it "sets @video" do
			# setup
			# action
			# result
			video = Fabricate(:video)
			get :show, id: video.id


		end

		it "renders the video template" do
		end

	end


	describe "GET search" do


	end
end

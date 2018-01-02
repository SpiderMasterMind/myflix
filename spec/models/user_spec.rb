require 'spec_helper'

describe User do
	it { should validate_presence_of(:email) }
	it { should validate_presence_of(:password) }
	it { should validate_presence_of(:full_name) }
	it { should validate_uniqueness_of(:email) }
	it { should have_many(:queue_items).order(:position) }

	describe "#has_queued_video?" do
		it "returns true when there is an instance of the video argument in the user's queue" do
			user = Fabricate(:user)
			video = Fabricate(:video)
			Fabricate(:queue_item, user: user, video: video)
			user.has_queued_video?(video).should be_truthy
 		end

		it "returns false when the user has not queued the video" do
			user = Fabricate(:user)
			video = Fabricate(:video)
			video2 = Fabricate(:video)
			Fabricate(:queue_item, user: user, video: video2)
			user.has_queued_video?(video).should be_falsey	
		end
	end
end

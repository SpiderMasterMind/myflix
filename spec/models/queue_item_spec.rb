require 'spec_helper'

describe QueueItem do
	it { should belong_to(:user) }
	it { should belong_to(:video) }

	describe "#video_title" do
		it "returns the title of the associated video" do
			video = Fabricate(:video, title: "Monk")
			queue_item = Fabricate(:queue_item, video: video)
			expect(queue_item.video_title).to eq("Monk")
		end
	end

	describe "#rating" do
		it "returns the rating from the review when the review is present" do
			user = Fabricate(:user)
			video = Fabricate(:video)
			review = Fabricate(:review, user: user, video: video, rating: 4)
			queue_item = Fabricate(:queue_item, video: video, user: user)
			expect(queue_item.rating).to eq(4)
		end

		it "returns nil when the review is not present" do
			user = Fabricate(:user)
			video = Fabricate(:video)
			review = Fabricate(:review, user: user, video: video, rating: nil)
			queue_item = Fabricate(:queue_item, video: video, user: user)
			expect(queue_item.rating).to eq(nil)
		end
	end

	describe "#category_name" do
		it "returns the category's name of the video" do
			category = Fabricate(:category, name: "comedy")			
			video = Fabricate(:video, category: category)			
			queue_item = Fabricate(:queue_item, video: video)
			expect(queue_item.category_name).to eq("comedy")
		end
	end
end
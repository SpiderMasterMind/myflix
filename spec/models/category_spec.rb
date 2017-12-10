require 'spec_helper'

describe Category do
	it { should have_many(:videos) }
	it { should validate_presence_of(:name) }
	

	describe "#recent_videos" do
		it "returns the videos in the reverse chronological order by when they were created" do
			comedy = Category.create(name: "comedy")
			futurama = Video.create(title: "Futurama", description: "Space travel", category: comedy, created_at: 1.day.ago)
			south_park = Video.create(title: "South Park", description: "Crazy kids!", category: comedy)
			expect(comedy.recent_videos).to eq([futurama, south_park])
		end

		it "returns all the videos if thre are less than 6 videos" do
			comedy = Category.create(name: "comedy")
			futurama = Video.create(title: "Futurama", description: "Space travel", category: comedy, created_at: 1.day.ago)
			south_park = Video.create(title: "South Park", description: "Crazy kids!", category: comedy)
			expect(comedy.recent_videos.count).to eq(2)
		end

	end
end

require 'spec_helper'

describe Category do
	it "saves itself" do
		category = Category.new(name: "comedy")
		category.save
		expect(Category.first).to eq(category)
	end

	it "has many videos" do
		category = Category.create(name: "comedy")
		south_park = Video.create(title: "South Park", description: "Funny video", category: category)
		futurama = Video.create(title: "Futurama", description: "Space", category: category)
		expect(category.videos).to include(south_park, futurama)
	end
end

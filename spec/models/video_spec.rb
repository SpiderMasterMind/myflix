require 'spec_helper'

describe Video do
	it "saves itself with create" do
		test = Video.create(title: "Test Title 1", description: "test description")
		Video.first.title.should == "Test Title 1"
	end

	it "saves itself with save" do
		test = Video.new(title: "Test Title 2", description: "test description")
		test.save
		expect(Video.first.title).to eq("Test Title 2")
	end

	it "belongs to a category" do
		category = Category.create(name: "drama")
		test = Video.new(title: "Line of Duty", description: "Cop show", category: category)
		expect(test.category).to eq(category)
	end

	it "requires a title" do
		test_model = Video.new(description: "Cop show")
		expect(test_model.save).to eq(false) # with no title
	end

	it "requires a description" do
		test_model = Video.new(title: "Futurama")
		expect(test_model.save).to eq(false) # with no description
	end

end

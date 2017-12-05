Fabricator(:video) do 
	title { Faker::Movie.quote }
	description { Faker::Lorem.paragraph(2) }

end


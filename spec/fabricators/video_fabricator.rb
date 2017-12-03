Fabricator(:video) do 
	name { Faker::Movie.quote }
	description { Faker::Lorem.paragraph(2) }

end


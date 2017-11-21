# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# http://placehold.it/WxH/bckgrndcolor/textcolor?text=Hello+World!
titles = %w(ponyo the_wind_rises porco_rosso howl's_moving_castle grave_of_the_fireflies 
	the_cat_returns arriety only_yesterday spirited_away princess_mononoke the_red_turtle the_little_norse_princess laputa grave_of_the_fireflies)

def random_color
	"%06x" % rand(0..0xffffff)
end

small_base_url = "http://placehold.it/166x236/"
large_base_url = "http://placehold.it/665x375/"


titles.each do |title|
	Video.create(title: title, description: "A film", small_cover_url: "#{small_base_url}+#{random_color}/000000?text=#{title.upcase.titleize}", large_cover_url: "#{large_base_url}" + title.upcase)
end

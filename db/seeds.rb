# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

# puts "Cleaning up database..."
# Movie.destroy_all
# puts "Database is Clean!"


url = "http://tmdb.lewagon.com/movie/top_rated"
5.times do |i|
	puts "Importing Movies.. #{i + 1}"
	movies = JSON.parse(open("#{url}?page=#{i + 1}").read)['results']
	movies.each do |movie|
		puts "Creating #{movie['title']}"
		base_url = "https://image.tmdb.org/"
		Movie.create(
			title: movie['title'],
			overview: movie['overview'],
			poster_url:"#{base_url}#{movie['backdrop_path']}",
			rating: movie['vote_avarage']
		)
	end
end
puts "All Done"		
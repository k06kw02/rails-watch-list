# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require "open-uri"
require "json"
puts "Cleaning database..."
Movie.destroy_all

puts "Creating restaurants..."
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
url = "http://tmdb.lewagon.com/movie/top_rated"
movie_data = JSON.parse(open(url).read)["results"]

movie_data.each do |movie|

  params = {
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie["backdrop_path"]}",
    rating: movie["vote_average"]
  }
  new_movie = Movie.create(params)
  puts new_movie.id
end

#

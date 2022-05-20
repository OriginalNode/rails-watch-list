# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "json"
require "open-uri"

List.create(name: 'Top movies')
List.create(name: 'All time favorites')

url = 'https://tmdb.lewagon.com/movie/now_playing'
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)['results']
movies.each do |i|
  movie = Movie.new(
    title: i['title'],
    overview: i['overview'],
    poster_url: "https://image.tmdb.org/t/p/original#{i['poster_path']}",
    rating: i['vote_average']
  )
  movie.save
  Bookmark.new(comment: 'machin machin machin', movie_id: movie.id, list_id: 2)
end

url = 'https://tmdb.lewagon.com/movie/upcoming'
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)['results']
movies.each do |i|
  Movie.create(
    title: i['title'],
    overview: i['overview'],
    poster_url: "https://image.tmdb.org/t/p/original#{i['poster_path']}",
    rating: i['vote_average']
  )
end

url = 'https://tmdb.lewagon.com/movie/top_rated'
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)['results']
movies.each do |i|
  Movie.create(
    title: i['title'],
    overview: i['overview'],
    poster_url: "https://image.tmdb.org/t/p/original#{i['poster_path']}",
    rating: i['vote_average']
  )
  Bookmark.new(comment: 'truc truc truc', movie_id: movie.id, list_id: 1)
end

url = 'https://tmdb.lewagon.com/movie/latest'
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)['results']
movies.each do |i|
  Movie.create(
    title: i['title'],
    overview: i['overview'],
    poster_url: "https://image.tmdb.org/t/p/original#{i['poster_path']}",
    rating: i['vote_average']
  )
end

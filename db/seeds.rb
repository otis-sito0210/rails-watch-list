require 'open-uri'
require 'json'

puts "Deletando base de filmes"
Movie.destroy_all

puts "Carregando base de filmes"
base_url = 'http://tmdb.lewagon.com'

def fetch_data(url)
  response = URI.open(url)
  JSON.parse(response.read)
end

page = 1
url = "#{base_url}/movie/top_rated"
movie_data = fetch_data(url)

if movie_data['results'].length > 0
  movie_data['results'].each do |movie|
    Movie.create(
      title: movie['title'],
      overview: movie['overview'],
      poster_url: "https://image.tmdb.org/t/p/w500/" + movie['poster_path'],
      rating: movie['vote_average']
    )
  end
end

puts "Filmes carregados com sucesso"

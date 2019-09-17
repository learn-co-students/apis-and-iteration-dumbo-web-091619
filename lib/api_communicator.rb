require 'rest-client'
require 'json'
require 'pry'

# iterate over hash and collect API URLS for the moves that character appears in
# make a web request to each URL using Rest Client
# collect and parse the responses of each of these web requests.
# RESULT: should be array of hashes
# RESULT: each hash should rep. a movie
def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  ugly_films = response_hash["results"].map do |character_hash|
    if character_hash["name"].downcase == character_name
      character_hash["films"]
    end
  end
  films = ugly_films.find do |element|
    !element.nil?
  end
  return films
end

  

  # if character == character_name
  #   films = character[]
  # end
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.


def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each do |film|
    response_string = RestClient.get(film)
  response_hash = JSON.parse(response_string)
  puts response_hash["title"]
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

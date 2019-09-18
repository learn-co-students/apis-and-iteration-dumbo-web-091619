require 'rest-client'
require 'json'
require 'pry'

def get_character_hash_data
  # told in review that to parse through the different pages, 
  # told to loop through by concatenating it onto the 'response_string'
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  response_hash["results"]
end


def find_characters_in_api(character_name)
  #make the web request
  hash_data = get_character_hash_data()
  hash_data.find do |character|
    character['name'].downcase == character_name 
  end
end  
  
def get_character_movies_from_api(character_name)
   character = find_characters_in_api(character_name)
   get_films = character['films']
end


def film_url_convert(film_array)
  arr1 = []
  film_array.map do |film_url|
    response_string = RestClient.get(film_url)
    response_hash = JSON.parse(response_string)
    arr1 << response_hash
  end
  arr1
end


def print_movies(films)
   films.each_with_index do |val , index|
    # can edit method and choose to number based on the order of the numbers from the original hash. 
    puts "#{index + 1} #{val['title']}"
   end
end

def show_character_movies(character)
films_array_url = get_character_movies_from_api(character)
films_to_print = film_url_convert(films_array_url)
print_movies(films_to_print)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

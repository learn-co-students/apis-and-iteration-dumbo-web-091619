require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  url = "http://www.swapi.co/api/people/"
  all_character_array = get_all_characters(url)
  char_result = all_character_array.find do |character|
    character['name'] == character_name

  # all_character_array.find{|character| character['name'] == character_name}
  end
  char_result ? get_film_list(char_result['films']): nil
end

def get_all_characters(url)
  all_character_array = []
  while url do
    response_hash = get_hash_from_request(url)
    all_character_array = all_character_array.concat(response_hash['results'])
    url = response_hash["next"]
  end
  return all_character_array
end

def get_film_list(film_urls)
  film_urls.map do |film|
    get_hash_from_request_for(film)
  end
end

def get_hash_from_request(url)
  response_string = RestClient.get(url)
  JSON.parse(response_string)
end

def print_movies(films)
  puts "---------------------------------------------------"
  films.each do |film|
    puts "Title: #{film["title"]}"
    puts "Director: #{film["director"]}"
    puts "Producer: #{film["producer"]}"
    puts "Release Date: #{film["release_date"]}"
    puts "---------------------------------------------------"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  # print_movies(films)
  films ? print_movies(films): puts( "Sorry try again")
end
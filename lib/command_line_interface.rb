def welcome
  puts "welcome to the Star Wars API."
  puts "Please enter what you would like to search for."
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  input = gets.chomp.downcased
end

def welcome
  # puts out a welcome message here!
  puts "Hello and welcome to the Star Wars API Communicator!"
  puts "May the Force be with you!"
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  input = gets.chomp()
  return input.downcase
end


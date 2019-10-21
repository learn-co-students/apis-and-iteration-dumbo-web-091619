def welcome
  # puts out a welcome message here!
  puts "It is a period of civil war."
  puts "Striking from a hidden base, rebel spaceships have won their first victory against the Evil Galactic Empire."
  puts "In the battle, rebels managed to steal the plans to the Empire's secret ultimate weapon, THE DEATH STAR...."
end

def get_character_from_user
  puts "please enter a character name"
  gets.chomp.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end

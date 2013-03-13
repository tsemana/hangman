
















































# require_relative "hangman"
# # figure out a rnadom word to use for the game

# class HangPlay

# 	# Starts the hangman game
# 	def self.start
# 		@@game = Hangman.new("hello")  # hey, let's play 1 game of hangman
		
# 		while !@@game.game_over?
# 		self.show_round
# 		end
# 	end

# 	def self.show_round
# 		puts
# 		 ""
# 		puts "Board: #{@@game.board}"
# 		puts ""
# 		puts "Guessed: "
# 		puts ""
# 		puts "Chances left: #{@@game.chance}"
# 		puts ""
# 		puts "Please choose a letter"
# 		letter = gets.chomp
# 		puts ""
	
# 		puts "The letter is: " + letter
# 	end
# end
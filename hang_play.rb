require_relative "hangman"

class HangmanPlay

	 cattr_accessor :inputletter, :word  # why can't I use this to call up my hang_play_tests?

	def self.start
		self.get_a_random_word
		@@inputletter = "o" # - default value of a single letter so that self.inputcheck can run at first loop of @interface_setup
		@@game = Hangman.new(@@word)
		self.interface_setup
	end

	def self.get_a_random_word
  	word_list = ["hello", "goodbye", "dance", "ruby", "left", "maybe","panic","jonas", "ipod","wallet","keyboard","computer"]
  	@@word = word_list[rand(word_list.size)]
	end

	def self.interface_setup
		loop do
			puts "*************************"
			puts "HANGMAN!"
			puts ""
			puts ""
			puts @@game.board
			puts ""
			puts "Letters chosen: #{@@game.inputlist}"
			puts "Chances left: #{@@game.chance}"
			puts ""
				if @@game.board_won?
					puts "YOU WON!"
					return
				elsif @@game.board_lost?
					puts "YOU LOST!"
					puts "The word was: #{@@game.word}"
					return
				elsif !self.inputcheck?
					puts "Invalid character! Insert one letter!!"
				end
			puts "Pick a letter:"
			self.input
			puts "*************************"
		end
	end
	
	def self.input
		@@inputletter = gets.chomp.downcase
		if self.inputcheck?
			@@game.guessed_letter(@@inputletter)
		end
	end

	def self.inputcheck?
		("a".."z").to_a.include?(@@inputletter)
	end

end
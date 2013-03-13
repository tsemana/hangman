require "test/unit"
require_relative "hangman"
# if running ruby 1.9.3 => require_relative "hangman"

class HangmanTest < Test::Unit::TestCase

	def test_hangman_initializes_word_chosen
		w = "word"
		h = Hangman.new(w)
		assert_equal "word", h.word
	end

	def test_hangman_initializes_board
		w = "hello"
		h = Hangman.new(w)
		assert_equal "_ _ _ _ _", h.board
	end

	def test_hangman_initializes_show_chances_left
		w = "hello"
		h = Hangman.new(w)
		assert_equal 8, h.chance
	end

	def test_hangman_initializes_show_guessed_letters_list
		w = "hello"
		h = Hangman.new(w)
		h.guessed_letter("h")
		assert_equal "h", h.letter[-1]
	end

end












































# require "test/unit"
# require "./hangman.rb"

# # if running ruby 1.9.3 => require_relative "hangman"

# class HangmanTest < Test::Unit::TestCase

# 	def test_initialize_starts_with_eight_chances
# 	 	h = Hangman.new("blahblah")
# 	 	assert_equal 8, h.chances
# 	end

# 	def test_initialize_has_an_empty_board_of_the_right_size
# 		h = Hangman.new("hello")
# 		assert_equal "_ _ _ _ _", h.board
# 	end

# 	def test_initialize_accepts_and_uses_the_word
# 		word = "hello"
# 		h = Hangman.new(word) # -> def initialize
# 		assert_equal word, h.word
# 	end

# 	def test_initialize_starts_with_no_guesses
		
# 	end

# 	def test_game_ends_when_last_letter_is_guessed_correctly
# 		word = "hello"
# 		board = "h e l l _"
# 		guess = "o"
# 		h = Hangman.new(word) # created the game
# 		h.board = board 			# setup the code
# 		# DONE WITH SETUP - hopefully
# 		# guess "o" (the final letter)
# 		h.guess!(guess)
# 		# game ends 
# 		assert h.won?
# 		# player wins
# 	end
# end
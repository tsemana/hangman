require "test/unit"
require_relative "hangman"
# if running ruby 1.9.3 => require_relative "hangman"

class HangmanTest < Test::Unit::TestCase

	# have to make this into a random word generator
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
		assert_equal "h", h.inputlist[-1]
	end

	def test_hangman_gameover_win_case_all_letters_are_guessed # - make this into a real world 
		w = "hello"
	 	h = Hangman.new(w)
		h.guessed_letter("h")
		h.guessed_letter("e")
		h.guessed_letter("l")
		h.guessed_letter("o")
		assert h.board_won?
	end

	def test_hangman_picks_wrong_letter
		w = "hello"
	 	h = Hangman.new(w)
	 	h.guessed_letter("a")
	 	assert_equal 7, h.chance
	end

	def test_hangman_gameover_chance_is_zero
		w = "hello"
		h = Hangman.new(w)
		h.guessed_letter("a")
		h.guessed_letter("b")
		h.guessed_letter("c")
		h.guessed_letter("d")
		h.guessed_letter("f")
		h.guessed_letter("g")
		h.guessed_letter("i")
		h.guessed_letter("j")
		assert_equal 0, h.chance
	end

	def test_hangman_nonalpha_characters_inputted
		skip "do this later"
		w = "hello"
		h = Hangman.new(w)
		h.guessed_letter(3)
		assert_equal no change, h.inputlist
	end
	 
end
	 

	# def test_hangman_all_letters_in_word_are_guessed
	# 	w = "hello"
	# 	h = Hangman.new(w)

	# end

	# def test_hangman_player_loses_all_chances
	# end












































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
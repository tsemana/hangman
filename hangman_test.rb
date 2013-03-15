require "test/unit"
require_relative "hangman"
# if running ruby 1.9.3 => require_relative "hangman"

class HangmanTest < Test::Unit::TestCase

	def test_hangman_initializes_word_chosen
		w = "hello"
		h = Hangman.new(w)
		assert_equal "hello", h.word
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

	def test_hangman_anything_other_than_single_letter_inputted
		w = "hello"
		h = Hangman.new(w)
	end

	def test_hangman_gameover_win_case_all_letters_are_guessed
		w = "hello"
	 	h = Hangman.new(w)
		h.guessed_letter("h")
		h.guessed_letter("e")
		h.guessed_letter("l")
		h.guessed_letter("o")
		assert h.board_won?
	end

	def test_hangman_chance_counter_goes_down_when_wrong_letter_picked
		w = "hello"
	 	h = Hangman.new(w)
	 	h.guessed_letter("a")
	 	assert_equal 7, h.chance
	end

	def test_hangman_chance_counter_doesnt_change_when_right_letter_picked
		w = "hello"
		h = Hangman.new(w)
		h.guessed_letter("h")
		h.guessed_letter("o")
		assert_equal 8, h.chance
	end

	def test_hangman_gameover_chance_counter_goes_down_to_zero
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

	def test_hangman_counter_stops_at_zero
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
		h.guessed_letter("x")
		h.guessed_letter("z")
		assert_equal 0, h.chance
	end

	def test_hangman_inputlist_doesnt_add_wrong_input_entered_multiple_times
		w = "hello"
		h = Hangman.new(w)
		h.guessed_letter("x")
		h.guessed_letter("x")
		assert_equal ["x"], h.inputlist
	end

	def test_hangman_counter_doesnt_change_when_wrong_input_entered_multiple_times
		
		w = "hello"
		h = Hangman.new(w)
		h.guessed_letter("x")
		h.guessed_letter("x")
		assert_equal 7, h.chance
	end
	
	def test_hangman_number_inputted
		skip "Method is called in hang_play; can't test?" # can we test a method in hang_play?
		w = "hello"
		h = Hangman.new(w)
		h.guessed_letter("3")
		assert_equal [], h.inputlist
	end

	def test_hangman_random_generator_producing_words
		skip "Method is called in hang_play; can't test?" # can we test a method in hang_play?
		w = ""
		h = Hangman.new(w)
		assert_equal word_list[0..-1], h.word
	end

end
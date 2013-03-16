require "test/unit"
require_relative "hang_play"
# if running ruby 1.9.3 => require_relative "hangman"

class HangPlayTest < Test::Unit::TestCase

	def test_hang_play_random_generator_producing_words
		skip
		list = HangmanPlay.word_list 
		assert_equal "hello", HangmanPlay.get_a_random_word
	end

	def test_hang_play_array_doesnt_change_if_nonalpha_character_inputted
		HangmanPlay.inputletter=("3")
		assert !HangmanPlay.input_valid?
	end


end
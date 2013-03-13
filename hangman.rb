class Hangman

	attr_accessor :word, :board, :chance, :letter

  def initialize(word)
  	@word = word
  	@board = word.split("").map{"_ "}.join.strip
  	@chance = 8
  	@letter = []
  	puts "Hangman!"
  end

  def guessed_letter(letter)
  	@letter.push(letter)
  end

end




























































# class Hangman

#   # This class represents an instance of a hangman game.
#   # It is only concerned with one run through of the game.
#   # It is not responsbile for human interaction.

#   attr_accessor :word, :chances, :board

#   def initialize(word)
#   	@word = word
# 	@chances = 8
	
#     puts "Hangman game!"
#   end

#   def board
#   	board = "_ " * @word.length
#   	board.strip
#   end

#   def guess!(letter)
#   end

#   def won?
#   	# true or false
#   end
  
# end


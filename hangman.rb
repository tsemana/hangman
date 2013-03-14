
class Hangman

  attr_accessor :word, :board, :chance, :inputlist

  def initialize(word)
    @word = word
    @board = word.split("").map{"_ "}.join.strip
    @chance = 8
    @inputlist = []
    puts "Hangman!"
  end

  def guessed_letter(input)   # why does it break when i take the @ out
    @inputlist.push(input)
    if word.include?(input)
      @board = word.split("").map{|x| @inputlist.include?(x) ? "#{x} " : "_ " }.join.strip #ternary operator used here. (test ? true : false) 
      chance_counter
    end
  end

  # def currentboard_changer
  #     @currentboard # will have to change this into the current status of the board
  # end

  def board_won?
    puts @board
    word == @board.delete(" ")
  end

  def chance_counter
    @chance -= 1
  end

  # def guess
  #   input = 
  # end

end


# - we will have to .downcase all incoming characters




































# class Hangman

#   # This class represents an instance of a hangman game.
#   # It is only concerned with one run through of the game.
#   # It is not responsbile for human interaction.

#   attr_accessor :word, :chances, :board

#   def initialize(word)
#     @word = word
#   @chances = 8
  
#     puts "Hangman game!"
#   end

#   def board
#     board = "_ " * @word.length
#     board.strip
#   end

#   def guess!(letter)
#   end

#   def won?
#     # true or false
#   end
  
# end



class Hangman

  attr_accessor :word, :board, :chance, :inputlist

  def initialize(word)
    @word = word
    @board = word.split("").map{"_ "}.join.strip
    @chance = 8
    @inputlist = []
    @input = nil
    puts "Hangman!"
  end

  def guessed_letter(input)
    @input = input
    if input_in_inputlist?
      return      
    end
    inputlist_push(input)
    if word.include?(input)
      board_update
    else 
      chance_counter
    end
  end

  def inputlist_push(input) # which input are all these inputs referring to? help us clean up.
    @inputlist.push(input)
  end

  def input_in_inputlist?
    @inputlist.include?(@input)
  end

  def board_update
      @board = word.split("").map{|x| @inputlist.include?(x) ? "#{x} " : "_ " }.join.strip #ternary operator used here. (test ? true : false) 
  end

  def chance_counter
    @chance -= 1 unless @chance == 0
  end

  def board_won?
    word == @board.delete(" ")
  end

  def board_lost?
    @chance == 0
  end  

end
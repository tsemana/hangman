class Hangman

  attr_accessor :word, :board, :chance, :inputlist, :repeated

  def initialize(word)
    @word = word
    @board = word.split("").map{"_ "}.join.strip
    @chance = 8
    @inputlist = []
    @input = nil
    @repeated = false
  end

  def guessed_letter(input)
    @input = input
    if input_in_inputlist?
      @repeated = true
      return 
    else
      @repeated = false
    end
    inputlist_push!
    if word.include?(input)
      board_update!
    else 
      lose_a_chance!
    end
  end

  def inputlist_push!
    @inputlist.push(@input)
  end

  def input_in_inputlist?
    @inputlist.include?(@input)
  end

  def board_update!
    @board = word.split("").map{|x| @inputlist.include?(x) ? "#{x} " : "_ " }.join.strip #ternary operator used here. (test ? true : false) 
  end

  def lose_a_chance!
    @chance -= 1 unless @chance == 0
  end

  def board_won?
    word == @board.delete(" ")
  end

  def board_lost?
    @chance == 0
  end  

end
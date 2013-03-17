require_relative "hangman"

class HangmanPlay

  def self.start
    if FileTest.exist?("/usr/share/dict/words")
      @@word_list = File.read("/usr/share/dict/words").downcase.split("\n")
    else @@word_list = ["hello", "goodbye", "dance", "ruby", "left", "maybe","panic","jonas", "ipod","wallet","keyboard","computer"]
    end
    self.get_a_random_word
    @@inputletter = nil
    @@repeat = nil
    @@game = Hangman.new(@@word)
    self.interface_setup
  end

  def self.inputletter 			#cattr_reader equivalent
    return @@inputletter
  end

  def self.inputletter=(inputletter)		#cattr_writer equivalent
    @@inputletter = inputletter
  end

  def self.get_a_random_word
    @@word = @@word_list[rand(@@word_list.size)]
  end

  def self.interface_setup
    loop do
      system "clear"
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
      elsif !self.input_valid?
        puts "Invalid character! Choose a single letter." 
      elsif @@game.repeated
        puts "Already guessed! Choose another letter." 
      end
      puts "Choose a letter:"
      self.input
    end
  end

  def self.input
    @@inputletter = gets.chomp.downcase
    if self.input_valid?
      @@game.guessed_letter(@@inputletter)
    end
  end

  def self.input_valid?
    return true if @@inputletter.nil?
    ("a".."z").to_a.include?(@@inputletter)
  end
end

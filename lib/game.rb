require_relative "guesses"
require_relative "lives"

class Game
  attr_accessor :word, :guesses, :lives

  def initialize(word:)
    @word = word
    @guesses = Guesses.new(word: word)
    @lives = Lives.new
  end

  def play(guess:)
    lives.deduct_life unless guesses.check?(guess)
  end

  def output
    return win_msg if word.eql?(guesses.correct)
    return loose_msg if lives.remaining.zero?
    str = correct_msg
    str << incorrect_msg unless guesses.incorrect.empty?
    str
  end

  def correct_msg
    str = ""
    str << @guesses.correct
    str << " life left: " + lives.remaining.to_s
    str
  end

  def incorrect_msg
    " incorrect guesses: " + guesses.incorrect
  end

  def win_msg
    guesses.correct + " You win!".upcase
  end

  def loose_msg
    guesses.correct + " You lose!".upcase
  end
end

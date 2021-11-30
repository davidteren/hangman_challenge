require_relative "guesses"
require_relative "lives"

class Game
  attr_reader :word
  attr_accessor :guesses, :lives

  def initialize(guesses:, lives: Lives.new)
    @guesses = guesses
    @lives = lives
  end

  def play(guess:)
    lives.deduct_life unless guesses.check?(guess)
  end

  def output
    return win_msg if guesses.correct?
    return loose_msg unless lives.remaining?
    str = correct_msg
    str << incorrect_msg unless guesses.none?
    str
  end

  private

  def correct_msg
    str = ""
    str << guesses.correct
    str << " life left: " + lives.remaining.to_s
    str
  end

  def incorrect_msg
    " incorrect guesses: " + guesses.incorrect
  end

  def win_msg
    guesses.correct + " YOU WIN!"
  end

  def loose_msg
    guesses.correct + " YOU LOSE!"
  end
end

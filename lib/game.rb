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
    return win_msg if guesses.match_word?
    return loose_msg if lives.depleted?
    str = correct_msg
    str << incorrect_msg if guesses.exist?
    str
  end

  private

  def correct_msg
    str = ""
    str << guesses.correct
    str << " life left: " + lives.remaining.to_s
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

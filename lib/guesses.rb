class Guesses
  attr_reader :word
  attr_accessor :correct, :incorrect

  def initialize(word:)
    @word = word
    @correct = set_underscores
    @incorrect = ""
  end

  def check?(guess)
    if word.include?(guess)
      update_correct(guess)
      true
    else
      @incorrect += guess
      false
    end
  end

  def correct?
    correct == word
  end

  def any?
    incorrect.empty?
  end

  private

  def update_correct(guess)
    correct.chars.each_with_index do |letter, index|
      if letter == "_" && word[index] == guess
        correct[index] = guess
      end
    end
  end

  def set_underscores
    word.chars.map { "_" }.join("")
  end
end

class WordEvaluator
  attr_reader :word, :incorrect_guesses, :correct_guesses

  def initialize(word:)
    @word = word
    @incorrect_guesses = ""
    @correct_guesses = set_correct_letters
  end

  def check_letter?(l)
    res = word.chars.any?(l)
    @incorrect_guesses += l unless res
    add_to_correct_letters(l) if res
    res
  end

  def completed?
    correct_guesses == word
  end

  private

  def set_correct_letters
    res = word.chars.count
    "_" * res
  end

  def add_to_correct_letters(l)
    positions = word.chars.each_index.select { |i| word[i] == l }
    positions.each do |pos|
      cl = correct_guesses.chars
      cl.delete_at(pos)
      cl.insert(pos, l)
      @correct_guesses = cl.join
    end
  end
end

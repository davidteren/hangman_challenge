class Player
  DEFAULT_LIVES = 6

  attr_reader :lives

  def initialize
    @lives = DEFAULT_LIVES
  end

  def deduct_life
    @lives -= 1
  end

  def has_life?
    @lives > 0
  end
end
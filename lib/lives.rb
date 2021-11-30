class Lives
  DEFAULT_LIVES = 6

  attr_reader :remaining

  def initialize
    @remaining = DEFAULT_LIVES
  end

  def deduct_life
    @remaining -= 1
  end

  def depleted?
    @remaining.zero?
  end
end

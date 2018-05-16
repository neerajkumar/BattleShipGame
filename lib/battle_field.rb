class BattleField

  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def valid?
    raise 'Battle Area Outbound' unless (@width.to_i >= 1 && @width.to_i <= 9) && (@height.ord >= 'A'.ord && @height.ord <= 'Z'.ord)
    return true
  end
end

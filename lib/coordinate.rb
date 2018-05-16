class Coordinate

  attr_reader :x, :y

  def initialize(position)
    @y, @x = position.split('')
  end

  def to_s
    return self.y + self.x
  end

  def valid?(battle_field)
    raise 'x Coordinate outbound' if @x.to_i > battle_field.width.to_i || @x.to_i < 0
    raise 'y Coordinate outbound' if @y.ord > battle_field.height.ord

    return true
  end
end

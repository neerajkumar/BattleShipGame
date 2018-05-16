class BattleShip

  attr_reader :position
  attr_accessor :cells

  TYPES = { P: 1, Q: 2 }

  def initialize(width, height, type, initial_coordinate)
    @width = width
    @height = height
    @type = type
    @cells = []
    @position = initial_coordinate
    build_cells()
  end

  def valid?(battle_field)
    valid_ship_type?
    valid_ship_size?(battle_field)
    return true
  end

  def build_cells
    @width.to_i.times do |w|
      @height.to_i.times do |h|
        coordinate = Coordinate.new((@position.y.ord + h).chr + (@position.x.to_i + w).to_s)
        @cells << BattleShipCell.new(@type, coordinate)
      end
    end
  end

  def destroyed?
    @cells.empty?
  end

  private

  def valid_ship_type?
    raise 'Invalid Ship Type' unless TYPES.keys.include?(@type.to_sym)
    return true
  end

  def valid_ship_size?(battle_field)
    raise 'BattleShip width Outbound' if (@width.to_i > battle_field.width.to_i) || (@width.to_i < 1)
    raise 'BattleShip height Outbound' if (@height.to_i > (battle_field.height.ord - 'A'.ord))
    return true
  end
end

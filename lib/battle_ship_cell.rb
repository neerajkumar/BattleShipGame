class BattleShipCell

  attr_reader :type, :position
  attr_accessor :hits

  def initialize(type, position)
    @type = type
    @position = position
    @hits = 0
  end

  def destroyed?
    @hits == BattleShip::TYPES[@type.to_sym]
  end
end

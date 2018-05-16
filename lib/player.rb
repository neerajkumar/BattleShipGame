class Player

  attr_accessor :name, :no_of_ships, :ships, :missile_targets

  def initialize(name)
    @name = name
    @ships = []
    @missile_targets = []
  end

  def all_ships_destroyed?
    @ships.map(&:destroyed?).all?
  end

end

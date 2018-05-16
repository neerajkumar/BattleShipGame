class MissileLauncher

  attr_reader :source, :target, :target_position

  def initialize(source, target, target_position)
    @source = source
    @target = target
    @target_position = target_position
  end

  def launch
    if @target_position.nil?
      puts "#{@source.name} has no more missiles left to launch"
      return false
    else
      target_hit = @target.ships.detect { |ship| ship.cells.map(&:position).flatten.map(&:to_s).include?(@target_position.to_s) }
      if target_hit.nil?
        puts "#{@source.name} fires a missile with target #{@target_position.to_s} which got miss"
      else
        destroy_ship_cell()
        puts "#{@source.name} fires a missile with target #{@target_position.to_s} which got hit"
      end
      return !target_hit.nil?
    end
  end

  private

  def destroy_ship_cell
    @target.ships.each do |ship|
      ship.cells.each do |cell|
        if cell.position.to_s == @target_position.to_s
          cell.hits += 1
          ship.cells.delete(cell) if cell.destroyed?
        end
      end
    end
  end
end

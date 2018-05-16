class BattleShipWar

  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    while (!@player1.missile_targets.empty? || !@player2.missile_targets.empty?) do
      missile_target = @player1.missile_targets.shift()
      while(MissileLauncher.new(@player1, @player2, missile_target).launch()) do
        missile_target = @player1.missile_targets.shift()
      end

      missile_target = @player2.missile_targets.shift()
      while(MissileLauncher.new(@player2, @player1, missile_target).launch()) do
        missile_target = @player2.missile_targets.shift()
      end
    end

    result()
  end

  def result
    if @player1.all_ships_destroyed?
      puts "#{@player2.name} won the battle."
    elsif @player2.all_ships_destroyed?
      puts "#{@player1.name} won the battle."
    else
      puts "Both players declares the peace."
    end
  end
end

require 'byebug'

Dir["lib/*.rb"].sort.each { |file| require_relative(file) }

class BattleShipGame

  attr_accessor :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def simulate
    file = File.open('lib/input.txt', 'r')
    inputs = []
    file.each_line { |line| inputs << line }

    battle_field = create_battle_field(inputs[0])

    if battle_field.valid?
      @player1.no_of_ships = inputs[1].to_i
      @player2.no_of_ships = inputs[1].to_i

      create_ships(inputs, battle_field)

      adding_missile_targets(@player1, inputs[4], battle_field)
      adding_missile_targets(@player2, inputs[5], battle_field)
    end
  end

  def start_war
    puts 'Starting The War...'
    puts '====================================================='
    BattleShipWar.new(@player1, @player2).start
    puts '====================================================='
  end

  private

  def create_battle_field(input)
    puts "Creating battle area"

    battle_area_width, battle_area_height = input.split(' ')

    BattleField.new(battle_area_width, battle_area_height)
  end

  def create_ships(input, battle_field)
    puts "Creating battleships..."

    puts "reading battleship type, dimensions of ships, positions for players #{@player1.name} & #{@player2.name}"

    [1, 2].each do |i|
      ship_coordinate_player1, ship_coordinate_player2 = Coordinate.new(input[i + 1].split(' ')[3]), Coordinate.new(input[i + 1].split(' ')[4])

      ship_type, ship_width, ship_height = input[i + 1].split(' ')[0], input[i + 1].split(' ')[1], input[i + 1].split(' ')[2]

      battleship1 = BattleShip.new(ship_width, ship_height, ship_type, ship_coordinate_player1)
      battleship2 = BattleShip.new(ship_width, ship_height, ship_type, ship_coordinate_player2)

      @player1.ships << battleship1 if ship_coordinate_player1.valid?(battle_field) && battleship1.valid?(battle_field)
      @player2.ships << battleship2 if ship_coordinate_player2.valid?(battle_field) && battleship2.valid?(battle_field)
    end

    [@player1, @player2]
  end

  def adding_missile_targets(player, input, battle_field)
    puts "Adding missiles target for player: #{player.name}"

    input.split(' ').each do |location|
      coordinate = Coordinate.new(location)
      player.missile_targets << coordinate if coordinate.valid?(battle_field)
    end
  end
end

player_1 = Player.new('Player-1')
player_2 = Player.new('Player-2')

battleship_game = BattleShipGame.new(player_1, player_2)

battleship_game.simulate()
battleship_game.start_war()
